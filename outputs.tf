
# Ubuntu AMI Outputs

output "ubuntu_ami_id" {
  description = "Latest Ubuntu 24.04 AMI ID"
  value       = data.aws_ami.ubuntu.id
}

output "ubuntu_ami_name" {
  description = "Selected Ubuntu AMI name"
  value       = data.aws_ami.ubuntu.name
}

# Network Outputs

output "vpc_id" {
  description = "ID of the enterprise VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "web_security_group_id" {
  description = "ID of the web server security group"
  value       = aws_security_group.web.id
}

# EC2 Module Outputs

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.web_server.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the web server"
  value       = module.web_server.public_ip
}

output "ec2_private_ip" {
  description = "Private IP of the web server"
  value       = module.web_server.private_ip
}

output "ec2_availability_zone" {
  description = "Availability zone of the EC2 instance"
  value       = module.web_server.availability_zone
}

output "web_server_url" {
  description = "Public URL of the Nginx web server"
  value       = "http://${module.web_server.public_ip}"
}
