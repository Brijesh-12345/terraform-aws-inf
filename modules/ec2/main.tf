
resource "aws_security_group" "ec2_sg" {
  ingress {
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  subnet_id = var.public_subnets[count.index]

  user_data = <<EOF
#!/bin/bash
yum install httpd -y
systemctl start httpd
EOF
}
