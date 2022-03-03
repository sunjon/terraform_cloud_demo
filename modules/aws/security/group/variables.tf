variable "vpc_id" {}
variable "name" {}
variable "description" {}

# Add a rule to allow all outbound
variable "allow_all_outbound" {
  type    = bool
  default = false
}

locals {
  allow_all_outbound_each = tomap({ "is" = var.allow_all_outbound })
}
