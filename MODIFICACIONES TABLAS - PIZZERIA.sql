ALTER TABLE CLIENTE 
	ADD nombre_completo varchar(70);
SELECT * FROM CLIENTE;
UPDATE CLIENTE 
	SET nombre_completo = 'Rosa'
    WHERE id_cliente = 1;
UPDATE CLIENTE 
	SET nombre_completo = 'Dalia'
    WHERE id_cliente = 2;
UPDATE CLIENTE 
	SET nombre_completo = 'Margarita'
    WHERE id_cliente = 3;
UPDATE CLIENTE 
	SET nombre_completo = 'Hortencia'
    WHERE id_cliente = 4;
 
 
ALTER TABLE SUCURSAL
	ADD nombre varchar(70);
UPDATE SUCURSAL
	SET nombre = 'Miraflores'
    WHERE id_sucursal = 1;
UPDATE SUCURSAL
	SET nombre = 'Floripondia'
    WHERE id_sucursal = 2;

SELECT * FROM SUCURSAL;