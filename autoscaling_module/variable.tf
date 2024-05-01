variable "ec2_template_name" {
  type = string
  default = "my-ec2-template"
}
variable "ec2_ami" {
  type = string
  default = "ami-007020fd9c84e18c7"
}

variable "cpu_type" {
  type = string
  default = "t2.micro"
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
variable "lb_target_group" {
  default = ""
}
variable "ami_filter" {
  description = "Filter criteria for selecting the AMI."
  default = {
    name  = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  }
}
