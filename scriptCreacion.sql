-- Update 27/10/2022
CREATE DATABASE samuidb;
USE samuidb;

CREATE TABLE  `samuidb`.`Roles` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(30) NOT NULL,
	PRIMARY KEY (`id`)
);
  
CREATE TABLE `samuidb`.`Usuarios` (
	`id` int NOT NULL AUTO_INCREMENT,
	`idRol` int NOT NULL,
	`usuario` varchar(30) NOT NULL,
	`contrasenia` varchar(32) NOT NULL,
	`fechaAlta` datetime NOT NULL,
	`fechaBaja` datetime,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`idRol`) REFERENCES Roles(`id`)
);
  
  
CREATE TABLE  `samuidb`.`Empleados` (
	`id` int NOT NULL AUTO_INCREMENT,
	`idUsuario` int,
	`nombre` varchar(30) NOT NULL,
	`apellido` varchar(30) NOT NULL,
	`telefono` varchar(20),
	`email` varchar(40),
	`dni` int,
	`fechaAlta` datetime NOT NULL,
	`fechaBaja` datetime,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`idUsuario`) REFERENCES Usuarios(`id`)
); 
  
CREATE TABLE `samuidb`.`PuntosVenta`(
	`id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `samuidb`.`Socios`(
	`id` int NOT NULL AUTO_INCREMENT,
	`idUsuario` int,
	`nombre` varchar(30) NOT NULL,
	`apellido` varchar(30) NOT NULL,
	`domicilio` varchar(50),
	`email` varchar(40) NOT NULL,
	`dni` int NOT NULL,
	`telefono` varchar(20),
	`fechaAlta` datetime NOT NULL,
	`fechaBaja` datetime,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`idUsuario`) REFERENCES Usuarios(`id`));
  
  
CREATE TABLE `samuidb`.`EstadosPedido`(
	`id` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(32) NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE `samuidb`.`Pedidos`(
	`id` int NOT NULL AUTO_INCREMENT,
	`idPuntoVenta` int NOT NULL,
	`idSocio` int,
	`idEmpleado` int,
	`idEstado` int NOT NULL,
	`observaciones` varchar(100),
	`fechaPedido` datetime NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`idPuntoVenta`) REFERENCES PuntosVenta(`id`),
	FOREIGN KEY (`idSocio`) REFERENCES Socios(`id`),
	FOREIGN KEY (`idEmpleado`) REFERENCES Empleados(`id`)
);
  
  
CREATE TABLE `samuidb`.`Productos` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(32) NOT NULL,
	`precio` double NOT NULL,
	`descripcion` varchar(100), 
	`observaciones` varchar(100), 
	`activo` boolean NOT NULL, 
	`puntosGanados` int NOT NULL,
	`urlImagen` varchar(100),
	PRIMARY KEY (`id`)
);

CREATE TABLE `samuidb`.`Promociones`(
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50),
    `descripcion` varchar(100),
    `precioPuntos` mediumint NOT NULL,
    `fechaDesde` datetime NOT NULL,
    `fechaHasta` datetime NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `samuidb`.`DetallePromocion`(
	`id` int NOT NULL AUTO_INCREMENT,
    `idProducto` int NOT NULL,
	`cantidad` mediumint NOT NULL,
    `idPromocion` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`idProducto`) REFERENCES Productos(id),
    FOREIGN KEY (`idPromocion`) REFERENCES Promociones(id)
);

CREATE TABLE `samuidb`.`DetallesPedido` (
	`idDetalle` int NOT NULL AUTO_INCREMENT,
	`idPedido` int NOT NULL,
	`idProducto` int NOT NULL,
	`cantidad` tinyint NOT NULL, 
	`precioUnitario` double NOT NULL,
	`puntosGanados` mediumint NOT NULL,
	`comentarios` varchar(150),
	PRIMARY KEY (`idDetalle`),
	FOREIGN KEY (`idPedido`) REFERENCES Pedidos(`id`),
	FOREIGN KEY (`idProducto`) REFERENCES Productos(`id`)
);

CREATE TABLE `samuidb`.`MovimientosPuntos` (
	`id` int NOT NULL AUTO_INCREMENT,
	`idPromocion` int,
	`idDetallePedido` int,
	`idSocio` int NOT NULL,
	`puntos` mediumint NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`idPromocion`) REFERENCES Promociones(`id`), 
	FOREIGN KEY (`idDetallePedido`) REFERENCES DetallesPedido(`idDetalle`),
	FOREIGN KEY (`idSocio`) REFERENCES Socios(`id`)
);
  
 CREATE TABLE `samuidb`.`Gustos`(
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(30),
    `activo` boolean NOT NULL,
    PRIMARY KEY (`id`)
); 