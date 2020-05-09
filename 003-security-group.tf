resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "webserver-sg"
  vpc_id      = data.aws_vpc.default.id
  
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}