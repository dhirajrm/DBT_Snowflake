# Airbnb dbt Snowflake Project

This directory contains the main dbt Core project assets (models, snapshots, macros, and configurations) for the Airbnb data pipeline on Snowflake.

For complete documentation, architectural diagrams, and setup instructions, please see the [Root README](../README.md).

### Quick Commands
```bash
# Test connection
dbt debug

# Run all models
dbt run

# Run snapshots (SCD Type 2)
dbt snapshot

# Run full project build
dbt build
```
