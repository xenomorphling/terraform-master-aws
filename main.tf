provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "example" {
  # ami = "ami-0c64dd618a49aeee8"
  ami = "ami-b374d5a5"
  instance_type = "t2.micro"
}
