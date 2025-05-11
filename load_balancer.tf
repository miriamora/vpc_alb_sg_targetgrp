resource "aws_lb_target_group" "alb-target-gp" {
  name = "alb-target-gp"
  protocol = "HTTP"
  port = 80
  vpc_id = aws_vpc.v1.id

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 100
    path = "/"
    matcher = 200
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 6
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "target-grp-attachment1" {
  target_group_arn = aws_lb_target_group.alb-target-gp.arn
  target_id = aws_instance.web1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "target-grp-attachment2" {
  target_group_arn = aws_lb_target_group.alb-target-gp.arn
  target_id = aws_instance.web2.id
  port = 80
}

resource "aws_lb" "alb-loadbalancer" {
  name = "alb-loadbalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = [aws_subnet.pub1.id, aws_subnet.pub2.id]
  enable_deletion_protection = false
  tags = {
    env = "dev"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.alb-loadbalancer.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb-target-gp.arn
  }
}