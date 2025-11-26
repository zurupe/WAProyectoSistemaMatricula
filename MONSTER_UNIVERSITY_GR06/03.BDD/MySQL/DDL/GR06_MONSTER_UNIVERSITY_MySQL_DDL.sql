/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     21/11/2025 9:54:30                           */
/*==============================================================*/


DROP TABLE IF EXISTS AEASI_ASIGN;

DROP TABLE IF EXISTS AECAR_CARRER;

DROP TABLE IF EXISTS AEEST_ESTUD;

DROP TABLE IF EXISTS AEGRU_GRUPO;

DROP TABLE IF EXISTS AEPER_PERIOD;

DROP TABLE IF EXISTS ARASR_PRERREQ;

DROP TABLE IF EXISTS FEDEU_DEUDA;

DROP TABLE IF EXISTS FEPAG_PAGO;

DROP TABLE IF EXISTS PEASI_ASIGNACION_ROL;

DROP TABLE IF EXISTS PECAR_CARGO;

DROP TABLE IF EXISTS PEDEP_DEPAR;

DROP TABLE IF EXISTS PEDOC_DOCEN;

DROP TABLE IF EXISTS PEEMP_EMPLE;

DROP TABLE IF EXISTS PEESC_ESTCIV;

DROP TABLE IF EXISTS PEROL_INSTITUCIONAL;

DROP TABLE IF EXISTS PESEX_SEXO;

DROP TABLE IF EXISTS XEEST_ESTAD;

DROP TABLE IF EXISTS XEOPC_OPCIO;

DROP TABLE IF EXISTS XEOXP_OPCPE;

DROP TABLE IF EXISTS XEPER_PERFI;

DROP TABLE IF EXISTS XESIS_SISTE;

DROP TABLE IF EXISTS XEUSU_USUAR;

DROP TABLE IF EXISTS XEUXP_USUPE;

/*==============================================================*/
/* Table: AEASI_ASIGN                                           */
/*==============================================================*/
CREATE TABLE AEASI_ASIGN
(
   AEASI_ID             VARCHAR(10) NOT NULL,
   AEASI_CODIGO         VARCHAR(10) NOT NULL,
   AEASI_NOMBRE         VARCHAR(20) NOT NULL,
   AEASI_CREDITOS       INT NOT NULL,
   DESCRIPCIONASIGNATURA VARCHAR(100),
   PRIMARY KEY (AEASI_ID)
);

ALTER TABLE AEASI_ASIGN COMMENT 'Entidad que se utiliza para almacenar las asignaturas.';

/*==============================================================*/
/* Table: AECAR_CARRER                                          */
/*==============================================================*/
CREATE TABLE AECAR_CARRER
(
   IDCARRERA            VARCHAR(10) NOT NULL,
   NOMBRECARRERA        VARCHAR(20) NOT NULL,
   CODIGOCARRERA        VARCHAR(10) NOT NULL,
   MAX_CREDITOSCARRERA  NUMERIC(24,0) NOT NULL,
   MIN_CREDITOSCARRERA  NUMERIC(12,0) NOT NULL,
   PRIMARY KEY (IDCARRERA)
);

ALTER TABLE AECAR_CARRER COMMENT 'Entidad que representa las carreras o programas académicos. ';

/*==============================================================*/
/* Table: AEEST_ESTUD                                           */
/*==============================================================*/
CREATE TABLE AEEST_ESTUD
(
   IDCARRERA            VARCHAR(10) NOT NULL,
   AEEST_ID             VARCHAR(10) NOT NULL,
   AEEST_CI             VARCHAR(20),
   AEEST_NOMBRE         VARCHAR(50) NOT NULL,
   AEEST_APELLIDOS      VARCHAR(50) NOT NULL,
   AEEST_PROMEDIO       NUMERIC(3,2) NOT NULL,
   AEEST_ESTADO_PAGO    BOOL NOT NULL,
   AEEST_FECHANAC       DATE NOT NULL,
   AEEST_EMAIL          VARCHAR(25) NOT NULL,
   AEEST_CELULAR        VARCHAR(10),
   AEEST_DIRECCION      VARCHAR(50) NOT NULL,
   IDAEMAT              VARCHAR(10) NOT NULL,
   FECHAAEMAT           DATE NOT NULL,
   ESTADOAEMAT          VARCHAR(30) NOT NULL,
   PRIMARY KEY (IDCARRERA, AEEST_ID)
);

