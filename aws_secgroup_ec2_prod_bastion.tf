# Security Group - Bastion Host

module "aws_sg_ec2_bastion" {
  source             = "./modules/aws/security/group"
  vpc_id             = module.aws_network_vpc.id
  name               = var.aws_sg_ec2_bastion["security_group_name"]
  description        = var.aws_sg_ec2_bastion["security_group_description"]
  allow_all_outbound = var.aws_sg_ec2_bastion["allow_all_outbound"]
}

# Bastion Host Security Group Rules

# Allow access to SSH port from Bastion Host
module "aws_sgr_ec2_bastion_internet_to_ssh" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  security_group_id = module.aws_sg_ec2_bastion.id
  type              = var.aws_sgr_ec2_bastion_internet_to_ssh["type"]
  from_port         = var.aws_sgr_ec2_bastion_internet_to_ssh["from_port"]
  to_port           = var.aws_sgr_ec2_bastion_internet_to_ssh["to_port"]
  protocol          = var.aws_sgr_ec2_bastion_internet_to_ssh["protocol"]
  cidr_blocks       = [var.aws_sgr_ec2_bastion_internet_to_ssh["cidr_blocks"]]
  description       = var.aws_sgr_ec2_bastion_internet_to_ssh["description"]
  # cidr_blocks       = [format("%s/%s", data.external.whatismyip.result["internet_ip"], 32)]
  #sec_rule_ec2_default_internet_to_ssh["cidr_blocks"]
}







# resource "aws_security_group" "BH-SG" {
#
#   # depends_on = [
#   #   aws_vpc.custom,
#   #   aws_subnet.subnet1,
#   #   aws_subnet.subnet2
#   # ]
#
#   description = "MySQL Access only from the Webserver Instances!"
#   name        = "bastion-host-sg"
#   vpc_id      = aws_vpc.custom.id
#
#   # Created an inbound rule for Bastion Host SSH
#   ingress {
#     description = "Bastion Host Security Group"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     description = "output from Bastion Host"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
