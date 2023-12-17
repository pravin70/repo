provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "Terraform_EC2_instance_loop" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  count         = 1

  tags = {
    Name = "Terraform_EC2_instance_loop"
  }
}

resource "aws_iam_user" "aws_iam_user" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "IAM resources"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}
