---
redirect_from:
  - "/lessons/lesson7-aws-big-data-data-security"
interact_link: content/lessons/Lesson7_AWS_Big_Data_Data_Security.ipynb
kernel_name: python3
title: 'Lesson 7 - AWS Big Data Data Security'
prev_page:
  url: /lessons/Lesson6_AWS_Big_Data_Visualization
  title: 'Lesson 6 - AWS Big Data Visualization'
next_page:
  url: /lessons/Lesson8_AWS_Big_Data_Case_Studies
  title: 'Lesson 8 - AWS Big Data Case Studies'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson7_AWS_Big_Data_Data_Security.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Lesson 2 Data Security

## Pragmatic AI Labs



![alt text](https://paiml.com/images/logo_with_slogan_white_background.png)

This notebook was produced by [Pragmatic AI Labs](https://paiml.com/).  You can continue learning about these topics by:

*   Buying a copy of [Pragmatic AI: An Introduction to Cloud-Based Machine Learning](http://www.informit.com/store/pragmatic-ai-an-introduction-to-cloud-based-machine-9780134863917)
*   Reading an online copy of [Pragmatic AI:Pragmatic AI: An Introduction to Cloud-Based Machine Learning](https://www.safaribooksonline.com/library/view/pragmatic-ai-an/9780134863924/)
*  Watching video [Essential Machine Learning and AI with Python and Jupyter Notebook-Video-SafariOnline](https://www.safaribooksonline.com/videos/essential-machine-learning/9780135261118) on Safari Books Online.
* Watching video [AWS Certified Machine Learning-Speciality](https://learning.oreilly.com/videos/aws-certified-machine/9780135556597)
* Purchasing video [Essential Machine Learning and AI with Python and Jupyter Notebook- Purchase Video](http://www.informit.com/store/essential-machine-learning-and-ai-with-python-and-jupyter-9780135261095)
*   Viewing more content at [noahgift.com](https://noahgift.com/)


## AWS Shared Responsibility Model

One topic that you MUST understand to pass the AWS Big Data exam is the AWS Shared Responsibility Model.  This has been covered on every AWS exam that I've ever taken.  The good news is that the concepts are very simple to understand:  You, as a solution designer have a certain amount of responsibility when it comes to ensuring data security.  As an AWS customer you share this responsibility with AWS.  The line of delinieation for that responsibility varies depending on the AWS services employed by the solution.

## Model Variations
![Shared Responsibility Model Overview][Shared Responsibility Model Overview]

[Shared Responsibility Model Overview]: https://user-images.githubusercontent.com/39421615/54854935-c20c0200-4cb1-11e9-8558-2b580c2b40d4.jpg

Shared Responsibility Model Overview

There are three major variations of the Shared Responsibility model.
* Infrastructure.
* Container.
* Abstract.

The amount of responsibilty for security reduces as you move to the right.

## Infrastruture Model
* EC2
* EBS
* VPC

The infrastructure model applies to low level infrastructure service where the user has direct control over virtual hardware such as EC2 instances, EBS volumes, VPC networks and firewalls.

In the infrastructure model you are responsible for security at every level above the physical infrastrcucture.
This includes.

Items to consider in this model are OS patching, data encryption (client, server, transport & at rest)

Most Big Data solutions on AWS will not use this model.

## Infrastructure Model
![Infrastructure Model][Infrastructure Model]

[Infrastructure Model]: https://user-images.githubusercontent.com/39421615/54853999-aa7f4a00-4cae-11e9-8c77-a8d3b4f78f3d.jpg


## Container Model

The container model applies to services wher AWS manages the underlying foundation services such as virtaul servers, networking, and storage.

For example the RDS service is responsible is for provisioning servers, networks, EBS volumes AND RDBMS software such as MySQL INCLUDING security patches.  However you are still responsible for configuring firewall rules, user accounts, backups and recovery strategies.

This model is very common in Big Data solutions as it's employed by EMR, Redshift, and other relevant services

As you can see the area of responsibility for AWS has grown while the Customer's area has been reduced.

## Container Model
![Container Model](https://user-images.githubusercontent.com/39421615/54854210-748e9580-4caf-11e9-9b9a-9461e245f3c6.jpg)

## Abstract Model


The Abstract model applies to all of the so called "serverless" service on the AWS platform.  Abstract services are fully managed by AWS with resources provisioned automatically as needed.

These services manage access control entirely via AWS IAM (Covered in the next section).


* S3
* DynamoDB

## Abstract Model
![Abstract Model](https://user-images.githubusercontent.com/39421615/54854001-af43fe00-4cae-11e9-904f-5b0ad0eeca1d.jpg)
