data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  
    user_data = <<-EOF
                #!/bin/bash
                dnf -y update
                dnf -y install nginx
                systemctl start nginx
                systemctl enable nginx
                echo "<h1>Welcome to NGINX on EC2</h1>" > /usr/share/nginx/html/index.html
                EOF
 
  tags = {
    Name = "web-server"
  }
}