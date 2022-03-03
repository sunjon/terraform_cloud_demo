is_production = false

# Cloudflare

cloudflare_auth = {
  email   = "sunjon@foo.com"
  api_key = "************"
}

cloudflare_dns_record = {
  zone_id = "123456789"
  name    = "test"
  # value   = "" # See cloudflare_proxy_dns.tf
  type    = "A"
  ttl     = 1
  proxied = true
  allow_overwrite = true
}

# AWS Defaults
provider_default_aws_profile                 = "terraform"
provider_default_aws_region                  = "eu-north-1"
provider_default_aws_account_id              = ["653165961753"]
provider_default_aws_shared_credentials_file = "~/.aws/credentials"
provider_default_aws_key_file                = "./mydemo_ansible_ssh.pem" # key for ansible provisioning

# AWS Ubuntu AMI
ami_ubuntu_account_number = "099720109477"

# VPC for EC2 instances
aws_vpc_tag_name = "mydemo-vpc"
aws_vpc_block    = "10.0.0.0/20" # 10.0.0.1 - 10.0.15.254

# VPC Subnets

# Zone: A, Env: PROD, Type: PUBLIC, Code: 11
aws_sn_za_prod_public_11 = {
  cidr   = "10.0.11.0/24" # 10.0.11.1 - 10.0.11.254
  name   = "mydemo-sn-za-prod-public-11"
  az     = "eu-north-1a"
  public = "true"
}

# Zone: A, Env: PROD, Type: PRIVATE, Code: 12
aws_sn_za_prod_private_12 = {
  cidr   = "10.0.12.0/24" # 10.0.12.1 - 10.0.12.254
  name   = "mydemo-sn-za-prod-private-12"
  az     = "eu-north-1a"
  public = "false"
}

# Zone: B, Env: PROD, Type: PUBLIC, Code: 13
aws_sn_zb_prod_public_13 = {
  cidr   = "10.0.13.0/24" # 10.0.13.1 - 10.0.13.254
  name   = "mydemo-sn-zb-prod-public-13"
  az     = "eu-north-1b"
  public = "true"
}

# Zone: B, Env: PROD, Type: PRIVATE, Code: 14
aws_sn_zb_prod_private_14 = {
  cidr   = "10.0.14.0/24" # 10.0.14.1 - 10.0.14.254
  name   = "mydemo-sn-zb-prod-private-14"
  az     = "eu-north-1b"
  public = "false"
}

# Bastion Subnet
aws_sn_za_prod_public_bastion = {
  cidr   = "10.0.0.0/28" # 10.0.0.1 - 10.0.0.14
  name   = "mydemo-sn-za-prod-public-bastion"
  az     = "eu-north-1a"
  public = "true"
}

# Subnets for RDS instances
aws_rds_sn_private_prod = {
  name        = "mydemo-rds-sn-private-prod"
  description = "mydemo-RDS-SN-private-PROD"
  #See aws_rds_sn_pro.tf for subnet_ids
  #subnet_ids  = ${module.aws_sn_za_prod_public_11.id},${module.aws_sn_zb_prod_public_13.id
}

