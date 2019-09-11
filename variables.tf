variable "region" {
  default = "us-east-2"
}

variable "amis-ubuntu" {
  type = "map"
  default = {
    "us-east-2" = "ami-05c1fa8df71875112"
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}

variable "amis-linux" {
  type = "map"
  default = {
    "us-east-2" = "ami-0c64dd618a49aeee8"
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
