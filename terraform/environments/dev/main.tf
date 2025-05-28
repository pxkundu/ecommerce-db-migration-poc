module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "rds_aurora" {
  source                = "../../modules/rds_aurora"
  cluster_identifier    = "ecommerce-db-dev"
  database_name         = "ecommerce_db"
  master_username       = var.master_username
  master_password       = var.master_password
  vpc_security_group_ids = [module.vpc.security_group_id]
  subnet_ids            = module.vpc.subnet_ids
}

module "dms" {
  source                = "../../modules/dms"
  replication_instance_identifier = "ecommerce-dms-dev"
  vpc_security_group_ids = [module.vpc.security_group_id]
  subnet_ids            = module.vpc.subnet_ids
}
