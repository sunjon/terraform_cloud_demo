resource "aws_db_subnet_group" "default" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids //[split(",", var.subnet_ids)]

  tags = {
    Name = var.name
  }
}
