# Internet facing frontend ELB
# module "aws_elb_frontend_public_prod" {
#   source      = "./modules/aws/rds/subnet"
#   name        = var.aws_elb_frontend_public_prod["name"]
#   description = var.aws_elb_frontend_public_prod["description"]
#
#   # TODO: add other vars from terraform.tfvars -> http load balancer
#
#   # Add 2 PRIVATE Subnets from two availability zones
#   subnet_ids = [module.aws_sn_za_prod_private_12.id, module.aws_sn_zb_prod_private_14.id]
# }
