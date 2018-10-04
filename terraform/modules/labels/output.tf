output "id" {
  value = "${null_resource.default.triggers.id}"
}

output "hostname" {
  value = "${null_resource.default.triggers.hostname}"
}

output "profile" {
  value = "${null_resource.default.triggers.profile}"
}

output "aws_region_alias" {
  value = "${null_resource.default.triggers.aws_region_alias}"
}

output "purpose" {
  value = "${null_resource.default.triggers.purpose}"
}

output "author" {
  value = "${null_resource.default.triggers.author}"
}

output "build" {
  value = "${null_resource.default.triggers.build}"
}

output "task" {
  value = "${null_resource.default.triggers.task}"
}

output "attributes" {
  value = "${null_resource.default.triggers.attributes}"
}

/*
output "vpc_default" {
  value = "${null_resource.default.triggers.vpc_default}"
}
*/

# Merge input tags with our tags.
# Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
output "tags" {
  value = "${
    merge( 
      map(
        "Profile", "${null_resource.default.triggers.profile}",
        "Purpose", "${null_resource.default.triggers.purpose}",
        "Task",    "${null_resource.default.triggers.task}",
        "Build",   "${null_resource.default.triggers.build}",
        "Author",  "${null_resource.default.triggers.author}"
      ), var.tags
    )
  }"
}
