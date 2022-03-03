# Create Bastion host instance
module "aws_ec2_prod_public_bastion_01" {
  source                      = "./modules/aws/ec2/instance/add"
  name                        = var.aws_ec2_prod_public_bastion_01["name"]
  ami                         = data.aws_ami.ubuntu1804.id
  instance_type               = var.aws_ec2_prod_public_bastion_01["instance_type"]
  availability_zone           = var.aws_ec2_prod_public_bastion_01["availability_zone"]
  key_name                    = var.aws_ec2_prod_public_bastion_01["key_name"]
  disable_api_termination     = var.is_production ? true : false
  vpc_security_group_ids      = [module.aws_sg_ec2_default.id, module.aws_sg_ec2_bastion.id]
  subnet_id                   = module.aws_sn_za_prod_public_bastion.id
  private_ip                  = null # https://github.com/hashicorp/terraform-provider-aws/issues/13626
  associate_public_ip_address = var.aws_ec2_prod_public_bastion_01["associate_public_ip_address"]
  instance_tags               = {}
  tag_private_name            = var.aws_ec2_prod_public_bastion_01["tag_private_name"]
  tag_public_name             = var.aws_ec2_prod_public_bastion_01["tag_public_name"]
  tag_app                     = var.aws_ec2_prod_public_bastion_01["tag_app"]
  tag_app_id                  = var.aws_ec2_prod_public_bastion_01["tag_app_id"]
  tag_os                      = var.aws_ec2_prod_public_bastion_01["tag_os"]
  tag_os_id                   = var.aws_ec2_prod_public_bastion_01["tag_os_id"]
  tags_environment            = var.aws_ec2_prod_public_bastion_01["tags_environment"]
  tag_cost_center             = var.aws_ec2_prod_public_bastion_01["tag_cost_center"]

  register_dns_private    = true
  route53_private_zone_id = module.aws_route53_public.id

  register_dns_public    = true
  route53_public_zone_id = module.aws_route53_public.id

  root_block_device = {
    volume_size           = var.aws_ec2_prod_public_bastion_01["root_block_device_size"]
    volume_type           = var.aws_ec2_prod_public_bastion_01["root_block_device_volume_type"]
    delete_on_termination = var.is_production ? false : true # If production, Do not delete!
  }

  volume_tags = {
    Name = var.aws_ec2_prod_public_bastion_01["name"]
  }

  ignore_changes = ["ami"]
}
