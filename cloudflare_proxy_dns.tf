data "aws_route53_zone" "www" {
  name         = "awsdemo.sunjon.com"
  private_zone = false
}

module "dns_record" {
  source      = "./modules/cloudflare/dns_record/update"
  dns_records = "4.4.4.4" # TODO: fixme
  # dns_record = merge(var.cloudflare_dns_record, { value = tostring(data.aws_route53_zone.www.records[0]) })


  # dns_record = merge(var.cloudflare_dns_record, { value = module.aws_ec2_prod_public_wordpress_01. }
  # demo.${domain_name}
  # dns_record.value = aws_route53_zone.public.zone_id
}
