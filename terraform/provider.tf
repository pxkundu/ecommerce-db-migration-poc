provider "aws" {
  region = var.region
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "master_username" {
  description = "Master username for RDS"
  type        = string
}

variable "master_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}
