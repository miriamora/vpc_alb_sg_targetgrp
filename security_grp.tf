# Security group

resource "aws_security_group" "webserver_sg" {
  name = "webserver_sg"
  vpc_id = aws_vpc.v1.id
  description = "allow 80"

  ingress {
    description = "allow 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
    #cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

#--------------------------------------

resource "aws_security_group" "alb_sg" {
  name = "alb_sg"
  vpc_id = aws_vpc.v1.id
  description = "allow 80 and 443"
  ingress {
    description = "allow 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "allow 443"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}