with orders_joined as (
    select * from {{ ref('int_pedidos_clientes') }}
)

select
    order_id,
    customer_id,
    nombre_cliente,
    segmento_cliente,
    order_date,
    status as estado_pedido,
    importe_bruto as importe_total,
    {{ categorizar_importe('importe_bruto') }} as categoria_venta,
    total_piezas,
    total_proveedores_distintos,
    pieza_ejemplo,
    proveedor_principal
from orders_joined