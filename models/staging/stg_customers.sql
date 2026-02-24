with source_customers as (
    select * from {{ source('snowflake_sample', 'customer') }}
)

select
    c_custkey as customer_id,
    c_name as name,
    c_address as address,
    c_nationkey as nation_id,
    c_phone as phone,
    c_mktsegment as segment
from source_customers