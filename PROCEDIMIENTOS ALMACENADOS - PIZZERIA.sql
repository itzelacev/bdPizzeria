USE db_PIZZERIA_CAPRI;

-- Procedimiento 1: que muestre los clientes con sus direcciones con los campos: 
-- nombre_completo_cliente, saldo, domicilio_completo (incluye: calle, número y estado)
DELIMITER //
CREATE PROCEDURE PA_CLIENTES()
BEGIN
SELECT cli.nombre_completo, cli.saldo, CONCAT(dir.calle,' #',dir.numero,', ',
	dir.estado) domicilio_completo
FROM CLIENTE cli
INNER JOIN DIRECCIONES dir ON cli.id_cliente = dir.id_cliente;
END //
DELIMITER ;

CALL PA_CLIENTES();


-- Procedimiento 2: que permita actualizar el total del pedido de acuerdo a los 
-- articulos insertados actualmente y regrese el encabezado del pedido
DELIMITER //
CREATE PROCEDURE PA_ACTUALIZAR_TOTAL(
IN p_id_pedido INT,
OUT p_suma INT
)
BEGIN
SELECT SUM(cantidad*precio_unitario) INTO p_suma 
	FROM PEDIDO_ARTICULO
	WHERE id_pedido = p_id_pedido;
UPDATE PEDIDO SET monto_total = p_suma
	WHERE id_pedido = p_id_pedido;
SELECT * FROM PEDIDO
	WHERE id_pedido = p_id_pedido;
END //
DELIMITER ;

CALL PA_ACTUALIZAR_TOTAL(2,@p_suma);

SELECT @p_suma;

-- Procedimiento 3: que permita insertar un artículo a un pedido, calcule el total 
-- del pedido, actualice en la tabla correspondiente y muestra el encabezado con el 
-- total incluido
DELIMITER //
CREATE PROCEDURE PA_INSERTAR_PEDIDO(
IN p_cantidad INT,
IN p_precio_unitario INT,
IN p_id_articulo INT,
IN p_id_pedido INT,
OUT p_suma INT
)
BEGIN
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES (p_cantidad,p_precio_unitario,p_id_articulo,p_id_pedido);
SELECT SUM(cantidad*precio_unitario) INTO p_suma 
	FROM PEDIDO_ARTICULO
	WHERE id_pedido = p_id_pedido;
UPDATE PEDIDO SET monto_total = p_suma
	WHERE id_pedido = p_id_pedido;
SELECT * FROM PEDIDO
	WHERE id_pedido = p_id_pedido;
END //
DELIMITER ;

CALL PA_INSERTAR_PEDIDO(3, 180, 3, 2, @p_suma);
-- 2,150,1,1,1,@p_suma

-- Procedimiento 4: que permita insertar un artículo a un pedido, calcule el total 
-- del pedido, actualice en la tabla correspondiente, muestra el encabezado con el 
-- total incluido y descuente del inventario el artículo vendido.
DROP PROCEDURE PA_DESCONTAR_INVENTARIO;

DELIMITER //
CREATE PROCEDURE PA_DESCONTAR_INVENTARIO(
IN p_cantidad INT,
IN p_precio_unitario INT,
IN p_id_articulo INT,
IN p_id_pedido INT,
IN p_id_sucursal INT,
OUT p_suma INT)
BEGIN
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES (p_cantidad,p_precio_unitario,p_id_articulo,p_id_pedido);
SELECT SUM(cantidad*precio_unitario) INTO p_suma 
	FROM PEDIDO_ARTICULO
	WHERE id_pedido = p_id_pedido;
UPDATE PEDIDO SET monto_total = p_suma
	WHERE id_pedido = p_id_pedido;
UPDATE ARTICULO_SUCURSAL SET existencias = (existencias - p_cantidad) 
	WHERE id_sucursal = p_id_sucursal AND id_articulo = p_id_articulo;
SELECT * FROM PEDIDO
	WHERE id_pedido = p_id_pedido;
END //
DELIMITER ;

CALL PA_DESCONTAR_INVENTARIO(2, 150, 1, 1, 1, @p_suma);