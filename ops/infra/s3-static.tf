resource "aws_s3_bucket" "this" {
  bucket        = "${var.SERVICE}-${var.ENVIRONMENT}.${var.DOMAIN}"
  acl           = "public-read"
  force_destroy = true

  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.SERVICE}-${var.ENVIRONMENT}.${var.DOMAIN}/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

output "s3-uri" {
  value = "${aws_s3_bucket.this.bucket}"
}
