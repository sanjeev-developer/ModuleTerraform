resource "aws_subnet" "Ec2Subnet01" {
// by providing EC2vpc we are attaching thevpc to this subnet
  vpc_id     = aws_vpc.Ec2Vpc.id
  cidr_block =  var.subnet_cidr_01
  availability_zone = var.availability_zone_a

  tags = {
    Name = var.subnet_name_01
  }
}

resource "aws_subnet" "Ec2Subnet02" {
// by providing EC2vpc we are attaching thevpc to this subnet
  vpc_id     = aws_vpc.Ec2Vpc.id
  cidr_block = var.subnet_cidr_02
  availability_zone = var.availability_zone_b

  tags = {
    Name = var.subnet_name_02
  }
}

resource "aws_route_table" "Ec2Route" {
  vpc_id = aws_vpc.Ec2Vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Ec2Subnet01.id
  route_table_id = aws_route_table.Ec2Route.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Ec2Subnet02.id
  route_table_id = aws_route_table.Ec2Route.id
}

