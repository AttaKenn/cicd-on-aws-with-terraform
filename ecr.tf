# ECR Repositories
module "alpha_app_frontend" {
  source           = "./modules/ecr"
  name             = var.ecr-app-frontend
  tags             = var.tags
  ecr-force-delete = var.ecr-force-delete
}

module "alpha_app_backend" {
  source           = "./modules/ecr"
  name             = var.ecr-app-backend
  tags             = var.tags
  ecr-force-delete = var.ecr-force-delete
}
