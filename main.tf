terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = var.ami_aws_linux["us-east-1"]
  instance_type = var.instance_type_micro
  key_name      = var.key_name
  tags = {
    Name = "dev-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.access-ssh.id]
}

resource "aws_instance" "dev-4" {
  ami           = var.ami_ubuntu["us-east-1"]
  instance_type = var.instance_type_micro
  key_name      = var.key_name
  tags = {
    Name = "dev-4"
  }
  vpc_security_group_ids = [aws_security_group.access-ssh.id]
  depends_on             = [aws_s3_bucket.dev-4]
}

resource "aws_instance" "dev-5" {
  ami           = var.ami_ubuntu["us-east-1"]
  instance_type = var.instance_type_micro
  key_name      = var.key_name
  tags = {
    Name = "dev-5"
  }
  vpc_security_group_ids = [aws_security_group.access-ssh.id]
}

resource "aws_instance" "dev-6" {
  provider      = aws.us-east-2
  ami           = var.ami_ubuntu["us-east-2"]
  instance_type = var.instance_type_micro
  key_name      = var.key_name
  tags = {
    Name = "dev-6"
  }
  vpc_security_group_ids = [aws_security_group.access-ssh-us-east-2.id]
  depends_on             = [aws_dynamodb_table.dynamodb-hom]
}

resource "aws_instance" "dev-7" {
  provider      = aws.us-east-2
  ami           = var.ami_ubuntu["us-east-2"]
  instance_type = var.instance_type_micro
  key_name      = var.key_name
  tags = {
    Name = "dev-7"
  }
  vpc_security_group_ids = [aws_security_group.access-ssh-us-east-2.id]
}
