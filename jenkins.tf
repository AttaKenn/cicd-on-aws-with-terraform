# IAM role for EC2 instance
resource "aws_iam_role" "ec2_role" {
  name = var.alpha-jenkins-ec2-role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

# IAM policy for Jenkins instance
resource "aws_iam_role_policy" "jenkins_instance_policy" {
  name = var.alpha-jenkins-instance-policy
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "ecr:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.ec2-profile-for-jenkins-instance
  role = aws_iam_role.ec2_role.name

  tags = var.tags
}

# Jenkins Server
module "jenkins_server_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name              = var.alpha-jenkins-server-name
  ami               = data.aws_secretsmanager_secret_version.jenkins_latest.secret_string
  availability_zone = var.jenkins-instance-az
  create_eip        = var.create-eip

  associate_public_ip_address = var.associate-public-ip
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  instance_type          = var.jenkins-instance-type
  key_name               = var.jenkins-key-name
  user_data              = file(var.jenkins-user-data)
  monitoring             = var.jenkins-monitoring
  vpc_security_group_ids = [module.management_private_sg.private_security_group_id]
  subnet_id              = module.management_vpc.private_subnets[0]

  tags = var.tags
}