ALTER TABLE AEEST_ESTUD COMMENT 'Entidad que almacena la información personal y académica de ';

/*==============================================================*/
/* Table: AEGRU_GRUPO                                           */
/*==============================================================*/
CREATE TABLE AEGRU_GRUPO
(
   IDPERIODO            VARCHAR(10) NOT NULL,
   AEASI_ID             VARCHAR(10) NOT NULL,
   AEGRU_CODIGO         VARCHAR(20) NOT NULL,
   IDCARRERA            VARCHAR(10) NOT NULL,
   AEEST_ID             VARCHAR(10) NOT NULL,
   PEDOC_ID             VARCHAR(10) NOT NULL,
   AEGRU_AULA           VARCHAR(20) NOT NULL,
   AEGRU_CUPO_MAX       INT NOT NULL,
   AEGRU_CUPO_ACTUAL    INT NOT NULL,
   HORARIOGRUPO         TEXT,
   PRIMARY KEY (IDPERIODO, AEASI_ID, AEGRU_CODIGO)
);

ALTER TABLE AEGRU_GRUPO COMMENT 'Entidad que representa las secciones o grupos de una asignat';

/*==============================================================*/
/* Table: AEPER_PERIOD                                          */
/*==============================================================*/
CREATE TABLE AEPER_PERIOD
(
   IDPERIODO            VARCHAR(10) NOT NULL,
   NOMBREPERIODO        VARCHAR(50) NOT NULL,
   FECHA_INICIOPERIODO  DATE NOT NULL,
   FECHA_FINPERIODO     DATE NOT NULL,
   ACTIVOPERIODO        BOOL NOT NULL,
   PRIMARY KEY (IDPERIODO)
);

ALTER TABLE AEPER_PERIOD COMMENT 'Entidad que representa los periodos académicos (semestres, t';

/*==============================================================*/
/* Table: ARASR_PRERREQ                                         */
/*==============================================================*/
CREATE TABLE ARASR_PRERREQ
(
   AEASI_ID             VARCHAR(10) NOT NULL,
   AEA_AEASI_ID         VARCHAR(10) NOT NULL,
   ARASRTIPO            VARCHAR(10) NOT NULL,
   PRIMARY KEY (AEASI_ID, AEA_AEASI_ID)
);

ALTER TABLE ARASR_PRERREQ COMMENT 'Relación N:M entre ASIGNATURA (AsignaturaObjetivo) y ASIGNAT';

/*==============================================================*/
/* Table: FEDEU_DEUDA                                           */
/*==============================================================*/
CREATE TABLE FEDEU_DEUDA
(
   FEDEU_ID             VARCHAR(10) NOT NULL,
   IDCARRERA            VARCHAR(10) NOT NULL,
   AEEST_ID             VARCHAR(10) NOT NULL,
   FEDEU_MONTO_PEND     DECIMAL(10,2) NOT NULL,
   FEDEU_FECHA_LIMIT    DATE NOT NULL,
   FEDEU_ESTADO_DEU     VARCHAR(30) NOT NULL,
   PRIMARY KEY (FEDEU_ID)
);

ALTER TABLE FEDEU_DEUDA COMMENT 'Entidad que controla la morosidad o los pagos pendientes.';

/*==============================================================*/
/* Table: FEPAG_PAGO                                            */
/*==============================================================*/
CREATE TABLE FEPAG_PAGO
(
   FEPAG__ID            VARCHAR(10) NOT NULL,
   IDCARRERA            VARCHAR(10) NOT NULL,
   AEEST_ID             VARCHAR(10) NOT NULL,
   FEPAG_FECHA_PAGO     DATE NOT NULL,
   FEPAG_MONTO_PAGO     DECIMAL(10,2) NOT NULL,
   FEPAG_MEDIO          VARCHAR(30) NOT NULL,
   FEPAG_ESTADO         VARCHAR(30) NOT NULL,
   PRIMARY KEY (FEPAG__ID)
);

ALTER TABLE FEPAG_PAGO COMMENT 'Entidad que registra los pagos realizados por el estudiante.';

