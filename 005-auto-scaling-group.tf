resource "aws_autoscaling_group" "webserver" {
  name                 = "webserver-asg"
  launch_configuration = aws_launch_configuration.webserver.name
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  availability_zones   = var.availability_zones
}