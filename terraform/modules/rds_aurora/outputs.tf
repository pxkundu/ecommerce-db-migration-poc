output "cluster_endpoint" {
  description = "Aurora MySQL cluster endpoint"
  value       = aws_rds_cluster.aurora_mysql.endpoint
}
