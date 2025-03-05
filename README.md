# dbt-clickhouse

dbt adapter for [ClickHouse](https://clickhouse.com/) data warehouse.

## Installation

```bash
pip install dbt-clickhouse
```

## Configuration

In your `profiles.yml` file, configure your ClickHouse connection:

```yaml
your_profile_name:
    target: dev
    outputs:
        dev:
            type: clickhouse
            host: your-clickhouse-host
            port: 9000
            user: default
            password: your-password
            database: your_database
            schema: your_schema
            secure: False  # Set to True for HTTPS connections
```

## Supported features

- Table materialization
- View materialization
- Incremental materialization
- Seeds
- Sources
- Tests
- Snapshots
- Documentation generation
- Custom schema configurations

## Usage

### Basic model example

```sql
-- models/my_model.sql
{{ config(materialized='table') }}

SELECT
    column1,
    column2,
    SUM(metric) as total_metric
FROM {{ source('source_name', 'table_name') }}
GROUP BY column1, column2
```

### Incremental model

```sql
-- models/incremental_model.sql
{{ config(
        materialized='incremental',
        unique_key='id'
) }}

SELECT
    id,
    timestamp,
    event_name,
    user_id
FROM {{ source('source_name', 'events') }}
{% if is_incremental() %}
    WHERE timestamp > (SELECT MAX(timestamp) FROM {{ this }})
{% endif %}
```

## Limitations

- Some ClickHouse-specific features might require custom implementations.
- Performance optimizations should follow ClickHouse best practices.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
