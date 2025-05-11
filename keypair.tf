resource "tls_private_key" "wk9" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key_pair" {
  key_name       = "lampkey"
  public_key = tls_private_key.wk9.public_key_openssh
}

resource "local_file" "name" {
  filename        = "${aws_key_pair.key_pair.key_name}.pem"
  file_permission = 400
  content         = tls_private_key.wk9.private_key_pem
}