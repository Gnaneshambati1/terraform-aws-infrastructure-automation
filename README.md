\# Terraform AWS Infrastructure Automation \& Deployment



\### Automating AWS Cloud Infrastructure Using Terraform (Infrastructure as Code)



<p align="center">

&#x20; <strong>Build • Provision • Automate • Deploy</strong>

</p>



\---



\## 1. Project Overview



This project demonstrates how to design, provision and deploy AWS cloud infrastructure using \*\*Terraform (Infrastructure as Code)\*\*.



Instead of manually creating AWS resources through the AWS Management Console, Terraform is used to automate the infrastructure provisioning process through reusable configuration files.



The project creates a custom AWS network, provisions an Ubuntu EC2 instance, configures networking and security, and automatically installs an Nginx web server using a Bash user-data script.



It also demonstrates Terraform modules and remote state management using Amazon S3 with native state locking.



\### Project Objectives



\- Automate AWS infrastructure provisioning using Terraform.

\- Build a custom Virtual Private Cloud (VPC).

\- Configure public networking and internet connectivity.

\- Deploy an Ubuntu 24.04 EC2 instance.

\- Install and configure Nginx automatically.

\- Organize infrastructure using reusable Terraform modules.

\- Manage Terraform state remotely using Amazon S3.



\---

\## 2. AWS Infrastructure Architecture



The following architecture illustrates how Terraform provisions AWS resources, how internet traffic reaches the Nginx web server, and how Terraform state is managed remotely using Amazon S3.



\### Architecture Diagram



```mermaid

flowchart TB

&#x20;   USER(\["Internet Users"])



&#x20;   subgraph AWS\["AMAZON WEB SERVICES"]

&#x20;       subgraph VPC\["Virtual Private Cloud - 10.0.0.0/16"]

&#x20;           IGW\["Internet Gateway"]

&#x20;           RT\["Public Route Table"]

&#x20;           SUBNET\["Public Subnet - 10.0.1.0/24"]

&#x20;           SG\["Security Group - HTTP Port 80"]

&#x20;           EC2\["EC2 Instance - Ubuntu 24.04 LTS"]

&#x20;           NGINX\["Nginx Web Server - Custom Website"]



&#x20;           IGW --- RT

&#x20;           RT --> SUBNET

&#x20;           SUBNET --> SG

&#x20;           SG --> EC2

&#x20;           EC2 --> NGINX

&#x20;       end



&#x20;       S3\[("Amazon S3 - Remote Terraform State")]

&#x20;   end



&#x20;   TF\["Terraform - Infrastructure as Code"]

&#x20;   MODULE\["Reusable EC2 Module"]

&#x20;   SCRIPT\["Bash User Data - Nginx Installation"]



&#x20;   USER --> IGW

&#x20;   TF --> VPC

&#x20;   TF --> S3

&#x20;   TF --> MODULE

&#x20;   MODULE --> EC2

&#x20;   SCRIPT --> EC2



&#x20;   classDef user fill:#dbeafe,stroke:#2563eb,color:#1e3a8a

&#x20;   classDef terraform fill:#ede9fe,stroke:#7c3aed,color:#4c1d95

&#x20;   classDef network fill:#d1fae5,stroke:#059669,color:#064e3b

&#x20;   classDef compute fill:#ffedd5,stroke:#ea580c,color:#9a3412

&#x20;   classDef storage fill:#fce7f3,stroke:#db2777,color:#831843



&#x20;   class USER user

&#x20;   class TF,MODULE,SCRIPT terraform

&#x20;   class IGW,RT,SUBNET,SG network

&#x20;   class EC2,NGINX compute

&#x20;   class S3 storage

```



\### Architecture Explanation



1\. \*\*Internet Users:\*\* Access the deployed website through a web browser using the EC2 public IP address.

2\. \*\*Internet Gateway:\*\* Enables communication between the VPC and the internet.

3\. \*\*Public Route Table:\*\* Routes internet-bound traffic through the Internet Gateway.

4\. \*\*Public Subnet:\*\* Hosts the EC2 instance and provides public network connectivity.

5\. \*\*Security Group:\*\* Allows inbound HTTP traffic on port 80.

6\. \*\*Amazon EC2:\*\* Runs the Ubuntu 24.04 LTS operating system.

7\. \*\*Nginx Web Server:\*\* Serves the custom-designed website.

8\. \*\*Terraform:\*\* Automates AWS infrastructure provisioning through Infrastructure as Code.

9\. \*\*Reusable EC2 Module:\*\* Organizes EC2 configuration into reusable Terraform components.

10\. \*\*Bash User Data:\*\* Automatically installs and configures Nginx during instance initialization.

