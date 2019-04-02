---
redirect_from:
  - "/lessons/lesson3-aws-big-data-storage"
interact_link: content/lessons/Lesson3_AWS_Big_Data_Storage.ipynb
kernel_name: python3
title: 'Lesson 3 - AWS Big Data Storage'
prev_page:
  url: /lessons/Lesson2_AWS_Big_Data_Collection
  title: 'Lesson 2 - AWS Big Data Collection'
next_page:
  url: /lessons/Lesson4_AWS_Big_Data_Processing
  title: 'Lesson 4 - AWS Big Data Processing'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson3_AWS_Big_Data_Storage.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Lesson 3 Storage

## Pragmatic AI Labs



![alt text](https://paiml.com/images/logo_with_slogan_white_background.png)

This notebook was produced by [Pragmatic AI Labs](https://paiml.com/).  You can continue learning about these topics by:

*   Buying a copy of [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](http://www.informit.com/store/pragmatic-ai-an-introduction-to-cloud-based-machine-9780134863917)
*   Reading an online copy of [Pragmatic AI:Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.safaribooksonline.com/library/view/pragmatic-ai-an/9780134863924/)
*  Watching video [Essential Machine Learning and AI with Python and Jupyter Notebook-Video-SafariOnline](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118) on Safari Books Online.
* Watching video [AWS Certified Machine Learning-Speciality](https://learning.oreilly.com/videos/aws-certified-machine/9780135556597)
* Purchasing video [Essential Machine Learning and AI with Python and Jupyter Notebook- Purchase Video](http://www.informit.com/store/essential-machine-learning-and-ai-with-python-and-jupyter-9780135261095)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


## 3.1 Determine and optimize the operational characteristics of the storage solution

### The Three "Vs" of Big Data:  Variety, Velocity and Volume

![Big Data Challenges](https://user-images.githubusercontent.com/58792/54285644-98d7cd00-455f-11e9-823d-ee6fe85af26e.png)

#### Variety


#### Velocity

#### Volume

## 3.2 Determine data access and retrieval patterns

### Batch vs Streaming Data

#### Impact on ML Pipeline

* More control of model training in batch (can decide when to retrain)
* Continuously retraining model could provide better prediction results or worse results
 - Did input stream suddenly get more users or less users?
 - Is there an A/B testing scenario?

#### Batch

*   Data is batched at intervals
*   Simplest approach to create predictions
*   Many Services on AWS Capable of Batch Processing
 - AWS Glue
 - AWS Data Pipeline
 - AWS Batch
 - EMR





#### Streaming


* Continously polled or pushed
* More complex method of prediction
* Many Services on AWS Capable of Streaming
 - Kinesis
 - IoT

## 3.3 Evaluate mechanisms for capture, update, and retrieval of catalog entries

[Omnigraffle or Whiteboard Demo]

## 3.4 Determine appropriate data structure and storage format

[Omnigraffle or Whiteboard Demo]

## 3.5 Understand Storage & Database Fundamentals

### Data Storage Concepts

#### Database Overview



![Database Styles](https://user-images.githubusercontent.com/58792/48925585-2214a800-ee7a-11e8-8546-767177679328.png)

* [One size database doesn't fit anyone](https://www.allthingsdistributed.com/2018/06/purpose-built-databases-in-aws.html)

## 3.6 Learn S3 - storage

[Demo]

## 3.7 Understand Glacier - backup & archive

[Demo]

## 3.8 Create AWS Glue - data catalog

### AWS Glue

#### AWS Glue is fully managed ETL Service



![AWS Glue Screen](https://user-images.githubusercontent.com/58792/49441953-dff23d00-f77c-11e8-9065-dab53c47c345.png)

#### AWS Glue Workflow



*   Build Data Catalog
*   Generate and Edit Transformations
*   Schedule and Run Jobs



#### [DEMO] AWS Glue

## 3.9 Use Dynamodb

#### Using AWS DynamoDB

* *[Watch Video Lesson 11.4:  Use AWS DynamoDB](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118/9780135261118-EMLA_01_11_04)*

https://aws.amazon.com/dynamodb/

![alt text](https://d1.awsstatic.com/video-thumbs/dynamodb/AWS-online-games-wide.ada4247744e9be9a6d857b2e13b7eb78b18bf3a5.png)

Query Example:

```python
def query_police_department_record_by_guid(guid):
    """Gets one record in the PD table by guid
    
    In [5]: rec = query_police_department_record_by_guid(
        "7e607b82-9e18-49dc-a9d7-e9628a9147ad"
        )
    
    In [7]: rec
    Out[7]: 
    {'PoliceDepartmentName': 'Hollister',
     'UpdateTime': 'Fri Mar  2 12:43:43 2018',
     'guid': '7e607b82-9e18-49dc-a9d7-e9628a9147ad'}
    """
    
    db = dynamodb_resource()
    extra_msg = {"region_name": REGION, "aws_service": "dynamodb", 
        "police_department_table":POLICE_DEPARTMENTS_TABLE,
        "guid":guid}
    log.info(f"Get PD record by GUID", extra=extra_msg)
    pd_table = db.Table(POLICE_DEPARTMENTS_TABLE)
    response = pd_table.get_item(
        Key={
            'guid': guid
            }
    )
    return response['Item']
```


### Case Study DynamoDB

![casestudy](https://user-images.githubusercontent.com/58792/55354483-bae7af80-547a-11e9-9909-a5621251065b.png)

#### [Demo] DynamoDB
