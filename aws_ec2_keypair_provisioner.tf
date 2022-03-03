resource "aws_key_pair" "provision_key" {
  key_name   = "ansible-key"
  public_key = file(var.provider_default_aws_key_file)
}
