# Zone: A, Env: PROD, Type: PUBLIC, Code: 11
variable "aws_sn_za_prod_public_11" {
  description = "Zone: A, Env: PROD, Type: PUBLIC, Code: 11"
  type        = map(any)
}

# Zone: A, Env: PROD, Type: PRIVATE, Code: 12
variable "aws_sn_za_prod_private_12" {
  description = "Zone: A, Env: PROD, Type: PRIVATE, Code: 12"
  type        = map(any)
}

# Zone: B, Env: PROD, Type: PUBLIC, Code: 13
variable "aws_sn_zb_prod_public_13" {
  description = "Zone: B, Env: PROD, Type: PUBLIC, Code: 13"
  type        = map(any)
}

# Zone: B, Env: PROD, Type: PRIVATE, Code: 14
variable "aws_sn_zb_prod_private_14" {
  description = "Zone: B, Env: PROD, Type: PRIVATE, Code: 14"
  type        = map(any)
}

# Zone: A, Env: PROD, Type: PUBLIC
variable "aws_sn_za_prod_public_bastion" {
  description = "Zone: A, Env: PROD, Type: PUBLIC"
  type        = map(any)
}
