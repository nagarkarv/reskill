resource "aws_alb_listener" "listener" {
  load_balancer_arn = aws_lb.webserver.arn
  port              = var.api_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.webserver.arn
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "webserver" {
  alb_target_group_arn   = aws_alb_target_group.webserver.arn
  autoscaling_group_name = aws_autoscaling_group.webserver.id
}


resource "aws_alb_listener" "pylistener" {
  load_balancer_arn = aws_lb.webserver.arn
  port              = 5000
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.pywebserver.arn
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "pywebserver" {
  alb_target_group_arn   = aws_alb_target_group.pywebserver.arn
  autoscaling_group_name = aws_autoscaling_group.webserver.id
}