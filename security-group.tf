resource "aws_security_group" "access-ssh" {
  name        = "access-ssh"
  description = "SSH Access SG"

  ingress {
    description = "ingress ssh rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  tags = {
    Name = "ssh-access"
  }
}

resource "aws_security_group" "access-ssh-us-east-2" {

  provider    = aws.us-east-2
  name        = "access-ssh"
  description = "SSH Access SG"

  ingress {
    description = "ingress ssh rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  tags = {
    Name = "ssh-access"
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
