variable "subnet_cidr_01" {
  default = "10.0.0.0/24"
}

variable "subnet_cidr_02" {
  default = "10.0.1.0/24"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "mainVpc"
}

variable "gateway_name" {
  default = "maingateway"
}

variable "subnet_name_01" {
  default = "SubnetTag001"
}

variable "subnet_name_02" {
  default = "SubnetTag002"
}

variable "availability_zone_a" {
  default = "ap-south-1a"
}

variable "availability_zone_b" {
  default = "ap-south-1b"
}

variable "cidr_route" {
  default = "0.0.0.0/0"
}

variable "route_table_name" {
  default = "routetableEc2"
}