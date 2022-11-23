create database Music;

-- MySQL Script generated by MySQL Workbench
-- Mon Nov 21 23:49:33 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_base_datos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_base_datos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_base_datos` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_base_datos` ;

-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Artistas` (
  `idArtistas` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `media_oyentesXmes` VARCHAR(45) NULL,
  PRIMARY KEY (`idArtistas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Albumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Albumes` (
  `idAlbumes` INT NOT NULL,
  `id_artista` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlbumes`, `id_artista`),
  INDEX `Fk_albumes_artistas_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `Fk_albumes_artistas`
    FOREIGN KEY (`id_artista`)
    REFERENCES `proyecto_base_datos`.`Artistas` (`idArtistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Canciones` (
  `idCanciones` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_artista_principal` INT NULL,
  `id_album` INT NULL,
  `fecha_publicacion` DATE NULL,
  `duracion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCanciones`),
  INDEX `Fk_canciones_artistas_idx` (`id_artista_principal` ASC) VISIBLE,
  INDEX `Fk_canciones_albumes_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `Fk_canciones_artistasP`
    FOREIGN KEY (`id_artista_principal`)
    REFERENCES `proyecto_base_datos`.`Artistas` (`idArtistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_canciones_albumes`
    FOREIGN KEY (`id_album`)
    REFERENCES `proyecto_base_datos`.`Albumes` (`idAlbumes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Canciones_mas_escuchadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Canciones_mas_escuchadas` (
  `id_cancion` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_cancion`, `id_artista`),
  INDEX `Fk_cme_artista_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `Fk_cme_canciones`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `proyecto_base_datos`.`Canciones` (`idCanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_cme_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `proyecto_base_datos`.`Artistas` (`idArtistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Artistas_invitados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Artistas_invitados` (
  `id_artistas` INT NOT NULL,
  `id_cancion` INT NOT NULL,
  PRIMARY KEY (`id_artistas`, `id_cancion`),
  INDEX `Fk_ai_canciones_idx` (`id_cancion` ASC) VISIBLE,
  CONSTRAINT `Fk_ai_canciones`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `proyecto_base_datos`.`Canciones` (`idCanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_ai_artistas`
    FOREIGN KEY (`id_artistas`)
    REFERENCES `proyecto_base_datos`.`Artistas` (`idArtistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Membresias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Membresias` (
  `tipo` VARCHAR(45) NOT NULL,
  `valor` INT NULL,
  `num_integrantes` INT NULL,
  PRIMARY KEY (`tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Usuarios` (
  `idUsuario` INT auto_increment ,
  `nombre_completo` VARCHAR(45) ,
  `nombre_de_usuario` VARCHAR(45) ,
  `tipo_membresia` VARCHAR(45) ,
  `correo` VARCHAR(45) ,
  `fecha_registro` DATE ,
  `contrasenna` VARCHAR(45) ,
  `fecha_nacimiento` DATE ,
  `id_membresia` INT,
  PRIMARY KEY (`idUsuario`),
  INDEX `Fk_usuario_membresia_idx` (`tipo_membresia` ASC) VISIBLE,
  CONSTRAINT `Fk_usuario_membresia`
    FOREIGN KEY (`tipo_membresia`)
    REFERENCES `proyecto_base_datos`.`Membresias` (`tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


	
-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Artistas_mas_esuchados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Artistas_mas_esuchados` (
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_artista`),
  INDEX `Fk_ame_artistas_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `Fk_ame_usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `proyecto_base_datos`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_ame_artistas`
    FOREIGN KEY (`id_artista`)
    REFERENCES `proyecto_base_datos`.`Artistas` (`idArtistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Usuario_pagador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Usuario_pagador` (
  `id_usuario` INT NOT NULL,
  `metodo_pago` VARCHAR(45),
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `Fk_up_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `proyecto_base_datos`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Listas_reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Listas_reproduccion` (
  `idListas_reproduccion` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_usuario_duenno` INT NULL,
  `tiempo_reproduccion` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`idListas_reproduccion`),
  INDEX `Fk_listas_usuario_idx` (`id_usuario_duenno` ASC) VISIBLE,
  CONSTRAINT `Fk_listas_usuario`
    FOREIGN KEY (`id_usuario_duenno`)
    REFERENCES `proyecto_base_datos`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Usuarios_con_acceso_a_listas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Usuarios_con_acceso_a_listas` (
  `id_lista_rep` INT NOT NULL,
  `id_usuario_con_acceso` INT NOT NULL,
  PRIMARY KEY (`id_lista_rep`, `id_usuario_con_acceso`),
  INDEX `Fk_ucl_usuarios_idx` (`id_usuario_con_acceso` ASC) VISIBLE,
  CONSTRAINT `Fk_ucl_listas`
    FOREIGN KEY (`id_lista_rep`)
    REFERENCES `proyecto_base_datos`.`Listas_reproduccion` (`idListas_reproduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_ucl_usuarios`
    FOREIGN KEY (`id_usuario_con_acceso`)
    REFERENCES `proyecto_base_datos`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_base_datos`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_base_datos`.`Pago` (
  `idPago` INT auto_increment,
  `id_usuario_pagador` INT,
  `tipo_memb_pagada` VARCHAR(45),
  `fecha_pago` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `valor` INT NOT NULL,
  `metodo_de_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPago`),
  INDEX `Fk_pago_usuario_pagador_idx` (`id_usuario_pagador` ASC) VISIBLE,
  INDEX `Fk_pago_membresias_idx` (`tipo_memb_pagada` ASC) VISIBLE,
  CONSTRAINT `Fk_pago_usuario_pagador`
    FOREIGN KEY (`id_usuario_pagador`)
    REFERENCES `proyecto_base_datos`.`Usuario_pagador` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_pago_membresias`
    FOREIGN KEY (`tipo_memb_pagada`)
    REFERENCES `proyecto_base_datos`.`Membresias` (`tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- INSERTAR DATOS

insert into artistas( idArtistas,nombre,media_oyentesXmes)
values 
	(1, 'Bad Bunny','1.331.491.164'),
	(2, 'Ed Sheeran', '3.256.601.748'),
    (3, 'Dua Lipa', '2.027.947.003'),
    (4,'Jbalvin','1.025.037.774'),
    (5,'Chencho Corleone','926.590.972'),
    (6,'Potter Payper','5.905.106'),
    (7,'Antytila','249.342'),
    (8,'Ellinoora','9.605.334'),
    (9,'Leto','42.030.899'),
    (10,'Ultimo','66.279.119'),
    (11,'Calvin Harris','1.147.584.470');
    

insert into Albumes (idAlbumes,id_artista,nombre)
	values 
    (245,1,'X 100PRE'),
    (523,1,'OASIS'),
    (426,1,'Un Verano Sin ti'),
	(493,2,'X(Deluxe Edition'),
    (534,2,'2step'),
    (754,2,'='),
    (324,3,'One Kiss'),
    (364,3,'Potion'),
    (934,3,'Future Nostalgia');


insert into canciones( idCanciones,nombre,id_artista_principal,id_album,fecha_publicacion,duracion)
	values 
	(9834,'Ni Bien Ni Mal', 1 , 245, '2018-12-23', '3:52'),
	(4368,'¿Quien Tu Eres?',1, 245, '2018-12-23','2:28'),
    (5744,'Caro',1,245, '2018-12-23', '3:49'),
    (4389,'Tenemos Que Hablar',1,254,'2018-12-23', '3:44'),
    (1328,'Otra Noche En Miami',1,254,'2018-12-23', '3:43'),
    (7513,'Moscow Mule',1,426,'2020-05-06', '4:30'),
    (4324,'Despues De La Playa',1,426,'2020-05-06','3:50'),
    (3598,'Me Porto Bonito',1,426,'2020-05-06','2:58'),
    (9361,'Neverita',1,426,'2020-05-06','2:53'),
	(7361,'Efecto',1,426,'2020-05-06','3:33'),
    (4298,'Tití Me Pregunto',1,426,'2020-05-06','4:03'),
    (7813,'Un Ratito',1,426,'2020-05-06','2:56'),
    (5469,'Mojadita',1,523,'2019-06-28','3:06'),
    (9132,'Yo Le Llego',1,523,'2019-06-28','4:09'),
    (1324,'Cuidado Por Ahí',1,523,'2019-06-28','3:17'),
    (5345,'Que Pretendes',1,523,'2019-06-28','3:42'),
    (4325,'La Canción',1,523,'2019-06-28','4:02'),
    (6548,'One',2,493,'2014-06-23', '4:12'),
	(5498,'Im A Mess',2,493,'2014-06-23', '4:04'),
    (6356,'Sing',2,493,'2014-06-23','3:55'),
    (4328,'Dont',2,493,'2014-06-23','3:39'),
    (9324,'Nina',2,493,'2014-06-23','3:45'),
    (1534,'2step(feat.Ultimo)',2,534,'2021-03-22','2:42'),
	(4521,'2step(feat.Potter Payper)',2,534,'2021-03-22','2:32'),
	(1234,'2step(feat.Antyla)',2,534,'2021-03-22','2:33'),
	(8764,'2step(feat.Leto)',2,534,'2021-03-22','2:34'),
	(8542,'2step(feat.Ellinoora)',2,534,'2021-03-22','2:33'),
	(9776,'Tides',2,754,'2021-06-22','3:15'),
    (1276,'Shivers',2,754,'2021-06-22','3:27'),
    (9272,'First Times',2,754,'2021-06-22','3:05'),
    (7273,'Bad Habits',2,754,'2021-06-22','3:50'),
    (9876,'Tides',2,754,'2021-06-22','3:15'),
    (7654,'One Kiss',3,324,'2018-05-13','3:34'),
    (5816,'Potion',3,364,'2022-04-24','3:34'),
    (8291,'Future Nostalgia',3,934,'2021-03-27','3:04'),
    (5321,'Dont Start Now',3,934,'2021-03-27','3:07'),
    (8240,'Cool',3,934,'2021-03-27','3:29'),
    (9340,'Physical',3,934,'2021-03-27','3:13'),
    (8290,'Levitating',3,934,'2021-03-27','3:23');
	

insert into Artistas_invitados  (id_artistas,id_cancion)
	values 
    (4,1324),
    (4,5354),
    (5,3598),
    (4,4325),
    (4,5469),
    (4,9132),
    (6,4521),
	(7,1234),
    (8,8542),
    (9,8764),
    (10,1534),
    (11,7654),
    (11,5816);
    

insert into Membresias(tipo,valor,num_integrantes)
	values 
    ('Individual',14900,1),
    ('Duo',19900,2),
    ('Familiar',23900,6),
    ('Estudiantes',7490,1);



insert into usuarios( nombre_completo,nombre_de_usuario,tipo_membresia,correo,fecha_registro,contrasenna,
					  fecha_nacimiento,id_membresia)
	Values 
    ('Juan Jose Villa Soria','Juan32soria','Familiar','juano321919@gmail.com','2022-11-22','Juan1234','2002-02-22',6543),
	('Samuel Rendon Trujillo','Rendox','Duo','rengod321919@gmail.com','2022-02-12','Rengod1234','2003-02-08',9047),
    ('Sofia Mnendieta Marin','Mendiflower','Individual','mendiflow@gmail.com','2022-08-12','Mendi1324','2004-06-15',8934),
    ('Sebastian Granda','Granda','Estudiantes','granda@gmail.com','2022-04-25','Granda1234','2003-05-18',2349);
		

insert into Artistas_mas_esuchados (id_usuario,id_artista)
	values 
	(1,3),
    (2,2),
    (3,1),
    (4,2);


insert into Usuario_pagador(id_usuario,metodo_pago)
	values 
    (1,'Tarjeta Debito/Credito'),
    (2,'Tajeta Fisica'),
    (3,'Tarjeta Debito/Credito'),
    (4,'Tarjeta fisica');


insert into pago( idPago,id_usuario_pagador,tipo_memb_pagada,fecha_pago,fecha_vencimiento,valor,metodo_de_pago)
	values 
    (4683,1,'Familiar','2022-11-22','2022-12-22',23900,'Tarjeta Debito/Credito'),
    (9632,2,'Duo','2022-02-12','2022-03-12',19900,'Tajeta Fisica'),
    (0894,3,'Individual','2022-08-20','2022-09-20',14900,'Tarjeta Debito/Credito'),
    (8426,4,'Estudiantes','2022-04-25','2022-05-25',7490,'Tajeta Fisica');
insert into canciones_mas_escuchadas(id_cancion,id_artista)
	values (1328,1),
			(5816,3);
          

-- CONSULTAS
-- Consultar Albumes
SELECT a.idAlbumes, a.id_artista, art.nombre as nombre_artista, a.nombre as nombre_album 
	FROM albumes a, artistas art 
	WHERE a.id_artista = art.idArtistas; 
    
-- Consultar artistas
SELECT * FROM artistas;

-- Consultar artistas_invitados
SELECT ai.id_artistas as id_artista_invitado,
	a.nombre as artista_invitado, 
    ai.id_cancion as id_cancion_invitado, 
    c.nombre  as nombre_cancion_invitado
    FROM artistas_invitados ai, artistas a, canciones c 
	WHERE ai.id_artistas = a.idArtistas and ai.id_cancion = c.idCanciones;
 
-- Consultar artistas_mas_escuchados 
SELECT am.id_usuario, u.nombre_de_usuario, am.id_artista as id_artista_mas_escuchado, a.nombre as nombre_artista_mas_escuchado
	FROM artistas_mas_esuchados am, usuarios u, artistas a
    WHERE am.id_usuario = u.idUsuario and am.id_artista = a.idArtistas;

-- Consultar canciones
SELECT * FROM canciones;

-- Consultar canciones_mas escuchadas FALTA
SELECT * FROM canciones_mas_escuchadas;

-- Consultar listas_reproduccion FALTA
SELECT * FROM listas_reproduccion;

 -- Consultar membresias
SELECT * FROM membresias;

-- Consultar pago
SELECT * FROM pago;

-- Consultar usuario_pagador
SELECT up.id_usuario, u.nombre_completo, up.metodo_pago FROM usuario_pagador up, usuarios u
	WHERE up.id_usuario = u.idUsuario;

-- Consultar usuario
SELECT * FROM usuarios;

-- Consultar usuarios_con_acceso_a_listas FALTA
SELECT * FROM usuarios_con_acceso_a_listas;

-- TRIGGER
CREATE TABLE `Registros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `registro` VARCHAR(255) NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));  
SELECT * FROM Registros;

delimiter //
CREATE TRIGGER log_tabla_usuarios AFTER INSERT on usuarios
for each row begin
	insert into Registros (registro) value (concat('Se ha registrado un nuevo usuario con id: ', NEW.idUsuario, ' y nombre: ', NEW.nombre_completo));
end//
delimiter ;

insert into usuarios( nombre_completo,nombre_de_usuario,tipo_membresia,correo,fecha_registro,contrasenna,
					  fecha_nacimiento,id_membresia)
	Values 
    ('Pepe Perez','pepito','Familiar','pepe@gmail.com','2023-11-22','pepe123','2002-02-22',6540);
insert into usuarios( nombre_completo,nombre_de_usuario,tipo_membresia,correo,fecha_registro,contrasenna,
					  fecha_nacimiento,id_membresia)
	Values 
    ('Juan Lopez','juan','Familiar','juan@gmail.com','2023-11-22','juann123','2002-02-22',6040);
 
 
-- PROCEDIMIENTO
delimiter $$
CREATE PROCEDURE mostrarMembresia(in memb varchar(50), out cantidad int)
BEGIN
	SELECT  count(*)  into cantidad FROM usuarios 
		WHERE tipo_membresia = memb group by tipo_membresia LIMIT 1;
END$$
delimiter ;

CALL mostrarMembresia('Duo', @Cantidad_Duo);
CALL mostrarMembresia('Familiar', @Cantidad_Familiar);
CALL mostrarMembresia('Individual', @Cantidad_Individual);
CALL mostrarMembresia('Estudiantes', @Cantidad_Estudiantes);
SELECT @Cantidad_Duo, @Cantidad_Familiar, @Cantidad_Individual, @Cantidad_Estudiantes;


-- FUNCION
delimiter $$
CREATE FUNCTION encontrar_cancion_mas_escuchada (artista varchar(100)) RETURNS varchar(100)
BEGIN
DECLARE nombre_cancion varchar(100);
SELECT concat(artista,' - ',c.nombre) INTO nombre_cancion FROM canciones_mas_escuchadas cm, artistas a, canciones c
	WHERE cm.id_artista = a.idArtistas and artista = a.nombre and cm.id_cancion = c.idCanciones;
RETURN nombre_cancion;
END$$
delimiter ;

select encontrar_cancion_mas_escuchada('Bad Bunny') as cancion_mas_escuchada;
select encontrar_cancion_mas_escuchada('Dua Lipa') as cancion_mas_escuchada;
