resource "aws_s3_bucket" "dev-4" {
  bucket = "lab1-dev-4"

  tags = {
    Name = "lab1-dev-4"
  }
}
