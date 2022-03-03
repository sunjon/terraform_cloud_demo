# Create a route Table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "default" {
  vpc_id           = var.vpc_id
  propagating_vgws = tolist(var.propagating_vgws)

  tags = {
    Name = var.name
  }
}
