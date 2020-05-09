variable "key-name" {
  default ="MyKeyPair"
}

variable "project_name" {
  default = "reskill"
}

variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "api_port" {
  default = 80
}
