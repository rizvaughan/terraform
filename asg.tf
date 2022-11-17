resource "aws_launch_configuration" "webserver" {
  name                 = "webserverasgconfig"
  image_id             = var.ami
  instance_type        = var.instancetype
  iam_instance_profile = aws_iam_instance_profile.test-profile.name
  security_groups      = [aws_security_group.WebserverSG.id]
  user_data            = file("userdata.sh")
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "webserver" {
  name                 = "webserverasg"
  launch_configuration = aws_launch_configuration.webserver.id
  vpc_zone_identifier  = [aws_subnet.puba.id, aws_subnet.pubb.id]
  min_size             = 1
  max_size             = 3
  load_balancers       = [aws_elb.webserver-felb.name]
  health_check_type    = "ELB"
  tag {
    key                 = "Name"
    value               = "webserver"
    propagate_at_launch = true
  }
}
