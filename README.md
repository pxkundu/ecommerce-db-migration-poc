# Ecommerce Database Migration POC

This repository contains a Proof of Concept (POC) for migrating an on-premises MySQL database to AWS RDS Aurora MySQL, using Terraform for infrastructure, Flyway for database version control, and GitHub Actions for CI/CD.

## Project Structure
- `terraform/`: Modular Terraform configurations for AWS infrastructure.
- `db/`: Flyway migration scripts and DML for seeding data.
- `.github/workflows/`: GitHub Actions workflows for CI/CD.

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-org/ecommerce-db-migration-poc.git
   cd ecommerce-db-migration-poc
   ```
2. **Set Up GitHub Secrets**:
   - Add `ON_PREM_DB_HOST`, `ON_PREM_DB_USER`, `ON_PREM_DB_PASSWORD`, `AURORA_DB_HOST`, `AURORA_DB_USER`, `AURORA_DB_PASSWORD`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY` in GitHub Settings > Secrets.
3. **Initialize Terraform**:
   ```bash
   cd terraform/environments/dev
   terraform init
   ```
4. **Apply Terraform**:
   ```bash
   terraform apply
   ```
5. **Run Flyway Locally**:
   ```bash
   cd db
   flyway migrate
   ```
6. **Configure AWS DMS**:
   - Set up DMS replication instance, endpoints, and tasks in the AWS Console.
   - Apply `V1.0.1__add_index_and_trigger.sql` post-migration.
7. **Push Changes**:
   Commit and push to trigger the CI/CD pipeline.

## License
MIT
