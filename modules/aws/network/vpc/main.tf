resource "aws_vpc" "default" {
  cidr_block           = var.aws_vpc_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_tag_name
  }
}
