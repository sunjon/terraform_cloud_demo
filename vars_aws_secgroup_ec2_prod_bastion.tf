# Bastion Hosts Security Group
variable "aws_sg_ec2_bastion" {
  description = "Default Security Group for all Bastion Hosts, Env: PROD"
  type        = map(any)
}

variable "aws_sgr_ec2_bastion_internet_to_ssh" {
  description = "Access SSH on Bastion Hosts from internet"
  type        = map(any)
}
