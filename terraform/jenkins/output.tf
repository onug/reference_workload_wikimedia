# Domain
output "jenkins_url" {
  description = "Jenkins domain"
  value       = "${module.dns_record_instance.fqdn}"
}

# EC2
output "instance_id" {
  description = "Jenkins instance ID"
  value       = "${module.ec2.id}"
}

output "public_ip" {
  description = "Jenkins public IP"
  value       = "${module.ec2.public_ip}"
}

output "private_ip" {
  description = "Jenkins public IP"
  value       = "${module.ec2.private_ip}"
}
