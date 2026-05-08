# route53.tf
# Route 53 hosted zone and DNS records for gabrielperson.click
# Zone ID: Z09881251V7DJK0XE9ZII

/* resource "aws_route53_zone" "gabrielpersonclick" {
  name              = "gabrielperson.click"
  force_destroy     = false
  comment           = "Managed by Terraform"

  tags = {
    project = "lab01"
  }
} */

# DNS Records for gabrielperson.click

# NS Record - Name servers for the hosted zone
/* resource "aws_route53_record" "gabrielpersonclick_NS" {
  zone_id = aws_route53_zone.gabrielpersonclick.zone_id
  name    = "gabrielperson.click"
  type    = "NS"
  ttl     = 172800
  records = [
    "ns-1429.awsdns-50.org.",
    "ns-2023.awsdns-60.co.uk.",
    "ns-319.awsdns-39.com.",
    "ns-828.awsdns-39.net."
  ]
}

# SOA Record - Start of Authority
resource "aws_route53_record" "gabrielpersonclick_SOA" {
  zone_id = aws_route53_zone.gabrielpersonclick.zone_id
  name    = "gabrielperson.click"
  type    = "SOA"
  ttl     = 900
  records = [
    "ns-319.awsdns-39.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}
 */

# ACM Certificate Validation Record
/* resource "aws_route53_record" "gabrielpersonclick_acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.gabrielpersonclick.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.gabrielpersonclick.zone_id
} */

# Load Balancer Alias Record - A record pointing to ALB
/* resource "aws_route53_record" "loadbalancer_alias" {
  zone_id = aws_route53_zone.gabrielpersonclick.zone_id
  name    = "gabrielperson.click"
  type    = "A"

  alias {
    name                   = module.module_alb.alb_dns_name
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
} */

# Outputs for Route 53 Zone
/* output "route53_zone_id" {
  description = "Zone ID for gabrielperson.click hosted zone"
  value       = aws_route53_zone.gabrielpersonclick.zone_id
}

output "route53_zone_arn" {
  description = "ARN for gabrielperson.click hosted zone"
  value       = aws_route53_zone.gabrielpersonclick.arn
}

output "route53_name_servers" {
  description = "Name servers for gabrielperson.click hosted zone"
  value       = aws_route53_zone.gabrielpersonclick.name_servers
}

output "route53_primary_name_server" {
  description = "Primary name server for gabrielperson.click hosted zone"
  value       = aws_route53_zone.gabrielpersonclick.primary_name_server
} */