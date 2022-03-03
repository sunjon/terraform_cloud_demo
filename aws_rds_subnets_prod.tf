# Subnet for RDS - Prod Private

module "aws_rds_sn_private_prod" {
  source      = "./modules/aws/rds/subnet"
  name        = var.aws_rds_sn_private_prod["name"]
  description = var.aws_rds_sn_private_prod["description"]

  # Add 2 PRIVATE Subnets from two availability zones
  subnet_ids = [module.aws_sn_za_prod_private_12.id, module.aws_sn_zb_prod_private_14.id]
}