/*==============================================================*/
/* Table: PEASI_ASIGNACION_ROL                                  */
/*==============================================================*/
CREATE TABLE PEASI_ASIGNACION_ROL
(
   PEASI_CODIGO         VARCHAR(10) NOT NULL,
   PEROL_CODIGO         VARCHAR(10),
   PEASI_FECHA          DATE NOT NULL,
   PEASI_ESTADO         VARCHAR(20) NOT NULL,
   PRIMARY KEY (PEASI_CODIGO)
);

ALTER TABLE PEASI_ASIGNACION_ROL COMMENT 'Entidad utilizada para representar el rol de asignacion de u';

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
CREATE TABLE PECAR_CARGO
(
   PEDEP_CODIGO         VARCHAR(10) NOT NULL,
   PECAR_CODIGO         VARCHAR(10) NOT NULL,
   PECAR_NOMBRE         VARCHAR(20) NOT NULL,
   PECAR_DESCRI         VARCHAR(20),
   PRIMARY KEY (PEDEP_CODIGO, PECAR_CODIGO)
);

ALTER TABLE PECAR_CARGO COMMENT 'Entidad utilizada para representar el el CARGO de un DEPARTA';

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
CREATE TABLE PEDEP_DEPAR
(
   PEDEP_CODIGO         VARCHAR(10) NOT NULL,
   PEDEP_NOMBRE         VARCHAR(20) NOT NULL,
   PEDEP_DESCRI         VARCHAR(20),
   PEDEP_AREA           CHAR(10),
   PRIMARY KEY (PEDEP_CODIGO)
);

ALTER TABLE PEDEP_DEPAR COMMENT 'Entidad utilizada para representar el DEPARTAMENTO de una pe';

/*==============================================================*/
/* Table: PEDOC_DOCEN                                           */
/*==============================================================*/
CREATE TABLE PEDOC_DOCEN
(
   PEDOC_ID             VARCHAR(10) NOT NULL,
   PEDOC_NOMBRES        VARCHAR(30) NOT NULL,
   PEDOC_APELLIDOS      VARCHAR(30) NOT NULL,
   PEDOC_EMAIL          VARCHAR(20) NOT NULL,
   CEDULADOCENTE        VARCHAR(10),
   PRIMARY KEY (PEDOC_ID)
);

ALTER TABLE PEDOC_DOCEN COMMENT 'Entidad que contiene los datos personales y de contacto de l';

/*==============================================================*/
/* Table: PEEMP_EMPLE                                           */
/*==============================================================*/
CREATE TABLE PEEMP_EMPLE
(
   PEEMP_CODIGO         VARCHAR(10) NOT NULL,
   PESEX_CODIGO         VARCHAR(10) NOT NULL,
   PEESC_CODIGO         VARCHAR(10),
   PEEMP_NOMBRE         VARCHAR(100) NOT NULL,
   PEEMP_APELLIDO       VARCHAR(100) NOT NULL,
   PEEMP_CORREO         VARCHAR(100) NOT NULL,
   PEEMP_CEL            CHAR(10),
   PEEMP_NACIM          DATE NOT NULL,
   PEEMP_CARGAS         NUMERIC(2,0) NOT NULL,
   PEEMP_DIRECCION      VARCHAR(100),
   CEDULA               CHAR(10) NOT NULL,
   PRIMARY KEY (PEEMP_CODIGO)
);

ALTER TABLE PEEMP_EMPLE COMMENT 'Entidad que se utiliza para almacenar los empleados';

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
CREATE TABLE PEESC_ESTCIV
(
   PEESC_CODIGO         VARCHAR(10) NOT NULL,
   PEESC_DESCRI         VARCHAR(20) NOT NULL,
   PRIMARY KEY (PEESC_CODIGO)
);

ALTER TABLE PEESC_ESTCIV COMMENT 'Entidad utilizada para representar el estado civil de una pe';

/*==============================================================*/
/* Table: PEROL_INSTITUCIONAL                                   */
/*==============================================================*/
CREATE TABLE PEROL_INSTITUCIONAL
(
   PEROL_CODIGO         VARCHAR(10) NOT NULL,
   PEEMP_CODIGO         VARCHAR(10),
   PEROL_NOMBRE         VARCHAR(20) NOT NULL,
   PEROL_DESCRIPCION    VARCHAR(100) NOT NULL,
   PRIMARY KEY (PEROL_CODIGO)
);

