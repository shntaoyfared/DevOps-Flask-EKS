output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "ecr_repository_url" {
  value = aws_ecr_repository.flask_repo.repository_url
}

output "cluster_iam_role_arn" {
  value = module.eks.cluster_iam_role_arn
}

output "vpc_id" {
  value = aws_vpc.example.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
