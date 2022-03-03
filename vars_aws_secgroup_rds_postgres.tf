# RDS Postgres - Default Security Group

variable "aws_sg_rds_postgres_default" {
  description = "Default Security Group for all Postgresql instances"
  type        = map(any)
}

variable "aws_sgr_rds_postgres_default_bastion_to_db_port" {
  description = "Access DB port from Bastion-Host"
  type        = map(any)
}

variable "aws_sgr_rds_postgres_default_wordpress_to_db_port" {
  description = "Access DB port from Wordpress Instances"
  type        = map(any)
}
