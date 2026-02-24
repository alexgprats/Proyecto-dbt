{{
    config(
        materialized='incremental', unique_key='order_id')
}}

with source_orders as (
    select * from {{ source('snowflake_sample', 'orders') }}
)

select
    o_orderkey as order_id,
    o_custkey as customer_id,
    o_orderstatus as status,
    o_totalprice as total_price,
    o_orderdate as order_date,
    o_orderpriority as priority
from source_orders

{% if is_incremental() %}
  where o_orderdate > (select max(order_date) from {{ this }})
{% endif %}