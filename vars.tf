variable "ami_aws_linux" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0f34c5ae932e6f0e4"
  }
}

variable "ami_ubuntu" {
  type = map(string)
  default = {
    "us-east-1" = "ami-053b0d53c279acc90"
    "us-east-2" = "ami-024e6efaf93d85776"
  }
}

#variable "cdirs_remote_access" {
#  type    = list(string)
#  default = ["0.0.0.0/32"]
#}

variable "key_name" {
  type    = string
  default = "terraform-aws"
}

variable "instance_type_micro" {
  default = "t2.micro"
}
