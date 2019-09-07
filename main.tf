provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_instance" "ubuntu" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  tags          = { Name = "ubuntu-slave" }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ubuntu.public_ip} > ip_address.txt"
  }
}

resource "aws_instance" "amazon_linux" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  tags          = { Name = "amazon-slave" }
}

# resource "aws_eip" "ip" {
#     vpc = true
#     instance = aws_instance.example.id
# }