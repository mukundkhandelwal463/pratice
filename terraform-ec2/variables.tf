variable "aws_region" {
  description = "AWS region where the EC2 instance will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix for AWS resources."
  type        = string
  default     = "pratice-ec2"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name for SSH access."
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH into the instance. Use your public IP with /32 for better security."
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "Port opened for the app."
  type        = number
  default     = 3003
}
