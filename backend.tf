terraform {
  backend "s3" {
    bucket         = "w6-contract-673008-terraformstatefile-2"
    key            = "lb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "lock-w6-contract-673008-terraformstatefile-2"
    encrypt        = true
  }
}
