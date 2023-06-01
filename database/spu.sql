USE almacen;

-- LOGIN
DELIMITER $$
CREATE PROCEDURE spu_trabajadores_login(_email VARCHAR(100))
BEGIN
	SELECT idtrabajador, nombres, apellidos, email, claveacceso, nivelacceso
		FROM trabajadores
		WHERE email = _email AND estado = '1';
END $$

CALL spu_trabajadores_login('jose@gmail.com');