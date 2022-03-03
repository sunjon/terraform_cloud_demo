# EC2 Subnets

# Zone: A, Env: PROD, Type: PUBLIC, Code: 11
module "aws_sn_za_prod_public_11" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_prod_public_11["cidr"]
  name   = var.aws_sn_za_prod_public_11["name"]
  az     = var.aws_sn_za_prod_public_11["az"]
  public = var.aws_sn_za_prod_public_11["public"]
}

# Zone: A, Env: PROD, Type: PRIVATE, Code: 12
module "aws_sn_za_prod_private_12" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_prod_private_12["cidr"]
  name   = var.aws_sn_za_prod_private_12["name"]
  az     = var.aws_sn_za_prod_private_12["az"]
  public = var.aws_sn_za_prod_private_12["public"]
}

# Zone: B, Env: PROD, Type: PUBLIC, Code: 13
module "aws_sn_zb_prod_public_13" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_prod_public_13["cidr"]
  name   = var.aws_sn_zb_prod_public_13["name"]
  az     = var.aws_sn_zb_prod_public_13["az"]
  public = var.aws_sn_zb_prod_public_13["public"]
}

# Zone: B, Env: PROD, Type: PRIVATE, Code: 14
module "aws_sn_zb_prod_private_14" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_prod_private_14["cidr"]
  name   = var.aws_sn_zb_prod_private_14["name"]
  az     = var.aws_sn_zb_prod_private_14["az"]
  public = var.aws_sn_zb_prod_private_14["public"]
}

# Bastion Subnet

# Zone: A, Env: PROD, Type: PRIVATE, Code: 20
module "aws_sn_za_prod_public_bastion" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_prod_public_bastion["cidr"]
  name   = var.aws_sn_za_prod_public_bastion["name"]
  az     = var.aws_sn_za_prod_public_bastion["az"]
  public = var.aws_sn_za_prod_public_bastion["public"]
}
