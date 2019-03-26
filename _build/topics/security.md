---
title: 'security'
prev_page:
  url: /topics/topics
  title: 'Topics'
next_page:
  url: /topics/big_data_test_prep_notes
  title: 'AWS Big Data Test Prep Notes'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---
**AWS Security Best Practices**



*   **Shared Responsibility mode**:  AWS provides a globally secure infrastructure.  Customers are responsible for protecting confidentiality, integrity, availability and business requirements.

_Infrastructure Services_

_Containers_

_Abstracted Services_

 *   **AWS Manages**
        *   Facilities
        *   Physical security of hardware
        *   Network infrastructure
        *   Virtualization infrastructure
 *   **Customer Manages**
        *   Amazon Machine Images( AMIs)
        *   OS
        *   Applications
        *   Data in transit
        *   Data at rest
        *   Data stores
        *   Credentials
        *   Policies and configuration

**AWS Secure Global Infrastructure**

*  **IAM Service: **centrally managed users, security credentials, access keys, and permission policies for services and resources.

*   **Regions:  **Used to manage network latency and regulatory compliance.  Consist of at least two Availability Zones

*   **Availability Zones:  **Designed for fault tolerance, interconnected using high-speed links. The customer is responsible for designing system across AZ.

*   **Endpoints:  **AWS provides management "backplane" access to services via API and CLI.

**Strategies for Using Multiple AWS Accounts**

*   **Centralized security management**
    *   Single AWS account
*   **Separation of production, developing and testing**
    *   Three AWS accounts
        *   One for dev, one for prod, one for testing
*   **Multiple autonomous departments**
    *   Multiple AWS Accounts:
        *   Assign permissions/policies under each account
*   **Centralized security management with multiple autonomous independent projects**
    *   Multiple AWS Accounts:
        *   Single AWS account for common project resources: DNS, AD, CMS
        *   Separate accounts for each project

**Secure Your Data**



*   **Resource Access Authorization**
    *   Resource policies:  User creates resources and wants others to access. Root accounts always have access to manage resource policies.  The policy is attached to the resource.
    *   Capability policies:  "user-based permissions"  Assigned to IAM user directly or through the group.
    *   IAM Policies:  can restrict access to IP, specific time periods and other conditions
    *   Resource and capability policies are cumulative.
*   **Storing and Managing Encryption Keys in the Cloud**
    *   Can use the existing process
    *   Can level server-side encryption with AWS key management and storage
    *   Can use on-premise HSM or Cloud HSM (Hardware Security Module) to support a variety of use cases and applications
*   **Protecting Data at Rest**
    *   Common Concerns
        *   Accidental information disclosure:  Use AWS permissions to manage access.  Use encryption to protect:  i.e S3, EBS.
        *   Data integrity compromise: Ensure accidental or deliberate modification using permissions, data integrity checks, backup and Versioning (S3)
        *   Accidental deletion:  Rule of least privilege, versioning and MFA delete
        *   System infrastructure availability:  Multiple AZ and Backup Replication.
*   **Protecting Data in Transit**
    *   Common Concerns:
        *   Accidental information disclosure:  access to data should be limited and encrypted using IPSec and/or SSL/TLS
        *   Data integrity compromise: want to ensure data integrity is not compromised.  Authenticate data integrity using IPSec, ESP/AH and/or SSL/TLS.  
        *   Peer identify compromise:  encryption is worthless if the remote end is attacker.  Use IPSec with pre-shared keys or X.509 certificates.

**Secure Your Infrastructure**



*   **Using Amazon Virtual Private Cloud (VPC)**
    *   Creates private clouds
    *   Can use private IP addresses
    *   Provides isolation from other customers and layer 3 (Network Layer IP routing) isolation from the Internet.

**References**


*   [AWS Security Best Practices](https://d1.awsstatic.com/training-and-certification/docs-sa-pro/AWS%20Certified%20Solutions%20Architect-Professional_Exam%20Guide.pdf)