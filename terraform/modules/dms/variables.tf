variable "replication_instance_identifier" {
  description = "Identifier for the DMS replication instance"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}
variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
