with orders as (
    select * from {{ ref('stg_orders') }}),

customers as (
    select * from {{ ref('stg_customers') }}),

lineitems as (
    select * from {{ ref('stg_lineitems') }}),

parts as (
    select * from {{ ref('stg_parts') }}),
    
suppliers as (
    select * from {{ ref('stg_suppliers') }}),

lineitem_aggregation as (
    select
        l.order_id,
        count(l.part_id) as total_piezas,
        count(distinct l.supplier_id) as total_proveedores_distintos,
        sum(l.precio_extendido) as importe_bruto,
        -- Traemos el nombre de la primera pieza y proveedor como ejemplo
        max(p.nombre_pieza) as pieza_ejemplo,
        max(s.nombre_proveedor) as proveedor_principal
    from lineitems l
    left join parts p on l.part_id = p.part_id
    left join suppliers s on l.supplier_id = s.supplier_id
    group by 1
),

final as (
    select
        o.order_id,
        o.customer_id,
        c.name as nombre_cliente, -- Cambia 'nombre_cliente' por el alias que usaras en stg_customers
        c.segment as segmento_cliente, -- Cambia 'segmento_cliente' por el alias de stg_customers
        o.order_date,
        o.status,
        la.total_piezas,
        la.total_proveedores_distintos,
        la.importe_bruto,
        la.pieza_ejemplo,
        la.proveedor_principal
    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join lineitem_aggregation la on o.order_id = la.order_id
)

select * from final