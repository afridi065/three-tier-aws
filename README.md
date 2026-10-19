# AWS Three-Tier Web Application Deployment

## 📌 Project Overview

This project demonstrates how to design and deploy a secure, scalable, and highly available three-tier web application on Amazon Web Services (AWS).

The application follows a three-tier architecture consisting of a Presentation Layer, Application Layer, and Database Layer. It uses AWS networking and security services, Docker containerization, Terraform infrastructure as code, and GitHub Actions for CI/CD automation.

**Project Goal:** Build practical AWS Cloud and DevOps skills by deploying a Student Management System from development to cloud deployment.

## 🏗️ Architecture

The application follows this request flow:

```text
                    Users
                      |
                      v
             Application Load Balancer
                      |
             ---------------------
             |                   |
             v                   v
        Application EC2     Application EC2
        (Private Subnet)    (Private Subnet)
             |                   |
             ---------------------
                      |
                      v
                Amazon RDS
                 MySQL DB
                (Private)
```

### Architecture Components

**1. Presentation Layer**
- Application Load Balancer (ALB)
- Receives incoming HTTP/HTTPS requests
- Distributes traffic across healthy application instances

**2. Application Layer**
- Amazon EC2
- Python Flask backend
- Docker containers
- Processes application requests and business logic

**3. Database Layer**
- Amazon RDS for MySQL
- Stores student records and application data
- Configured without public database access

## 🛠️ Technologies Used

| Category | Technologies |
|---|---|
| Cloud Platform | AWS |
| Networking | VPC, Public Subnets, Private Subnets, Route Tables |
| Compute | Amazon EC2 |
| Load Balancing | Application Load Balancer |
| Database | Amazon RDS, MySQL |
| Backend | Python, Flask |
| Containerization | Docker |
| Infrastructure as Code | Terraform |
| CI/CD | GitHub Actions |
| Monitoring | Amazon CloudWatch |
| Version Control | Git, GitHub |
| Operating System | Linux |

## ✨ Key Features

- Three-tier cloud architecture
- Public and private subnet separation
- Application traffic routing through an ALB
- Database isolation using private networking
- Security groups with least-access principles
- Docker-based application deployment
- Infrastructure provisioning using Terraform
- Automated build and deployment using GitHub Actions
- Application and infrastructure monitoring using CloudWatch
- Health checks and troubleshooting practices

*Features listed above describe the intended project scope. Mark each feature as completed only after implementing and testing it.*

## 📂 Project Structure

```text
three-tier-project/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── templates/
│       └── index.html
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
├── scripts/
│   └── deploy.sh
├── tests/
│   └── test_app.py
├── .github/
│   └── workflows/
│       └── deploy.yml
├── Dockerfile
├── .gitignore
└── README.md
```

## 🚀 Deployment Overview

### Step 1: Create AWS Networking

- Create a VPC.
- Create public and private subnets across two Availability Zones.
- Configure an Internet Gateway and public route table.
- Configure private routing and outbound access only where required.

### Step 2: Configure Security

- Configure security groups for the ALB, application servers, and database.
- Allow application traffic only from the ALB security group.
- Allow MySQL traffic only from the application security group.
- Keep the database private.

### Step 3: Deploy the Database

- Create an Amazon RDS MySQL database.
- Configure a DB subnet group using private database subnets.
- Store credentials securely.
- Configure the application to connect to the database.

### Step 4: Deploy the Application

- Develop the Student Management System using Python Flask.
- Build a Docker image.
- Deploy the container to application EC2 instances.
- Register the instances with the ALB target group.
- Verify application health checks.

### Step 5: Automate with Terraform

- Define AWS resources using Terraform.
- Validate the configuration.
- Review the execution plan.
- Provision and manage infrastructure using Terraform.

### Step 6: Configure CI/CD

- Store source code in GitHub.
- Configure GitHub Actions to run tests and build the Docker image.
- Configure secure AWS authentication for deployment.
- Deploy changes through the pipeline.

### Step 7: Configure Monitoring

- Monitor EC2 and ALB metrics using CloudWatch.
- Collect application logs.
- Configure useful alarms.
- Troubleshoot unhealthy targets and application errors.

## 🔐 Security Best Practices

- Never commit AWS access keys, passwords, or database credentials.
- Do not expose the database to the public internet.
- Restrict security group rules to necessary sources and ports.
- Use IAM roles and least-privilege permissions.
- Use HTTPS with an appropriate TLS certificate for production.
- Store secrets in AWS Secrets Manager or another suitable secret-management service.
- Protect Terraform state because it may contain sensitive information.
- Enable logging and monitoring for troubleshooting and auditing.

## 🧪 Testing and Validation

The project should be tested to verify:

- The application is accessible through the ALB.
- Health checks report healthy application targets.
- Student records can be created and retrieved.
- The application can connect to RDS.
- The database is not publicly accessible.
- Security group rules prevent unauthorized connections.
- CI/CD successfully tests and deploys application changes.
- CloudWatch provides useful metrics and logs.

## 💡 Challenges and Troubleshooting

Common issues to investigate include:

- ALB target health checks failing
- Incorrect security group rules
- Application-to-database connectivity failures
- Incorrect database credentials
- Docker image build failures
- Terraform configuration errors
- GitHub Actions deployment failures

Troubleshooting should begin with application logs, CloudWatch metrics, target health status, routing, and security group rules.

## 📚 Learning Outcomes

By completing this project, I aim to demonstrate practical knowledge of:

- AWS cloud infrastructure and networking
- Three-tier architecture and traffic flow
- Linux and application deployment
- Docker containerization
- Terraform infrastructure as code
- CI/CD pipeline implementation
- Cloud monitoring and troubleshooting
- Cloud security fundamentals

## 🔮 Future Enhancements

- Configure HTTPS using AWS Certificate Manager.
- Add Auto Scaling for the application tier.
- Introduce blue-green or rolling deployments.
- Add automated integration tests.
- Improve observability with dashboards and alarms.
- Add a managed Kubernetes deployment as an advanced extension.

## 👨‍💻 Author

**Mohammed Afridi**

Aspiring AWS Cloud / DevOps Engineer

GitHub: https://github.com/YOUR-GITHUB-USERNAME

---

**Note:** This README documents the planned architecture and implementation process. Update the project status, screenshots, deployment details, and results to reflect what has actually been built and tested.
