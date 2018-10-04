variable "domain" {
    description = "DNS Domain"
    default     = "onug.net."
}

data "aws_route53_zone" "selected" {
    name         = "${var.root_domain}"
}
