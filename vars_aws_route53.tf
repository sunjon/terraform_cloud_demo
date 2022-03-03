# Public: Zone to be used outside the VPC

variable "aws_route53_delegation_set_reference_name" {
  description = "Name of Reusable Delegation Sets for Route 53"
}

variable "aws_route53_public" {
  description = "Route 53 for public VPC DNS"
  type        = map(any)
} # public
