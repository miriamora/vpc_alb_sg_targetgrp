resource "tls_private_key" "wk9" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "key_pair" {
  key_name       = var.key_pair_name
  public_key = tls_private_key.wk9.public_key_openssh
}

resource "local_file" "name" {
  filename        = "${var.key_pair_name}.pem"
  file_permission = var.file_permission
  content         = tls_private_key.wk9.private_key_pem
}