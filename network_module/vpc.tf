resource "aws_vpc" "Ec2Vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Ec2Vpc.id
    tags = {
    Name = var.gateway_name
  }
}