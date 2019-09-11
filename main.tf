provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_instance" "ubuntu" {
  ami           = var.amis-ubuntu[var.region]
  instance_type = "t2.micro"
  tags          = { Name = "ubuntu-slave" }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ubuntu.tags.Name + aws_instance.ubuntu.public_ip} > ip_address.txt"
  }
}

resource "aws_instance" "amazon_linux" {
  ami           = var.amis-linux[var.region]
  instance_type = "t2.micro"
  tags          = { Name = "amazon-slave" }

  provisioner "local-exec" {
    command = "echo ${aws_instance.amazon_linux.tags.Name}${aws_instance.ubuntu.public_ip} > ip_address.txt"
  }
}

module "consul" {
  source      = "hashicorp/consul/aws"
  num_servers = "3"
  leave_on_terminate = true
}


# resource "aws_eip" "ip" {
#     vpc = true
#     instance = aws_instance.example.id
# }
