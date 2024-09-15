# Security Group for public instances (allowing HTTP and HTTPS inbound)
resource "aws_security_group" "management_public_sg_jenkins_alb" {
  name        = var.alb-sg-name
  description = var.alb-sg-description
  vpc_id      = var.vpc_id

  ingress {
    description = var.alb-sg-port80-description
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.alb-sg-ingress-port-80-cidr
  }

  ingress {
    description = var.alb-sg-port443-description
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.alb-sg-ingress-port-443-cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.alb-sg-tags
}
