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

<a href="https://colab.research.google.com/github/paiml/awsbigdata/blob/master/Lesson7_AWS_Big_Data_Data_Security_checkpoint.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

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

### Model Variations
![Shared Responsibility Model Overview][Shared Responsibility Model Overview]

[Shared Responsibility Model Overview]: https://user-images.githubusercontent.com/39421615/54854935-c20c0200-4cb1-11e9-8558-2b580c2b40d4.jpg

Shared Responsibility Model Overview

There are three major variations of the Shared Responsibility model.
* Infrastructure.
* Container.
* Abstract.

The amount of responsibilty for security reduces as you move to the right.

### Infrastructure Model
* EC2
* EBS
* VPC

The infrastructure model applies to low level infrastructure service where the user has direct control over virtual hardware such as EC2 instances, EBS volumes, VPC networks and firewalls.

In the infrastructure model you are responsible for security at every level above the physical infrastrcucture.
This includes.

Items to consider in this model are OS patching, data encryption (client, server, transport & at rest)

Most Big Data solutions on AWS will not use this model.

#### Infrastructure Model
![Infrastructure Model][Infrastructure Model]

[Infrastructure Model]: https://user-images.githubusercontent.com/39421615/54853999-aa7f4a00-4cae-11e9-8c77-a8d3b4f78f3d.jpg


### Container Model

The container model applies to services wher AWS manages the underlying foundation services such as virtaul servers, networking, and storage.

For example the RDS service is responsible is for provisioning servers, networks, EBS volumes AND RDBMS software such as MySQL INCLUDING security patches.  However you are still responsible for configuring firewall rules, user accounts, backups and recovery strategies.

This model is very common in Big Data solutions as it's employed by EMR, Redshift, and other relevant services

As you can see the area of responsibility for AWS has grown while the Customer's area has been reduced.

