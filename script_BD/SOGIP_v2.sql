/*

+++++++ RECONSTRUIR BASE DE DATOS CON LOS CAMBIOS RESPECTIVOS ++++++++++

use master;
drop database "SOGIP_v3"

create database "SOGIP_v3"
use "SOGIP_v3"

+++++++ RECONSTRUIR BASE DE DATOS CON LOS CAMBIOS RESPECTIVOS ++++++++++

-- ++++++++++++++++++++++++++++ Select's ++++++++++++++++++++++++++++


 select SOGIP_Users.Nombre1, SOGIP_Roles.Name, SOGIP_Roles.id
 from 
 SOGIP_Users, SOGIP_UserRoles, SOGIP_Roles
 where 
 SOGIP_Users.Id = SOGIP_UserRoles.Userid
 and
 SOGIP_UserRoles.Roleid = SOGIP_Roles.id
 order by SOGIP_Roles.id;

 delete from SOGIP_Users where Email != 'cmb28@hotmail.com';
 delete from SOGIP_Users;

 select * from SOGIP_Users;
 select * from SOGIP_Roles order by Id asc;

 select * from SOGIP_UserRoles, SOGIP_Roles;
 select * from SOGIP_Estados;

 select * from SOGIP_Selecciones;
 select * from SOGIP_Entrenadores;
 select * from SOGIP_Atletas;
 select * from SOGIP_Funcionario_ICODER;	
 select * from SOGIP_Entidad_Publica;
 select * from SOGIP_Asociacion_Deportiva;

 sp_help SOGIP_Users; -- Describe los atributos de cualquier tabla.

*/

-- ++++++++++++++++++++++++++++ Select's ++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++ Trigger's ++++++++++++++++++++++++++

/*
create trigger fecha_expiracion on SOGIP_Users
 for update, insert
  as
   if update(PasswordHash)
    begin
     update SOGIP_Users
     set fecha_expiracion=SOGIP_Users.fecha_expiracion+90
     from inserted
     where SOGIP_Users.id = inserted.id
    end
*/

-- ++++++++++++++++++++++++++ Trigger's ++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++ Insert's ++++++++++++++++++++++++++++


insert into SOGIP_Roles values('1', 'Supervisor');
insert into SOGIP_Roles values('2', 'Administrador');
insert into SOGIP_Roles values('3', 'Seleccion/Federacion');
insert into SOGIP_Roles values('4', 'Entrenador');
insert into SOGIP_Roles values('5', 'Atleta');
insert into SOGIP_Roles values('6', 'Atleta Becados');
insert into SOGIP_Roles values('7', 'Funcionarios ICODER');
insert into SOGIP_Roles values('8', 'Entidades Publicas');
insert into SOGIP_Roles values('9', 'Asociacion/Comite');
insert into SOGIP_Roles values('10', 'Usuario Externo');

insert into SOGIP_Estados values('Inactivo');
insert into SOGIP_Estados values('Activo');
insert into SOGIP_Estados values('Finalizado');
insert into SOGIP_Estados values('En Proceso');

insert into SOGIP_Categorias values('Juvenil');
insert into SOGIP_Categorias values('Mayor');
insert into SOGIP_Categorias values('SUB 20');
insert into SOGIP_Categorias values('Nacional');

insert into SOGIP_Tipo_Deporte values('Individual');
insert into SOGIP_Tipo_Deporte values('De conjunto');
insert into SOGIP_Tipo_Deporte values('De tiempo y marca');
insert into SOGIP_Tipo_Deporte values('De combate');
insert into SOGIP_Tipo_Deporte values('De raqueta');
insert into SOGIP_Tipo_Deporte values('De precision');

