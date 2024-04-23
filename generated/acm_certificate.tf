resource "aws_acm_certificate" "tfer--8f4359be-ad9b-424d-90ad-13d4342e79a2_hyobeom-002E-shop" {
  domain_name   = "hyobeom.shop"
  key_algorithm = "RSA_2048"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  subject_alternative_names = ["*.hyobeom.shop", "hyobeom.shop"]
  validation_method         = "DNS"
}
