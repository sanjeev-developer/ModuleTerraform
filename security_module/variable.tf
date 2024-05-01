variable "security_group_name" {
  default = "my-tera-security-group"
}

variable "security_description" {
  default = "My testing to create security group from terraform"
}

variable "security_cidr" {
  default = "0.0.0.0/0"
}

variable "port_from" {
  default = 0
}

variable "port_to" {
  default = 0
}

variable "protocol" {
  default = -1
}

variable "vpc_id" {
  default = ""
}