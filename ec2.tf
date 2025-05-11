resource "aws_instance" "web1" {
  availability_zone = "us-east-1a"
  ami = "ami-045269a1f5c90a6a0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  user_data = file("userdata.sh")
  subnet_id = aws_subnet.priv1.id
  depends_on = [ aws_nat_gateway.nat1 ]
  #associate_public_ip_address = true
  tags = {
    Name = "web1"
  }
}

resource "aws_instance" "web2" {
  availability_zone = "us-east-1b"
  ami = "ami-045269a1f5c90a6a0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  user_data = file("userdata.sh")
  subnet_id = aws_subnet.priv2.id
  depends_on = [ aws_nat_gateway.nat1 ]
  #associate_public_ip_address = true
  tags = {
    Name = "web2"
  }
}