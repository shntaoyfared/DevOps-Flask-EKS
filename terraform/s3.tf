resource "aws_s3_bucket" "terraform_state" {
  bucket = "fared-terraform-state-2026"

  tags = {
    Name        = "Terraform State"
    Environment = "Dev"
  }
}
