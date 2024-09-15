resource "aws_ecr_repository" "ecr" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  force_delete         = var.ecr-force-delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