11\. \*\*Amazon S3:\*\* Stores Terraform state remotely and supports native state locking.



\### Infrastructure Workflow



\*\*Terraform Configuration → AWS Resource Provisioning → EC2 Initialization → Nginx Installation → Website Deployment → Browser Access\*\*





\## 3. AWS Resources Created



| AWS Resource | Description |

|---|---|

| Amazon VPC | Creates an isolated virtual network |

| Public Subnet | Hosts the EC2 instance |

| Internet Gateway | Enables internet connectivity |

| Route Table | Controls network traffic routing |

| Route Table Association | Connects the subnet to the public route table |

| Security Group | Controls inbound and outbound traffic |

| Amazon EC2 | Provides virtual compute infrastructure |

| Amazon EBS | Provides encrypted root storage |

| Amazon S3 | Stores Terraform remote state |



\*\*Important:\*\* The project uses a public subnet and public IP for this HTTP demonstration. It does not configure public SSH access or a NAT Gateway.



\---



\## 4. Technology Stack



| Technology | Purpose |

|---|---|

| Amazon Web Services | Cloud infrastructure platform |

| Terraform | Infrastructure as Code |

| HCL | Terraform configuration language |

| Amazon EC2 | Virtual machine |

| Amazon VPC | Network isolation |

| Ubuntu 24.04 LTS | Operating system |

| Nginx | Web server |

| Amazon S3 | Remote Terraform state |

| Bash | Automated server configuration |

| Git \& GitHub | Version control and project hosting |

| AWS CLI | AWS command-line management |



\---



\## 5. Project Directory Structure



The project is organized into separate Terraform configuration files and a reusable EC2 module.



```text

terraform-aws-infrastructure-automation/

│

├── .github/

│   └── workflows/

│

├── modules/

│   └── ec2/

│       ├── main.tf

│       ├── variables.tf

│       └── outputs.tf

│

├── backend.tf

├── main.tf

├── provider.tf

├── variables.tf

├── outputs.tf

├── versions.tf

├── terraform.tfvars.example

├── user\_data.sh

├── .gitignore

├── .terraform.lock.hcl

└── README.md

```



\### File Responsibilities



| File | Responsibility |

|---|---|

| `main.tf` | Defines AWS networking and calls the EC2 module |

| `provider.tf` | Configures the AWS provider |

| `variables.tf` | Defines configurable input variables |

| `outputs.tf` | Displays infrastructure information |

| `versions.tf` | Defines Terraform and provider version constraints |

| `backend.tf` | Configures the S3 remote backend |

| `user\_data.sh` | Installs and configures Nginx automatically |

| `terraform.tfvars.example` | Provides example variable values |

| `modules/ec2/` | Contains reusable EC2 infrastructure configuration |

| `.terraform.lock.hcl` | Locks selected provider versions |

| `.gitignore` | Excludes state, plans and sensitive local files |



\---



\## 6. How the Deployment Works



The infrastructure deployment follows these steps:



\*\*Step 1 — Terraform Initialization\*\*



Terraform downloads the required AWS provider and initializes the configured backend.



\*\*Step 2 — AWS Networking\*\*



Terraform provisions the VPC, public subnet, Internet Gateway, route table and route table association.



\*\*Step 3 — Security Configuration\*\*



A security group is created to allow HTTP access on port 80.



\*\*Step 4 — EC2 Provisioning\*\*



A reusable EC2 module provisions an Ubuntu 24.04 virtual machine in the public subnet.



\*\*Step 5 — Automated Web Server Installation\*\*



The `user\_data.sh` script executes during EC2 initialization and installs Nginx.



\*\*Step 6 — Website Deployment\*\*



Nginx serves the custom HTML website.



\*\*Step 7 — Terraform Outputs\*\*



Terraform displays the EC2 instance ID, public IP, VPC ID and website URL.



\---



\## 7. Prerequisites



Before deploying this project, ensure you have:



\- An AWS account.

\- Terraform CLI installed.

\- AWS CLI installed and configured.

\- An IAM identity with the required AWS permissions.

\- Git installed.

\- An existing S3 bucket for the Terraform backend.



The S3 bucket must be created before initializing this project. Enable bucket versioning, encryption and Block Public Access.



\---



\## 8. Deployment Instructions



\### Step 1 — Clone the Repository



```bash

git clone https://github.com/Gnaneshambati1/terraform-aws-infrastructure-automation.git

cd terraform-aws-infrastructure-automation

```



\### Step 2 — Configure AWS Credentials



Configure an AWS CLI profile with the required permissions.



Do not place AWS access keys or secret keys inside Terraform configuration files or GitHub.



\### Step 3 — Configure the Remote Backend



