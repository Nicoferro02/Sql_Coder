

USE Distribuidora_Electrica;


-- Vista N1 = Para mostrar información de inventario
DROP VIEW IF EXISTS vista_inventario;
CREATE VIEW vista_inventario AS
SELECT
    id_producto,
    nombre,
    descripcion,
    precio,
    stock
FROM producto;

-- Vista N2 = Para mostrar información de pedidos con clientes y vendedores
DROP VIEW IF EXISTS vista_pedidos_clientes;
CREATE VIEW vista_pedidos_clientes AS
SELECT 
    p.id_pedidos,
    c.nombre AS nombre_cliente,
    c.telefono,
    c.email,
    v.id_vendedores,
    v.comision,
    p.total,
    p.id_metodo_de_pago,
    p.id_transporte
FROM 
    pedidos p
INNER JOIN 
    clientes c ON p.id_clientes = c.id_clientes
INNER JOIN 
    vendedores v ON c.id_vendedores = v.id_vendedores;

-- Vista N3 = Para identificar productos con stock menor a 10 unidades

DROP VIEW IF EXISTS vista_productos_stock_bajo;
CREATE VIEW vista_productos_stock_bajo AS
SELECT 
    p.id_producto,
    p.nombre AS nombre_producto,
    p.descripcion,
    p.precio,
    p.stock
FROM 
    Distribuidora_Electrica.producto p
WHERE 
    p.stock < 10;

-- Vista N4 = Para identificar los 10 vendedores con mayores ventas

DROP VIEW IF EXISTS vista_top_vendedores;

CREATE VIEW vista_top_vendedores AS
SELECT 
    v.id_vendedores,
    e.nombre AS nombre_vendedor,
    COUNT(p.id_pedidos) AS total_pedidos,
    SUM(p.total) AS monto_acumulado
FROM 
    Distribuidora_Electrica.vendedores v
JOIN 
    Distribuidora_Electrica.empleados e
ON 
    v.id_empleados = e.id_empleados
LEFT JOIN 
    Distribuidora_Electrica.pedidos p
ON 
    v.id_vendedores = p.id_empleados
GROUP BY 
    v.id_vendedores
ORDER BY 
    monto_acumulado DESC
LIMIT 10;

-- Vista N5 = Para mostrar información de direcciones de clientes

DROP VIEW IF EXISTS vista_direcciones_clientes;
CREATE VIEW vista_direcciones_clientes AS
SELECT 
    d.id_direcciones,
    c.nombre AS nombre_cliente,
    d.ciudad,
    d.calle,
    d.numero,
    d.codigo_postal
FROM 
    Distribuidora_Electrica.direcciones d
JOIN 
    Distribuidora_Electrica.clientes c
ON 
    d.id_clientes = c.id_clientes;


