create table "my_new_database"."__destination_database_"."company__dbt_tmp"
as (
    select
        _airbyte_emitted_at,
        _airbyte_ab_id,
        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,

        cast(jsonb_extract_path_text(_airbyte_data, 'EMP_ID') as "EMP_ID",
        cast(jsonb_extract_path_text(_airbyte_data, 'EMP_AGE') as EMP_AGE,
        cast(jsonb_extract_path_text(_airbyte_data, 'EMP_NAME') as "EMP_NAME",
        cast(jsonb_extract_path_text(_airbyte_data, 'SALARY') as salary,
        cast(jsonb_extract_path_text(_airbyte_data, 'updated_at') as updated_at,
    from "my_new_database".__destination_database_._airbyte_raw_company as table_alias
);
