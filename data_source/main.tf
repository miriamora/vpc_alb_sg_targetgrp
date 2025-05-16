terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.67.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

/*

data "aws_instance" "foo" {
  instance_id = "i-0c28aafc343360757"
}

resource "aws_instance" "server2" {
  ami = data.aws_instance.foo.ami
  key_name = data.aws_instance.foo.key_name
  instance_type = data.aws_instance.foo.instance_type
  availability_zone = data.aws_instance.foo.availability_zone

}

*/

data "aws_ami" "example" {
  #executable_users = ["self"]
  most_recent      = true
  #name_regex       = "^myami-[0-9]{3}"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
 
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "server3" {
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"
}