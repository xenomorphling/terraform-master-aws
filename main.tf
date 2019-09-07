provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "example" {
  # ami = "ami-0c64dd618a49aeee8"
  ami = "ami-05c1fa8df71875112"
  instance_type = "t2.micro"
}
