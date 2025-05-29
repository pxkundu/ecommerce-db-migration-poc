# Infrastructure as Code (Terraform)

This directory contains all Terraform configurations for provisioning and managing AWS infrastructure required for the database migration project.

## 📁 Directory Structure

```
terraform/
├── environments/
│   └── dev/            # Development environment configuration
├── modules/
│   ├── rds/           # RDS Aurora module
│   ├── vpc/           # VPC module
│   └── security/      # Security groups and IAM
├── provider.tf        # AWS provider configuration
└── backend.tf         # Terraform state backend
```

## 🏗️ Infrastructure Components

### 1. RDS Aurora Module
- Aurora MySQL cluster configuration
- Parameter groups
- Subnet groups
- Security groups
- Backup configuration

### 2. VPC Module
- VPC configuration
- Subnets (public/private)
- Route tables
- Internet Gateway
- NAT Gateway

### 3. Security Module
- Security groups
- IAM roles and policies
- KMS encryption
- Network ACLs

## 🔧 Usage

### Prerequisites
```bash
# Install Terraform
brew install terraform  # macOS
# or
apt-get install terraform  # Ubuntu

# Configure AWS credentials
aws configure
```

### Initialize Terraform
```bash
# Initialize backend
terraform init

# Initialize specific environment
cd environments/dev
terraform init
```

### Apply Changes
```bash
# Plan changes
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan
```

### Destroy Infrastructure
```bash
# Plan destruction
terraform plan -destroy

# Destroy infrastructure
terraform destroy
```

## ⚙️ Configuration

### Environment Variables
```bash
# Required environment variables
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="your-region"
```

### Terraform Variables
```hcl
# Example variables.tf
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.r5.large"
}
```

## 🔒 Security

### Best Practices
1. **State Management**
   - Use remote state storage
   - Enable state encryption
   - Implement state locking

2. **Access Control**
   - Use IAM roles
   - Implement least privilege
   - Enable audit logging

3. **Network Security**
   - Use private subnets
   - Implement security groups
   - Enable VPC flow logs

## 📊 Monitoring

### CloudWatch Integration
```hcl
# Example CloudWatch configuration
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "rds-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period             = "300"
  statistic          = "Average"
  threshold          = "80"
  alarm_description  = "This metric monitors RDS CPU utilization"
}
```

## 🔄 CI/CD Integration

### GitHub Actions
```yaml
# Example workflow
name: Terraform
on:
  push:
    paths:
      - 'terraform/**'
jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: hashicorp/setup-terraform@v1
      - run: terraform init
      - run: terraform plan
```

## ⚠️ Best Practices

1. **Code Organization**
   - Use modules for reusability
   - Separate environments
   - Version control
   - Documentation

2. **Security**
   - Encrypt sensitive data
   - Use IAM roles
   - Implement network security
   - Enable audit logging

3. **State Management**
   - Use remote state
   - Enable state locking
   - Implement backup
   - Version control

## 🔍 Troubleshooting

### Common Issues
1. **State Conflicts**
   - Check state locking
   - Verify backend configuration
   - Review state file

2. **Provider Issues**
   - Verify credentials
   - Check region configuration
   - Review provider version

3. **Module Issues**
   - Check module versions
   - Verify input variables
   - Review module documentation

## 📚 Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform-best-practices.com/) 