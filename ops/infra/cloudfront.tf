locals { s3_origin_id = "${var.SERVICE}-${var.ENVIRONMENT}" }
resource "aws_cloudfront_distribution" "this" {
  provider = "aws.global"

  aliases     = ["%{ if var.URL != "" }${var.URL}%{ else }${var.SERVICE}-${var.ENVIRONMENT}.${var.DOMAIN}%{ endif }"]
  price_class = "PriceClass_100"
  enabled         = true
  is_ipv6_enabled = true

  viewer_certificate {
    acm_certificate_arn      = "${aws_acm_certificate_validation.this.certificate_arn}"
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction { restriction_type = "none" }
  }

  origin {
    origin_id   = "${local.s3_origin_id}"
    domain_name = "${aws_s3_bucket.this.website_endpoint}"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "${local.s3_origin_id}"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 60
    default_ttl            = 600
    max_ttl                = 600

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  }
}
