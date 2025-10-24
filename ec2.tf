terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region

}

data "aws_ami" "amazonami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }


}



resource "aws_instance" "My-first-ec2" {
  count         = var.instance_cnt
  ami           = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  region        = var.region

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }

}
