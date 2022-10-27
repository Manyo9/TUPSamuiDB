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

CREATE PROCEDURE spObtenerProductos()
BEGIN
    SELECT id, nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen
	FROM productos;
END //

CREATE PROCEDURE spObtenerProductoPorID(
	IN id int
)
BEGIN
    SELECT p.id, p.nombre, p.precio, p.descripcion, p.observaciones, p.activo, p.puntosGanados, p.urlImagen
	FROM productos p
    WHERE p.id = id;
END //

CREATE PROCEDURE spInsertarProducto(
IN nom varchar(32),
IN pre double,
IN des varchar(100),
IN obs varchar(100),
IN act tinyint(1),
IN pg int,
IN url varchar(100)
)
BEGIN
    INSERT INTO productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
    VALUES (nom,pre,des,obs,act,pg,url);
END //

CREATE PROCEDURE spActualizarProducto(
IN i int,
IN nom varchar(32),
IN pre double,
IN des varchar(100),
IN obs varchar(100),
IN act tinyint(1),
IN pg int,
IN url varchar(100)
)
BEGIN
    UPDATE productos 
    SET nombre = nom,
	precio = pre,
    descripcion = des,
    observaciones = obs,
    activo = act,
    puntosGanados = pg,
    urlImagen = url
    WHERE id = i;
    
END //

CREATE PROCEDURE spBorrarProducto(
IN id int
)
BEGIN
	DELETE 
    FROM productos p
    WHERE p.id = id;
END //


DELIMITER ;