provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_instance" "ubuntu" {
  ami           = var.amis-ubuntu[var.region]
  instance_type = "t2.micro"
  tags          = { Name = "ubuntu[count.index]" }
  key_name      = "ernestlawrence_ohio_aws"
  count         = 1

  //  provisioner "local-exec" {
  //    command = "echo ${aws_instance.ubuntu[count.index].public_ip} >> ip_address.txt"
  //  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ubuntu[count.index].public_dns} >> ip_address.txt"
  }

  provisioner "file" {
    source      = "sshd_config"
    destination = "/etc/ssh/sshd_config"
  }
}

//resource "aws_instance" "suse" {
//  ami           = var.amis-suse[var.region]
//  instance_type = "t2.micro"
//  tags          = { Name = "suse-slave" }
//  count         = 5
//  key_name      = "ernestlawrence_ohio_aws"
//
//  provisioner "file" {
//    source      = "sshd_config"
//    destination = "/etc/ssh/sshd_config"
//  }
//
//  //  provisioner "local-exec" {
////    command = "echo ${aws_instance.suse[count.index]} >> ip_address.txt"
////  }
//}

//resource "aws_instance" "amazon_linux" {
//  ami           = var.amis-linux[var.region]
//  instance_type = "t2.micro"
//  tags          = { Name = "amazon-slave[count.index]" }
//  key_name      = "ernestlawrence_ohio_aws"
//  count = 5

//  provisioner "local-exec" {
////    command = "echo ${aws_instance.amazon_linux.tags.Name}${aws_instance.ubuntu.public_ip} > ip_address.txt"
//    command = "echo ${aws_instance.amazon_linux[count.index].public_ip} >> ip_address.txt"
//  }
//  provisioner "file" {
//    source      = "sshd_config"
//    destination = "/etc/ssh/sshd_config"
//  }
//}


# resource "aws_eip" "ip" {
#     vpc = true
#     instance = aws_instance.example.id
# }
