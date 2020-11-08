--	Consulta que muestre los 4 clientes con sus direcciones
SELECT * FROM DIRECCIONES dir
	INNER JOIN CLIENTE cli ON cli.id_cliente = dir.id_cliente;
use db_PIZZERIA_CAPRI;

--	Consulta que muestre el artículo más vendido
SELECT *  FROM PEDIDO_ARTICULO can
	INNER JOIN ARTICULO art ON art.id_articulo = can.id_articulo
    
    ORDER BY SUM(can.cantidad) DESC
    LIMIT 1;
-- GROUP BY can.id_articulo


INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('1','150','1','1');


--	Consulta que muestre de las 2 sucursales y las existencias que tienen de artículos
SELECT * FROM ARTICULO_SUCURSAL exi
	INNER JOIN SUCURSAL suc ON suc.id_sucursal = exi.id_sucursal
    INNER JOIN ARTICULO art ON art.id_articulo = exi.id_articulo;

--	Consulta los datos de la cabecera del pedido número 1 (cliente, dirección y pedido)
SELECT * FROM PEDIDO cab
	INNER JOIN CLIENTE cli ON cli.id_cliente = cab.id_cliente
    WHERE cab.id_pedido = 1;

--	Consulta de artículos (listado) que corresponden al pedido número 1
SELECT * FROM PEDIDO_ARTICULO lis
	INNER JOIN ARTICULO art ON art.id_articulo = lis.id_articulo
    INNER JOIN PEDIDO ped ON ped.id_pedido = lis.id_pedido
    WHERE lis.id_pedido = 1;

--	Consulta los datos de la cabecera del pedido número 2 (cliente, dirección y pedido)
SELECT * FROM PEDIDO cab
	INNER JOIN CLIENTE cli ON cli.id_cliente = cab.id_cliente
    WHERE cab.id_pedido = 2;

--	Consulta de artículos (listado) que corresponden al pedido número 2
SELECT * FROM PEDIDO_ARTICULO lis
	INNER JOIN ARTICULO art ON art.id_articulo = lis.id_articulo
    INNER JOIN PEDIDO ped ON ped.id_pedido = lis.id_pedido
    WHERE lis.id_pedido = 2;
