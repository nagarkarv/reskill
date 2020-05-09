data "aws_vpc" "default" {
  default = true
}

output "aws_vpc_default" {
  value = "${data.aws_vpc.default.id}"
}

data "aws_subnet" "default-a" {
  vpc_id            = "${data.aws_vpc.default.id}"
  default_for_az    = true
  availability_zone = "eu-west-2a"
}
output "aws_subnet_default_a" {
  value = "${data.aws_subnet.default-a.id}"
}

data "aws_subnet" "default-b" {
  vpc_id            = "${data.aws_vpc.default.id}"
  default_for_az    = true
  availability_zone = "eu-west-2b"
}

output "aws_subnet_default_b" {
  value = "${data.aws_subnet.default-b.id}"
}

data "aws_subnet" "default-c" {
  vpc_id            = "${data.aws_vpc.default.id}"
  default_for_az    = true
  availability_zone = "eu-west-2c"
}
output "aws_subnet_default_c" {
  value = "${data.aws_subnet.default-c.id}"
}