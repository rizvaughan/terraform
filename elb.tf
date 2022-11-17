resource "aws_security_group" "elb" {
  name   = "elb"
  vpc_id = aws_vpc.webvpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_elb" "webserver-felb" {
  name                      = "webserver-felb"
  security_groups           = [aws_security_group.elb.id]
  subnets                   = [aws_subnet.puba.id, aws_subnet.pubb.id]
  cross_zone_load_balancing = true
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 60
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
}
