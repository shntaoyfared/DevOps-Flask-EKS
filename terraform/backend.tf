terraform {
  backend "s3" {
    bucket = "fared-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


# terraform init -migrate-state
