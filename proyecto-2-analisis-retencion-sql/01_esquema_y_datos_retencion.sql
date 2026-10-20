-- =====================================================
-- PROYECTO 2: ANÁLISIS DE RETENCIÓN Y MÉTRICAS DE CLIENTES
-- Archivo: 01_esquema_y_datos_retencion.sql
-- =====================================================

DROP TABLE IF EXISTS ordenes_retencion;
DROP TABLE IF EXISTS clientes_retencion;

CREATE TABLE clientes_retencion (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE ordenes_retencion (
    orden_id INT PRIMARY KEY,
    cliente_id INT,
    fecha_orden DATE,
    monto TOTAL DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes_retencion(cliente_id)
);

-- Insertar Clientes
INSERT INTO clientes_retencion VALUES 
(1, 'Carlos Gómez', '2024-01-10'),
(2, 'María Rodríguez', '2024-01-15'),
(3, 'Juan Pérez', '2024-02-01'),
(4, 'Ana Martínez', '2024-02-20');

-- Insertar Órdenes
INSERT INTO ordenes_retencion VALUES 
(101, 1, '2024-01-12', 150.00),
(102, 1, '2024-02-15', 200.00),
(103, 1, '2024-03-10', 300.00),
(104, 2, '2024-01-18', 80.00),
(105, 2, '2024-04-01', 120.00),
(106, 3, '2024-02-05', 50.00);