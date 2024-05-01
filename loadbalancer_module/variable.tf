variable "lb_name" {
  type = string  
  default = "tera-targe-tgroup-lb"
}
variable "protocol_name" {
  type = string  
  default = "HTTP"
}
variable "lb_type" {
  type = string  
  default = "application"
}
variable "aws_lb_name" {
  type = string  
  default = "test-lb-tf"
}
variable "listener_type" {
  type = string  
  default = "forward"
}

variable "listener_port" {
  type = string  
  default = "80"
}
variable "aws_lb_internal" {
  type = bool  
  default = false
}
variable "subnet_id_01" {
  default = ""
}
variable "subnet_id_02" {
  default = ""
}
variable "security_group" {
  default = ""
}
variable "vpc_id" {
  default = ""
}



