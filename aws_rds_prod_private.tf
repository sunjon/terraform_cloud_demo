# AWS RDS - Postgresql

# ec2
module "aws_rds_prod_private_postgres_01" {
  source                  = "./modules/aws/rds/instance"
  identifier              = var.aws_rds_prod_private_postgres_01["identifier"]
  allocated_storage       = var.aws_rds_prod_private_postgres_01["allocated_storage"]
  storage_type            = var.aws_rds_prod_private_postgres_01["storage_type"]
  final_snapshot_id       = var.aws_rds_prod_private_postgres_01["final_snapshot_id"]
  skip_final_snapshot     = var.aws_rds_prod_private_postgres_01["skip_final_snapshot"]
  engine                  = var.aws_rds_prod_private_postgres_01["engine"]
  engine_version          = var.aws_rds_prod_private_postgres_01["engine_version"]
  instance_class          = var.aws_rds_prod_private_postgres_01["instance_class"]
  password                = var.aws_rds_prod_private_postgres_01["password"]
  username                = var.aws_rds_prod_private_postgres_01["username"]
  availability_zone       = var.aws_rds_prod_private_postgres_01["availability_zone"]
  backup_retention_period = var.aws_rds_prod_private_postgres_01["backup_retention_period"]
  # Workaround for dependency. We need Terraform to wait for aws_rds_sn_prod_01 creation before the RDS DB can use it.
  db_subnet_group_name = module.aws_rds_sn_private_prod.id
  multi_az             = var.aws_rds_prod_private_postgres_01["multi_az"]
  # vpc_security_group_ids = [module.aws_sg_rds_postgres_default.id, module.aws_sg_rds_prod_private_postgres.id]
  vpc_security_group_ids = [module.aws_sg_rds_postgres_default.id]
  publicly_accessible    = var.aws_rds_prod_private_postgres_01["publicly_accessible"]
  # parameter_group_name    = aws_db_parameter_group.rds_pos_96_db_parameter_group_01.id
  allow_major_version_up = var.aws_rds_prod_private_postgres_01["allow_major_version_up"]
  tag_private_name       = var.aws_rds_prod_private_postgres_01["tag_private_name"]
  tag_public_name        = var.aws_rds_prod_private_postgres_01["tag_public_name"]
  tag_app                = var.aws_rds_prod_private_postgres_01["tag_app"]
  tag_app_id             = var.aws_rds_prod_private_postgres_01["tag_app_id"]
  tag_os                 = var.aws_rds_prod_private_postgres_01["tag_os"]
  tags_environment       = var.aws_rds_prod_private_postgres_01["tags_environment"]
  tag_cost_center        = var.aws_rds_prod_private_postgres_01["tag_cost_center"]
}
