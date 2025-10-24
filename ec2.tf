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

resource "aws_instance" "My-first-ec2" {
  ami           = var.ami-id
  instance_type = "t3.micro"
  region        = var.region

  tags = {
    Name = var.instance_name
  }

}
