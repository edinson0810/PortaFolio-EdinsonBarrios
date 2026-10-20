-- Creación de tablas básicas
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE ventas (
    venta_id INT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    monto_total DECIMAL(10,2),
    fecha_venta DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Inserción de datos de prueba
INSERT INTO clientes VALUES 
(1, 'Carlos Gómez', 'Bucaramanga', '2024-01-15'),
(2, 'Ana Martínez', 'Floridablanca', '2024-02-10'),
(3, 'Luis Rodríguez', 'Bucaramanga', '2024-03-05');

INSERT INTO productos VALUES 
(101, 'Teclado Mecánico', 'Tecnología', 150000.00),
(102, 'Monitor 24 pulgadas', 'Tecnología', 650000.00),
(103, 'Silla Ergonómica', 'Oficina', 450000.00);

INSERT INTO ventas VALUES 
(1, 1, 101, 2, 300000.00, '2024-04-01'),
(2, 2, 102, 1, 650000.00, '2024-04-03'),
(3, 1, 103, 1, 450000.00, '2024-04-05'),
(4, 3, 101, 1, 150000.00, '2024-04-10');
