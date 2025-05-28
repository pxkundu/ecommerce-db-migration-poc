variable "master_username" {
  description = "Master username for RDS"
  type        = string
}
variable "master_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}
