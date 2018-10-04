# Jenkins deployment

module "labels"{
  source = "../modules/labels"

  aws_region_alias = "${var.aws_region_alias}"    
  profile          = "${var.profile}"
  hostname         = "${var.hostname}"
  purpose          = "${var.purpose}"
  author           = "${var.author}"
  build            = "${var.build}"
  task             = "${var.task}"

}

# Jenkins Server
module "ec2" {
  source = "../modules/ec2"

  vpc_peering          = "${var.vpc_peering}"
  name                 = "${module.labels.id}"
  iam_instance_profile = "default"
  instance_type        = "t2.medium"

  root_block_device    = [
      {
          volume_size           = "50"
          volume_type           = "gp2"
          delete_on_termination = true
      }
  ]

  tags = "${module.labels.tags}"

}

# DNS
module "dns_record_instance" {
    source = "../modules/dns-record-instance"

    hostname = "${replace(module.labels.id, "-", ".")}"
    records = ["${module.ec2.public_ip}"]
}