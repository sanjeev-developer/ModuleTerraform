output "vpc_ids" {
  value = aws_vpc.Ec2Vpc.id
}

output "subnet_id_001" {
  value = aws_subnet.Ec2Subnet01.id
}

output "subnet_id_002" {
  value = aws_subnet.Ec2Subnet02.id
}

output "aws_internet_gateway_output" {
  value = aws_internet_gateway.gw.id
}

