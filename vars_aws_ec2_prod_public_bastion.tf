# Instances
variable "aws_ec2_prod_public_bastion_01" {
  description = "EC2 Bastion-Host 01, Env: PROD"
  type        = map(any)
}

# Security Group
# variable "aws_sg_ec2_prod_public_bastion_01" {
#   description = "Security group for Bastion-Host, Env: PROD"
#   type        = map(any)
# }
