# Default Security Group - RDS
module "aws_sg_rds_postgres_default" {
  source             = "./modules/aws/security/group"
  vpc_id             = module.aws_network_vpc.id
  name               = var.aws_sg_rds_postgres_default["security_group_name"]
  description        = var.aws_sg_rds_postgres_default["security_group_description"]
  allow_all_outbound = var.aws_sg_rds_postgres_default["allow_all_outbound"]
}

# Security Group Rules

# Allow access from Bastion-Host to db port
module "aws_sgr_rds_postgres_default_bastion_to_db_port" {
  source                   = "./modules/aws/security/rule/source_group"
  security_group_id        = module.aws_sg_rds_postgres_default.id
  type                     = var.aws_sgr_rds_postgres_default_bastion_to_db_port["type"]
  from_port                = var.aws_sgr_rds_postgres_default_bastion_to_db_port["from_port"]
  to_port                  = var.aws_sgr_rds_postgres_default_bastion_to_db_port["to_port"]
  protocol                 = var.aws_sgr_rds_postgres_default_bastion_to_db_port["protocol"]
  source_security_group_id = module.aws_sg_ec2_bastion.id
  description              = var.aws_sgr_rds_postgres_default_bastion_to_db_port["description"]
}

# Allow access from Wordpress instances to db port
module "aws_sgr_rds_postgres_default_wordpress_to_db_port" {
  source                   = "./modules/aws/security/rule/source_group"
  security_group_id        = module.aws_sg_rds_postgres_default.id
  type                     = var.aws_sgr_rds_postgres_default_wordpress_to_db_port["type"]
  from_port                = var.aws_sgr_rds_postgres_default_wordpress_to_db_port["from_port"]
  to_port                  = var.aws_sgr_rds_postgres_default_wordpress_to_db_port["to_port"]
  protocol                 = var.aws_sgr_rds_postgres_default_wordpress_to_db_port["protocol"]
  source_security_group_id = module.aws_sg_ec2_prod_public_wordpress.id
  description              = var.aws_sgr_rds_postgres_default_wordpress_to_db_port["description"]
}

