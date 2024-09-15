resource "aws_lb" "alb" {
  name               = var.alb-name
  internal           = var.alb-placement
  load_balancer_type = var.alb-type
  security_groups    = var.alb-sg
  subnets            = var.alb-subnets

  enable_deletion_protection = var.enable-alb-deletion-protection
}

resource "aws_lb_target_group" "alb_tg" {
  name     = var.alb-tg-name
  port     = var.alb-target-port
  protocol = var.alb-target-protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = var.alb-health-check-path
    healthy_threshold   = var.alb-healthy-threshold
    unhealthy_threshold = var.alb-unhealthy-threshold
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.alb-listener-port
  protocol          = var.alb-listener-protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "alb-target" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.alb-target-id
  port             = var.alb-target-port
}