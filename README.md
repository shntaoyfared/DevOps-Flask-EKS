# 🚀 Flask DevOps Project

A complete end-to-end DevOps project demonstrating how to automate the deployment of a Dockerized Flask application on Amazon EKS using Terraform, Helm, Amazon ECR, and GitHub Actions.

---

## 📖 Project Overview

This project provisions AWS infrastructure with **Terraform**, containerizes a **Flask** application using **Docker**, stores the image in **Amazon ECR**, deploys it to **Amazon EKS** with **Helm**, and automates the entire deployment process using **GitHub Actions**.

Every push to the `main` branch automatically builds a new Docker image, pushes it to Amazon ECR, and deploys the latest version to the Kubernetes cluster.

---

## 🏗️ Architecture

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Actions
    │
    ├── Build Docker Image
    ├── Push Image to Amazon ECR
    ├── Configure kubectl
    └── Deploy with Helm
             │
             ▼
      Amazon EKS Cluster
             │
             ▼
      Kubernetes Deployment
             │
             ▼
      AWS Load Balancer
             │
             ▼
      Flask Application
```

---

## 🛠️ Technologies Used

* Python 3.12
* Flask
* Docker
* Kubernetes
* Helm
* Terraform
* GitHub Actions
* Git
* AWS EKS
* AWS ECR
* AWS VPC
* AWS S3 (Terraform Backend)
* IAM

---

## 📁 Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── app/
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt
│   └── README.md
│
├── Helm/
│   └── flask-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│
├── terraform/
│   ├── backend.tf
│   ├── ecr.tf
│   ├── eks.tf
│   ├── nat.tf
│   ├── network.tf
│   ├── output.tf
│   ├── s3.tf
│   ├── subnet.tf
│   └── vpc.tf
│
└── README.md
```

---

## 🚀 Features

* Infrastructure as Code with Terraform
* Dockerized Flask application
* Amazon EKS Kubernetes cluster
* Amazon ECR image repository
* Helm deployment
* GitHub Actions CI/CD pipeline
* AWS LoadBalancer service
* Remote Terraform state stored in Amazon S3

---

## ⚙️ CI/CD Pipeline

Every push to the `main` branch triggers the following workflow:

1. Checkout repository
2. Configure AWS credentials
3. Login to Amazon ECR
4. Build Docker image
5. Push image to Amazon ECR
6. Configure `kubectl`
7. Deploy to Amazon EKS using Helm

---

## 🔐 Required GitHub Secrets

Configure the following repository secrets:

| Secret                  | Description           |
| ----------------------- | --------------------- |
| `AWS_ACCESS_KEY_ID`     | AWS Access Key        |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Access Key |
| `AWS_REGION`            | AWS Region            |
| `AWS_ACCOUNT_ID`        | AWS Account ID        |

---

## 📦 Deployment

Clone the repository:

```bash
git clone https://github.com/your-username/DevOps_assignment.git
cd DevOps_assignment
```

Deploy the infrastructure:

```bash
cd terraform

terraform init

terraform apply
```

Deploy the application manually with Helm:

```bash
helm upgrade --install flask ./Helm/flask-app
```

Or simply push to the `main` branch and let GitHub Actions deploy automatically.

---

## 📷 Application

Once deployed, the application is exposed through an AWS Load Balancer.

Example output:

```text
Hello from GitHub Actions CI/CD
```

---

## 📚 Skills Demonstrated

* AWS Cloud
* Infrastructure as Code
* Kubernetes
* Helm
* Docker
* CI/CD
* GitHub Actions
* Amazon EKS
* Amazon ECR
* Terraform
* Linux
* Networking
* IAM
* DevOps Best Practices

---

## ⭐ Acknowledgements

This project was built as a hands-on DevOps learning project to demonstrate a complete cloud-native deployment workflow using AWS and Kubernetes.
