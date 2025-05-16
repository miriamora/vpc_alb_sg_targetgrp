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

import {
  to = aws_instance.terraform_server
  id = "i-032fe215956002a83"
}