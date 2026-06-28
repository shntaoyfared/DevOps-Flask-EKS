# Dockerize and Push Flask Application to Amazon ECR

## Overview

This guide explains how to build the Docker image for the Flask application and push it to the Amazon Elastic Container Registry (ECR) repository created with Terraform.

---

## Prerequisites

Before starting, ensure you have the following installed:

* Docker
* AWS CLI
* Terraform (Infrastructure already deployed)
* AWS account with appropriate permissions

Verify the installations:

```bash
docker --version
aws --version
```

---

## Step 1: Configure AWS Credentials

Configure the AWS CLI if you have not already done so:

```bash
aws configure
```

Provide:

* AWS Access Key ID
* AWS Secret Access Key
* Default Region: `us-east-1`
* Output Format: `json`

Verify the credentials:

```bash
aws sts get-caller-identity
```

---

## Step 2: Build the Docker Image

Navigate to the application directory containing the `Dockerfile`.

Build the Docker image:

```bash
docker build -t flask-app .
```

Verify the image:

```bash
docker images
```

---

## Step 3: Authenticate Docker with Amazon ECR

Retrieve an authentication token and log in to Amazon ECR:

```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com
```

Replace `<ACCOUNT_ID>` with your AWS Account ID.

---

## Step 4: Tag the Docker Image

Tag the image using your ECR repository URI:

```bash
docker tag flask-app:latest <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
```

---

## Step 5: Push the Image to Amazon ECR

Push the tagged image:

```bash
docker push <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
```

---

## Step 6: Verify the Image

List the images stored in the repository:

```bash
aws ecr list-images --repository-name flask-app --region us-east-1
```

Alternatively, verify the image in the AWS Management Console under **Amazon ECR → Repositories → flask-app**.

---

## Dockerfile

```dockerfile
FROM python:3.12

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

---

## Project Structure

```text
app/
├── app.py
├── requirements.txt
├── Dockerfile
└── README.md
```
