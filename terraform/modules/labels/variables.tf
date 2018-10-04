variable "aws_region_alias" {}
variable "profile" {}
variable "hostname" {}
variable "enabled" {
    description = "Set to false to prevent the module from creating any resources"
    default     = "true"
}

variable "delimiter" {
    type        = "string"
    default     = "-"
    description = "Delimiter to be used between `hostname`, `profile`, `aws_region_alias`, etc."
}

variable "attributes" {
    type        = "list"
    default     = []
    description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
    type        = "map"
    default     = {}
    description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "build" {
    description = "Jenkins build number"
    default     = "000"
}

variable "task" {
    description = "Jira task number"
    default     = "vero-000"
}

variable "purpose" {
    default = "not informed"
}
variable "author" {
    default = "not informed"
}
