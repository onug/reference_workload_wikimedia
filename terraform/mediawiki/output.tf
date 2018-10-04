# Domain

output "wiki_url" {
  description = "MediaWiki domain"
  #value       = "${var.create_domain == "1" ? module.dns_record_instance.fqdn : module.ec2.public_ip}"
  value       =  "${module.ec2.public_ip}"
}

# VPC
output "vpc_id" {
  description = "ID of the VPC created"
  value = "${module.vpc.vpc_id}"
}

# EC2
output "ec2_instance_id" {
  description = "MediaWiki instance ID"
  value       = "${module.ec2.id}"
}

output "ec2_public_ip" {
  description = "MediaWiki public IP"
  value       = "${module.ec2.public_ip}"
}

output "ec2_private_ip" {
  description = "MediaWiki private IP"
  value       = "${module.ec2.private_ip}"
}

output "ssh_key" {
  value = "${module.ec2.key_name}"
}


# Database
output "db_address" {
  description = "Database IP address"
  value       = "${module.rds.this_db_instance_address}"
}

output "db_name" {
  description = "Database name"
  value       = "${module.rds.this_db_instance_name}"
}

output "db_user" {
  description = "Database user"
  value       = "${module.rds.this_db_instance_username}"
}

output "db_password" {
  description = "Database password"
  value       = "${module.rds.this_db_instance_password}"
}

output "db_port" {
  description = "Database port"
  value       = "${module.rds.this_db_instance_port}"
}