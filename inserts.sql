INSERT INTO samuidb.roles (nombre) values ('Socio');
INSERT INTO samuidb.roles (nombre) values ('Admin');

INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (1, "manyouser", "manyo123", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (2, "manyoadmin", "manyo456", NOW());