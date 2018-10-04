terraform {
    backend "s3" {
        bucket = "terraform-apcela"
        region = "us-east-1"
	profile = "apcela"
  }
}

variable "key_name" {}
variable "create_domain" {
    description = "Defines if a domain must be created for the instance"
    default = false
}
variable "root_domain" {
    description = "Defines the root domain of MediaWiki"
    default = "onug.net."
}
variable "profile" {}
variable "aws_profile" {}
variable "hostname" {}
variable "purpose" {}
variable "build" {}
variable "task" {}
variable "author" {}
variable "aws_region_alias" {}
variable "vpc_peering" {}
variable "aws_region" {
    description = "Region where the service will be deployed"
    type        = "map"
    default     = {
        "use1"  = "us-east-1"       # US East (N. Virginia)
        "use2"  = "us-east-2"       # US East (Ohio)
        "usw1"  = "us-west-1"       # US West (N. California)
        "usw2"  = "us-west-2"       # US West (Oregon)
        "cac1"  = "ca-central-1"    # Canada (Central)
        "euc1"  = "eu-central-1"    # EU (Frankfurt)
        "euw1"  = "eu-west-1"       # EU (Ireland)
        "euw2"  = "eu-west-2"       # EU (London)
        "apne1" = "ap-northeast-1"  # Asia Pacific (Tokyo)
        "apne2" = "ap-northeast-2"  # Asia Pacific (Seoul)
        "apse1" = "ap-southeast-1"  # Asia Pacific (Singapore)
        "apse2" = "ap-southeast-2"  # Asia Pacific (Sydney)
        "aps1"  = "ap-south-1"      # Asia Pacific (Mumbai)
        "sae1"  = "sa-east-1"       # South America (São Paulo)
    }
}

variable "subnet_az" {
    type        = "map"
    default     = {
        "use1"  = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1e"]
        #"use2"  = 
        "usw1"  = ["us-west-1a", "us-west-1b"]
        "usw2"  = ["us-west-2a", "us-west-2b", "us-west-2c"]
        #"cac1"  = 
        "euc1"  = ["eu-central-1a", "eu-central-1b"]
        "euw1"  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
        "euw2"  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
        #"apne1" = 
        #"apne2" = 
        #"apse1" = 
        #"apse2" = 
        #"aps1"  = 
        #"sae1"  = 
    }
}

provider "aws" {
    region = "${lookup(var.aws_region, var.aws_region_alias)}"
    profile = "${var.aws_profile}"
}
