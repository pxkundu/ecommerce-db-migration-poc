resource "aws_dms_replication_instance" "main" {
  replication_instance_identifier = var.replication_instance_identifier
  replication_instance_class      = "dms.t3.medium"
  allocated_storage              = 20
  vpc_security_group_ids         = var.vpc_security_group_ids
  subnet_group_id                = aws_dms_replication_subnet_group.main.id
}

resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_identifier = "${var.replication_instance_identifier}-subnet-group"
  subnet_ids                         = var.subnet_ids
}
