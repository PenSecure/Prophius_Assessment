resource "aws_ecr_repository" "demo_ecr_repo" {
  name = "demo_ecr_repo"
}

resource "aws_ecr_repository_policy" "demo_ecr_repo_policy" {
  repository = aws_ecr_repository.demo_ecr_repo.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid       = "DenyPublicAccess",
        Effect    = "Deny",
        Principal = "*",
        Action    = "ecr:GetDownloadUrlForLayer",
        Condition = {
          Bool = {
            "ecr:Public" = true
          }
        }
      }
    ]
  })
}

output "ecr_repository_url" {
  value = aws_ecr_repository.demo_ecr_repo.repository_url
}
