{{ config(materialized='table') }}
with emp_department as( select        _airbyte_emitted_at,        _airbyte_ab_id,        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,        cast(jsonb_extract_path_text(_airbyte_data, 'ID') as int) as S.NO,        cast(jsonb_extract_path_text(_airbyte_data, 'dept') as varchar) as emp_dept,        cast(jsonb_extract_path_text(_airbyte_data, 'emp_id') as int) as employee_id,  cast(jsonb_extract_path_text(_airbyte_data, 'updated_at') as timestamp) as updated_at from _airbyte_raw_department)
select * from emp_department
