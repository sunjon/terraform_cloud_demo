# Public DNS

module "aws_route53_delegation_set" {
  source         = "./modules/aws/route53/delegation_set"
  reference_name = var.aws_route53_delegation_set_reference_name
}

module "aws_route53_public" {
  source            = "./modules/aws/route53/public_zone"
  name              = var.aws_route53_public["name"]
  delegation_set_id = module.aws_route53_delegation_set.id
  comment           = var.aws_route53_public["comment"]
  tags_environment  = var.aws_route53_public["tags_environment"]
}
