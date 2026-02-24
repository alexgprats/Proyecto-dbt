with source_lineitems as (
    select * from {{ source('snowflake_sample', 'lineitem') }}
)

select
    l_orderkey as order_id,
    l_partkey as part_id,
    l_suppkey as supplier_id,
    l_linenumber as linea_numero,
    l_quantity as cantidad,
    l_extendedprice as precio_extendido,
    l_discount as descuento,
    l_tax as impuesto,
    l_shipdate as fecha_envio
from source_lineitems