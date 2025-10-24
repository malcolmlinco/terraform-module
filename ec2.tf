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
  instance_type = "t2.micro"
  region        = var.region

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }

}

able "ami-id" {
  type        = string
  default     = "ami-0854d4f8e4bd6b834"
  description = "Defines ami id to launch the instance"
}

variable "region" {
  type        = string
  default     = "eu-north-1"
  description = "Defines region to launch the instance"
}

variable "instance_name" {
  type        = string
  default     = "ec2-instance"
  description = "Base name for EC2 instances"
}
