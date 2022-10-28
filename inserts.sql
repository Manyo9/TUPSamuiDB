INSERT INTO samuidb.roles (nombre) values ('Socio');
INSERT INTO samuidb.roles (nombre) values ('Admin');

INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (1, "manyouser", "manyo123", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (2, "manyoadmin", "manyo456", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (1, "pmonticoli", "qweasd123", NOW());

INSERT INTO samuidb.puntosventa (nombre) values ('Sucursal Samui');
INSERT INTO samuidb.puntosventa (nombre) values ('Web');
INSERT INTO samuidb.estadospedido(nombre) values('pendiente');

INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (1,'agustin','manyito','messi street 123','manyo@hotmail.com','41236598','35136544782',NOW(),NULL);
INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (3,'pablo','monticoli','ovidio lagos','pablo@hotmail.com','4214122','3525555444',NOW(),NULL);