resource "aws_db_instance" "postgres" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  skip_final_snapshot    = var.skip_final_snapshot
  storage_encrypted      = var.storage_encrypted
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name

  tags       = var.tags
  depends_on = [aws_db_subnet_group.postgres]
}

resource "aws_db_subnet_group" "postgres" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.aws_db_subnet_group_tags
}