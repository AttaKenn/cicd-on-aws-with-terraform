# Security Group for private instances
resource "aws_security_group" "management_private_sg" {
  name        = var.sg-private-mgmt-name
  description = "Security group for private subnet instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow all inbound traffic from within the VPC and Peered VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg-private-mgmt-ingress-port-0-cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg-private-mgmt-tags
}
