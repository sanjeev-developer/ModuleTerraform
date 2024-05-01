//auto scaling has launch template and load balancer has target group
//auto scaling doesnt need multiple availabilty zone but in load balancer must have minimum
resource "aws_launch_template" "my_template" {
  name = var.ec2_template_name
  image_id = data.aws_ami.selected.id # Replace with your desired AMI ID
  instance_type = var.cpu_type  # Choose an appropriate instance type

  tags = {
    Name = "sanjeev ec2"
  }

// if it auto scale to 10 thwn what happen to subnet will it assign different subnet to each ec2 or same
// can we pass multiple available zone for autoscale so that it can create ec2 in differenr availabilty zone
// if we already attached vpc and subnet to ec2 then do we need to provide vpc and subnet to auto scaling group and if we mention different vpc and subnet then which one it will take
  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.subnet_id_01  # Replace with your subnet ID and this one dont need the bracket 
    security_groups = [var.security_group]  # Specify the security group IDs and this one needs the bracket
  }

# Attach user data to ensure Nginx installation during scaling
  user_data = base64encode(<<EOF
#!/bin/bash
sudo update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
)
}

resource "aws_autoscaling_group" "aws_auto_group" {
//availability_zones = ["ap-south-1a","ap-south-1b"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  vpc_zone_identifier  = [var.subnet_id_01, var.subnet_id_02] // we can attach single or multiple subnet in auto scaling
  target_group_arns    = [var.lb_target_group]


launch_template {
    id      = aws_launch_template.my_template.id
    version = "$Latest"
  }
}