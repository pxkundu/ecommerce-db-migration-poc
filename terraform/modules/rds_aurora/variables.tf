variable "cluster_identifier" {
  description = "Identifier for the Aurora cluster"
  type        = string
}
variable "engine_version" {
  description = "Aurora MySQL engine version"
  type        = string
  default     = "8.0.mysql_aurora.3.02.0"
}
variable "database_name" {
  description = "Name of the initial database"
  type        = string
}
variable "master_username" {
  description = "Master username for the database"
  type        = string
}
variable "master_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
variable "instance_class" {
  description = "Instance class for Aurora instances"
  type        = string
  default     = "db.r5.large"
}
variable "instance_count" {
  description = "Number of Aurora instances"
  type        = number
  default     = 1
}
variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}
variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}
