variable "count" {
    default = 1
}

variable "hostname" {
    description = "Hostname"
}

variable "records" {
    description = "DNS Records"
    type        = "list"
}

variable "root_domain" {
    description = "Defines the root domain of MediaWiki"
    default = "onug.net."
}

variable "create_cname" {
  description = "If set to true, create a CNAME for the service"
  default = 0
}

variable "cname_record_name" {
  description = "CNAME record name"
  default = "management"
}

output "fqdn" {
  description = "FQDN associated with the service"
  value       = "${aws_route53_record.record.name}"
}