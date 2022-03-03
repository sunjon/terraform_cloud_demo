# Instances
variable "aws_rds_prod_private_postgres_01" {
  description = "RDS Posgresql 01, Env: PROD"
  type        = map(any)
}

# Security Group
# variable "aws_sg_rds_prod_public_postgres" {
#   description = "Security group for RDS Postgresql"
#   type        = map(any)
# }
#
# variable "aws_sgr_rds_prod_public_postgres_ec2_to_db_port" {
#   description = "Access from EC2 instances to DB port"
#   type        = map(any)
# }
