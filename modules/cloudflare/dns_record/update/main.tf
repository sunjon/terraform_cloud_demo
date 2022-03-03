resource "cloudflare_record" "dns_records" {
  zone_id         = var.dns_record.zone_id
  name            = var.dns_record.name
  value           = var.dns_record.value
  type            = var.dns_record.type
  ttl             = var.dns_record.ttl
  proxied         = var.dns_record.proxied
  allow_overwrite = var.dns_record.allow_overwrite
}
