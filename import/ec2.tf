resource "aws_instance" "terraform_server" {
  ami                                  = "ami-0953476d60561c955"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1c"
  instance_type                        = "t2.micro"
  key_name                             = "windowskeypair"
  subnet_id                            = "subnet-091a6dac1383c301f"
  vpc_security_group_ids      = ["sg-0c1c890f907cdd688"]
  tags = {
    Name = "terraform_import"
  }
 
}
