# Use this data source to get the ID of the latests AMI for selected OS
# data.aws_ami.NAME.id

# Ubuntu 18.04 HVM using EBS SSD registered AMI for use in other resources.
data "aws_ami" "ubuntu1804" {
  most_recent = true
  owners      = ["${var.ami_ubuntu_account_number}"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  # filter {
  #     name   = "virtualization-type"
  #     values = ["hvm"]
  # }
}
