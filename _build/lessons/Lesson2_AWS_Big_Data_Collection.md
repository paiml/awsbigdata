---
redirect_from:
  - "/lessons/lesson2-aws-big-data-collection"
interact_link: content/lessons/Lesson2_AWS_Big_Data_Collection.ipynb
kernel_name: python3
title: 'Lesson 2 - AWS Big Data Collection'
prev_page:
  url: /lessons/Lesson1_AWS_Big_Data_Introduction
  title: 'Lesson 1 - AWS Big Data Introduction'
next_page:
  url: /lessons/Lesson3_AWS_Big_Data_Storage
  title: 'Lesson 3 - AWS Big Data Storage'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson2_AWS_Big_Data_Collection.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Lesson2:  Collection

## Pragmatic AI Labs



![alt text](https://paiml.com/images/logo_with_slogan_white_background.png)

This notebook was produced by [Pragmatic AI Labs](https://paiml.com/).  You can continue learning about these topics by:

*   Buying a copy of [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](http://www.informit.com/store/pragmatic-ai-an-introduction-to-cloud-based-machine-9780134863863) from Informit.
*   Buying a copy of  [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.amazon.com/Pragmatic-AI-Introduction-Cloud-Based-Learning/dp/0134863860) from Amazon
*   Reading an online copy of [Pragmatic AI:Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.safaribooksonline.com/library/view/pragmatic-ai-an/9780134863924/)
*  Watching video [Essential Machine Learning and AI with Python and Jupyter Notebook-Video-SafariOnline](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118) on Safari Books Online.
* Watching video [AWS Certified Machine Learning-Speciality](https://learning.oreilly.com/videos/aws-certified-machine/9780135556597)
* Purchasing video [Essential Machine Learning and AI with Python and Jupyter Notebook- Purchase Video](http://www.informit.com/store/essential-machine-learning-and-ai-with-python-and-jupyter-9780135261095)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


## Lesson 2.1 Determine the operational characteristics of the collection system

## Lesson 2.2 Select a collection system that handles the frequency of data change and type of data being ingested

## Lesson 2.3 Identify the properties that need to be enforced by the collection system: order, data structure, metadata, etc.

## Lesson 2.4 Explain the durability and availability characteristics for the collection approach

## Lesson 2.5 Learn AWS Kinesis Streams

## Lesson 2.6 Learn AWS Kinesis Firehose

### Kinesis Features

[Kinesis FAQ](https://aws.amazon.com/kinesis/data-streams/faqs/)

* Processes Data in Real-Time
* Can process hundreds of TBs an hour
* Example inputs are:  
 - logs
 - financial transactions
 * Streaming Data



{:.input_area}
```
!pip install -q sensible
```




{:.input_area}
```
import boto3

```




{:.input_area}
```
import asyncio
import time
import datetime
import uuid
import boto3
import json
from sensible.loginit import logger

LOG = logger(__name__)

def firehose_client(region_name="us-east-1"):
    """Kinesis Firehose client"""

    firehose_conn = boto3.client("firehose", region_name=region_name)
    extra_msg = {"region_name": region_name, "aws_service": "firehose"}
    LOG.info("firehose connection initiated", extra=extra_msg)
    return firehose_conn

async def put_record(data,
            client,
            delivery_stream_name="aws-ml-cert"):
    """
    See this:
        http://boto3.readthedocs.io/en/latest/reference/services/
        firehose.html#Firehose.Client.put_record
    """
    extra_msg = {"aws_service": "firehose"}
    LOG.info(f"Pushing record to firehose: {data}", extra=extra_msg)
    response = client.put_record(
        DeliveryStreamName=delivery_stream_name,
        Record={
            'Data': data
        }
    )
    return response


def gen_uuid_events():
    """Creates a time stamped UUID based event"""

    current_time = 'test-{date:%Y-%m-%d %H:%M:%S}'.format(date=datetime.datetime.now())
    event_id = str(uuid.uuid4())
    event = {event_id:current_time}
    return json.dumps(event)

def send_async_firehose_events(count=100):
    """Async sends events to firehose"""

    start = time.time() 
    client = firehose_client()
    extra_msg = {"aws_service": "firehose"}
    loop = asyncio.get_event_loop()
    tasks = []
    LOG.info(f"sending aysnc events TOTAL {count}",extra=extra_msg)
    num = 0
    for _ in range(count):
        tasks.append(asyncio.ensure_future(put_record(gen_uuid_events(), client)))
        LOG.info(f"sending aysnc events: COUNT {num}/{count}")
        num +=1
    loop.run_until_complete(asyncio.wait(tasks))
    loop.close()
    end = time.time()  
    LOG.info("Total time: {}".format(end - start))


```




{:.input_area}
```
send_async_firehose_events(10)
```


## Lesson 2.7 Use SQS

## Lesson 2.8 Create Data Pipelines