#### Container Model
![Container Model](https://user-images.githubusercontent.com/39421615/54854210-748e9580-4caf-11e9-9b9a-9461e245f3c6.jpg)

### Abstract Model


The Abstract model applies to all of the so called "serverless" service on the AWS platform.  Abstract services are fully managed by AWS with resources provisioned automatically as needed.

These services manage access control entirely via AWS IAM (Covered in the next section).

Some of these services also offer options for encrpyting data at rest.  For the Big Data exam it's very important to understand which services offer this and what the options are for key management.  We cover these services in some of the other modules, but the most important one to know is S3.  S3 ALWAYS stores data encrypted at rest, however you can opt to have AWS manage the keys automatically, use a specific key in their Key Management Service, or to use a supplied encryption key.  In the last case YOU are responsible for securing and retaining this key.  If the key is lost it is IMPOSSIBLE to recover the data!

Some services covered by the Abstract Model are:
* S3
* DynamoDB

#### Abstract Model
![Abstract Model](https://user-images.githubusercontent.com/39421615/54854001-af43fe00-4cae-11e9-904f-5b0ad0eeca1d.jpg)

## AWS Access and Identity Management

AWS Access and Identity Management commonly known as IAM allows you to manage access to AWS services and resources securely.   

### Principle of Least Privilege
![least privilege 1](https://user-images.githubusercontent.com/39421615/54962513-64cab780-4f22-11e9-8cd0-4d7034648806.jpg)
![least privilege 2](https://user-images.githubusercontent.com/39421615/54962759-58932a00-4f23-11e9-8d11-120ff883f075.jpg)

For any of the AWS exams it's very improtant that you understand the Principal of Least Priviledge.  The Principal of Least Priviledge simply states that a user or service should have access to ONLY the resources required to perform it's legitimate purpose.  

In this illustration there are two users with different job functions.  The first user is a NOC operator responsible for monitoring the availability of the production environment.  As part of his duties this user requires access to AWS Cloudwatch for Logs and metrics, and to EC2 to restart crashed instances or to increase capacity.  He does not need access to DynamoDB tables becuase these contian sensitive user data.  Any issues with DynamoDB will be reported through Cloudwatch.  This users access should NOT include DynamoDB.

The second user is an application developer.  This user also needs to access Cloudwatch Logs to diagnose bug reports and to make sure the application is running as expected.  The developer DOES need access to DynamoDB in order to troubleshoot issues realted to schema design and index performance.  The developer does NOT need to access EC2 as the operation of the servers is the responsibility of the NOC.  The developer should not be granted access to EC2 instances.

IAM allows you to create a security policy that conforms to this principle easily.  When considering any scenario on the test always keep in mind the minimum set of priviledges required to perform a given task.

There are 3 major resources you will interact with while configuring IAM:
1. Users
2. Groups
3. Roles

### Users
![users.jpg](https://user-images.githubusercontent.com/39421615/54941640-96c02780-4eea-11e9-8b77-93f429fc39ab.jpg)

#### User Types
![User Types](https://user-images.githubusercontent.com/39421615/54941973-60cf7300-4eeb-11e9-8bd3-d9701250a63a.jpg)

There are 2 distinct types of users in an AWS account:
1. Root users
2. IAM users

Each account has exactly one Root User.  This user always has full privileges over all resources in the account.  This account MUST be secured at all times and should NOT be used for day to day administrative or development tasks.  The best practice for the root account is to immediately secure it with Multi Factor Authentication (MFA), disable any API keys associated with it and only use it in case of emergency (such as lockout of other accounts).  That being said, there are a few tasks that can ONLY be performed by the root account such as changing your support plan or closing your account.

### Groups
![Groups](https://user-images.githubusercontent.com/39421615/54958641-adc73f80-4f13-11e9-8db8-b1bfddff9c88.jpg)

Groups are the simplest of the IAM objects.  Groups are simply a collection of User objects.  In fact IAM groups are even simpler than many other groups types becuase they can ONLY contain users directly... You cannot add a group to another group in AWS IAM.

Just becuase they're simple doesn't mean that groups aren't important!  You should almost always apply permissions to a group and add users to the group rather than applying permissions directly to a user.  This makes it much simpler to manage permissions.

### Roles
![Roles](https://user-images.githubusercontent.com/39421615/54964659-8cbe1900-4f2a-11e9-8a40-f233e10029a2.jpg)

AWS IAM Roles are conceptually similar to Users: You can assign permission policies to a Role just like you can a user or group.  However, instead of being associated with one person, a role is intended to be assumable by anyone who needs it.  A role does not have standard long-term credentials such as a password or access keys. Instead, when you assume a role, it provides you with temporary security credentials for your role session.

Roles have a number of use cases in AWS:

Delegation is used to assign permission to an IAM account that they wouldn't otherwise have.  This is commonly used to grant access to a user from another AWS account.  This is typical when there is a hierarchy of AWS accounts in an Organization.

Federation allows trust relationships to be formed with external account providers such as GSuite or Active Directory.  Users defined in external account providers may be assigned to one or more Roles and granted access to AWS resources.

For the AWS Big Data Exam you probably don't need to know much about Delegation or Federation.  These use cases tend to be covered by the Architect or DevOps exams.  Service and Service Linked Roles on the other hand must be understood to properly configure many of the Big Data services.

First, the definitions:

From the AWS documentation

"A Service Roles is role that a service assumes to perform actions in your account on your behalf. When you set up some AWS service environments, you must define a role for the service to assume. This service role must include all the permissions required for the service to access the AWS resources that it needs. Service roles vary from service to service, but many allow you to choose your permissions, as long as you meet the documented requirements for that service. Service roles provide access only within your account and cannot be used to grant access to services in other accounts. You can create, modify, and delete a service role from within IAM."

So, a Service Role is simply a role that is assumed by an AWS service on your behalf.  You are responsible for creating the role and configuring the permissions.  The role must exist before the AWS service can be configured to use it.

A Service-Linked Role is an evolution of the Service Role.  From the AWS docs:

"A unique type of service role that is linked directly to an AWS service. Service-linked roles are predefined by the service and include all the permissions that the service requires to call other AWS services on your behalf. The linked service also defines how you create, modify, and delete a service-linked role. A service might automatically create or delete the role. It might allow you to create, modify, or delete the role as part of a wizard or process in the service. Or it might require that you use IAM to create or delete the role. Regardless of the method, service-linked roles make setting up a service easier because you don’t have to manually add the necessary permissions."

The Big Data services use a mix of Service Role and Service-Linked Roles in their respective configurations.  The Big Data exam doesn't ask directly about which services use Service-Linked Roles, but it does ofter ask detailed questions about configuring roles for these services, so it's important to know the requirements for setting up each.  We cover a few of these in detail in the next part of this lesson.
