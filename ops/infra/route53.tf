data "aws_route53_zone" "primary" {
  name = "${var.DOMAIN}"
}

resource "aws_acm_certificate" "this" {
  provider          = "aws.global"
  domain_name       = "%{ if var.URL != "" }${var.URL}%{ else }${var.SERVICE}-${var.ENVIRONMENT}.${var.DOMAIN}%{ endif }"
  validation_method = "DNS"
}

resource "aws_route53_record" "validation" {
  name    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.primary.zone_id}"
  records = ["${aws_acm_certificate.this.domain_validation_options.0.resource_record_value}"]
  ttl     = "60"
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn = "${aws_acm_certificate.this.arn}"
  validation_record_fqdns = [
    "${aws_route53_record.validation.fqdn}",
  ]
}
resource "aws_route53_record" "this" {
  zone_id = "${data.aws_route53_zone.primary.zone_id}"
  name    = "%{ if var.URL != "" }${var.URL}%{ else }${var.SERVICE}-${var.ENVIRONMENT}.${var.DOMAIN}%{ endif }"
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = "${aws_cloudfront_distribution.this.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.this.hosted_zone_id}"
  }
}

output "deployed_url" {
  value = "${aws_route53_record.this.name}"
}
