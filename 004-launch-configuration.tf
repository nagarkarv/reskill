resource "aws_launch_configuration" "webserver" {
  name                        = var.project_name
  image_id                    = "ami-403e2524"
  instance_type               = "t2.micro"
  key_name                    = "test_key"

  security_groups             = [aws_security_group.webserver-sg.id]
  
  lifecycle {
    create_before_destroy = true
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo su
              yum -y install httpd
              export hostname=$(curl http://169.254.169.254/latest/meta-data/local-hostname) 
              echo "I am host: $hostname " > /var/www/html/index.html
              date >> /var/www/html/index.html
              service httpd start 
              yum install -y git
              git clone https://github.com/nagarkarv/reskill-service.git
              cd /reskill-service
              pip install -r requirements.txt
              nohup python reskillService.py &
              EOF
}
