create  table emp_company
  as (
    select
        _airbyte_emitted_at,
        _airbyte_ab_id,
        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,

        cast(jsonb_extract_path_text(_airbyte_data, 'ID')as int) as emp_ID,
        cast(jsonb_extract_path_text(_airbyte_data, 'AGE')as varchar) as emp_AGE,
        cast(jsonb_extract_path_text(_airbyte_data, 'NAME')as varchar) as emp_NAME,
        cast(jsonb_extract_path_text(_airbyte_data, 'SALARY')as varchar) as emp_SALARY,
        cast(jsonb_extract_path_text(_airbyte_data, 'updated_at')as timestamp) as updated_at
from _airbyte_raw_company
);
