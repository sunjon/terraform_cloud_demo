resource "aws_route53_zone" "public" {
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.delegation_set_id

  tags = {
    Name = var.name
    env  = var.tags_environment
  }
}
