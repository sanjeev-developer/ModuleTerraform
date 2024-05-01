#creating Security group
resource "aws_security_group" "securitygroupTera" {
  name_prefix = var.security_group_name
  description = var.security_description
  vpc_id = var.vpc_id

  # Inbound rule to allow all Inbound traffic
  ingress {
    from_port   = var.port_from
    to_port     = var.port_to
    protocol    = var.protocol # Allow all protocols
    cidr_blocks = [var.security_cidr]
  }

  # Outbound rule to allow all outbound traffic
  egress {
    from_port   = var.port_from
    to_port     = var.port_to
    protocol    = var.protocol # Allow all protocols
    cidr_blocks = [var.security_cidr]
  }
}