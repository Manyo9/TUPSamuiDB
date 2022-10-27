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

CREATE PROCEDURE spRegistrarPedido(
IN idPuntoVenta int,
IN idSocio int,
IN idEmpleado int,
IN observaciones varchar(100)
)
BEGIN
    INSERT INTO pedidos (idPuntoVenta, idSocio, idEmpleado, idEstado, observaciones, fechaPedido)
    VALUES (idPuntoVenta, idSocio, idEmpleado, 1, observaciones, now());
END //

CREATE PROCEDURE spRegistrarDetallePedido(
IN idPedido int, 
IN idProducto int,
IN idPromocion int,
IN cantidad tinyint,
IN precioUnitario double,
IN porcentajeDescuento tinyint,
IN puntosGanados int,
IN comentarios varchar(150)
)
BEGIN
    INSERT INTO detallespedido (idPedido, idProducto, idPromocion, cantidad, precioUnitario, porcentajeDescuento, puntosGanados, comentarios)
    Values (idPedido, idProducto, idPromocion, cantidad, precioUnitario, porcentajeDescuento, puntosGanados, comentarios);
END //


DELIMITER ;