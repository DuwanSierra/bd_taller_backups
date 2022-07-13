
CREATE TABLE autor
  (
     identificacion INT NOT NULL,
     nombre         VARCHAR(255) NOT NULL,
     PRIMARY KEY (identificacion)
  );

CREATE TABLE editorial
  (
     codigo_editorial INT NOT NULL,
     nombre           VARCHAR(255) NOT NULL,
     PRIMARY KEY (codigo_editorial)
  );

CREATE TABLE libro
  (
     codigo_libro        INT NOT NULL,
     titulo              VARCHAR(255) NOT NULL,
     isbn                VARCHAR(255) NOT NULL,
     edicion             INT,
     no_pag              INT,
     fk_codigo_editorial INT,
     PRIMARY KEY (codigo_libro),
     FOREIGN KEY (fk_codigo_editorial) REFERENCES editorial(codigo_editorial)
  );

CREATE TABLE escribe
  (
     fk_identificacion_autor INT NOT NULL,
     fk_codigo_libro         INT NOT NULL,
     FOREIGN KEY (fk_identificacion_autor) REFERENCES autor(identificacion),
     FOREIGN KEY (fk_codigo_libro) REFERENCES libro(codigo_libro),
     PRIMARY KEY (fk_identificacion_autor, fk_codigo_libro)
  );

CREATE TABLE ubicacion
  (
     codigo_ubicacion SERIAL NOT NULL,
     ubicacion        VARCHAR(255),
     PRIMARY KEY (codigo_ubicacion)
  );

CREATE TABLE ejemplar
  (
     fk_codigo_libro     INT NOT NULL,
     codigo_ejem         INT NOT NULL,
     fk_codigo_ubicacion INT NOT NULL,
     PRIMARY KEY (codigo_ejem, fk_codigo_libro),
     FOREIGN KEY (fk_codigo_libro) REFERENCES libro(codigo_libro),
     FOREIGN KEY (fk_codigo_ubicacion) REFERENCES ubicacion(codigo_ubicacion)
  );

CREATE TABLE usuario
  (
     codigo_usur   INT NOT NULL,
     nombre        VARCHAR(255) NOT NULL,
     codigo_postal SMALLINT NOT NULL,
     calle         VARCHAR(255) NOT NULL,
     numero        VARCHAR(255) NOT NULL,
     PRIMARY KEY (codigo_usur)
  );

CREATE TABLE telefono
  (
     telefono       INT NOT NULL,
     fk_codigo_usur INT NOT NULL,
     FOREIGN KEY (fk_codigo_usur) REFERENCES usuario(codigo_usur),
     PRIMARY KEY (telefono, fk_codigo_usur)
  );

CREATE TABLE prestamo
  (
     fk_codigo_ejem  INT NOT NULL,
     fk_codigo_usur  INT NOT NULL,
     fk_codigo_libro INT NOT NULL,
     fecha_prest     TIMESTAMP NOT NULL,
     dias_prestamo   INT NOT NULL,
     fecha_devol     TIMESTAMP,
     valor_multa     DECIMAL(25, 2) NOT NULL,
     FOREIGN KEY (fk_codigo_usur) REFERENCES usuario(codigo_usur),
     FOREIGN KEY (fk_codigo_ejem, fk_codigo_libro) REFERENCES ejemplar(
     codigo_ejem, fk_codigo_libro),
     PRIMARY KEY (fk_codigo_usur, fk_codigo_ejem, fecha_prest)
  ); 