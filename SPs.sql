DELIMITER //
CREATE PROCEDURE spIniciarSesion(
IN usuario varchar(30),
IN contrasenia varchar(32)
)
BEGIN
SELECT u.id, r.nombre as rol,
     u.usuario, u.fechaAlta, u.fechaBaja FROM usuarios u
     join roles r on r.id = u.idRol
     where u.usuario=usuario and u.contrasenia=contrasenia;

END //

CREATE PROCEDURE spNuevoUsuarioSocio(
IN usuario varchar(30),
IN contrasenia varchar(32)
)
BEGIN
INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (1, usuario, contrasenia, NOW());
END//


CREATE PROCEDURE spNuevoUsuarioAdmin(
IN usuario varchar(30),
IN contrasenia varchar(32)
)
BEGIN 
INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (2, usuario, contrasenia, NOW());
END//
DELIMITER ;