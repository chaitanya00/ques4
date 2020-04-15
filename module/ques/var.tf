variable "ami" {
  type = "string"
  default = "ami-07ebfd5b3428b6f4d"
}
variable "region" {
  type = "string"
  default = "us-east-1"
}
variable "instance-type" {
  type = "string"
  default = "t2.micro"
}
variable "policy" {
  type = "string"
  default = ""
}
variable "user_data" {
  type = "string"
  default = ""
}

variable "path-to-private-key" {
  type = "string"
  default = "/home/ubuntu/instance/module/ques/mykey"
}
variable "path-to-public-key" {
  type = "string"
  default = "/home/ubuntu/instance/module/ques/mykey.pub"
}

variable "instance-username" {
  type = "string"
  default = "ubuntu"
}


