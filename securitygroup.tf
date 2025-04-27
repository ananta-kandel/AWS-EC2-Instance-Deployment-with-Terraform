resource "aws_security_group" "ananta-sg" {
  name        = "ananta-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "ananta-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfrommyip" {
  security_group_id = aws_security_group.ananta-sg.id
  cidr_ipv4         =  "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allowhttpfromanywhere" {
  security_group_id = aws_security_group.ananta-sg.id
  cidr_ipv4      = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "sshfrommyip" {
  security_group_id = aws_security_group.ananta-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_vpc_security_group_egress_rule" "allowalltrafficipv6" {
  security_group_id = aws_security_group.ananta-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}