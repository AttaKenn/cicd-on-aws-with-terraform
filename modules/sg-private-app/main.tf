# Security Group for private instances
resource "aws_security_group" "application_private_sg" {
  name        = var.application_vpc_private_sg_name
  description = "Security group for private subnet instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow all inbound traffic from within the VPC and Peered VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg-private-app-ingress-port-0-cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.application-vpc-sg-tags
}
