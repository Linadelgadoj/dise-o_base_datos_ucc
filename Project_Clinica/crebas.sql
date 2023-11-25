/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     25/11/2023 16:29:11                          */
/*==============================================================*/


alter table DOCTOR
   drop constraint FK_DOCTOR_FK_DOCTOR_CONSULTO;

alter table ESPECIALIDAD
   drop constraint FK_ESPECIAL_FK_ESPECI_DOCTOR;

alter table PACIENTE
   drop constraint FK_PACIENTE_FK_PACIEN_CITA;

alter table PACIENTE
   drop constraint FK_PACIENTE_FK_PACIEN_ESTADO_P;

alter table PACIENTE
   drop constraint FK_PACIENTE_FK_PACIEN_TIPO_BIO;

alter table PACIENTE
   drop constraint FK_PACIENTE_FK_PACIEN_TIPO_PAC;

alter table PISO
   drop constraint FK_PISO_REFERENCE_CONSULTO;

alter table TIPO_BIOPSIA
   drop constraint FK_TIPO_BIO_FK_TIPO_B_ESPECIAL;

alter table TIPO_BIOPSIA
   drop constraint FK_TIPO_BIO_FK_TIPO_B_VALOR_PR;

alter table TIPO_PACIENTE
   drop constraint FK_TIPO_PAC_FK_TIPO_P_VALOR_PR;

drop table CITA cascade constraints;

drop table CONSULTORIO cascade constraints;

drop table DOCTOR cascade constraints;

drop table ESPECIALIDAD cascade constraints;

drop table ESTADO_PACIENTE cascade constraints;

drop table PACIENTE cascade constraints;

drop table PISO cascade constraints;

drop table TIPO_BIOPSIA cascade constraints;

drop table TIPO_PACIENTE cascade constraints;

drop table VALOR_PROCEDIMIENTO cascade constraints;

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA  (
   ID_CITA              VARCHAR(10)                     not null,
   FECHA_CITA           DATE,
   HORA_CITA            TIMESTAMP WITH LOCAL TIME ZONE,
   CONFIRMA_CITA        VARCHAR(10),
   constraint PK_CITA primary key (ID_CITA)
);

/*==============================================================*/
/* Table: CONSULTORIO                                           */
/*==============================================================*/
create table CONSULTORIO  (
   ID_CONSULTORIO       NUMBER(10)                      not null,
   constraint PK_CONSULTORIO primary key (ID_CONSULTORIO)
);

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR  (
   ID_DOCTOR            VARCHAR(10)                     not null,
   ID_CONSULTORIO       NUMBER(10),
   NOMBRE               VARCHAR(10),
   DOCUMENTO            NUMBER(10),
   REG_MEDICO           NUMBER(10),
   constraint PK_DOCTOR primary key (ID_DOCTOR)
);

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD  (
   ID_ESPECIALIDAD      VARCHAR(10)                     not null,
   ID_DOCTOR            VARCHAR(10),
   DESC_ESPECIALIDAD    VARCHAR(10),
   constraint PK_ESPECIALIDAD primary key (ID_ESPECIALIDAD)
);

/*==============================================================*/
/* Table: ESTADO_PACIENTE                                       */
/*==============================================================*/
create table ESTADO_PACIENTE  (
   ID_ESTADO_PTE        NUMBER(10)                      not null,
   DESC_ESTADO_PTE      VARCHAR(10),
   constraint PK_ESTADO_PACIENTE primary key (ID_ESTADO_PTE)
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE  (
   ID_PACIENTE          VARCHAR(10)                     not null,
   ID_BIOPSIA           VARCHAR(10),
   ID_ESTADO_PTE        VARCHAR(10),
   ID_CITA              VARCHAR(10),
   ID_TIPO_PACIENTE     VARCHAR(10),
   ID_DOCUMENTO         VARCHAR(10)                     not null,
   GENERO               VARCHAR(10)                     not null,
   FECHA_NACIMIENTO     DATE                            not null,
   CELULAR              NUMBER(10)                      not null,
   NOMBRE_PTE           VARCHAR(20),
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Table: PISO                                                  */
/*==============================================================*/
create table PISO  (
   ID_PISO              NUMBER(10)                      not null,
   ID_CONSULTORIO       NUMBER(10),
   constraint PK_PISO primary key (ID_PISO)
);

/*==============================================================*/
/* Table: TIPO_BIOPSIA                                          */
/*==============================================================*/
create table TIPO_BIOPSIA  (
   ID_BIOPSIA           VARCHAR(10)                     not null,
   ID_ESPECIALIDAD      VARCHAR(10),
   ID_VALOR             NUMBER(10),
   DESC_BIOPSIA         VARCHAR(10),
   constraint PK_TIPO_BIOPSIA primary key (ID_BIOPSIA)
);

/*==============================================================*/
/* Table: TIPO_PACIENTE                                         */
/*==============================================================*/
create table TIPO_PACIENTE  (
   ID_TIPO_PACIENTE     VARCHAR(10)                     not null,
   ID_VALOR             VARCHAR(10),
   DESC_TIPO_PACIENTE   VARCHAR(10),
   constraint PK_TIPO_PACIENTE primary key (ID_TIPO_PACIENTE)
);

/*==============================================================*/
/* Table: VALOR_PROCEDIMIENTO                                   */
/*==============================================================*/
create table VALOR_PROCEDIMIENTO  (
   ID_VALOR             VARCHAR(0)                      not null,
   CANTIDAD             NUMBER(0),
   constraint PK_VALOR_PROCEDIMIENTO primary key (ID_VALOR)
);

alter table DOCTOR
   add constraint FK_DOCTOR_FK_DOCTOR_CONSULTO foreign key (ID_CONSULTORIO)
      references CONSULTORIO (ID_CONSULTORIO);

alter table ESPECIALIDAD
   add constraint FK_ESPECIAL_FK_ESPECI_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR);

alter table PACIENTE
   add constraint FK_PACIENTE_FK_PACIEN_CITA foreign key (ID_CITA)
      references CITA (ID_CITA);

alter table PACIENTE
   add constraint FK_PACIENTE_FK_PACIEN_ESTADO_P foreign key (ID_ESTADO_PTE)
      references ESTADO_PACIENTE (ID_ESTADO_PTE);

alter table PACIENTE
   add constraint FK_PACIENTE_FK_PACIEN_TIPO_BIO foreign key (ID_BIOPSIA)
      references TIPO_BIOPSIA (ID_BIOPSIA);

alter table PACIENTE
   add constraint FK_PACIENTE_FK_PACIEN_TIPO_PAC foreign key (ID_TIPO_PACIENTE)
      references TIPO_PACIENTE (ID_TIPO_PACIENTE);

alter table PISO
   add constraint FK_PISO_REFERENCE_CONSULTO foreign key (ID_CONSULTORIO)
      references CONSULTORIO (ID_CONSULTORIO);

alter table TIPO_BIOPSIA
   add constraint FK_TIPO_BIO_FK_TIPO_B_ESPECIAL foreign key (ID_ESPECIALIDAD)
      references ESPECIALIDAD (ID_ESPECIALIDAD);

alter table TIPO_BIOPSIA
   add constraint FK_TIPO_BIO_FK_TIPO_B_VALOR_PR foreign key (ID_VALOR)
      references VALOR_PROCEDIMIENTO (ID_VALOR);

alter table TIPO_PACIENTE
   add constraint FK_TIPO_PAC_FK_TIPO_P_VALOR_PR foreign key (ID_VALOR)
      references VALOR_PROCEDIMIENTO (ID_VALOR);

