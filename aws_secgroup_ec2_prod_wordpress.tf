# Security Group - EC2 - Wordpress
module "aws_sg_ec2_prod_public_wordpress" {
  source      = "./modules/aws/security/group"
  vpc_id      = module.aws_network_vpc.id
  name        = var.aws_sg_ec2_prod_public_wordpress["security_group_name"]
  description = var.aws_sg_ec2_prod_public_wordpress["security_group_description"]
}

# Security Group Rules

# Access from Internet to port 80 (for redirection)
module "aws_sgr_ec2_prod_public_wordpress_internet_to_80" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  security_group_id = module.aws_sg_ec2_prod_public_wordpress.id
  type              = var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["type"]
  from_port         = var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["from_port"]
  to_port           = var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["to_port"]
  protocol          = var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["protocol"]
  cidr_blocks       = [var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["cidr_blocks"]]
  description       = var.aws_sgr_ec2_prod_public_wordpress_internet_to_80["description"]
}

# Access from Internet to port 443
module "aws_sgr_ec2_prod_public_wordpress_internet_to_443" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  security_group_id = module.aws_sg_ec2_prod_public_wordpress.id
  type              = var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["type"]
  from_port         = var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["from_port"]
  to_port           = var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["to_port"]
  protocol          = var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["protocol"]
  cidr_blocks       = [var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["cidr_blocks"]]
  description       = var.aws_sgr_ec2_prod_public_wordpress_internet_to_443["description"]
}
