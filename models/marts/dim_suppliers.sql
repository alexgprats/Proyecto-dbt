with suppliers as (
    select * from {{ ref('stg_suppliers') }}
)

select
    supplier_id,
    nombre_proveedor,
    direccion,
    telefono,
    balance_cuenta
from suppliers