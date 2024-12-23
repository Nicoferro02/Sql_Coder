USE Distribuidora_Electrica;

DELIMITER //

CREATE PROCEDURE RegistrarPedido(
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_total DECIMAL(10,2),
    IN p_id_metodo_pago INT,
    IN p_id_transporte INT,
    IN p_productos_ids VARCHAR(255),  
    IN p_cantidades VARCHAR(255)     
)
BEGIN
    DECLARE v_id_pedido INT;
    DECLARE v_producto_id INT;
    DECLARE v_cantidad INT;
    DECLARE v_index INT DEFAULT 1;
    DECLARE v_total_productos INT;

    -- Insertar el pedido principal
    INSERT INTO pedidos (id_clientes, id_empleados, total, id_metodo_de_pago, id_transporte)
    VALUES (p_id_cliente, p_id_empleado, p_total, p_id_metodo_pago, p_id_transporte);

    -- Obtener el ID del pedido recién insertado
    SET v_id_pedido = LAST_INSERT_ID();

    -- Calcular la cantidad de productos a partir de las comas en las cadenas
    SET v_total_productos = LENGTH(p_productos_ids) - LENGTH(REPLACE(p_productos_ids, ',', '')) + 1;

    -- Insertar cada detalle del pedido
    WHILE v_index <= v_total_productos DO
        -- Obtener el ID del producto de la lista (producto)
        SET v_producto_id = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(p_productos_ids, ',', v_index), ',', -1) AS UNSIGNED);

        -- Obtener la cantidad del producto de la lista (cantidad)
        SET v_cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(p_cantidades, ',', v_index), ',', -1) AS UNSIGNED);

        -- Insertar el detalle del pedido
        INSERT INTO detalle_de_pedidos (id_pedidos, id_producto, cantidad)
        VALUES (v_id_pedido, v_producto_id, v_cantidad);

        -- Incrementar el índice para la siguiente iteración
        SET v_index = v_index + 1;
    END WHILE;
END//

DELIMITER ;

-- Probar el procedimiento
CALL RegistrarPedido(
    1,                  -- p_id_cliente
    2,                  -- p_id_empleado
    1000.00,            -- p_total
    1,                  -- p_id_metodo_pago
    2,                  -- p_id_transporte
    '1,2,3',            -- p_productos_ids
    '1,2,1'             -- p_cantidades
);

-- Verificar los datos insertados en la tabla 'pedidos'
SELECT * FROM pedidos;
