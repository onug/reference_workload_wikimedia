# MediaWiki deployment

# Resourcers labels
module "labels" {
  source = "../modules/labels"

  aws_region_alias = "${var.aws_region_alias}"    
  profile          = "${var.profile}"
  hostname         = "${var.hostname}"
  purpose          = "${var.purpose}"
  author           = "${var.author}"
  build            = "${var.build}"
  task             = "${var.task}"

}

# VPC
module "vpc" {
  source = "../modules/vpc"

  name = "mediawiki-onug-vpc"

  cidr = "10.0.0.0/16"

  create_vpc = true
  create_database_subnet_group = true
  azs = "${var.subnet_az["${var.aws_region_alias}"]}"
  private_subnets = ["10.0.1.0/28", "10.0.2.0/28"]
  public_subnets = ["10.0.100.0/28", "10.0.200.0/28"]

  tags = "${module.labels.tags}"

  vpc_tags = "${module.labels.tags}"
}

# EC2 Security Group
module "sg" {
  source = "../modules/security-group"

  name        = "mediawiki-onug-sg"
  description = "Security group to the MediaWiki resources of ONUG"
  vpc_id      = "${module.vpc.vpc_id}"

  # Ingress
  ingress_cidr_blocks = ["0.0.0.0/0", "${module.vpc.vpc_cidr_block}"]
  ingress_rules = ["http-80-tcp", "https-443-tcp", "postgresql-tcp", "ssh-tcp"]

  # Egress
  egress_cidr_blocks = [ "0.0.0.0/0" ]
  egress_rules = ["all-all"]
}

# RDS Security Group
module "rds_sg" {
  source = "../modules/security-group"

  name        = "mediawiki-onug-sg"
  description = "Security group to the Database MediaWiki resource of ONUG"
  vpc_id      = "${module.vpc.vpc_id}"

  # Ingress
  ingress_cidr_blocks = ["${module.vpc.vpc_cidr_block}"]
  ingress_rules = ["postgresql-tcp"]

  # Egress
  egress_cidr_blocks = [ "0.0.0.0/0" ]
  egress_rules = ["all-all"]
}

# MediaWiki Server
module "ec2" {
  source = "../modules/ec2-instance"

  # Instance
  name                 = "${module.labels.id}"
  ami                  = "default"
  instance_type        = "t2.medium"
  key_name             = "${var.key_name}"

  # Networking
  vpc_security_group_ids = ["${module.sg.this_security_group_id}"]
  associate_public_ip_address = true
  subnet_id = "${module.vpc.public_subnets[0]}"

  root_block_device    = [
      {
          volume_size           = "50"
          volume_type           = "gp2"
          delete_on_termination = true
      }
  ]

  # Tags
  tags = "${module.labels.tags}"

}

# Database Server
module "rds" {
    source = "../modules/rds"

    identifier = "${module.labels.id}"

    # Database software
    engine    = "postgres"
    engine_version = "9.5.4"
    family = "postgres9.5"
    instance_class = "db.t2.small"
    allocated_storage = 10

    # Backup and Maintenance
    backup_window = "03:00-06:00"
    maintenance_window = "Sun:10:00-Sun:12:00"

    # Database data
    name    = "test"
    username   = "postgres"
    password   = "1w3r4E2Q"
    
    # Networking
    port       = "5432"
    publicly_accessible = false
    vpc_security_group_ids = ["${module.rds_sg.this_security_group_id}"]
    subnet_ids = ["${module.vpc.private_subnets}"]

    tags = "${module.labels.tags}"
}

# DNS
/*
module "dns_record_instance" {
    source = "../modules/dns-record-instance"

    count = "${var.create_domain}"
    root_domain = "${var.root_domain}"
    hostname = "${replace(module.labels.id, "-", ".")}"
    records = ["${module.ec2.public_ip}"]
}
*/
