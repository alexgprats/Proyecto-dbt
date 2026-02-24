with datos_clientes as (
    select * from {{ source('snowflake_sample', 'customer') }}
)

select 
    c_custkey as cliente_id,
    c_name as nombre,
    c_mktsegment as segmento
from datos_clientes
limit 100