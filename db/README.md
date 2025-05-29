# Database Migration Directory

This directory contains all database-related components for the migration from on-premises MySQL to AWS RDS Aurora.

## 📁 Directory Structure

```
db/
├── migrations/           # Flyway migration scripts
│   ├── V1.0.0__initial_schema.sql
│   └── V1.0.1__add_index_and_trigger.sql
└── scripts/
    ├── validation/      # Data validation scripts
    └── monitoring/      # Migration monitoring scripts
```

## 🚀 Migration Scripts

### Naming Convention
- Format: `V{version}__{description}.sql`
- Example: `V1.0.0__initial_schema.sql`

### Migration Types
1. **Versioned Migrations**
   - Schema changes
   - Data structure modifications
   - Index creation/modification

2. **Repeatable Migrations**
   - Views
   - Stored procedures
   - Functions
   - Triggers

## 📊 Validation Scripts

### Data Integrity Checks
```sql
-- Example validation query
SELECT 
    table_name,
    COUNT(*) as row_count,
    MD5(GROUP_CONCAT(*)) as table_checksum
FROM information_schema.tables 
WHERE table_schema = DATABASE()
GROUP BY table_name;
```

### Constraint Verification
```sql
-- Example constraint check
SELECT 
    table_name,
    column_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = DATABASE();
```

## 📈 Monitoring Scripts

### Performance Monitoring
```sql
-- Example performance query
SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool_%';
SHOW ENGINE INNODB STATUS;
```

### Migration Progress
```sql
-- Example progress tracking
SELECT 
    table_name,
    COUNT(*) as migrated_rows,
    TIMESTAMPDIFF(SECOND, MIN(created_at), MAX(created_at)) as migration_duration
FROM migration_log
GROUP BY table_name;
```

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

### Running Validation Scripts
```bash
# Run all validation scripts
./scripts/validation/run_all.sh

# Run specific validation
./scripts/validation/check_constraints.sh
```

### Running Monitoring Scripts
```bash
# Start monitoring
./scripts/monitoring/start_monitoring.sh

# Generate report
./scripts/monitoring/generate_report.sh
```

## ⚠️ Best Practices

1. **Migration Scripts**
   - Always include rollback procedures
   - Test migrations in development first
   - Use transactions for data modifications
   - Include appropriate indexes

2. **Validation**
   - Run checks before and after migration
   - Verify data integrity
   - Check constraint compliance
   - Validate performance metrics

3. **Monitoring**
   - Track migration progress
   - Monitor performance impact
   - Log all operations
   - Set up alerts for issues

## 🔍 Troubleshooting

### Common Issues
1. **Migration Failures**
   - Check error logs
   - Verify database connectivity
   - Ensure sufficient privileges
   - Check for conflicting changes

2. **Validation Errors**
   - Review data integrity checks
   - Verify constraint definitions
   - Check for data type mismatches
   - Validate foreign key relationships

3. **Performance Issues**
   - Monitor resource usage
   - Check for long-running queries
   - Verify index usage
   - Review connection settings

## 📚 Additional Resources

- [Flyway Documentation](https://flywaydb.org/documentation)
- [MySQL Migration Guide](https://dev.mysql.com/doc/refman/8.0/en/migration.html)
- [AWS DMS Best Practices](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_BestPractices.html) 