# Security Group for public instances (allowing HTTP and HTTPS inbound)
resource "aws_security_group" "application_public_sg" {
  name        = var.name
  description = var.application-vpc-public-sg-description
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.application-vpc-sg-anywhere-cidr-block
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.application-vpc-sg-anywhere-cidr-block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.application-vpc-sg-anywhere-cidr-block
  }

  tags = var.application-vpc-sg-tags
}
