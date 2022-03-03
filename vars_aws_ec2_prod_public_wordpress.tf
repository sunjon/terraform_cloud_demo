# Instances
variable "aws_ec2_prod_public_wordpress_01" {
  description = "EC2 WordPress 01, Env: PROD"
  type        = map(any)
}

# Security Group
variable "aws_sg_ec2_prod_public_wordpress" {
  description = "Security group for WordPress Instances, Env: PROD"
  type        = map(any)
}

variable "aws_sgr_ec2_prod_public_wordpress_internet_to_80" {
  description = "Access from Internet to port 80"
  type        = map(any)
}

variable "aws_sgr_ec2_prod_public_wordpress_internet_to_443" {
  description = "Access from Internet to port 443"
  type        = map(any)
}
