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
* Purchasing video [AWS Certified Machine Learning Video and Practice Exams](http://www.pearsonitcertification.com/store/aws-certified-machine-learning-specialty-ml-s-complete-9780135556511)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


Lesson 8:  Case Studies (60 min)

* 8.1 Understand Big Data for Sagemaker (12 min)
* 8.2 Learn Sagemaker and EMR Integration (12 min)
* 8.3 Learn Serverless Production Big Data Application Development (12 min)
* 8.4 Implement Containerization for Big Data (12 min)
* 8.5 Implement Spot Instances for Big Data Pipeline (12 min)



## 8.1 Understand Big Data for Sagemaker

### Search

#### [Demo] Search

[Manage Machine Learning Experiments with Search](https://docs.aws.amazon.com/sagemaker/latest/dg/search.html)



*   Finding training jobs
*   Rank training jobs
*   Tracing lineage of a model



### Ground Truth

![ground_truth](https://user-images.githubusercontent.com/58792/49688683-9bdba100-faca-11e8-8d93-a55ce6c35a92.png)



*   Setup and Manage labeling jobs
*   Uses active learning and human labeling
*   First 500 objects labeled per month are free



#### [Demo] Labeling Job

### Notebook

![notebooks](https://user-images.githubusercontent.com/58792/49688694-d04f5d00-faca-11e8-9fad-eb63b2534b07.png)

#### [Demo] Sagemaker Notebooks

*   Create and run Jupyter Notebooks
  -  Using Jupyter
  -  Using JupyterLab
  -  Using the terminal
  
*   Lifecycle configurations

*   Git Repositories
  - public repositories can be cloned on Notebook launch



### Training

![training](https://user-images.githubusercontent.com/58792/49688717-05f44600-facb-11e8-8d7f-cf33d272573a.png)

#### [Demo] Sagemaker Training

*   Algorithms
  -  Create algorithm
  -  Subscribe [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?page=1&filters=fulfillment_options%2Cresource_type&fulfillment_options=SAGEMAKER&resource_type=ALGORITHM)

  
*   Training Jobs

*   HyperParameter Tuning Jobs


### Inference

![inference](https://user-images.githubusercontent.com/58792/49688735-2fad6d00-facb-11e8-94cb-cba9322e309b.png)

#### [Demo] Sagemaker Inference

*  Compilation jobs

*  Model packages

*  Models

*  Endpoint configurations

*  Endpoints

*  Batch transform jobs


### Built in Sagemaker Algorithms

Table of [algorithms provided by Amazon Sagemaker](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html)

![aws_algorithms](https://user-images.githubusercontent.com/58792/49692597-58595500-fb13-11e8-9db3-e1fe371ac36a.png)







### Sagemaker Built-in Algorithms---Examples



#### BlazingText


* unsupervised learning algorithm for generating **Word2Vec embeddings.**
* aws blog post [BlazingText](https://aws.amazon.com/blogs/machine-learning/amazon-sagemaker-blazingtext-parallelizing-word2vec-on-multiple-cpus-or-gpus/)



![BlazingText](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2018/01/18/sagemaker-word2vec-3-1.gif)

#### DeepAR Forecasting

* supervised learning algorithm for forecasting scalar (that is, one-dimensional) time series using recurrent neural networks (RNN)
* [DeepAR Documentation](https://docs.aws.amazon.com/sagemaker/latest/dg/deepar.html)

![DeepAR](https://docs.aws.amazon.com/sagemaker/latest/dg/images/deepar-2.png)

### Demo


[Demo]

* **Built in Sagemaker Algorithms Scale:   **

---

"We recommend training k-means on CPU instances. You can train on GPU instances, but should limit GPU training to p*.xlarge instances because only one GPU 
per instance is used.""


* County Census Notebook


## 8.2 Learn Sagemaker and EMR Integration

![kernel](https://user-images.githubusercontent.com/58792/55046667-982f4400-4fff-11e9-8db1-b70766de3f52.png)

### Demo




![EMR](https://user-images.githubusercontent.com/58792/55369064-d1f1c600-54a9-11e9-9937-9ded09489c6d.png)

* [Sagemaker/Spark/EMR Notebooks](https://aws.amazon.com/blogs/machine-learning/build-amazon-sagemaker-notebooks-backed-by-spark-in-amazon-emr/)

## 8.3 Learn Serverless Production Big Data Application Development

[Source Code for Demo](https://github.com/noahgift/awslambda/tree/master/example_src)

[Demo]

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



## 8.4 Implement Containerization for Big Data

[Demo]

## 8.5 Implement Spot Instances for Big Data Pipeline

**Real Massively Parallel Computer Vision Pipeline**

![Spot Pipeline](https://user-images.githubusercontent.com/58792/55369313-ed110580-54aa-11e9-83d5-724611b6f8bd.png)

[Spot Launcher](https://github.com/noahgift/spot_price_machine_learning/blob/master/spot_launcher.py)



```python
#!/usr/bin/env python
"""Launches a test spot instance"""

import click
import boto3
import base64

from sensible.loginit import logger
log = logger(__name__)

#Tell Boto3 To Enable Debug Logging
#boto3.set_stream_logger(name='botocore')

@click.group()
def cli():
    """Spot Launcher"""


def user_data_cmds(duration):
    """Initial cmds to run, takes duration for halt cmd"""

    cmds = """
        #cloud-config
        runcmd:
         - echo "halt" | at now + {duration} min
    """.format(duration=duration)
    return cmds

@cli.command("launch")
@click.option('--instance', default="r4.large", help='Instance Type')
@click.option('--duration', default="55", help='Duration')
@click.option('--keyname', default="pragai", help='Key Name')
@click.option('--profile', default="arn:aws:iam::561744971673:instance-profile/admin",
                     help='IamInstanceProfile')
@click.option('--securitygroup', default="sg-61706e07", help='Key Name')
@click.option('--ami', default="ami-6df1e514", help='Key Name')
def request_spot_instance(duration, instance, keyname, 
                            profile, securitygroup, ami):
    """Request spot instance"""

    #import pdb;pdb.set_trace()
    user_data = user_data_cmds(duration)
    LaunchSpecifications = {
            "ImageId": ami,
            "InstanceType": instance,
            "KeyName": keyname,
            "IamInstanceProfile": {
                "Arn": profile
            },
            "UserData": base64.b64encode(user_data.encode("ascii")).\
                decode('ascii'),
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda",
                    "Ebs": {
                        "DeleteOnTermination": True,
                        "VolumeType": "gp2",
                        "VolumeSize": 8,
                    }
                }
            ],
            "SecurityGroupIds": [securitygroup]
        }

    run_args = {
            'SpotPrice'           : "0.8",
            'Type'                : "one-time",
            'InstanceCount'       : 1,
            'LaunchSpecification' : LaunchSpecifications
        }

    msg_user_data = "SPOT REQUEST DATA: %s" % run_args
    log.info(msg_user_data)

    client = boto3.client('ec2', "us-west-2")
    reservation = client.request_spot_instances(**run_args)
    return reservation

if __name__ == '__main__':
    cli()

```




### Demo





* Spot Launch Demo and Walkthrough on Pricing
* Spot Instances EMR
* Spot Instances AWS Batch
