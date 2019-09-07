provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "example" {
  # ami = "ami-0c64dd618a49aeee8"
  ami           = "ami-05c1fa8df71875112"
  instance_type = "t2.micro"
  count         = 2
  tags          = { Name = "slave" }
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example[count.index]
}