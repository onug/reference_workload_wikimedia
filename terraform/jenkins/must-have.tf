terraform {
    backend "s3" {
        bucket = "apcela-terraform-state"
        region = "us-east-1"
        profile = "apcela"
  }
}

variable "profile" {}
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
        "euw1"  = "eu-west-1"       # EU (Ireland)
        "euc1"  = "eu-central-1"    # EU (Frankfurt)
        "euw2"  = "eu-west-2"       # EU (London)
        "apne1" = "ap-northeast-1"  # Asia Pacific (Tokyo)
        "apne2" = "ap-northeast-2"  # Asia Pacific (Seoul)
        "apse1" = "ap-southeast-1"  # Asia Pacific (Singapore)
        "apse2" = "ap-southeast-2"  # Asia Pacific (Sydney)
        "aps1"  = "ap-south-1"      # Asia Pacific (Mumbai)
        "sae1"  = "sa-east-1"       # South America (São Paulo)
    }
}

provider "aws" {
    region = "${lookup(var.aws_region, var.aws_region_alias)}"
    profile = "apcela"
}
