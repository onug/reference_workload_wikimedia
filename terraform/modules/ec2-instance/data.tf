# VPC
/*
variable "vpc_peering" {
    description = "VPC Peering"
    default = ""

}

variable "cidr_vpc_default" {
    description = "Cidr block from default VPC"
    default     = ""
}

data "aws_vpc" "selected" {
    default = "${var.vpc_default}"

    filter {
        name   = "${var.vpc_default == "false" ? "tag:Name" : "cidr"}"
        values = ["${var.vpc_default == "false" ? var.vpc_peering : var.cidr_vpc_default}"]
    }
}

output "vpc_id" {
    value = "${data.aws_vpc.selected.id}"
}
*/
# Availability zones
data "aws_availability_zones" "available" {}

output "availability_zones" {
    value = "${data.aws_availability_zones.available.names}"
}

# AMI
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

output "ubuntu_ami_id" {
    value = "${data.aws_ami.ubuntu.id}"
}

# Subnet
/*
data "aws_subnet_ids" "subnet" {
    vpc_id = "${data.aws_vpc.selected.id}"
}

data "aws_subnet" "subnets" {
    count = "${length(data.aws_subnet_ids.subnet.ids)}"
    id = "${data.aws_subnet_ids.subnet.ids[count.index]}"
}
*/
variable "subnet_count" {
    description = "Subnet amount"
    default     = 0
}

/*
output "subnet_ids" {
    value = "${data.aws_subnet_ids.subnet.ids}"
}

# Security groups
data "aws_security_group" "default" {
    name   = "default"
    vpc_id = "${data.aws_vpc.selected.id}"
}

output "sg_default_id" {
    value = "${data.aws_security_group.default.id}"
}
*/