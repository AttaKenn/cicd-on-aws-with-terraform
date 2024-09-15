# Security Group for public instances (allowing HTTP and HTTPS inbound)
resource "aws_security_group" "management_public_sg" {
  name        = var.sg-public-mgmt-name
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from only GitHub (Webhook) - api.github.com/meta"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sg-public-mgmt-ingress-port-80-cidr
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.sg-public-mgmt-ingress-port-443-cidr
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg-public-mgmt-ingress-port-22-cidr
  }

  ingress {
    description = "TCP/943 for OpenVPN connection"
    from_port   = 943
    to_port     = 943
    protocol    = "tcp"
    cidr_blocks = var.sg-public-mgmt-ingress-port-943-cidr
  }

  ingress {
    description = "UDP access for OpenVPN connection"
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = var.sg-public-mgmt-ingress-port-1194-cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg-public-mgmt-tags
}
