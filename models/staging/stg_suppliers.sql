with source_suppliers as (
    select * from {{ source('snowflake_sample', 'supplier') }}
)

select
    s_suppkey as supplier_id,
    s_name as nombre_proveedor,
    s_address as direccion,
    s_phone as telefono,
    s_acctbal as balance_cuenta
from source_suppliers