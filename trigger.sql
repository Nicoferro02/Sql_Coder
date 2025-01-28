USE Distribuidora_Electrica;

-- Trigger para actualizar el stock al insertar un detalle de pedido
DROP TRIGGER IF EXISTS actualizar_stock_pedido;
DELIMITER //
CREATE TRIGGER actualizar_stock_pedido
AFTER INSERT ON Distribuidora_Electrica.detalle_de_pedidos
FOR EACH ROW
BEGIN
    UPDATE Distribuidora_Electrica.producto
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END//
DELIMITER ;

-- Trigger para asegurar que el stock no sea negativo al actualizar el producto
DROP TRIGGER IF EXISTS asegurar_stock;
DELIMITER //
CREATE TRIGGER asegurar_stock
BEFORE UPDATE ON Distribuidora_Electrica.producto
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END//
DELIMITER ;
