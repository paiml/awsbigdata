---
redirect_from:
  - "/topics/big-data-test-prep-notes"
title: 'AWS Big Data Test Prep Notes'
prev_page:
  url: /topics/security
  title: 'security'
next_page:
  url: /lessons/lessons
  title: 'Lessons'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---


**Official Video/Training Resources**

**Exam Readiness:  AWS Certified Big Data - Speciality (Digital)**



*   Training Link:  [https://www.aws.training/learningobject/curriculum?id=21332](https://www.aws.training/learningobject/curriculum?id=21332)

**Preparation Steps**



1. _Review Exam Guide and Sample Questions_
2. Practice with Qwiklabs and Exam Prep Quests
3. Review AWS FAQ
4. Study AWS Whitepapers
5. Practice Exam
6. Exam

**Big Data is Breaking Traditional IT Infrastructure**



*   Variety
*   Velocity
*   Volume

**Evolution of Big Data Processing**



*   **Descriptive (Historical)**
    *   Dashboards, traditional query, and reporting
*   **Real-time**
    *   Click-stream analysis, ad bidding, streaming data
*   **Predictive**

**Types of Services**

**On AWS**



*   Amazon EC2
*   Kafka
*   Cassandra

**Managed**



*   Amazon EMR
*   Amazon RDS
*   Amazon Elasticsearch
*   Amazon ElasticCache
*   Amazon Redshift

**Serverless**



*   AWS Lambda
*   Amazon S3
*   Amazon API Gateway
*   Amazon Cognito
*   Amazon DynamoDB
*   Amazon CloudWatch
*   Amazon Kinesis
*   Amazon SQS
*   AWS IoT

**AWS Big Data Services**

**Ingest/Collect**



*   ISV connectors
*   AWS Direct Connect
*   AWS Snowball
*   Amazon S3 Transfer Acceleration
*   Kinesis Data Firehose
*   AWS IoT
*   AWS Glue
*   AWS Step Functions

**Store**



*   Aurora
*   Amazon Elasticsearch
*   Amazon Kinesis
*   Amazon DynamoDB
*   Amazon S3

**Analyze/Process**



*   Amazon EMR
*   EC2
*   AWS Lambda
*   Amazon Redshift
*   AWS DMS (CDC)
*   Amazon Athena
*   Amazon AI
*   Kinesis Data Analytics

**Visualize/Consume**



*   Kibana
*   AWS Marketplace
*   IPython/Jupyter
*   Zeppelin
*   Amazon QuickSight

**Amazon EMR and Kerberos**



*   Amazon EMR 5.10.0 and later supports Kerberos
*   Services and users that authenticate are called principals
*   Principles exist in a Kerberos realm
*   The Key Distribution Center (KDC) manages authentication
*   The KDC issues tickets
*   Principles can be from other Realms.  This requires Cross-Realm Trust

**Amazon EMR Storage Permissions**



*   EMR File System (EMRFS) storage-based permissions
*   Consistent View
*   Data Encryption

**Amazon EMR Data Encryption**



*   In-Transit Data Encryption for EMRFS traffic between S3 and Cluster nodes
*   TLS Encryption
*   At-Rest Data Encryption

**Amazon EMR and Apache Hive**



*   Four features of Hive that are specific to Amazon EMR
    *   Load table partitions automatically from Amazon S3
    *   Specify an off-instance metadata store
    *   Write data directly to Amazon S3
    *   Access resources located in Amazon S3

**Amazon EMR Log Auditing**



*   Services
    *   Apache Spark
    *   Apache HBase
    *   Apache Hadoop
    *   Apache Tez
    *   Apache Flink
*   AWS CloudTrail
    *   Amazon EMR API calls
    *   AWS KMS API calls
    *   Amazon S3 API calls
*   Amazon EMR
    *   /JobFlowId/node
    *   /JobFlowId/steps/N
    *   /JobFlowId/containers

**Amazon Redshift Security**



*   IAM roles to access data on Amazon S3
*   IAM SSO authentication
*   SSL to secure data in transit
*   Encryption to secure data at rest
*   No direct access to compute nodes
*   Support for Amazon VPC
*   User audit logging and AWS CloudTrail integration
*   SOC 1/2/3, PCI-DSS Level 1, FedRAMP
*   Limit Data Access using Views (know this is possible on the exam)

**Amazon Redshift Networking**



*   Enhanced VPC routing
    *   Query traffic flows only through customer VPC
    *   Strict data traffic management
    *   Amazon S3 endpoint to access Amazon S3
    *   Locked down security groups
    *   SSL certificate for each Amazon Redshift cluster

**Amazon Redshift IAM Authorization**



*   IAM support for data LOAD/UNLOAD
    *   IAM roles for LOAD/UNLOAD operations
    *   A cluster can have access to specific S3 buckets
    *   Simplify credentials management
    *   Access to AWS KMS for encryption

**Amazon Redshift encryption**



*   In Transit
    *   Amazon Redshift API calls are made using HTTPS
    *   SSL certificate for each Amazon Redshift cluster required
*   At Rest
    *   Enable cluster encryption
    *   Encrypted via:
        *   AWS KMS
        *   Hardware security module
    *   Supports server-side encryption using SSE-KMS and SSE-S3

**Amazon Spark on AWS**



*   Spark SQL
    *   Can read data from an existing Hive installation
*   Spark Streaming
    *   Ingest from kinesis
    *   Push to filesystems, and dashboards
*   MLLib (Machine Learning)
    *   ML library
*   GraphX
    *   Designed to simplify graph analytics tasks

**Amazon EMR Sandbox Applications**



*   Oozie
    *   Workflow scheduler Hadoop Jobs
*   Presto
    *   Distributed SQL query engine for GB to PB data
*   Spark
    *   Unified analytics engine
*   Sqoop
    *   Tool designed for efficiently transferring bulk data between Hadoop and structured data
*   Zeppelin
    *   Web-based notebook (similar to Jupyter)
*   Zookeeper
    *   Centralized service for maintaining config information

**Amazon EMR Spot Instances**



*   Master node
*   Core instance fleet
*   Task instance fleet

**Amazon Redshift**



*   Columns are fast to read
*   Database inserts are expensive and inefficient (update tables)
*   COPY and UPSERT
*   MPP (Massively Parallel Processing cluster).
*   Key Distribution Styles
    *   Even:  Distribute the rows across the slices in a round-robin fashion **(Doesn't participate in Joins)**
    *   Key:  Distribute according to the values in one column **(Columns in Joins are placed together)**
    *   All:  Distribute the entire table to every node **(Much longer to load update and insert).  Multiplies the data by every node**
*   Sort Key:
    *   Compound
        *   Query predicates use a predicate
    *   Interleaved
        *   Equal preference to predicates
*   Queues: 
    *   By default 1 queue with 5 concurrent queries
    *   Can have 50 concurrent queries to queue
    *   Can specify by each Queue
    *   Superuser can always run a job
*   What are the functions of the Amazon Redshift leader node?
    *   Acts as a SQL endpoint
    *   Stores metadata
    *   Generates and coordinates query execution plans
*   What are the AWS services that can be used to load data into Amazon Redshift?
    *   DynamoDB
    *   EMR
    *   DataPipeline
    *   Kinesis Data Firehose
    *   Amazon S3

**Amazon Redshift vs EMR**



*   EMR (custom code to analyze large datasets with Spark/Hadoop)
*   Redshift:
    *   Complex queries on structured data

**Amazon Athena Uses**



*   Apache Hive for DDL functionality
    *   Complex data types
    *   Multitude of formats
    *   Supports data partitioning
    *   Optimized for query throughput
*   Teradata Presto for SQL queries
    *   An in-memory distributed query engine
    *   ANSI-SQL compatible with extensions
    *   Optimized for latency
*   Best Practices
    *   Partitioning
        *   Reduce the amount of data scanned
        *   Read-only files necessary for queries
    *   Compression and file sizes
        *   Splittable files allow Athena's execution engine to split reading of a file by multiple readers
    *   Columnar formats for analytics
        *   Optimize column-based reads
        *   Use Apache Parquet and Apache ORC
*   Asynchronous Interaction Model using Athena API supports:
    *   Named queries
    *   Column data and metadata
    *   Integration with existing data access tools
    *   Paginated result sets

**Choosing Analytics Services**



*   Amazon Redshift
    *   Data warehouse for historical analysis and reporting
*   Amazon Redshift Spectrum
    *   Extends data warehouse queries to Amazon S3
    *   Differentiates performance for complex queries over TBs of data on Amazon S3
    *   Improves availability and concurrency on Amazon Redshift
*   Amazon Athena
    *   On-demand interactive querying
    *   Run simple queries by using standard SQL on Amazon S3
