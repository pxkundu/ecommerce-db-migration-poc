# Database Migrations

This directory contains all database migration scripts managed by Flyway. These scripts handle schema changes, data migrations, and database object modifications.

## 📁 Migration Files

```
migrations/
├── V1.0.0__initial_schema.sql    # Initial database schema
└── V1.0.1__add_index_and_trigger.sql  # Index and trigger modifications
```

## 📝 Migration Script Guidelines

### Naming Convention
- Format: `V{version}__{description}.sql`
- Version format: `major.minor.patch`
- Description: Short, descriptive name in lowercase with underscores
- Example: `V1.0.0__create_users_table.sql`

### Script Structure
```sql
-- Migration: V1.0.0__initial_schema.sql
-- Description: Creates initial database schema
-- Author: Your Name
-- Date: YYYY-MM-DD

-- Start transaction
START TRANSACTION;

-- Schema changes
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Add indexes
CREATE INDEX idx_users_email ON users(email);

-- Commit transaction
COMMIT;
```

## 🔄 Migration Types

### 1. Versioned Migrations
- Schema changes
- Table modifications
- Index creation/deletion
- Constraint modifications

### 2. Repeatable Migrations
- Views
- Stored procedures
- Functions
- Triggers

### 3. Data Migrations
- Data transformations
- Data cleanup
- Reference data updates

## ⚠️ Best Practices

### 1. Migration Scripts
- Always use transactions
- Include rollback procedures
- Add appropriate indexes
- Use meaningful names
- Include comments

### 2. Data Integrity
- Validate data before migration
- Check constraints
- Verify foreign keys
- Test rollback procedures

### 3. Performance
- Optimize queries
- Use appropriate indexes
- Batch large operations
- Monitor execution time

## 🔧 Usage

### Running Migrations
```bash
# Validate migrations
flyway validate

# Execute migrations
flyway migrate

# Check migration status
flyway info
```

### Rollback Procedures
```sql
-- Example rollback
START TRANSACTION;

-- Rollback changes
DROP TABLE IF EXISTS users;

COMMIT;
```

## 📊 Migration Logging

### Log Table Structure
```sql
CREATE TABLE flyway_schema_history (
    installed_rank INT PRIMARY KEY,
    version VARCHAR(50),
    description VARCHAR(200),
    type VARCHAR(20),
    script VARCHAR(1000),
    checksum INT,
    installed_by VARCHAR(100),
    installed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    execution_time INT,
    success BOOLEAN
);
```

## 🔍 Troubleshooting

### Common Issues
1. **Migration Failures**
   - Check error messages
   - Verify database connectivity
   - Review transaction logs
   - Check for conflicts

2. **Performance Issues**
   - Monitor execution time
   - Check index usage
   - Review query plans
   - Optimize batch size

3. **Data Issues**
   - Validate data integrity
   - Check constraints
   - Verify foreign keys
   - Review data types

## 📚 Additional Resources

- [Flyway Documentation](https://flywaydb.org/documentation)
- [MySQL Migration Guide](https://dev.mysql.com/doc/refman/8.0/en/migration.html)
- [Database Migration Best Practices](https://flywaydb.org/documentation/bestpractices) 