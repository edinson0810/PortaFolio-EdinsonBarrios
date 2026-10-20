-- =====================================================
-- CONSULTAS Y MÉTRICAS DE NEGOCIO (WINDOW FUNCTIONS & CTEs)
-- Archivo: 02_metricas_y_window_functions.sql
-- =====================================================

-- 1. Identificar el orden de compra por cliente y diferencia de días entre compras
WITH compras_ordenadas AS (
    SELECT 
        o.cliente_id,
        c.nombre,
        o.orden_id,
        o.fecha_orden,
        o.monto,
        ROW_NUMBER() OVER(PARTITION BY o.cliente_id ORDER BY o.fecha_orden) AS numero_compra,
        LAG(o.fecha_orden) OVER(PARTITION BY o.cliente_id ORDER BY o.fecha_orden) AS fecha_compra_anterior
    FROM ordenes_retencion o
    JOIN clientes_retencion c ON o.cliente_id = c.cliente_id
)
SELECT 
    cliente_id,
    nombre,
    orden_id,
    fecha_orden,
    monto,
    numero_compra,
    DATEDIFF(fecha_orden, fecha_compra_anterior) AS dias_desde_ultima_compra
FROM compras_ordenadas;

-- 2. Valor Total Generado por Cliente (LTV / Lifetime Value acumulado)
SELECT 
    c.cliente_id,
    c.nombre,
    COUNT(o.orden_id) AS total_ordenes,
    SUM(o.monto) AS total_gastado,
    AVG(o.monto) AS ticket_promedio
FROM clientes_retencion c
LEFT JOIN ordenes_retencion o ON c.cliente_id = o.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY total_gastado DESC;
