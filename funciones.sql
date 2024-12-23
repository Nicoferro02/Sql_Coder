Use Distribuidora_Electrica;

-- Función para calcular el descuento de un total

DELIMITER //
CREATE FUNCTION calcular_descuento(total DECIMAL(10,2), porcentaje DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN total - (total * (porcentaje / 100));
END;//
DELIMITER ;

-- Función para obtener el stock de un producto 

DELIMITER //
CREATE FUNCTION obtener_stock_producto(p_id_producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    SELECT stock INTO stock_actual
    FROM producto
    WHERE id_producto = p_id_producto;
    RETURN stock_actual;
END;//
DELIMITER ;