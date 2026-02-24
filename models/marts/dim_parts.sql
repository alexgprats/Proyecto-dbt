with parts as (
    select * from {{ ref('stg_parts') }}
)

select
    part_id,
    nombre_pieza,
    fabricante,
    marca,
    tipo_pieza,
    tamano, 
    precio_minorista
from parts