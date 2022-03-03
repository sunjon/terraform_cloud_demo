# Default Security Group

module "aws_sg_ec2_default" {
  source             = "./modules/aws/security/group"
  vpc_id             = module.aws_network_vpc.id
  name               = var.aws_sg_ec2_default["security_group_name"]
  description        = var.aws_sg_ec2_default["security_group_description"]
  allow_all_outbound = var.aws_sg_ec2_default["allow_all_outbound"]
}

# Rules

module "aws_sgr_ec2_default_icmp_in" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  description       = "Allow inbound ICMP"
  security_group_id = module.aws_sg_ec2_default.id
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# # Allow SSH access from bastion host
module "aws_sgr_ec2_default_bastion_to_ssh" {
  source                   = "./modules/aws/security/rule/source_group"
  security_group_id        = module.aws_sg_ec2_default.id
  type                     = var.aws_sgr_ec2_default_bastion_to_ssh["type"]
  from_port                = var.aws_sgr_ec2_default_bastion_to_ssh["from_port"]
  to_port                  = var.aws_sgr_ec2_default_bastion_to_ssh["to_port"]
  protocol                 = var.aws_sgr_ec2_default_bastion_to_ssh["protocol"]
  source_security_group_id = module.aws_sg_ec2_bastion.id
  description              = var.aws_sgr_ec2_default_bastion_to_ssh["description"]
}