insert into SOGIP_Deportes values('AJEDREZ', 3);
insert into SOGIP_Deportes values('ATLETISMO', 1);
insert into SOGIP_Deportes values('BILLAR', 1);
insert into SOGIP_Deportes values('BOLICHE', 2);
insert into SOGIP_Deportes values('BOXEO', 1);
insert into SOGIP_Deportes values('CICLISMO', 1);
insert into SOGIP_Deportes values('ESGRIMA', 4);
insert into SOGIP_Deportes values('FISICOCULTURISMO', 1);
insert into SOGIP_Deportes values('HALTEROFILIA', 1);
insert into SOGIP_Deportes values('JUDO', 4);
insert into SOGIP_Deportes values('KARATE DO', 4);
insert into SOGIP_Deportes values('MOTORES', 1);
insert into SOGIP_Deportes values('NADO SINCRONIZADO', 2);
insert into SOGIP_Deportes values('NATACION', 3);
insert into SOGIP_Deportes values('PARALIMPICO', 1);
insert into SOGIP_Deportes values('PATINAJE', 2);
insert into SOGIP_Deportes values('POTENCIA', 1);
insert into SOGIP_Deportes values('PULSOS', 1);
insert into SOGIP_Deportes values('RACQUETBOL', 5);
insert into SOGIP_Deportes values('ABC', 1);

