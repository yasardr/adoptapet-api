-- Creacion de base de datos.
CREATE DATABASE adopta_pet;

-- Uso de la nueva base de datos.
USE adopta_pet;

-- Creacion de tablas
CREATE TABLE mascota(
	id INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	fotos VARCHAR(80),
	descripcion VARCHAR(255)
);


CREATE TABLE usuario(
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(80) NOT NULL,
    telefono CHAR(10) NOT NULL,
    bio VARCHAR(255),
    fotos VARCHAR(80),
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE solicitud(
	id INT,
    idMascota INT NOT NULL,
    idUsuarioAnunciante INT NOT NULL,
    idUsuarioSolicitante INT NOT NULL,
    fechaDeCreacion DATE NOT NULL,
    estado CHAR(1),
    PRIMARY KEY(id),
    FOREIGN KEY(idMascota) REFERENCES mascota(id),
    FOREIGN KEY(idUsuarioAnunciante) REFERENCES usuario(id),
    FOREIGN KEY(idUsuarioSolicitante) REFERENCES usuario(id)
);

-- Insercion de registros
INSERT INTO mascota VALUES (1, "Firulais", "Perro", "https://www.65ymas.com/uploads/s1/65/73/5/bigstock-dog-beagle-having-fun-running-294325987-1.jpeg", "Grande y gris");
INSERT INTO mascota VALUES (2, "Roco", "Gato", null, null);

INSERT INTO usuario VALUES (1, "Pedro", "Torres", "ptorres", "ptorres@gmail.com", "123456", "Av. Insurgentes", "7226547894", null, null, "anunciante");
INSERT INTO usuario VALUES (2, "Juan", "Ramirez", "jramirez", "jramirez@gmail.com", "654321", "Av. Juarez", "5556987858", null, null, "usuario");
INSERT INTO usuario VALUES (3, "Veronica", "Ruiz", "vruiz", "vruiz@gmail.com", "123456", "Calle Venustiano", "7296987456", null, null, "anunciante");
INSERT INTO usuario VALUES (4, "Abigail", "Lopez", "alopez", "alopez@gmail.com", "654321", "Av. Suarez", "7225656565", null, null, "usuario");

INSERT INTO solicitud VALUES (1, 1, 1, 2, "2021-02-03", 0);
INSERT INTO solicitud VALUES (2, 2, 3, 4, "2021-02-03", 0);