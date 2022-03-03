variable "name" {
  description = "(Required) The name of the DB subnet group"
}

variable "description" {
  description = "(Required) The description of the DB subnet group."
}

variable "subnet_ids" {
  description = "(Required) A list of VPC subnet IDs."
}
