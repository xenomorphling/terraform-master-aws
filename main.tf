provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-05c1fa8df71875112"
  instance_type = "t2.micro"
  tags          = { Name = "ubuntu-slave" }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ubuntu.public_ip} > ip_address.txt"
  }
}

resource "aws_instance" "amazon_linux" {
  ami           = "ami-0c64dd618a49aeee8"
  instance_type = "t2.micro"
  tags          = { Name = "amazon-slave" }
}

# resource "aws_eip" "ip" {
#     vpc = true
#     instance = aws_instance.example.id
# }