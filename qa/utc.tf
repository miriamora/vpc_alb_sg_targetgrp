provider "aws" {
  region = "us-east-1"
}

module "key_pair" {
  source = "../modules/keypair"
  key_pair_name = "qakeytest"
}

output "keypairname" {
  value = module.key_pair.pem_key_name
}