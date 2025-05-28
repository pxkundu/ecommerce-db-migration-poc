# Defining Aurora MySQL cluster
resource "aws_rds_cluster" "aurora_mysql" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-mysql"
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = true
  apply_immediately       = true

  # Enable binary logging for DMS
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_params.name
}

# Defining Aurora MySQL instance
resource "aws_rds_cluster_instance" "aurora_instance" {
  count              = var.instance_count
  identifier         = "${var.cluster_identifier}-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_mysql.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora_mysql.engine
  engine_version     = aws_rds_cluster.aurora_mysql.engine_version
}

# Defining DB subnet group
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
}

# Defining parameter group for binary logging
resource "aws_rds_cluster_parameter_group" "aurora_params" {
  name   = "${var.cluster_identifier}-params"
  family = "aurora-mysql8.0"
  parameter {
    name  = "binlog_format"
    value = "ROW"
  }
  parameter {
    name  = "binlog_row_image"
    value = "FULL"
  }
}
