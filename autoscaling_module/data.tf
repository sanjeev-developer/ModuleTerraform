# Data source to find the latest AMI
data "aws_ami" "selected" {
  most_recent = true
  owners = ["099720109477"]  # Canonical

  filter {
    name   = "name"
    values = [var.ami_filter["name"]]
  }
}