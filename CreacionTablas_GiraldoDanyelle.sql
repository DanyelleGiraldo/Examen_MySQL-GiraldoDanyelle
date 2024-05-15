/*
  #################################
  ###Examen Sql Giraldo Danyelle###
  #################################
*/

create database olimpico;
use olimpico;

create table equipamiento(
	id_equipamiento int primary key,
	nombre_equipos varchar(100) not null,
	stock int not null
);

create table comisario(
	id_comisario int primary key,
	nombre varchar(100) not null,
	email varchar(100) not null,
	telefono varchar(20) not null,
	tipo enum('juez', 'observador')
);

create table jefes(
	id_jefe int primary key,
	nombre varchar(100) not null,
	email varchar(100) not null,
	titulo varchar(100) not null
);

CREATE table info_complejo(
	id_info_complejo int primary key,
	locacion varchar(100) not null,
	area_complejo float not null,
	id_jefe int,
	foreign key (id_jefe) references jefes(id_jefe)
);

create table deportes(
	id_deporte int primary key,
	nombre varchar(100),
	num_jugadores int
);

create table eventos(
	id_evento int primary key,
	nombre varchar(100) not null,
	fecha datetime not null,
	duracion time not null,
	num_participantes int
);

create table evento_equipo(
	id_evento_equipo int primary key,
	id_evento int,
	foreign key (id_evento) references eventos(id_evento),
	id_equipamiento int,
	foreign key (id_equipamiento) references equipamiento(id_equipamiento)
);

create table evento_comisario(
	id_evento_comisario int primary key,
	id_evento int,
	foreign key (id_evento) references eventos(id_evento),
	id_comisario int,
	foreign key (id_comisario) references comisario(id_comisario)
);

create table evento_complejo_poli(
	id_evento_complejo int primary key,
	id_evento int,
	foreign key (id_evento) references eventos(id_evento),
	id_complejo_evento_equipo int,
	foreign key (id_complejo_evento_equipo) references evento_equipo(id_evento_equipo)
);

create table complejo_polideportivo(
	id_complejo_polideportivo int primary key,
	nombre varchar(100) not null,
	id_deporte int,
	foreign key (id_deporte) references deportes(id_deporte),
	id_info_complejo int,
	foreign key (id_info_complejo) references info_complejo(id_info_complejo)
);


create table sede(
	id_sede int primary key,
	nombre varchar(100) not null,
	id_complejo_polideportivo int,
	foreign key (id_complejo_polideportivo) references complejo_polideportivo(id_complejo_polideportivo),
	presupuesto float
);

create table complejo_deportivo(
	id_complejo_deportivo int primary key,
	nombre varchar(100) not null,
	id_deporte int,
	foreign key (id_deporte) references deportes(id_deporte),
	id_info_complejo int,
	foreign key (id_info_complejo) references info_complejo(id_info_complejo)
);

create table evento_complejo_deportivo(
	id_evento_complejo_deportivo int primary key,
	id_evento int,
	foreign key (id_evento) references eventos(id_evento),
	id_complejo_deportivo int,
	foreign key (id_complejo_deportivo) references complejo_deportivo(id_complejo_deportivo) 
);

INSERT INTO deportes VALUES
(1,'Natacion', 5),
(2,'Futbol', 25),
(3,'Microfutbol', 20),
(4,'Voleibol', 16),
(5,'Tennis', 2);


INSERT INTO jefes VALUES
(1,'Jose Hernandez','jh@gmail.com','Especialista en Natacion'),
(2,'Camila Perez','cp@gmail.com','Especialista en Voleibol'),
(3,'Ana Rojas','ar@gmail.com','Especialista en Futbool'),
(4,'Carlos Duarte','cd@gmail.com','Especialista en Tennis'),
(5,'Horacio Hernandez','hh@gmail.com','Especialista en Tennis');



INSERT INTO equipamiento VALUES
(1, 'Arcos',5),
(2, 'Pértigas',15),
(3, 'Barras Paralelas',10),
(4, 'Flotadores',35),
(5, 'Raquetas',5),
(6, 'Balones',17);


INSERT INTO comisario VALUES
(1, 'Diego Rojas','dr@hotmail.com','555-555-12345','juez'),
(2, 'Dracula Rosas','drR@hotmail.com','555-555-67895','juez'),
(3, 'Tomas suarez','ts@hotmail.com','555-555-35485','juez'),
(4, 'Lorena Martinez','lm@hotmail.com','444-555-12345','observador'),
(5, 'Rosa Martinez','Rm@hotmail.com','444-457-12345','observador'),
(6, 'Laura Bermudez','lBer@hotmail.com','444-856-12345','observador');


INSERT INTO info_complejo VALUES
(1, 'Bucaramanga', 5, 2),
(2, 'Giron', 14.2, 1),
(3, 'Floridablanca', 54, 5),
(4, 'Zapatoca', 65, 3),
(5, 'Lebrija', 48, 4),
(6, 'Sangil', 5, 2),
(7, 'Socorro', 14.2, 1),
(8, 'Soacha', 54, 5),
(9, 'Bogota', 65, 3),
(10, 'Chia', 48, 4);


INSERT INTO complejo_polideportivo VALUES
(1,'Complejo Deportivo Bucaramanga', 4,2),
(2,'Complejo Deportivo Sangil',2,6),
(3,'Complejo Deportivo Soacha', 4,8),
(4,'Complejo Deportivo Bucaramanga', 5,2),
(5,'Complejo Deportivo Sangil',3,6),
(6,'Complejo Deportivo Soacha', 1,8),
(7,'Complejo Deportivo Sangil',1,6),
(8,'Complejo Deportivo Soacha', 5,8);


INSERT INTO complejo_deportivo VALUES
(1,'Complejo Deportivo Giron', 1,2),
(2,'Complejo Deportivo Floridablanca',3,3),
(3,'Complejo Deportivo Zapatoca', 2,4);


INSERT INTO eventos VALUES
(1, 'Torneo de Tennis','2023-05-12 10:00:00', '01:30:00', 25),
(2, 'Torneo de Microfutbol','2023-11-20 10:00:00', '03:15:00', 75),
(3, 'Torneo de Voleibol','2023-06-02 09:00:00', '05:30:00', 25),
(4, 'Torneo de Natacion','2023-12-12 16:00:00', '02:45:00', 5),
(5, 'Torneo de Futbol','2024-01-04 10:00:00', '01:45:00', 85),
(6, 'Torneo de Futbol ninos','2024-01-04 14:00:00', '01:45:00', 85);

INSERT INTO evento_complejo_poli values 
(1,2,3), 
(2,3,3), 
(4,1,2),
(4,1,2);

INSERT INTO evento_complejo_deportivo VALUES
(1,2,1),
(2,2,2),
(4,5,3),
(5,2,3),
(6,6,3);


INSERT INTO evento_comisario VALUES
(1,1,1),
(2,3,5),
(3,4,3);

INSERT INTO evento_equipo VALUES
(1,3,6),
(2,1,5),
(3,4,4);

INSERT INTO sede VALUES
(1,'sede1',1,12.300),
(2,'sede2',5,150000.03),
(3,'sede3',4,34561.215);









select * from evento_complejo_poli;