ALTER TABLE PEROL_INSTITUCIONAL COMMENT 'Entidad utilizada para representar el ROL INSTITUCIONAL de u';

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
CREATE TABLE PESEX_SEXO
(
   PESEX_CODIGO         VARCHAR(10) NOT NULL,
   PESEX_DESCRI         VARCHAR(50) NOT NULL,
   PRIMARY KEY (PESEX_CODIGO)
);

ALTER TABLE PESEX_SEXO COMMENT 'Entidad utilizada para representar el sexo o genero de una p';

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
CREATE TABLE XEEST_ESTAD
(
   XEEST_CODIGO         CHAR(1) NOT NULL,
   XEEST_DESCRI         VARCHAR(50) NOT NULL,
   PRIMARY KEY (XEEST_CODIGO)
);

ALTER TABLE XEEST_ESTAD COMMENT 'Entidad utilizada para gestionar el estado de las difetrente';

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
CREATE TABLE XEOPC_OPCIO
(
   XEOPC_CODIGO         CHAR(3) NOT NULL,
   XESIS_CODIGO         CHAR(1) NOT NULL,
   XEOPC_DESCRI         VARCHAR(100) NOT NULL,
   PRIMARY KEY (XEOPC_CODIGO)
);

ALTER TABLE XEOPC_OPCIO COMMENT 'Entidad utilizada para realizar el registro de las diferente';

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
CREATE TABLE XEOXP_OPCPE
(
   XEOPC_CODIGO         CHAR(3) NOT NULL,
   XEPER_CODIGO         CHAR(8) NOT NULL,
   XEOXP_FECASI         DATE NOT NULL,
   XEOXP_FECRET         DATE,
   PRIMARY KEY (XEOPC_CODIGO, XEPER_CODIGO, XEOXP_FECASI)
);

ALTER TABLE XEOXP_OPCPE COMMENT 'Entidad utilizada para llevar el registro de las opciones qu';

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
CREATE TABLE XEPER_PERFI
(
   XEPER_CODIGO         CHAR(8) NOT NULL,
   XEPER_DESCRI         VARCHAR(100) NOT NULL,
   XEPER_OBSER          TEXT,
   PRIMARY KEY (XEPER_CODIGO)
);

ALTER TABLE XEPER_PERFI COMMENT 'Entidad utilizada para realizar la gestión de los diferentes';

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
CREATE TABLE XESIS_SISTE
(
   XESIS_CODIGO         CHAR(1) NOT NULL,
   XESIS_DESCRI         VARCHAR(50) NOT NULL,
   PRIMARY KEY (XESIS_CODIGO)
);

ALTER TABLE XESIS_SISTE COMMENT 'Entidad utilizada para realziar la gestión de los diferentes';

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
CREATE TABLE XEUSU_USUAR
(
   PEEMP_CODIGO         VARCHAR(10) NOT NULL,
   XEUSU_PASWD          VARCHAR(16) NOT NULL,
   XEEST_CODIGO         CHAR(1) NOT NULL,
   XEUSU_FECCRE         DATETIME NOT NULL,
   XEUSU_FECMOD         DATETIME NOT NULL,
   XEUSU_PIEFIR         VARCHAR(100) NOT NULL,
   PRIMARY KEY (PEEMP_CODIGO, XEUSU_PASWD)
);

ALTER TABLE XEUSU_USUAR COMMENT 'Entidad relacionada para gentionar los usuario que ingrsan a';

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
CREATE TABLE XEUXP_USUPE
(
   PEEMP_CODIGO         VARCHAR(10) NOT NULL,
   XEUSU_PASWD          VARCHAR(16) NOT NULL,
   XEPER_CODIGO         CHAR(8) NOT NULL,
   XEUXP_FECASI         DATE NOT NULL,
   XEUXP_FECRET         DATE,
   PRIMARY KEY (PEEMP_CODIGO, XEUSU_PASWD, XEPER_CODIGO, XEUXP_FECASI)
);

ALTER TABLE XEUXP_USUPE COMMENT 'Entidad utilizada para realizar el registro de los diferente';

ALTER TABLE AEEST_ESTUD ADD CONSTRAINT FK_AR_AECAR_AEEST FOREIGN KEY (IDCARRERA)
      REFERENCES AECAR_CARRER (IDCARRERA);

ALTER TABLE AEGRU_GRUPO ADD CONSTRAINT FK_ARMAT_MATRI FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID);

