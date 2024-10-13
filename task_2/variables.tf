variable "region" {
  type        = string
  default     = "us-east-1"
  description = "An AWS region for infrastructure deployment"
}

variable "vpc_cidr" {
  description = "A CIDR block for VPC"
  type        = string
  default     = "13.0.0.0/16"
}

variable "private_subnets_cidr" {
  description = "A CIDR block for public subnets"
  type        = list(string)
  default     = ["13.0.0.0/24", "13.0.1.0/24"]
}

variable "public_subnets_cidr" {
  description = "A CIDR block for private subnets"
  type        = list(string)
  default = ["13.0.2.0/24", "13.0.3.0/24"]
}

variable "ami" {
  description = "Bastion host instance AMI"
  type        = string
  default     = "ami-0fff1b9a61dec8a5f"
}

variable "instance_type" {
  description = "Bastion host instance type"
  type        = string
  default     = "t2.micro"
}