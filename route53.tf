resource "aws_route53_zone" "alpha" {
  name = var.route53-zone-name

  tags = var.tags
}

resource "aws_route53_record" "www" {
  zone_id    = aws_route53_zone.alpha.zone_id
  name       = var.www-name
  type       = var.www-type
  ttl        = var.www-ttl
  records    = [module.openvpn_access_server_instance.public_ip]
  depends_on = [module.openvpn_access_server_instance, aws_route53_zone.alpha]
}

resource "aws_route53_record" "jenkins" {
  zone_id    = aws_route53_zone.alpha.zone_id
  name       = var.jenkins53-name
  type       = var.jenkins53-cname
  ttl        = var.jenkins53-ttl
  records    = var.jenkins53-records
  depends_on = [module.jenkins_alb, aws_route53_zone.alpha]
}

resource "aws_route53_record" "openvpn" {
  zone_id    = aws_route53_zone.alpha.zone_id
  name       = var.openvpn53-name
  type       = var.openvpn53-type
  ttl        = var.openvpn53-ttl
  records    = [module.openvpn_access_server_instance.public_ip]
  depends_on = [module.openvpn_access_server_instance, aws_route53_zone.alpha]
}
