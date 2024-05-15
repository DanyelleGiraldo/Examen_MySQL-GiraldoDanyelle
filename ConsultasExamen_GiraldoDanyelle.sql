/*
  #################################
  ###Examen Sql Giraldo Danyelle###
  #################################
*/

use olimpico;
/*
 Consulta de Todos los Eventos en un Complejo Deportivo Específico. 
 */
select * from complejo_deportivo where id_complejo_deportivo = 1;

/*
 Consulta de Comisarios Asignados a un Evento en Particular. 
 */

select * from comisario c 
join evento_comisario e on c.id_comisario = e.id_comisario 
where e.id_comisario = 3;

/*
Consulta de Todos los Eventos en un Rango de Fechas.
*/

select * from eventos e where e.fecha >= 2023-05-12 order by fecha;

-- Consulta del Número Total de Comisarios Asignados a Eventos.

select count(e.id_comisario) as Num_comisarios 
from evento_comisario e 
join comisario c on e.id_comisario = c.id_comisario;        


-- Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

select c.nombre, i.area_complejo from complejo_polideportivo c 
join info_complejo i on i.id_info_complejo = c.id_complejo_polideportivo 
where i.area_complejo > 10 
order by i.area_complejo DESC;

/*  
 Consulta de Eventos con Número de Participantes Mayor que la Media.
 */

select * from eventos where num_participantes > (select avg(num_participantes) from eventos);

-- Consulta de Equipamiento Necesario para un Evento Específico.
select e.nombre_equipos from evento_equipo eq join equipamiento e on e.id_equipamiento = eq.id_equipamiento where eq.id_evento_equipo = 2;

-- Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.

select cd.nombre as nombre_complejo_deportivo, j.nombre as nombre_jefe 
from complejo_deportivo cd 
join info_complejo ic on cd.id_info_complejo = ic.id_info_complejo 
join jefes j on j.id_jefe = ic.id_jefe where ic.id_jefe = 1;

-- Consulta de Complejos Polideportivos sin Eventos Celebrados.

select * from complejo_deportivo where id_complejo_deportivo not in (select id_complejo_deportivo from evento_complejo_deportivo);

-- Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
select c.nombre from comisario c 
join evento_comisario ec on c.id_comisario = ec.id_comisario 
where c.id_comisario IN (select id_comisario from evento_comisario);
















