{{ config (materialized='table') }}
with emp_products as( select        _airbyte_emitted_at,        _airbyte_ab_id,        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,        cast(jsonb_extract_path_text(_airbyte_data, 'product_id') as int) as id,        cast(jsonb_extract_path_text(_airbyte_data, 'product_name') as varchar) as product_names,        cast(jsonb_extract_path_text(_airbyte_data, 'price') as varchar) as product_price  from __destination_database_._airbyte_raw_products)
select * from emp_products
