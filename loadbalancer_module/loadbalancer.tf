# Define the target group. target group for load balancer is basically to add ec2 where we need to balance the traffic equally among avaialble ec2
// these are the important element for target group 
//auto scaling has launch template and load balancer has target group
resource "aws_lb_target_group" "target_group_lb" {
  name = var.lb_name
  port = var.listener_port  # Replace with your desired port
  protocol = var.protocol_name
  vpc_id = var.vpc_id  # Replace with your VPC ID
}

resource "aws_lb" "aws_alb" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal
  load_balancer_type = var.lb_type
  security_groups    = [var.security_group]
  subnets            = [var.subnet_id_01,var.subnet_id_02] // in load balancer it is mandatory to attach multiple subnet
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.aws_alb.arn // attaching lb
  port              = var.listener_port
  protocol          = var.protocol_name

  default_action {
    type             = var.listener_type
    target_group_arn = aws_lb_target_group.target_group_lb.arn // attaching target group
  }
}

