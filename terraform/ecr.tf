resource "aws_ecr_repository" "flask_repo" {
  name = "flask-app"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "Dev"
  }
}

