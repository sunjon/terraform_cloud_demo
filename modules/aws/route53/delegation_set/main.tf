resource "aws_route53_delegation_set" "public" {
  reference_name = var.reference_name
}