# HTTP Load Balancer
aws_elb_frontend_public_prod = {
  name = "wordpress"
  instance_port = 80
  instance_protocol = "http"
  lb_port = 80
  lb_protocol = "http"
  subnets = [module.aws_sn_za_prod_public_11.id , module.aws_sn_za_prod_public_11.id]
  security_groups = ["${aws_security_group.web.id}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  health_check = {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}

# VPC ROUTING

aws_main_route_table_name = "mydemo-rt-public-main"
aws_internet_gw_name      = "mydemo-igw-public-main"
aws_internet_route = {
  name                   = "mydemo-ir"
  destination_cidr_block = "0.0.0.0/0"
}
aws_private_route_table_za_name = "mydemo-rt-private-za"
aws_private_route_table_zb_name = "mydemo-rt-private-zb"

# Route53

# Public : Prod
aws_route53_delegation_set_reference_name = "mydemo-r53-delegation"
aws_route53_public = {
  name             = "aws.sunjon.com"
  comment          = "mydemo - Public DNS"
  tags_environment = "prod"
}

# Security Group: Default EC2

aws_sg_ec2_default = {
  security_group_name        = "mydemo-sg-ec2-default"
  security_group_description = "mydemo - EC2 Default Security Group - Env: PROD"
  allow_all_outbound         = true
}

aws_sgr_ec2_default_bastion_to_ssh = {
  type      = "ingress"
  from_port = "22"
  to_port   = "22"
  protocol  = "tcp"
  # source_security_group_id = # See aws_secgroup_ec2_default.tf 
  description = "Allow access from Bastion-Hosts to SSH on EC2 instances"
}

# Security Group: EC2 Bastion
aws_sg_ec2_bastion = {
  security_group_name        = "mydemo-sg-ec2-bastion"
  security_group_description = "mydemo - Default Bastion-Host access rules - Public, Env: PROD"
  allow_all_outbound         = false
}

aws_sgr_ec2_bastion_internet_to_ssh = {
  type      = "ingress"
  from_port = "22"
  to_port   = "22"
  protocol  = "tcp"
  #source_security_group_id module.aws_security_group_ec2_default.id
  cidr_blocks = "0.0.0.0/0"
  description = "Allow access from internet to SSH port"
}

# Security Group: EC2 Wordpress Prod 
aws_sg_ec2_prod_public_wordpress = {
  security_group_name        = "mydemo-sg-ec2-wordpress"
  security_group_description = "mydemo - Default Wordpress access rules - Public, Env: PROD"
  allow_all_outbound         = false
}

aws_sgr_ec2_prod_public_wordpress_internet_to_80 = {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = "0.0.0.0/0"
  description = "Access from Internet to port 80"
}

aws_sgr_ec2_prod_public_wordpress_internet_to_443 = {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = "0.0.0.0/0"
  description = "Access from Internet to port 443"
}

# Security Group: RDS
aws_sg_rds_postgres_default = {
  security_group_name        = "mydemo-sg-rds-postgres"
  security_group_description = "mydemo - Default Security Group for RDS Postgresql DB"
  allow_all_outbound         = true
}

aws_sgr_rds_postgres_default_bastion_to_db_port = {
  type        = "ingress"
  from_port   = "5432"
  to_port     = "5432"
  protocol    = "tcp"
  description = "Access Postgresql DB port from EC2 bastion instances"
}

aws_sgr_rds_postgres_default_wordpress_to_db_port = {
  type        = "ingress"
  from_port   = "5432"
  to_port     = "5432"
  protocol    = "tcp"
  description = "Access Postgresql DB port from EC2 WordPress instances"
}

# RDS Postgres Security Group
# aws_sg_rds_prod_public_postgres = {
#   security_group_name        = "mydemo-aws-sg-rds-postgres-prod-public"
#   security_group_description = "mydemo - RDS Postgresql access rules - Public, Env: PROD"
#   allow_all_outbound         = false
# }
#
# aws_sgr_rds_prod_public_postgres_ec2_to_db_port = {
#   type      = "ingress"
#   from_port = "5432"
#   to_port   = "5432"
#   protocol  = "tcp"
#   #source_security_group_id module.aws_security_group_ec2_default.id
#   description = "Allow access from EC2 instances to DB port"
# }

# EC2 INSTANCES

# Bastion Prod
aws_ec2_prod_public_bastion_01 = {
  name              = "mydemo-ec2-prod-public-bastion-01"
  ami               = ""         # Uses data.aws_ami.ubuntu1804.id
  instance_type     = "t3.micro" # AWS Free Tier: 750 hours per month of Linux, RHEL, or SLES t2.micro instance usage
  availability_zone = "eu-north-1a"
  key_name          = "ansible-key"
  # vpc_security_group_ids = SEE TF file
  # subnet_id         = SEE TF file
  associate_public_ip_address = true

  root_block_device_size = 8

  # See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html
  root_block_device_volume_type = "gp2"

  tag_private_name = "mydemo-ec2-prod-public-bastion-01"
  tag_public_name  = "bastion"
  tag_app          = "bastion"
  tag_app_id       = "bastion-01"
  tag_os           = "ubuntu"
  tag_os_id        = "ubuntu-18"
  tags_environment = "prod"
  tag_cost_center  = "mydemo-permanent"
  tags_volume      = "mydemo-ec2-prod-public-bastion-01-root"
}

# Wordpress Prod
aws_ec2_prod_public_wordpress_01 = {
  name              = "mydemo-ec2-prod-public-wordpress-01"
  ami               = ""         # Uses data.aws_ami.ubuntu1804.id
  instance_type     = "t3.micro" # AWS Free Tier: 750 hours per month of Linux, RHEL, or SLES t2.micro instance usage
  availability_zone = "eu-north-1a"
  key_name          = "ansible-key"
  # vpc_security_group_ids = SEE TF file
  # subnet_id         = SEE TF file
  associate_public_ip_address = true

  root_block_device_size = 8

  # See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html
  root_block_device_volume_type = "gp2"

  tag_private_name = "mydemo-ec2-prod-public-wordpress-01"
  tag_public_name  = "www"
  tag_app          = "wordpress"
  tag_app_id       = "wordpress-01"
  tag_os           = "ubuntu"
  tag_os_id        = "ubuntu-18"
  tags_environment = "prod"
  tag_cost_center  = "mydemo-permanent"
  tags_volume      = "mydemo-ec2-prod-public-wordpress-01-root"
}

# RDS INSTANCES

# Postgresql production 01 [master]
aws_rds_prod_private_postgres_01 = {
  identifier          = "mydemo-rds-prod-private-postgres-01"
  allocated_storage   = 10 #GB
  storage_type        = "gp2"
  final_snapshot_id   = "mydemo-rds-prod-private-postgres-01-final"
  skip_final_snapshot = false
  engine              = "postgres"
  engine_version      = "12.5"
  instance_class      = "db.t3.micro"
  # password                = {random_string.mydemo-postgres-password}
  password                = "foobarbaz"
  username                = "admin_postgres"
  availability_zone       = "eu-north-1a"
  backup_retention_period = 5
  #db_sn_group_name   = See var aws_rds_sn_prod_01["name"]
  multi_az               = false
  vpc_security_group_ids = ""
  parameter_group_name   = ""
  allow_major_version_up = false
  publicly_accessible    = false
  tag_private_name       = "mydemo-rds-prod-public-postgres-01"
  tag_public_name        = "mydemo-rds-prod-public-postgres-01"
  tag_app                = "postgres"
  tag_app_id             = "postgres-01"
  tag_os                 = "rds"
  tags_environment       = "prod"
  tag_cost_center        = "mydemo-permanent"
}

# TODO: move read-replica to standalone file
# Postgresql production 01 [read-replica]
# aws_rds_prod_public_postgres_01 = {
# identifier              = "mydemo-rds-postgres-prod-public-01"
#   allocated_storage       = 10 #GB
#   storage_type            = "gp2"
#   final_snapshot_id       = "mydemo-rds-postgres-prod-public-01-final"
#   skip_final_snapshot     = false
#   engine                  = "postgres"
#   engine_version          = "12.5"
#   instance_class          = "db.t3.micro"
#   password                = {random_string.mydemo-postgres-password}
#   username                = "mydemo-admin-postgres01"
#   availability_zone       = "eu-north-1a"
#   backup_retention_period = 5
#   #db_sn_group_name   = See var aws_rds_sn_pro_01["name"]
#   multi_az               = false
#   vpc_security_group_ids = ""
#   parameter_group_name   = ""
#   allow_major_version_up = false
#   publicly_accessible    = true
#   # tag_private_name       = "mydemo-rds-postgres-prod-public-01"
#   # tag_public_name        = "mydemo-rds-postgres-prod-public-01"
#   # tag_app                = "postgres"
#   # tag_app_id             = "postgres-01"
#   # tag_os                 = "rds"
#   # tags_environment       = "prod"
#   # tag_cost_center        = "mydemo-permanent"
# }
