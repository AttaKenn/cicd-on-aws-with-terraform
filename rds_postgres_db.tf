module "rds_postgres" {
  source = "./modules/rds_postgres_db"

  identifier               = var.db_identifier
  allocated_storage        = var.allocated_storage
  db_name                  = data.aws_secretsmanager_secret_version.automat_it_db_name_latest.secret_string
  engine                   = var.db_engine
  engine_version           = var.db_engine_version
  instance_class           = var.db_instance_class
  username                 = data.aws_secretsmanager_secret_version.automat_it_db_username_latest.secret_string
  password                 = data.aws_secretsmanager_secret_version.automat_it_db_password_latest.secret_string
  skip_final_snapshot      = var.db_skip_final_snapshot
  storage_encrypted        = var.db_storage_encrypted
  vpc_security_group_ids   = [module.application_private_sg.private_security_group_id]
  db_subnet_group_name     = var.db_subnet_group_name
  subnet_ids               = module.application_vpc.private_subnets[*]
  tags                     = var.tags
  aws_db_subnet_group_tags = var.aws_db_subnet_group_tags
}
