with source_parts as (
    select * from {{ source('snowflake_sample', 'part') }}
)

select
    p_partkey as part_id,
    p_name as nombre_pieza,
    p_mfgr as fabricante,
    p_brand as marca,
    p_type as tipo_pieza,
    p_size as tamano,
    p_retailprice as precio_minorista
from source_parts