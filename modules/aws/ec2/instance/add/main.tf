resource "aws_instance" "default" {
  ami                                  = var.ami
  instance_type                        = var.instance_type
  availability_zone                    = var.availability_zone
  ebs_optimized                        = var.ebs_optimized
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  vpc_security_group_ids               = var.vpc_security_group_ids
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = var.associate_public_ip_address
  private_ip                           = var.private_ip
  source_dest_check                    = var.source_dest_check
  user_data                            = var.user_data
  iam_instance_profile                 = var.iam_instance_profile
  volume_tags                          = var.volume_tags

  root_block_device {
    volume_size           = var.root_block_device["volume_size"]
    volume_type           = var.root_block_device["volume_type"]
    delete_on_termination = var.root_block_device["delete_on_termination"]
  }

  /*
  ebs_block_device       = var.ebs_block_device
  ephemeral_block_device = var.ephemeral_block_device
  */

  tags = merge(
    var.instance_tags,
    {
      "private_name" = var.tag_private_name,
      "public_name"  = var.tag_public_name,
      "environment"  = var.tags_environment,
      "app"          = var.tag_app,
      "app_id"       = var.tag_app_id,
      "os"           = var.tag_os,
      "os_id"        = var.tag_os_id,
      "cost_center"  = var.tag_cost_center
    }
  )

  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_route53_record" "private" {
  zone_id  = var.route53_private_zone_id
  name     = var.tag_private_name
  type     = "A"
  ttl      = "300"
  records  = [aws_instance.default.private_ip]
  for_each = local.register_dns_private_each
}

resource "aws_route53_record" "public" {
  zone_id  = var.route53_public_zone_id
  name     = var.tag_public_name
  type     = "A"
  ttl      = "300"
  records  = [aws_instance.default.public_ip]
  for_each = local.register_dns_public_each
}
