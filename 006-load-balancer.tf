resource "aws_lb" "webserver" {
  name               = "webserver-alb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups    = [aws_security_group.webserver-sg.id]

  subnets           = [data.aws_subnet.default-a.id, 
                      data.aws_subnet.default-b.id,
                      data.aws_subnet.default-c.id]

  tags = {
    Environment = "development"
    project = "test"
  }
}