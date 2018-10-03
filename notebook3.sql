CREATE DATABASE Valdivia;
USE Valdivia;

CREATE TABLE PERSONA(pk_RUT VARCHAR(45) NOT NULL, 
               NOMBRE VARCHAR(45) NOT NULL, 
               EDAD SMALLINT UNSIGNED, 
               PRIMARY KEY (pk_RUT))ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE LUGAR_DE_INTERES(
        pk_Lugar int NOT NULL AUTO_INCREMENT, 
        Descripcion VARCHAR(45), 
        Categoria VARCHAR(45), 
        Latitud DECIMAL(6,3) NOT NULL, 
        Longitud DECIMAL(6,3) NOT NULL, 
        PRIMARY KEY (pk_Lugar) 
        )ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE DESPLAZARSE(
    pk_RUT VARCHAR(45) NOT NULL, 
    fecha DATE NOT NULL, 
    Latitud DECIMAL(6,3) NOT NULL, 
    Longitud DECIMAL(6,3) NOT NULL, 
    FOREIGN KEY(pk_RUT) REFERENCES PERSONA(pk_RUT), 
    PRIMARY KEY(pk_RUT, fecha) 
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;