insert into SOGIP_Tipo_Entidad values('Aeropuerto Internacional Daniel Oduber');
insert into SOGIP_Tipo_Entidad values('Aeropuerto Internacional Juan Santamar�a');
insert into SOGIP_Tipo_Entidad values('Banco Central de Costa Rica�(BCCR)');
insert into SOGIP_Tipo_Entidad values('Banco Hipotecario de la Vivienda');
insert into SOGIP_Tipo_Entidad values('Banco Nacional de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Caja Costarricense de Seguro Social�(CCSS)');
insert into SOGIP_Tipo_Entidad values('Centro Costarricense de la Ciencia y la Cultura');
insert into SOGIP_Tipo_Entidad values('Centro Costarricense de Producci�n Cinematogr�fica');
insert into SOGIP_Tipo_Entidad values('Colegio de M�dicos y Cirujanos de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Colegio Federado de Ingenieros y Arquitectos de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Comisi�n Nacional de Asuntos Ind�genas');
insert into SOGIP_Tipo_Entidad values('Comisi�n Nacional de Emergencias (Costa Rica)');
insert into SOGIP_Tipo_Entidad values('Comisi�n Nacional de Rescate de Valores (Costa Rica)');
insert into SOGIP_Tipo_Entidad values('Comisionado Nacional Antidrogas');
insert into SOGIP_Tipo_Entidad values('Consejo Nacional de Producci�n');
insert into SOGIP_Tipo_Entidad values('Consejo Nacional para Investigaciones Cient�ficas y Tecnol�gicas');
insert into SOGIP_Tipo_Entidad values('Contralor�a General de la Rep�blica de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Corte Suprema de Justicia de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Defensor�a de los Habitantes de la Rep�blica de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Direcci�n Nacional de CEN-CINAI');
insert into SOGIP_Tipo_Entidad values('Editorial Costa Rica');
insert into SOGIP_Tipo_Entidad values('Escuela de Arquitectura de la Universidad de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Esencial Costa Rica');
insert into SOGIP_Tipo_Entidad values('Ficha de Informaci�n Social');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Acueductos y Alcantarillados�(AYA)');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Electricidad�(ICE)');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Ferrocarriles�(INCOFER)');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Pesca y Acuacultura�(INCOPESCA)');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Turismo');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense de Turismo�(ICT)');
insert into SOGIP_Tipo_Entidad values('Instituto Costarricense del Deporte y la Recreaci�n�(ICODER)');
insert into SOGIP_Tipo_Entidad values('Instituto de Desarrollo Rural');
insert into SOGIP_Tipo_Entidad values('Instituto de Desarrollo Rural�(INDER)');
insert into SOGIP_Tipo_Entidad values('Instituto de Fomento y Asesor�a Municipal�(IFAM)');
insert into SOGIP_Tipo_Entidad values('Instituto Mixto de Ayuda Social�(IMAS)');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Aprendizaje�(INA)');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Biodiversidad');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Estad�stica y Censos de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de la Mujer (Costa Rica)');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de la Mujer�(INAMU)');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Seguros');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Seguros�(INS)');
insert into SOGIP_Tipo_Entidad values('Instituto Nacional de Vivienda y Urbanismo�(INVU)');
insert into SOGIP_Tipo_Entidad values('Instituto Tecnol�gico de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Junta de Administraci�n Portuaria y de Desarrollo Econ�mico de la Vertiente Atl�ntica de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Junta de Protecci�n Social�(JPS)');
insert into SOGIP_Tipo_Entidad values('Ministerio de Agricultura y Ganader�a');insert into SOGIP_Tipo_Entidad values('Ministerio de Ambiente y Energ�a');
insert into SOGIP_Tipo_Entidad values('Ministerio de Ciencia, Tecnolog�a y Telecomunicaciones');
insert into SOGIP_Tipo_Entidad values('Ministerio de Comercio Exterior');
insert into SOGIP_Tipo_Entidad values('Ministerio de Comunicaci�n');
insert into SOGIP_Tipo_Entidad values('Ministerio de Cultura y Juventud');
insert into SOGIP_Tipo_Entidad values('Ministerio de Deporte y Recreaci�n');
insert into SOGIP_Tipo_Entidad values('Ministerio de Econom�a, Industria y Comercio');
insert into SOGIP_Tipo_Entidad values('Ministerio de Educaci�n P�blica');
insert into SOGIP_Tipo_Entidad values('Ministerio de Gobernaci�n y Polic�a');
insert into SOGIP_Tipo_Entidad values('Ministerio de Hacienda');
insert into SOGIP_Tipo_Entidad values('Ministerio de Justicia y Paz');
insert into SOGIP_Tipo_Entidad values('Ministerio de la Presidencia');
insert into SOGIP_Tipo_Entidad values('Ministerio de Obras P�blicas y Transportes');
insert into SOGIP_Tipo_Entidad values('Ministerio de Planificaci�n Nacional y Pol�tica Econ�mica');
insert into SOGIP_Tipo_Entidad values('Ministerio de Relaciones Exteriores');
insert into SOGIP_Tipo_Entidad values('Ministerio de Salud P�blica');
insert into SOGIP_Tipo_Entidad values('Ministerio de Seguridad P�blica');
insert into SOGIP_Tipo_Entidad values('Ministerio de Trabajo y Seguridad Social');
insert into SOGIP_Tipo_Entidad values('Ministerio de Vivienda y Asentamientos Humanos');
insert into SOGIP_Tipo_Entidad values('Observatorio Vulcanol�gico y Sismol�gico de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Organismo de Investigaci�n Judicial');
insert into SOGIP_Tipo_Entidad values('Patronato Nacional de la Infancia�(PANI)');
insert into SOGIP_Tipo_Entidad values('Refinadora Costarricense de Petr�leo�(RECOPE)');
insert into SOGIP_Tipo_Entidad values('Servicio de Vigilancia A�rea de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Sistema de Informaci�n de la Poblaci�n Objetivo');
insert into SOGIP_Tipo_Entidad values('Sistema Nacional de �reas de Conservaci�n');
insert into SOGIP_Tipo_Entidad values('Sistema Nacional de Radio y Televisi�n');
insert into SOGIP_Tipo_Entidad values('Universidad Empresarial de Costa Rica');
insert into SOGIP_Tipo_Entidad values('Universidad Estatal a Distancia');
insert into SOGIP_Tipo_Entidad values('Universidad Nacional de Costa Rica');

/*
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-11-18 08:00:11',1),convert(datetime,'10-11-18 08:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-11-18 09:00:11',1),convert(datetime,'10-11-18 09:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-09-18 10:00:11',1),convert(datetime,'10-09-18 10:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-09-18 11:00:11',1),convert(datetime,'10-09-18 11:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-23-18 08:00:11',1),convert(datetime,'10-23-18 08:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-23-18 09:00:11',1),convert(datetime,'10-23-18 09:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'11-01-18 08:00:11',1),convert(datetime,'11-01-18 08:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'11-01-18 09:00:11',1),convert(datetime,'11-01-18 09:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-12-18 08:00:11',1),convert(datetime,'10-12-18 08:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-12-18 09:00:11',1),convert(datetime,'10-12-18 09:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-12-18 10:00:11',1),convert(datetime,'10-12-18 11:25:11',1));
insert into sogip_cita values(1,1,'68f77a05-90b7-43a6-ad6e-604837744662', convert(datetime,'10-12-18 13:00:11',1),convert(datetime,'10-12-18 13:25:11',1));
*/

-- ++++++++++++++++++++++++++ Insert's ++++++++++++++++++++++++++