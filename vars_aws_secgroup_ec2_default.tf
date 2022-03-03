# Default Security Group

variable "aws_sg_ec2_default" {
  description = "Default Security Group for all instances, Env: PROD"
  type        = map(any)
}

# Rules
variable "aws_sgr_ec2_default_bastion_to_ssh" {
  description = "Allow access from Bastion-Hosts to SSH port on EC2 instances"
  type        = map(any)
}
