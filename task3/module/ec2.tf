## EC2
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.this.id]
  key_name = var.key_name

  tags = {
    Name = var.name
  }
}

## Security Group
resource "aws_security_group" "this" {
  name        = "web-server-sg"
  description = "Security group for webserver."
  vpc_id      = aws_vpc.this.id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4   = var.cidr_ipv4
  from_port   = var.port
  ip_protocol = var.ip_protocol
  to_port     = var.port
}

resource "aws_vpc_security_group_egress_rule" "this" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}
