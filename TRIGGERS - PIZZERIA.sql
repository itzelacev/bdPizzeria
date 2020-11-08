 -- Disparador 1: que actualice el total de la tabla PEDIDO después de que se inserte 
-- un artículo al pedido. Además, decremento de existencias en inventario.
DROP TRIGGER tr_actualiza_total_after_insert;

DELIMITER //
CREATE TRIGGER tr_actualiza_total_after_insert
AFTER INSERT
ON PEDIDO_ARTICULO
FOR EACH ROW 
BEGIN
DECLARE SUMA INT;
DECLARE SUCURSAL INT;
SET SUMA = (SELECT SUM(cantidad * precio_unitario) FROM PEDIDO_ARTICULO 
	WHERE id_pedido = new.id_pedido);
UPDATE PEDIDO SET monto_total = SUMA WHERE id_pedido = new.id_pedido;
SET SUCURSAL = (SELECT id_sucursal FROM PEDIDO WHERE id_pedido = new.id_pedido);
UPDATE ARTICULO_SUCURSAL SET existencias = existencias - new.cantidad
	WHERE id_articulo = new.id_articulo AND id_sucursal = SUCURSAL;
END //
DELIMITER ;

SELECT * FROM PEDIDO;
SELECT * FROM ARTICULO_SUCURSAL;
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES (1,150,1,1);

-- Disparador 2: que actualice el total de la tabla PEDIDO después de que se modifique 
-- un artículo del pedido. Además, actualice las existencias en inventario.
drop trigger tr_pedido_articulo_after_update;
DELIMITER //
CREATE TRIGGER tr_pedido_articulo_after_update
AFTER UPDATE 
ON PEDIDO_ARTICULO
FOR EACH ROW 
BEGIN
DECLARE SUMA INT;
DECLARE SUCURSAL INT;
SET SUMA = (SELECT SUM(cantidad * precio_unitario) FROM PEDIDO_ARTICULO 
	WHERE id_pedido = old.id_pedido);
UPDATE PEDIDO SET monto_total = SUMA WHERE id_pedido = old.id_pedido;
SET SUCURSAL = (SELECT id_sucursal FROM PEDIDO WHERE id_pedido = old.id_pedido);
UPDATE ARTICULO_SUCURSAL SET existencias = existencias - (new.cantidad - old.cantidad)
	WHERE id_articulo = old.id_articulo AND id_sucursal = SUCURSAL;
END //
DELIMITER ;

SELECT * FROM ARTICULO_SUCURSAL;
SELECT * FROM PEDIDO_ARTICULO;
SELECT * FROM PEDIDO;
UPDATE PEDIDO_ARTICULO SET cantidad = 2 WHERE id_pedido = 2 AND id_articulo = 3;


-- Disparador 3: que actualice el total de la tabla PEDIDO después de que se elimine un 
-- artículo del pedido. Además, aumento de existencias en inventario.
DELIMITER //
CREATE TRIGGER tr_actualiza_after_delete
AFTER DELETE
ON PEDIDO_ARTICULO
FOR EACH ROW
BEGIN 
DECLARE SUMA INT;
DECLARE SUCURSAL INT;
SET SUMA = (SELECT SUM(cantidad * precio_unitario) FROM PEDIDO_ARTICULO 
	WHERE id_pedido = old.id_pedido);
UPDATE PEDIDO SET monto_total = SUMA 
	WHERE id_pedido = old.id_pedido;

SET SUCURSAL = (SELECT id_sucursal FROM PEDIDO WHERE id_pedido = old.id_pedido);
UPDATE ARTICULO_SUCURSAL SET existencias = existencias + old.cantidad 
	WHERE id_articulo = old.id_articulo AND id_sucursal = SUCURSAL;
END //
DELIMITER ;

SELECT * FROM ARTICULO_SUCURSAL;
SELECT * FROM PEDIDO_ARTICULO;
SELECT * FROM PEDIDO;
DELETE FROM PEDIDO_ARTICULO WHERE id_articulo_pedido = 8;

    