ALTER TABLE AEGRU_GRUPO ADD CONSTRAINT FK_AR_AEASI_AEGRU FOREIGN KEY (AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID);

ALTER TABLE AEGRU_GRUPO ADD CONSTRAINT FK_AR_AEPER_AEGRU FOREIGN KEY (IDPERIODO)
      REFERENCES AEPER_PERIOD (IDPERIODO);

ALTER TABLE AEGRU_GRUPO ADD CONSTRAINT FK_AR_PEDOC_AEGRU FOREIGN KEY (PEDOC_ID)
      REFERENCES PEDOC_DOCEN (PEDOC_ID);

ALTER TABLE ARASR_PRERREQ ADD CONSTRAINT FK_ASIGNATURAREQUISITO FOREIGN KEY (AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID);

ALTER TABLE ARASR_PRERREQ ADD CONSTRAINT FK_REQ_ASIGNATURA_OBJETIVO FOREIGN KEY (AEA_AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID);

ALTER TABLE FEDEU_DEUDA ADD CONSTRAINT FK_FR_AEEST_FEDEU FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID);

ALTER TABLE FEPAG_PAGO ADD CONSTRAINT FK_FR_AEEST_FEPAG FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID);

ALTER TABLE PEASI_ASIGNACION_ROL ADD CONSTRAINT FK_PR_PEAS_PEROL FOREIGN KEY (PEROL_CODIGO)
      REFERENCES PEROL_INSTITUCIONAL (PEROL_CODIGO);

ALTER TABLE PECAR_CARGO ADD CONSTRAINT FK_PR_PEDEP_PECAR FOREIGN KEY (PEDEP_CODIGO)
      REFERENCES PEDEP_DEPAR (PEDEP_CODIGO);

ALTER TABLE PEEMP_EMPLE ADD CONSTRAINT FK_PR_PEESC_PEEMP FOREIGN KEY (PEESC_CODIGO)
      REFERENCES PEESC_ESTCIV (PEESC_CODIGO);

ALTER TABLE PEEMP_EMPLE ADD CONSTRAINT FK_PR_PESEX_PEEMP FOREIGN KEY (PESEX_CODIGO)
      REFERENCES PESEX_SEXO (PESEX_CODIGO);

ALTER TABLE PEROL_INSTITUCIONAL ADD CONSTRAINT FK_PR_PEROL_PEEMP FOREIGN KEY (PEEMP_CODIGO)
      REFERENCES PEEMP_EMPLE (PEEMP_CODIGO);

ALTER TABLE XEOPC_OPCIO ADD CONSTRAINT FK_XR_XESIS_XEOPC FOREIGN KEY (XESIS_CODIGO)
      REFERENCES XESIS_SISTE (XESIS_CODIGO);

ALTER TABLE XEOXP_OPCPE ADD CONSTRAINT FK_XR_XEOPC_XEOXP FOREIGN KEY (XEOPC_CODIGO)
      REFERENCES XEOPC_OPCIO (XEOPC_CODIGO);

ALTER TABLE XEOXP_OPCPE ADD CONSTRAINT FK_XR_XEPER_XEOXP FOREIGN KEY (XEPER_CODIGO)
      REFERENCES XEPER_PERFI (XEPER_CODIGO);

ALTER TABLE XEUSU_USUAR ADD CONSTRAINT FK_XR_PEEMP_XEUSU FOREIGN KEY (PEEMP_CODIGO)
      REFERENCES PEEMP_EMPLE (PEEMP_CODIGO);

ALTER TABLE XEUSU_USUAR ADD CONSTRAINT FK_XR_XEEST_XEUSU FOREIGN KEY (XEEST_CODIGO)
      REFERENCES XEEST_ESTAD (XEEST_CODIGO);

ALTER TABLE XEUXP_USUPE ADD CONSTRAINT FK_XR_XEPER_XEUXP FOREIGN KEY (XEPER_CODIGO)
      REFERENCES XEPER_PERFI (XEPER_CODIGO);

ALTER TABLE XEUXP_USUPE ADD CONSTRAINT FK_XR_XEUSU_XEUXP FOREIGN KEY (PEEMP_CODIGO, XEUSU_PASWD)
      REFERENCES XEUSU_USUAR (PEEMP_CODIGO, XEUSU_PASWD);

