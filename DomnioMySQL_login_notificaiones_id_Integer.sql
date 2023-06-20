/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/06/2023 10:58:53 p. m.                    */
/*==============================================================*/

/*
alter table Evaluacion
   drop primary key;

drop table if exists Evaluacion;

alter table Login
   drop primary key;

drop table if exists Login;

alter table UserRol
   drop primary key;

drop table if exists UserRol;

alter table Labor
   drop primary key;

drop table if exists Labor;


alter table Periodo
   drop primary key;

drop table if exists Periodo;

alter table Rol
   drop primary key;

drop table if exists Rol;

alter table TipoLabor
   drop primary key;

drop table if exists TipoLabor;


alter table Usuario
   drop primary key;

drop table if exists Usuario;
*/

/*==============================================================*/
/* Table: Evaluacion                                            */
/*==============================================================*/
create table Evaluacion
(
   eva_id               int not null,
   lab_id               int,
   per_id               int,
   usr_identificacion   int,
   rol_id               int,
   eva_estado           smallint,
   eva_puntaje          numeric(8,0),
   eva_resultado        varchar(254)
);

alter table Evaluacion
   add primary key (eva_id);

/*==============================================================*/
/* Table: Labor                                                 */
/*==============================================================*/
create table Labor
(
   lab_id               int not null,
   tl_id                int,
   lab_nombre           varchar(254),
   lab_horas            numeric(8,0)
);

alter table Labor
   add primary key (lab_id);

/*==============================================================*/
/* Table: Login                                                 */
/*==============================================================*/
create table Login
(
   lg_id                int not null,
   usr_identificacion   int,
   rol_id               int,
   lg_mail              varchar(254) not null,
   lg_password          varchar(254) not null
);

alter table Login
   add primary key (lg_id);

/*==============================================================*/
/* Table: Periodo                                               */
/*==============================================================*/
create table Periodo
(
   per_id               int not null,
   per_nombre           varchar(254),
   per_fechainicio      date,
   per_fechafin         date,
   per_anno             varchar(254),
   per_semestre         smallint
);

alter table Periodo
   add primary key (per_id);

/*==============================================================*/
/* Table: Rol                                                   */
/*==============================================================*/
create table Rol
(
   rol_id               int not null,
   rol_descripcion      varchar(254)
);

alter table Rol
   add primary key (rol_id);

/*==============================================================*/
/* Table: TipoLabor                                             */
/*==============================================================*/
create table TipoLabor
(
   tl_id                int not null,
   tl_codigo            varchar(254),
   tl_descripcion       varchar(254)
);

alter table TipoLabor
   add primary key (tl_id);

/*==============================================================*/
/* Table: UserRol                                               */
/*==============================================================*/
create table UserRol
(
   usr_identificacion   int not null,
   rol_id               int not null,
   ur_fechainicio       date,
   ur_fechafin          date
);

alter table UserRol
   add primary key (usr_identificacion, rol_id);

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario
(
   usr_identificacion   int not null,
   usr_nombre           varchar(254) not null,
   usr_apellido         varchar(254),
   usr_genero           varchar(254) not null,
   usr_estudio          varchar(254),
   usr_estado           bool not null
);

alter table Usuario
   add primary key (usr_identificacion);

alter table Evaluacion add constraint FK_Reference_6 foreign key (usr_identificacion, rol_id)
      references UserRol (usr_identificacion, rol_id) on delete restrict on update restrict;

alter table Evaluacion add constraint FK_Reference_8 foreign key (lab_id)
      references Labor (lab_id) on delete restrict on update restrict;

alter table Evaluacion add constraint FK_Reference_9 foreign key (per_id)
      references Periodo (per_id) on delete restrict on update restrict;

alter table Labor add constraint FK_Reference_10 foreign key (tl_id)
      references TipoLabor (tl_id) on delete restrict on update restrict;

alter table Login add constraint FK_Reference_7 foreign key (usr_identificacion, rol_id)
      references UserRol (usr_identificacion, rol_id) on delete restrict on update restrict;

alter table UserRol add constraint FK_Reference_11 foreign key (usr_identificacion)
      references Usuario (usr_identificacion) on delete restrict on update restrict;

alter table UserRol add constraint FK_Reference_12 foreign key (rol_id)
      references Rol (rol_id) on delete restrict on update restrict;

