-- 1. Total gastado por cliente y número de compras (INNER JOIN + GROUP BY + HAVING)
SELECT 
    c.nombre AS cliente,
    c.ciudad,
    COUNT(v.venta_id) AS total_compras,
    SUM(v.monto_total) AS total_gastado
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre, c.ciudad
HAVING total_gastado > 200000
ORDER BY total_gastado DESC;

-- 2. Ventas totales por categoría de producto
SELECT 
    p.categoria,
    SUM(v.cantidad) AS unidades_vendidas,
    SUM(v.monto_total) AS ingresos_totales
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
GROUP BY p.categoria
ORDER BY ingresos_totales DESC;
