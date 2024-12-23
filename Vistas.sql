

USE Distribuidora_Electrica;


-- Vista N1
CREATE VIEW vista_inventario AS
SELECT
    id_producto,
    nombre,
    descripcion,
    precio,
    stock
FROM producto;

-- Vista N2

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