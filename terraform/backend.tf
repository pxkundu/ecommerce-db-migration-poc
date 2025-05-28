terraform {
  backend "s3" {
    bucket         = "ecommerce-db-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
