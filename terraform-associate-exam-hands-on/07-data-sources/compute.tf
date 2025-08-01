data "aws_ami" "ubuntu" {

  most_recent = true
  owners      = ["099720109477"] #Owner is canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# data "aws_vpc" "prod_vpc" {
#   tags = {
#     Env = "Prod_vpc"
#   }

# }

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu
}

# output "Prod_vpc" {
#   value = data.aws_vpc.prod_vpc.id
# }

resource "aws_instance" "web" {
  #ami                         = "put_relavent_ami_id_for_region"
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

}