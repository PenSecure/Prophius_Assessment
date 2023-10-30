resource "aws_ecr_repository" "demo_ecr_repo" {
  name = "demo_ecr_repo"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.demo_ecr_repo.repository_url
}
