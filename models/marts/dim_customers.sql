with customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    name as nombre_cliente,
    segment as segmento_mercado,

    upper(address) as direccion_formateada
from customers