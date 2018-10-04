resource "null_resource" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"

  triggers = {
    id         		 = "${lower(join(var.delimiter, compact(concat(list(var.hostname, var.profile, var.aws_region_alias), var.attributes))))}"
    hostname   		 = "${lower(format("%v", var.hostname))}"
    profile    		 = "${lower(format("%v", var.profile))}"
    aws_region_alias = "${lower(format("%v", var.aws_region_alias))}"
    purpose          = "${lower(format("%v", var.purpose))}"
    author           = "${lower(format("%v", var.author))}"
    build            = "${lower(format("%v", var.build))}"
    task             = "${lower(format("%v", var.task))}"
    attributes 		 = "${lower(format("%v", join(var.delimiter, compact(var.attributes))))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
