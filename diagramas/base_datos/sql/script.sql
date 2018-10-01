/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/10/2018 02:02:32 p. m.                    */
/*==============================================================*/


drop table if exists CRIADERO;

drop table if exists GALLO;

drop table if exists INSCRIPCION_TORNEO;

drop table if exists PARAMETRO;

drop table if exists PELEA_GALLOS;

drop table if exists REPRESENTANTE;

drop table if exists TORNEO;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CRIADERO                                              */
/*==============================================================*/
create table CRIADERO
(
   ID_CRIADEROS         bigint not null auto_increment,
   NOMBRE               varchar(64),
   DESCRIPCION          varchar(256),
   ESTADO               varchar(1),
   primary key (ID_CRIADEROS)
);

/*==============================================================*/
/* Table: GALLO                                                 */
/*==============================================================*/
create table GALLO
(
   ID_GALLO             bigint not null auto_increment,
   ID_REPRESENTANTE     bigint,
   PLACA                varchar(64),
   PESO                 decimal(10,3),
   EDAD                 decimal(10,3),
   TALLA                decimal(10,3),
   ESTADO               varchar(1),
   primary key (ID_GALLO)
);

/*==============================================================*/
/* Table: INSCRIPCION_TORNEO                                    */
/*==============================================================*/
create table INSCRIPCION_TORNEO
(
   ID_DESCRIPCION       int not null auto_increment,
   ID_TORNEO            bigint,
   ID_CRIADEROS         bigint,
   ID_REPRESENTANTE     bigint,
   ID_GALLO             bigint,
   NOMBRE_CRIADERO      varchar(256),
   NOMBRE_REPRESENTANTE varchar(256),
   PLACA_GALLO          varchar(64),
   PESO_GALLO           decimal(10,3),
   EDAD_GALLO           decimal(10,3),
   TALLA_GALLO          decimal(10,3),
   ESTADO               varchar(1),
   primary key (ID_DESCRIPCION)
);

/*==============================================================*/
/* Table: PARAMETRO                                             */
/*==============================================================*/
create table PARAMETRO
(
   NOMBRE_PARAMETRO     varchar(64) not null,
   VALOR                varchar(64),
   primary key (NOMBRE_PARAMETRO)
);

/*==============================================================*/
/* Table: PELEA_GALLOS                                          */
/*==============================================================*/
create table PELEA_GALLOS
(
   ID_PELEA             bigint not null auto_increment,
   ID_DESCRIPCION       char(10),
   INS_ID_DESCRIPCION   char(10),
   RESULTADO            varchar(64),
   TIEMPO               int,
   OBSERVACION          varchar(256),
   ESTADO               varchar(1),
   primary key (ID_PELEA)
);

/*==============================================================*/
/* Table: REPRESENTANTE                                         */
/*==============================================================*/
create table REPRESENTANTE
(
   ID_REPRESENTANTE     bigint not null auto_increment,
   ID_CRIADEROS         bigint,
   IDENTIFICACION       varchar(16),
   NOMBRES              varchar(64),
   TELEFONOS            varchar(64),
   CORREO               varchar(64),
   DESCRIPCION          varchar(256),
   ETADO                varchar(1),
   primary key (ID_REPRESENTANTE)
);

/*==============================================================*/
/* Table: TORNEO                                                */
/*==============================================================*/
create table TORNEO
(
   ID_TORNEO            bigint not null auto_increment,
   NOMBRE               varchar(64),
   DESCRIPCION          varchar(256),
   FECHA                date,
   ESTADO               varchar(1),
   primary key (ID_TORNEO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   NICK                 varchar(64) not null,
   CLAVE                varchar(64),
   ESTADO               varchar(1),
   primary key (NICK)
);

alter table GALLO add constraint FK_RELATIONSHIP_3 foreign key (ID_REPRESENTANTE)
      references REPRESENTANTE (ID_REPRESENTANTE) on delete restrict on update restrict;

alter table INSCRIPCION_TORNEO add constraint FK_RELATIONSHIP_5 foreign key (ID_TORNEO)
      references TORNEO (ID_TORNEO) on delete restrict on update restrict;

alter table INSCRIPCION_TORNEO add constraint FK_RELATIONSHIP_7 foreign key (ID_CRIADEROS)
      references CRIADERO (ID_CRIADEROS) on delete restrict on update restrict;

alter table INSCRIPCION_TORNEO add constraint FK_RELATIONSHIP_8 foreign key (ID_REPRESENTANTE)
      references REPRESENTANTE (ID_REPRESENTANTE) on delete restrict on update restrict;

alter table INSCRIPCION_TORNEO add constraint FK_RELATIONSHIP_9 foreign key (ID_GALLO)
      references GALLO (ID_GALLO) on delete restrict on update restrict;

alter table PELEA_GALLOS add constraint FK_GALLO_PELEA1 foreign key (INS_ID_DESCRIPCION)
      references INSCRIPCION_TORNEO (ID_DESCRIPCION) on delete restrict on update restrict;

alter table PELEA_GALLOS add constraint FK_GALLO_PELEA2 foreign key (ID_DESCRIPCION)
      references INSCRIPCION_TORNEO (ID_DESCRIPCION) on delete restrict on update restrict;

alter table REPRESENTANTE add constraint FK_RELATIONSHIP_6 foreign key (ID_CRIADEROS)
      references CRIADERO (ID_CRIADEROS) on delete restrict on update restrict;

