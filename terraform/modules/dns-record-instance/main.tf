resource "aws_route53_record" "record" {
    
    count = "${var.count}"

    zone_id = "${data.aws_route53_zone.selected.zone_id}" 
    name    = "${var.count > 1 ? join(".", list(var.hostname, format("%s", count.index + 1), data.aws_route53_zone.selected.name)) : join(".", list(var.hostname, data.aws_route53_zone.selected.name))}"
    type    = "A"
    ttl     = "300"
    records = ["${var.records}"]
}

resource "aws_route53_record" "cname" {

  count = "${var.create_cname}"
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name = "${join(".", list(replace(var.hostname,"api",var.cname_record_name), data.aws_route53_zone.selected.name))}"
  type = "CNAME"
  ttl = "300"
  records = ["${join(".", list(var.hostname, data.aws_route53_zone.selected.name))}"]
}
