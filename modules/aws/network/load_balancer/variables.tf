variable "vpc_id" {}

variable "description" {
  default = "Subnet(Zone, #, Type): ?,?,?"
}

variable "cidr" {}
variable "name" {}
variable "az" {}

variable "public" {
  default = false
}
