provider "aws" {
  region = "us-east-1"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default = "10.0.10.0/24"
  type = string 
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "environment" {
  description = "deployment environment" 
}

resource "aws_vpc" "develpment-vpc" {
cidr_block = var.vpc_cidr_block  
tags = {
  Name: var.environment 
 }
}
 
resource "aws_subnet" "dev-subnet-1" {
vpc_id = aws_vpc.develpment-vpc.id
cidr_block = var.subnet_cidr_block 
availability_zone = "us-east-1a"  
tags = {
  Name: "subnet-1-dev"
}
}