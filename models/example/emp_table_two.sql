{{ config (materialized='table') }}
with emp_table_two as( select        _airbyte_emitted_at,        _airbyte_ab_id,        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,        cast(jsonb_extract_path_text(_airbyte_data, 'id') as int) as emp_ID,        cast(jsonb_extract_path_text(_airbyte_data, 'name') as varchar) as emp_name,       cast(jsonb_extract_path_text(_airbyte_data, 'updated_at') as timestamp) as updated_at from __destination_database_._airbyte_raw_table_two)
select * from emp_table_two
