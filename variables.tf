variable "ami-id" {
  type        = string
  default     = "ami-0854d4f8e4bd6b834"
  description = "Defines ami id to launch the instance"
}

variable "instance-type" {
  type = map
  default = {
    dev  = "t3.micro"
    prod = "t5.large"
    default = "t3.micro"
  }
  description = "Defines instance type to launch the instance"
}

variable "region" {
  type        = string
  default     = "eu-north-1"
  description = "Defines region to launch the instance"
}

variable "instance_cnt" {
  type        = number
  default     = 1
  description = "Defines number of instances to launch"
}

variable "instance_name" {
  type        = string
  default     = "ec2-instance"
  description = "Base name for EC2 instances"
}
