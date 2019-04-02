---
redirect_from:
  - "/lessons/lesson5-aws-big-data-analysis"
interact_link: content/lessons/Lesson5_AWS_Big_Data_Analysis.ipynb
kernel_name: python3
title: 'Lesson 5 - AWS Big Data Analysis'
prev_page:
  url: /lessons/Lesson4_AWS_Big_Data_Processing
  title: 'Lesson 4 - AWS Big Data Processing'
next_page:
  url: /lessons/Lesson6_AWS_Big_Data_Visualization
  title: 'Lesson 6 - AWS Big Data Visualization'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson5_AWS_Big_Data_Analysis.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Lesson 5 Analysis

## Pragmatic AI Labs



![alt text](https://paiml.com/images/logo_with_slogan_white_background.png)

This notebook was produced by [Pragmatic AI Labs](https://paiml.com/).  You can continue learning about these topics by:

*   Buying a copy of [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](http://www.informit.com/store/pragmatic-ai-an-introduction-to-cloud-based-machine-9780134863917)
*   Reading an online copy of [Pragmatic AI:Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.safaribooksonline.com/library/view/pragmatic-ai-an/9780134863924/)
*  Watching video [Essential Machine Learning and AI with Python and Jupyter Notebook-Video-SafariOnline](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118) on Safari Books Online.
* Watching video [AWS Certified Machine Learning-Speciality](https://learning.oreilly.com/videos/aws-certified-machine/9780135556597)
* Purchasing video [Essential Machine Learning and AI with Python and Jupyter Notebook- Purchase Video](http://www.informit.com/store/essential-machine-learning-and-ai-with-python-and-jupyter-9780135261095)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


## 5.1 Determine how to design and architect the analytical solution


## 5.2 Understand Redshift overview

### Link to AWS Console for Redshift cluster creation exercise:

https://console.aws.amazon.com/console



## 5.3  Learn Redshift design

### AWS Whitepaper on sizing Redshift clusters:

https://d1.awsstatic.com/whitepapers/Size-Cloud-Data-Warehouse-on-AWS.pdf


## 5.4 Use Redshift Data Ingestion

### Link to AWS Console for the Redshift data ingestion exercise:

https://console.aws.amazon.com/console




{:.input_area}
```
# code for:  `redshift-00-sales-create-tables.sql`
# should be run from your SQL IDE - not this colab notebook

-- create tables IF they do not already exist in the schema
-- helpfully, AWS provides IF NOT EXISTS which is useful in many queries
create table IF NOT EXISTS users(
	userid integer not null distkey sortkey,
	username char(8),
	firstname varchar(30),
	lastname varchar(30),
	city varchar(30),
	state char(2),
	email varchar(100),
	phone char(14),
	likesports boolean,
	liketheatre boolean,
	likeconcerts boolean,
	likejazz boolean,
	likeclassical boolean,
	likeopera boolean,
	likerock boolean,
	likevegas boolean,
	likebroadway boolean,
	likemusicals boolean);

create table IF NOT EXISTS venue(
	venueid smallint not null distkey sortkey,
	venuename varchar(100),
	venuecity varchar(30),
	venuestate char(2),
	venueseats integer);

create table IF NOT EXISTS category(
	catid smallint not null distkey sortkey,
	catgroup varchar(10),
	catname varchar(10),
	catdesc varchar(50));

create table IF NOT EXISTS date(
	dateid smallint not null distkey sortkey,
	caldate date not null,
	day character(3) not null,
	week smallint not null,
	month character(5) not null,
	qtr character(5) not null,
	year smallint not null,
	holiday boolean default('N'));

create table IF NOT EXISTS event(
	eventid integer not null distkey,
	venueid smallint not null,
	catid smallint not null,
	dateid smallint not null sortkey,
	eventname varchar(200),
	starttime timestamp);

create table IF NOT EXISTS listing(
	listid integer not null distkey,
	sellerid integer not null,
	eventid integer not null,
	dateid smallint not null  sortkey,
	numtickets smallint not null,
	priceperticket decimal(8,2),
	totalprice decimal(8,2),
	listtime timestamp);

create table IF NOT EXISTS sales(
	salesid integer not null,
	listid integer not null distkey,
	sellerid integer not null,
	buyerid integer not null,
	eventid integer not null,
	dateid smallint not null sortkey,
	qtysold smallint not null,
	pricepaid decimal(8,2),
	commission decimal(8,2),
	saletime timestamp);

```




{:.input_area}
```
# code for:  `redshift-01-sales-load-s3data.sql`
# should be run from your SQL IDE - not this colab notebook

copy users from 's3://awssampledbuswest2/tickit/allusers_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' region 'us-west-2';

copy venue from 's3://awssampledbuswest2/tickit/venue_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' region 'us-west-2';

copy category from 's3://awssampledbuswest2/tickit/category_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' region 'us-west-2';

copy date from 's3://awssampledbuswest2/tickit/date2008_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' region 'us-west-2';

copy event from 's3://awssampledbuswest2/tickit/allevents_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region 'us-west-2';

copy listing from 's3://awssampledbuswest2/tickit/listings_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '|' region 'us-west-2';

copy sales from 's3://awssampledbuswest2/tickit/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::<< insert your IAM ROLE ARN HERE'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-west-2';
```




{:.input_area}
```
# code for:  `redshift-02-sales-check-tables-after-data-load.sql`
# should be run from your SQL IDE - not this colab notebook

select count(*) from users;

select count(*) from venue;

select count(*) from category;

select count(*) from date;

select count(*) from event;

select count(*) from listing;

select count(*) from sales;

```




{:.input_area}
```
# code for:  `redshift-03-sales-sample-queries.sql`
# should be run from your SQL IDE - not this colab notebook

-- list all public tables, with columns and metadata (which we created) in Redshift
SELECT * FROM PG_TABLE_DEF
WHERE schemaname = 'public';

-- list all tables and columns where datatype of column is in a list we define
SELECT * FROM PG_TABLE_DEF
WHERE schemaname = 'public'
AND type IN ('smallint', 'date');

-- Get definition for the sales table.
SELECT *
FROM pg_table_def
WHERE tablename = 'sales';

-- Find total sales on a given calendar date.
SELECT sum(qtysold)
FROM   sales, date
WHERE  sales.dateid = date.dateid
AND    caldate = '2008-02-05';

-- Find top 10 buyers by quantity.
SELECT firstname, lastname, total_quantity
FROM   (SELECT buyerid, sum(qtysold) total_quantity
        FROM  sales
        GROUP BY buyerid
        ORDER BY total_quantity desc limit 20) Q, users
WHERE Q.buyerid = userid
ORDER BY Q.total_quantity desc;

-- Find events in the 99th percentile in terms of all time gross sales.
SELECT eventname, total_price
FROM  (SELECT eventid, total_price, ntile(1000) over(order by total_price desc) as percentile
       FROM (SELECT eventid, sum(pricepaid) total_price
             FROM   sales
             GROUP BY eventid)) Q, event E
       WHERE Q.eventid = E.eventid
       AND percentile = 1
ORDER BY total_price desc;

```




{:.input_area}
```
# code for:  `redshift-drop_tables-sales-example.sql`
# should be run from your SQL IDE - not this colab notebook

-- used to reset database; so you can repeat the tutorial on the same cluster
-- this will drop everything that user `awsuser` owns - change username to match your config
drop table category, date, event, listing, sales, users, venue;

```




{:.input_area}
```
# code for:  `redshift-vacuum_analyze.sql`
# should be run from your SQL IDE - not this colab notebook

-- VACUUM and ANALYZE are important to do after add/delete/modify a significant number of rows
-- VACUUM recovers space from deleted rows and restores the sort order
-- ANALYZE updates the statistics metadata.  This helps the query optimizer to generate more accurate query plans
vacuum;

-- this threshold can be changes; 0 means all rows in all tables are analyzed
set analyze_threshold_percent to 0;
analyze;

```


## 5.5 Apply Redshift operations

### AWS provided Redshift utilities - available on GitHub:

https://github.com/awslabs/amazon-redshift-utils



## 5.6 Use AWS Elasticsearch: operational analytics

### Link to AWS Console for Elasticsearch exercise:

https://console.aws.amazon.com/console




{:.input_area}
```
# elasticsearch - curl put single record

curl -XPUT <<INPUT YOUR elasticsearch_domain_endpoint>>/movies/_doc/1 -d '{"director": "Burton, Tim", "genre": ["Comedy","Sci-Fi"], "year": 1996, "actor": ["Jack Nicholson","Pierce Brosnan","Sarah Jessica Parker"], "title": "Mars Attacks!"}' -H 'Content-Type: application/json'
```




{:.input_area}
```
# elasticsearch - curl search single record

curl -XGET 'INPUT YOUR elasticsearch_domain_endpoint/movies/_search?q=mars'


```


## 5.7 Understand Machine Learning: clustering & regression

## 5.8 Use AWS Athena: interactive analytics

### S3 bucket path for NOAA data:   `s3://noaa-ghcn-pds/csv.gz/`



{:.input_area}
```
# code for:  `noaa.create_database.ddl`
# should be run from your Athena console in a browser - not this colab notebook

-- ddl query to create a separate database for NOAA climate data IF one does not exist
CREATE DATABASE IF NOT EXISTS noaa_climate;

```




{:.input_area}
```
# code for:  `noaa.create_table_from_gzip.ddl`
# should be run from your Athena console in a browser - not this colab notebook

-- first, manually create a climate database using the Athena console
-- Then use this DDL as a new query from Athena console to create historic_climate_gz table

CREATE EXTERNAL TABLE `historic_climate_gz`(
  `id` string,
  `yearmonthday` int,
  `element` string,
  `temperature` int,
  `m-flag` string,
  `q-flag` string,
  `s-flag` string,
  `obs-time` int)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://noaa-ghcn-pds/csv.gz/'
TBLPROPERTIES (
  'has_encrypted_data'='false',
  'transient_lastDdlTime'='1553207260')

```




{:.input_area}
```
# code for:  `noaa.select_hot_days.sql`
# should be run from your Athena console in a browser - not this colab notebook

-- query to scan 231+ years of climate data to report on hot days
--  data temperature is an integer multiple of 1/10 degree celcius, so we divide by 10 to get actual temp
-- filter on temps >40 deg celsius which is about 105 deg fahrenheit
SELECT yearmonthday, round(temperature/10) from historic_climate_gz
WHERE element = 'TMAX' AND (temperature/10) > 40
LIMIT 10000;



```

