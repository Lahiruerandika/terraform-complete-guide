ec2_instance_config_map = {
  ubuntu_1 = {
    instance_type = "t2.micro",
    ami           = "ubuntu"
  }

  nginx_1 = {
    instance_type = "t2.micro",
    ami           = "nginx"
    subnet_name   = "subnet_1"
  }
}