provider "cloudflare" {
  email   = var.cloudflare_auth.email
  api_key = var.cloudflare_auth.api_key
}
