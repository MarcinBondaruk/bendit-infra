variable "zone_id" {}
variable "record_name" {}
variable "record_type" {}

resource "aws_route53_record" "bendit" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = "300"
  records = [aws_instance.docker_host.public_ip]
}