Open `backend.tf` and configure the name of your own existing S3 bucket, state key and AWS region.



The example backend configuration in this project is specific to its original deployment. You must use a bucket that you own before initializing your copy.



\### Step 4 — Configure Variables



Create your local Terraform variable file from the example:



```powershell

Copy-Item terraform.tfvars.example terraform.tfvars

```



Update the region, VPC CIDR and subnet CIDR values as required.



\### Step 5 — Initialize Terraform



```bash

terraform init

```



\### Step 6 — Format and Validate



```bash

terraform fmt -recursive

terraform validate

```



\### Step 7 — Review the Infrastructure Plan



```bash

terraform plan

```



Review the proposed resources before deployment.



\### Step 8 — Deploy AWS Infrastructure



```bash

terraform apply

```



Review the plan and approve the deployment when prompted.



\### Step 9 — Retrieve Deployment Information



```bash

terraform output

```



Retrieve the website URL:



```bash

terraform output web\_server\_url

```



Open the returned HTTP URL in a browser to access the Nginx website.



Allow a few minutes for EC2 initialization and Nginx installation.



\---



\## 9. Terraform State Management



Terraform state keeps track of the infrastructure managed by Terraform.



This project uses an Amazon S3 remote backend instead of storing the primary state file in the project directory.



\### State Management Features



\- Remote state storage in Amazon S3.

\- Server-side encryption configured in the backend.

\- Native S3 state locking using `use\_lockfile = true`.

\- State versioning recommended on the S3 bucket.

\- Local state backups maintained separately.

\- State files excluded from GitHub.



\### Useful State Commands



```bash

terraform state list

terraform state show module.web\_server.aws\_instance.this

terraform state pull

```



\*\*Security Note:\*\* Terraform state may contain sensitive infrastructure information. Never publish state files or state backups in a public repository.



\---



\## 10. Security Best Practices



Security measures implemented in this project include:



\- Dedicated IAM identity for Terraform operations.

\- No hardcoded AWS credentials.

\- No public SSH ingress rule.

\- HTTP ingress restricted to the required web port.

\- EC2 Instance Metadata Service Version 2 (IMDSv2) required.

\- Encrypted EC2 root EBS volume.

\- Terraform state stored remotely in S3.

\- Terraform state, plans and local variable files excluded from Git.



\*\*Production improvement:\*\* For production workloads, configure HTTPS, restrict public access where possible, apply least-privilege IAM policies, and implement appropriate monitoring and logging.



\---



\## 11. Cost Considerations



AWS infrastructure can incur charges depending on the selected region, resource configuration and usage.



Potential charges include:



\- EC2 instance usage.

\- EBS storage.

\- Public IPv4 address usage.

\- S3 storage and requests.



Review AWS pricing before deploying. Back up Terraform state before destroying infrastructure.



\---



\## 12. Project Screenshots



Screenshots will be added to this section to demonstrate the actual deployment.



Recommended screenshots:



1\. AWS infrastructure resources.

2\. Terraform initialization and successful deployment.

3\. EC2 instance running in AWS.

4\. Custom Nginx website in a browser.

5\. Terraform outputs showing infrastructure details.



\---



\## 13. Skills Demonstrated



Through this project, I gained practical experience with:



\- Infrastructure as Code (IaC).

\- AWS infrastructure provisioning.

\- VPC and public networking.

\- EC2 deployment and configuration.

\- Terraform modules and variables.

\- Terraform remote state and state locking.

\- Automated Linux server configuration.

\- Nginx web server deployment.

\- Git and GitHub project management.

\- Infrastructure security and troubleshooting.



\---



\## 14. Future Enhancements



Potential improvements for future versions:



\- HTTPS configuration using SSL/TLS.

\- Application Load Balancer.

\- Auto Scaling Group.

\- Private subnet architecture.

\- CloudWatch monitoring and alerts.

\- CI/CD automation using GitHub Actions.

\- Multi-environment deployments using Terraform workspaces.



\---



\## Project Information



\*\*Project Name:\*\* Terraform AWS Infrastructure Automation \& Deployment



\*\*Cloud Platform:\*\* Amazon Web Services



\*\*Infrastructure as Code:\*\* Terraform



\*\*Operating System:\*\* Ubuntu 24.04 LTS



\*\*Web Server:\*\* Nginx



\*\*Deployment Region:\*\* Asia Pacific (Mumbai)



\*\*Project Repository:\*\* \[terraform-aws-infrastructure-automation](https://github.com/Gnaneshambati1/terraform-aws-infrastructure-automation)



\---



\*Built as a practical Cloud \& DevOps portfolio project to demonstrate AWS infrastructure provisioning and automation using Terraform.\*

