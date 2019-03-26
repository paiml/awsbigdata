---
redirect_from:
  - "/lessons/lesson8-aws-big-data-case-studies"
interact_link: content/lessons/Lesson8_AWS_Big_Data_Case_Studies.ipynb
kernel_name: python3
title: 'Lesson 8 - AWS Big Data Case Studies'
prev_page:
  url: /lessons/Lesson7_AWS_Big_Data_Data_Security
  title: 'Lesson 7 - AWS Big Data Data Security'
next_page:
  url: /lessons/Lesson9_AWS_Big_Data_Exam_Prep
  title: 'Lesson 9 - AWS Big Data Exam Prep'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson8_AWS_Big_Data_Case_Studies.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Lesson 8 Case Studies

## Pragmatic AI Labs



![alt text](https://paiml.com/images/logo_with_slogan_white_background.png)

This notebook was produced by [Pragmatic AI Labs](https://paiml.com/).  You can continue learning about these topics by:

*   Buying a copy of [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](http://www.informit.com/store/pragmatic-ai-an-introduction-to-cloud-based-machine-9780134863917)
*   Reading an online copy of [Pragmatic AI:Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.safaribooksonline.com/library/view/pragmatic-ai-an/9780134863924/)
*  Watching video [Essential Machine Learning and AI with Python and Jupyter Notebook-Video-SafariOnline](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118) on Safari Books Online.
* Watching video [AWS Certified Machine Learning-Speciality](https://learning.oreilly.com/videos/aws-certified-machine/9780135556597)
* Purchasing video [Essential Machine Learning and AI with Python and Jupyter Notebook- Purchase Video](http://www.informit.com/store/essential-machine-learning-and-ai-with-python-and-jupyter-9780135261095)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


Lesson 8:  Case Studies (60 min)

* 8.1 Understand Big Data for Sagemaker (12 min)
* 8.2 Learn Sagemaker and EMR Integration (12 min)
* 8.3 Learn Serverless Production Big Data Application Development (12 min)
* 8.4 Implement Containerization for Big Data (12 min)
* 8.5 Implement Spot Instances for Big Data Pipeline (12 min)



## 8.3 Learn Serverless Production Big Data Application Development

### Creating Timed Lambdas

Creating Serverless Data Pipeline Producers

#### Using AWS Lambda with Cloudwatch Events

Can create [cloudwatch timer](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html) to call lambda

![cloudwatch event lambda](https://user-images.githubusercontent.com/58792/53612460-4c67b700-3b87-11e9-8fb9-b5d30b77431a.png)



#### Using AWS Cloudwatch logging with AWS Lambda

Using cloudwatch logging is an essential step for Lambda Development

![cloudwatch](https://user-images.githubusercontent.com/58792/53612528-9355ac80-3b87-11e9-8473-ab28ba860553.png)

#### Using AWS Lambda to populate AWS SQS (Simple Queuing Service)

1. *** Create new Lambda with Serverless Wizard***
2.  ***cd into lambda and install packages on level up***



```
pip3 install boto3 --target ../
pip3 install python-json-logger --target ../
```

3.  ***Test local***
4. *** Deploy***



```python
"""
Dynamo to SQS
"""

import boto3
import json
import sys
import os

DYNAMODB = boto3.resource('dynamodb')
TABLE = "fang"
QUEUE = "producer"
SQS = boto3.client("sqs")

#SETUP LOGGING
import logging
from pythonjsonlogger import jsonlogger

LOG = logging.getLogger()
LOG.setLevel(logging.INFO)
logHandler = logging.StreamHandler()
formatter = jsonlogger.JsonFormatter()
logHandler.setFormatter(formatter)
LOG.addHandler(logHandler)

def scan_table(table):
    """Scans table and return results"""
    
    LOG.info(f"Scanning Table {table}")
    producer_table = DYNAMODB.Table(table)
    response = producer_table.scan()
    items = response['Items']
    LOG.info(f"Found {len(items)} Items")
    return items

def send_sqs_msg(msg, queue_name, delay=0):
    """Send SQS Message

    Expects an SQS queue_name and msg in a dictionary format.
    Returns a response dictionary. 
    """

    queue_url = SQS.get_queue_url(QueueName=queue_name)["QueueUrl"]
    queue_send_log_msg = "Send message to queue url: %s, with body: %s" %\
        (queue_url, msg)
    LOG.info(queue_send_log_msg)
    json_msg = json.dumps(msg)
    response = SQS.send_message(
        QueueUrl=queue_url,
        MessageBody=json_msg,
        DelaySeconds=delay)
    queue_send_log_msg_resp = "Message Response: %s for queue url: %s" %\
        (response, queue_url) 
    LOG.info(queue_send_log_msg_resp)
    return response

def send_emissions(table, queue_name):
    """Send Emissions"""
    
    items = scan_table(table=table)
    for item in items:
        LOG.info(f"Sending item {item} to queue: {queue_name}")
        response = send_sqs_msg(item, queue_name=queue_name)
        LOG.debug(response)

def lambda_handler(event, context):
    """
    Lambda entrypoint
    """

    extra_logging = {"table": TABLE, "queue": QUEUE}
    LOG.info(f"event {event}, context {context}", extra=extra_logging)
    send_emissions(table=TABLE, queue_name=QUEUE)

```



**Successful Local Test**

![test local](https://user-images.githubusercontent.com/58792/53637263-8bbdf400-3bd7-11e9-9840-0cb9851fac6a.png)

**Verify Messages in SQS**

![**SQS**](https://user-images.githubusercontent.com/58792/53637424-fb33e380-3bd7-11e9-8b68-021704da4ce0.png)


***Remote Test Needs Correct Role!!!***

![role failure](https://user-images.githubusercontent.com/58792/53638025-c45ecd00-3bd9-11e9-848c-6caedc3d9011.png)

#### Wire up Cloudwatch Event Trigger

1.  Enable Timed Execution of producer
2.  Verify messages flowing into SQS

![cloudwatch event trigger](https://user-images.githubusercontent.com/58792/53638200-6979a580-3bda-11e9-94ea-9008bdc9c72a.png)

***SQS is populating***

![alt text](https://user-images.githubusercontent.com/58792/53638351-cecd9680-3bda-11e9-85bb-f5f4bd4450ad.png)

### Creating Event Driven Lambdas

#### Triggering AWS Lambda with AWS SQS Events

Lambda can now fire on SQS event

![SQS Trigger](https://user-images.githubusercontent.com/58792/53644659-f842ee00-3beb-11e9-8527-96ec12acc5f7.png)



#### Reading AWS SQS Events from AWS Lambda



```python
def lambda_handler(event, context):
    """Entry Point for Lambda"""

    LOG.info(f"SURVEYJOB LAMBDA, event {event}, context {context}")
    receipt_handle  = event['Records'][0]['receiptHandle'] #sqs message
    #'eventSourceARN': 'arn:aws:sqs:us-east-1:561744971673:producer'
    event_source_arn = event['Records'][0]['eventSourceARN']
    
    names = [] #Captured from Queue
    
    # Process Queue
    for record in event['Records']:
        body = json.loads(record['body'])
        company_name = body['name']
        
        #Capture for processing
        names.append(company_name)
        
        extra_logging = {"body": body, "company_name":company_name}
        LOG.info(f"SQS CONSUMER LAMBDA, splitting sqs arn with value: {event_source_arn}",extra=extra_logging)
        qname = event_source_arn.split(":")[-1]
        extra_logging["queue"] = qname
        LOG.info(f"Attemping Deleting SQS receiptHandle {receipt_handle} with queue_name {qname}", extra=extra_logging)
        res = delete_sqs_msg(queue_name=qname, receipt_handle=receipt_handle)
        LOG.info(f"Deleted SQS receipt_handle {receipt_handle} with res {res}", extra=extra_logging)
    
    # Make Pandas dataframe with wikipedia snippts
    LOG.info(f"Creating dataframe with values: {names}")
    df = names_to_wikipedia(names)
    
    # Perform Sentiment Analysis
    df = apply_sentiment(df)
    LOG.info(f"Sentiment from FANG companies: {df.to_dict()}")
    
    # Write result to S3
    write_s3(df=df, name=names.pop(), bucket="fangsentiment")
```



#### Writing results to AWS S3

write dataframe to AWS S3

```python
### S3
def write_s3(df, name, bucket):
    """Write S3 Bucket"""

    csv_buffer = StringIO()
    df.to_csv(csv_buffer)
    s3_resource = boto3.resource('s3')
    res = s3_resource.Object(bucket, f'{name}_sentiment.csv').\
        put(Body=csv_buffer.getvalue())
    LOG.info(f"result of write name: {name} to bucket: {bucket} with:\n {res}")

```





```
noah:/tmp $ aws s3 cp --recursive s3://fangsentiment/ .                                                                                                
download: s3://fangsentiment/netflix_sentiment.csv to ./netflix_sentiment.csv
download: s3://fangsentiment/google_sentiment.csv to ./google_sentiment.csv
download: s3://fangsentiment/facebook_sentiment.csv to ./facebook_sentiment.csv
```


