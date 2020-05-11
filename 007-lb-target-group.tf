resource "aws_alb_target_group" "webserver" {
  name     = "webserver-target-group"
  port     = var.api_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_alb_target_group" "pywebserver" {
  name     = "pywebserver-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

