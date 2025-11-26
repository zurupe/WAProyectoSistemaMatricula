/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     21/11/2025 9:54:15                           */
/*==============================================================*/


IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('AEEST_ESTUD') AND O.NAME = 'FK_AEEST_ES_AR_AECAR__AECAR_CA')
ALTER TABLE AEEST_ESTUD
   DROP CONSTRAINT FK_AEEST_ES_AR_AECAR__AECAR_CA
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('AEGRU_GRUPO') AND O.NAME = 'FK_AEGRU_GR_ARMAT_MAT_AEEST_ES')
ALTER TABLE AEGRU_GRUPO
   DROP CONSTRAINT FK_AEGRU_GR_ARMAT_MAT_AEEST_ES
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('AEGRU_GRUPO') AND O.NAME = 'FK_AEGRU_GR_AR_AEASI__AEASI_AS')
ALTER TABLE AEGRU_GRUPO
   DROP CONSTRAINT FK_AEGRU_GR_AR_AEASI__AEASI_AS
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('AEGRU_GRUPO') AND O.NAME = 'FK_AEGRU_GR_AR_AEPER__AEPER_PE')
ALTER TABLE AEGRU_GRUPO
   DROP CONSTRAINT FK_AEGRU_GR_AR_AEPER__AEPER_PE
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('AEGRU_GRUPO') AND O.NAME = 'FK_AEGRU_GR_AR_PEDOC__PEDOC_DO')
ALTER TABLE AEGRU_GRUPO
   DROP CONSTRAINT FK_AEGRU_GR_AR_PEDOC__PEDOC_DO
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('ARASR_PRERREQ') AND O.NAME = 'FK_ARASR_PR_ASIGNATUR_AEASI_AS')
ALTER TABLE ARASR_PRERREQ
   DROP CONSTRAINT FK_ARASR_PR_ASIGNATUR_AEASI_AS
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('ARASR_PRERREQ') AND O.NAME = 'FK_ARASR_PR_REQ_ASIGN_AEASI_AS')
ALTER TABLE ARASR_PRERREQ
   DROP CONSTRAINT FK_ARASR_PR_REQ_ASIGN_AEASI_AS
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('FEDEU_DEUDA') AND O.NAME = 'FK_FEDEU_DE_FR_AEEST__AEEST_ES')
ALTER TABLE FEDEU_DEUDA
   DROP CONSTRAINT FK_FEDEU_DE_FR_AEEST__AEEST_ES
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('FEPAG_PAGO') AND O.NAME = 'FK_FEPAG_PA_FR_AEEST__AEEST_ES')
ALTER TABLE FEPAG_PAGO
   DROP CONSTRAINT FK_FEPAG_PA_FR_AEEST__AEEST_ES
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('PEASI_ASIGNACION_ROL') AND O.NAME = 'FK_PEASI_AS_PR_PEAS_P_PEROL_IN')
ALTER TABLE PEASI_ASIGNACION_ROL
   DROP CONSTRAINT FK_PEASI_AS_PR_PEAS_P_PEROL_IN
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('PECAR_CARGO') AND O.NAME = 'FK_PECAR_CA_PR_PEDEP__PEDEP_DE')
ALTER TABLE PECAR_CARGO
   DROP CONSTRAINT FK_PECAR_CA_PR_PEDEP__PEDEP_DE
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('PEEMP_EMPLE') AND O.NAME = 'FK_PEEMP_EM_PR_PEESC__PEESC_ES')
ALTER TABLE PEEMP_EMPLE
   DROP CONSTRAINT FK_PEEMP_EM_PR_PEESC__PEESC_ES
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('PEEMP_EMPLE') AND O.NAME = 'FK_PEEMP_EM_PR_PESEX__PESEX_SE')
ALTER TABLE PEEMP_EMPLE
   DROP CONSTRAINT FK_PEEMP_EM_PR_PESEX__PESEX_SE
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('PEROL_INSTITUCIONAL') AND O.NAME = 'FK_PEROL_IN_PR_PEROL__PEEMP_EM')
ALTER TABLE PEROL_INSTITUCIONAL
   DROP CONSTRAINT FK_PEROL_IN_PR_PEROL__PEEMP_EM
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEOPC_OPCIO') AND O.NAME = 'FK_XEOPC_OP_XR_XESIS__XESIS_SI')
ALTER TABLE XEOPC_OPCIO
   DROP CONSTRAINT FK_XEOPC_OP_XR_XESIS__XESIS_SI
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEOXP_OPCPE') AND O.NAME = 'FK_XEOXP_OP_XR_XEOPC__XEOPC_OP')
ALTER TABLE XEOXP_OPCPE
   DROP CONSTRAINT FK_XEOXP_OP_XR_XEOPC__XEOPC_OP
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEOXP_OPCPE') AND O.NAME = 'FK_XEOXP_OP_XR_XEPER__XEPER_PE')
ALTER TABLE XEOXP_OPCPE
   DROP CONSTRAINT FK_XEOXP_OP_XR_XEPER__XEPER_PE
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEUSU_USUAR') AND O.NAME = 'FK_XEUSU_US_XR_PEEMP__PEEMP_EM')
ALTER TABLE XEUSU_USUAR
   DROP CONSTRAINT FK_XEUSU_US_XR_PEEMP__PEEMP_EM
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEUSU_USUAR') AND O.NAME = 'FK_XEUSU_US_XR_XEEST__XEEST_ES')
ALTER TABLE XEUSU_USUAR
   DROP CONSTRAINT FK_XEUSU_US_XR_XEEST__XEEST_ES
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEUXP_USUPE') AND O.NAME = 'FK_XEUXP_US_XR_XEPER__XEPER_PE')
ALTER TABLE XEUXP_USUPE
   DROP CONSTRAINT FK_XEUXP_US_XR_XEPER__XEPER_PE
go

IF EXISTS (SELECT 1
   FROM SYS.SYSREFERENCES R JOIN SYS.SYSOBJECTS O ON (O.ID = R.CONSTID AND O.TYPE = 'F')
   WHERE R.FKEYID = OBJECT_ID('XEUXP_USUPE') AND O.NAME = 'FK_XEUXP_US_XR_XEUSU__XEUSU_US')
ALTER TABLE XEUXP_USUPE
   DROP CONSTRAINT FK_XEUXP_US_XR_XEUSU__XEUSU_US
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('AEASI_ASIGN')
            AND   TYPE = 'U')
   DROP TABLE AEASI_ASIGN
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('AECAR_CARRER')
            AND   TYPE = 'U')
   DROP TABLE AECAR_CARRER
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('AEEST_ESTUD')
            AND   NAME  = 'AR_AECAR_AEEST_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX AEEST_ESTUD.AR_AECAR_AEEST_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('AEEST_ESTUD')
            AND   TYPE = 'U')
   DROP TABLE AEEST_ESTUD
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('AEGRU_GRUPO')
            AND   NAME  = 'AR_PEDOC_AEGRU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX AEGRU_GRUPO.AR_PEDOC_AEGRU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('AEGRU_GRUPO')
            AND   NAME  = 'AR_AEPER_AEGRU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX AEGRU_GRUPO.AR_AEPER_AEGRU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('AEGRU_GRUPO')
            AND   NAME  = 'AR_AEASI_AEGRU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX AEGRU_GRUPO.AR_AEASI_AEGRU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('AEGRU_GRUPO')
            AND   NAME  = 'ARMAT_MATRI_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX AEGRU_GRUPO.ARMAT_MATRI_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('AEGRU_GRUPO')
            AND   TYPE = 'U')
   DROP TABLE AEGRU_GRUPO
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('AEPER_PERIOD')
            AND   TYPE = 'U')
   DROP TABLE AEPER_PERIOD
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('ARASR_PRERREQ')
            AND   NAME  = 'ASIGNATURAREQUISITO_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX ARASR_PRERREQ.ASIGNATURAREQUISITO_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('ARASR_PRERREQ')
            AND   NAME  = 'REQ_ASIGNATURA_OBJETIVO_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX ARASR_PRERREQ.REQ_ASIGNATURA_OBJETIVO_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('ARASR_PRERREQ')
            AND   TYPE = 'U')
   DROP TABLE ARASR_PRERREQ
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('FEDEU_DEUDA')
            AND   NAME  = 'FR_AEEST_FEDEU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX FEDEU_DEUDA.FR_AEEST_FEDEU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('FEDEU_DEUDA')
            AND   TYPE = 'U')
   DROP TABLE FEDEU_DEUDA
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('FEPAG_PAGO')
            AND   NAME  = 'FR_AEEST_FEPAG_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX FEPAG_PAGO.FR_AEEST_FEPAG_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('FEPAG_PAGO')
            AND   TYPE = 'U')
   DROP TABLE FEPAG_PAGO
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('PEASI_ASIGNACION_ROL')
            AND   NAME  = 'PR_PEAS_PEROL_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX PEASI_ASIGNACION_ROL.PR_PEAS_PEROL_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEASI_ASIGNACION_ROL')
            AND   TYPE = 'U')
   DROP TABLE PEASI_ASIGNACION_ROL
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('PECAR_CARGO')
            AND   NAME  = 'PR_PEDEP_PECAR_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX PECAR_CARGO.PR_PEDEP_PECAR_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PECAR_CARGO')
            AND   TYPE = 'U')
   DROP TABLE PECAR_CARGO
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEDEP_DEPAR')
            AND   TYPE = 'U')
   DROP TABLE PEDEP_DEPAR
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEDOC_DOCEN')
            AND   TYPE = 'U')
   DROP TABLE PEDOC_DOCEN
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('PEEMP_EMPLE')
            AND   NAME  = 'PR_PEESC_PEEMP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX PEEMP_EMPLE.PR_PEESC_PEEMP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('PEEMP_EMPLE')
            AND   NAME  = 'PR_PESEX_PEEMP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX PEEMP_EMPLE.PR_PESEX_PEEMP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEEMP_EMPLE')
            AND   TYPE = 'U')
   DROP TABLE PEEMP_EMPLE
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEESC_ESTCIV')
            AND   TYPE = 'U')
   DROP TABLE PEESC_ESTCIV
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('PEROL_INSTITUCIONAL')
            AND   NAME  = 'PR_PEROL_PEEMP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX PEROL_INSTITUCIONAL.PR_PEROL_PEEMP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PEROL_INSTITUCIONAL')
            AND   TYPE = 'U')
   DROP TABLE PEROL_INSTITUCIONAL
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('PESEX_SEXO')
            AND   TYPE = 'U')
   DROP TABLE PESEX_SEXO
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEEST_ESTAD')
            AND   TYPE = 'U')
   DROP TABLE XEEST_ESTAD
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEOPC_OPCIO')
            AND   NAME  = 'XR_XESIS_XEOPC_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEOPC_OPCIO.XR_XESIS_XEOPC_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEOPC_OPCIO')
            AND   TYPE = 'U')
   DROP TABLE XEOPC_OPCIO
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEOXP_OPCPE')
            AND   NAME  = 'XR_XEOPC_XEOXP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEOXP_OPCPE.XR_XEOPC_XEOXP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEOXP_OPCPE')
            AND   NAME  = 'XR_XEPER_XEOXP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEOXP_OPCPE.XR_XEPER_XEOXP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEOXP_OPCPE')
            AND   TYPE = 'U')
   DROP TABLE XEOXP_OPCPE
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEPER_PERFI')
            AND   TYPE = 'U')
   DROP TABLE XEPER_PERFI
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XESIS_SISTE')
            AND   TYPE = 'U')
   DROP TABLE XESIS_SISTE
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEUSU_USUAR')
            AND   NAME  = 'XR_PEEMP_XEUSU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEUSU_USUAR.XR_PEEMP_XEUSU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEUSU_USUAR')
            AND   NAME  = 'XR_XEEST_XEUSU_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEUSU_USUAR.XR_XEEST_XEUSU_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEUSU_USUAR')
            AND   TYPE = 'U')
   DROP TABLE XEUSU_USUAR
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEUXP_USUPE')
            AND   NAME  = 'XR_XEUSU_XEUXP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEUXP_USUPE.XR_XEUSU_XEUXP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSINDEXES
           WHERE  ID    = OBJECT_ID('XEUXP_USUPE')
            AND   NAME  = 'XR_XEPER_XEUXP_FK'
            AND   INDID > 0
            AND   INDID < 255)
   DROP INDEX XEUXP_USUPE.XR_XEPER_XEUXP_FK
go

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('XEUXP_USUPE')
            AND   TYPE = 'U')
   DROP TABLE XEUXP_USUPE
go

/*==============================================================*/
/* Table: AEASI_ASIGN                                           */
/*==============================================================*/
CREATE TABLE AEASI_ASIGN (
   AEASI_ID             VARCHAR(10)          NOT NULL,
   AEASI_CODIGO         VARCHAR(10)          NOT NULL,
   AEASI_NOMBRE         VARCHAR(20)          NOT NULL,
   AEASI_CREDITOS       INT                  NOT NULL,
   DESCRIPCIONASIGNATURA VARCHAR(100)         NULL,
   CONSTRAINT PK_AEASI_ASIGN PRIMARY KEY (AEASI_ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('AEASI_ASIGN') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'AEASI_ASIGN' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que se utiliza para almacenar las asignaturas.', 
   'user', @CURRENTUSER, 'table', 'AEASI_ASIGN'
go

/*==============================================================*/
/* Table: AECAR_CARRER                                          */
/*==============================================================*/
CREATE TABLE AECAR_CARRER (
   IDCARRERA            VARCHAR(10)          NOT NULL,
   NOMBRECARRERA        VARCHAR(20)          NOT NULL,
   CODIGOCARRERA        VARCHAR(10)          NOT NULL,
   MAX_CREDITOSCARRERA  NUMERIC(24)          NOT NULL,
   MIN_CREDITOSCARRERA  NUMERIC(12)          NOT NULL,
   CONSTRAINT PK_AECAR_CARRER PRIMARY KEY (IDCARRERA)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('AECAR_CARRER') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'AECAR_CARRER' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que representa las carreras o programas académicos. Incluye límites de créditos permitidos por periodo y sus parámetros de matrícula.', 
   'user', @CURRENTUSER, 'table', 'AECAR_CARRER'
go

/*==============================================================*/
/* Table: AEEST_ESTUD                                           */
/*==============================================================*/
CREATE TABLE AEEST_ESTUD (
   IDCARRERA            VARCHAR(10)          NOT NULL,
   AEEST_ID             VARCHAR(10)          NOT NULL,
   AEEST_CI             VARCHAR(20)          NULL,
   AEEST_NOMBRE         VARCHAR(50)          NOT NULL,
   AEEST_APELLIDOS      VARCHAR(50)          NOT NULL,
   AEEST_PROMEDIO       NUMERIC(3,2)         NOT NULL,
   AEEST_ESTADO_PAGO    BIT                  NOT NULL,
   AEEST_FECHANAC       DATETIME             NOT NULL,
   AEEST_EMAIL          VARCHAR(25)          NOT NULL,
   AEEST_CELULAR        VARCHAR(10)          NULL,
   AEEST_DIRECCION      VARCHAR(50)          NOT NULL,
   IDAEMAT              VARCHAR(10)          NOT NULL,
   FECHAAEMAT           DATETIME             NOT NULL,
   ESTADOAEMAT          VARCHAR(30)          NOT NULL,
   CONSTRAINT PK_AEEST_ESTUD PRIMARY KEY (IDCARRERA, AEEST_ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('AEEST_ESTUD') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'AEEST_ESTUD' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que almacena la información personal y académica de los estudiantes matriculados, incluyendo identificación, contacto, promedio y estado de pago.', 
   'user', @CURRENTUSER, 'table', 'AEEST_ESTUD'
go

/*==============================================================*/
/* Index: AR_AECAR_AEEST_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX AR_AECAR_AEEST_FK ON AEEST_ESTUD (IDCARRERA ASC)
go

/*==============================================================*/
/* Table: AEGRU_GRUPO                                           */
/*==============================================================*/
CREATE TABLE AEGRU_GRUPO (
   IDPERIODO            VARCHAR(10)          NOT NULL,
   AEASI_ID             VARCHAR(10)          NOT NULL,
   AEGRU_CODIGO         VARCHAR(20)          NOT NULL,
   IDCARRERA            VARCHAR(10)          NOT NULL,
   AEEST_ID             VARCHAR(10)          NOT NULL,
   PEDOC_ID             VARCHAR(10)          NOT NULL,
   AEGRU_AULA           VARCHAR(20)          NOT NULL,
   AEGRU_CUPO_MAX       INT                  NOT NULL,
   AEGRU_CUPO_ACTUAL    INT                  NOT NULL,
   HORARIOGRUPO         TEXT                 NULL,
   CONSTRAINT PK_AEGRU_GRUPO PRIMARY KEY (IDPERIODO, AEASI_ID, AEGRU_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('AEGRU_GRUPO') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'AEGRU_GRUPO' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que representa las secciones o grupos de una asignatura en un periodo determinado, con información de aula, docente, horario y cupos disponibles.', 
   'user', @CURRENTUSER, 'table', 'AEGRU_GRUPO'
go

/*==============================================================*/
/* Index: ARMAT_MATRI_FK                                        */
/*==============================================================*/




CREATE NONCLUSTERED INDEX ARMAT_MATRI_FK ON AEGRU_GRUPO (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Index: AR_AEASI_AEGRU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX AR_AEASI_AEGRU_FK ON AEGRU_GRUPO (AEASI_ID ASC)
go

/*==============================================================*/
/* Index: AR_AEPER_AEGRU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX AR_AEPER_AEGRU_FK ON AEGRU_GRUPO (IDPERIODO ASC)
go

/*==============================================================*/
/* Index: AR_PEDOC_AEGRU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX AR_PEDOC_AEGRU_FK ON AEGRU_GRUPO (PEDOC_ID ASC)
go

/*==============================================================*/
/* Table: AEPER_PERIOD                                          */
/*==============================================================*/
CREATE TABLE AEPER_PERIOD (
   IDPERIODO            VARCHAR(10)          NOT NULL,
   NOMBREPERIODO        VARCHAR(50)          NOT NULL,
   FECHA_INICIOPERIODO  DATETIME             NOT NULL,
   FECHA_FINPERIODO     DATETIME             NOT NULL,
   ACTIVOPERIODO        BIT                  NOT NULL,
   CONSTRAINT PK_AEPER_PERIOD PRIMARY KEY (IDPERIODO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('AEPER_PERIOD') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'AEPER_PERIOD' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que representa los periodos académicos (semestres, trimestres o años lectivos). Se utiliza para controlar la apertura y cierre de matrículas y grupos.', 
   'user', @CURRENTUSER, 'table', 'AEPER_PERIOD'
go

/*==============================================================*/
/* Table: ARASR_PRERREQ                                         */
/*==============================================================*/
CREATE TABLE ARASR_PRERREQ (
   AEASI_ID             VARCHAR(10)          NOT NULL,
   AEA_AEASI_ID         VARCHAR(10)          NOT NULL,
   ARASRTIPO            VARCHAR(10)          NOT NULL,
   CONSTRAINT PK_ARASR_PRERREQ PRIMARY KEY (AEASI_ID, AEA_AEASI_ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('ARASR_PRERREQ') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'ARASR_PRERREQ' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Relación N:M entre ASIGNATURA (AsignaturaObjetivo) y ASIGNATURA (AsignaturaRequisito) para definir los prerrequisitos académicos.', 
   'user', @CURRENTUSER, 'table', 'ARASR_PRERREQ'
go

/*==============================================================*/
/* Index: REQ_ASIGNATURA_OBJETIVO_FK                            */
/*==============================================================*/




CREATE NONCLUSTERED INDEX REQ_ASIGNATURA_OBJETIVO_FK ON ARASR_PRERREQ (AEA_AEASI_ID ASC)
go

/*==============================================================*/
/* Index: ASIGNATURAREQUISITO_FK                                */
/*==============================================================*/




CREATE NONCLUSTERED INDEX ASIGNATURAREQUISITO_FK ON ARASR_PRERREQ (AEASI_ID ASC)
go

/*==============================================================*/
/* Table: FEDEU_DEUDA                                           */
/*==============================================================*/
CREATE TABLE FEDEU_DEUDA (
   FEDEU_ID             VARCHAR(10)          NOT NULL,
   IDCARRERA            VARCHAR(10)          NOT NULL,
   AEEST_ID             VARCHAR(10)          NOT NULL,
   FEDEU_MONTO_PEND     DECIMAL(10,2)        NOT NULL,
   FEDEU_FECHA_LIMIT    DATETIME             NOT NULL,
   FEDEU_ESTADO_DEU     VARCHAR(30)          NOT NULL,
   CONSTRAINT PK_FEDEU_DEUDA PRIMARY KEY (FEDEU_ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('FEDEU_DEUDA') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'FEDEU_DEUDA' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que controla la morosidad o los pagos pendientes.', 
   'user', @CURRENTUSER, 'table', 'FEDEU_DEUDA'
go

/*==============================================================*/
/* Index: FR_AEEST_FEDEU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX FR_AEEST_FEDEU_FK ON FEDEU_DEUDA (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Table: FEPAG_PAGO                                            */
/*==============================================================*/
CREATE TABLE FEPAG_PAGO (
   FEPAG__ID            VARCHAR(10)          NOT NULL,
   IDCARRERA            VARCHAR(10)          NOT NULL,
   AEEST_ID             VARCHAR(10)          NOT NULL,
   FEPAG_FECHA_PAGO     DATETIME             NOT NULL,
   FEPAG_MONTO_PAGO     DECIMAL(10,2)        NOT NULL,
   FEPAG_MEDIO          VARCHAR(30)          NOT NULL,
   FEPAG_ESTADO         VARCHAR(30)          NOT NULL,
   CONSTRAINT PK_FEPAG_PAGO PRIMARY KEY (FEPAG__ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('FEPAG_PAGO') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'FEPAG_PAGO' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que registra los pagos realizados por el estudiante.', 
   'user', @CURRENTUSER, 'table', 'FEPAG_PAGO'
go

/*==============================================================*/
/* Index: FR_AEEST_FEPAG_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX FR_AEEST_FEPAG_FK ON FEPAG_PAGO (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Table: PEASI_ASIGNACION_ROL                                  */
/*==============================================================*/
CREATE TABLE PEASI_ASIGNACION_ROL (
   PEASI_CODIGO         VARCHAR(10)          NOT NULL,
   PEROL_CODIGO         VARCHAR(10)          NULL,
   PEASI_FECHA          DATETIME             NOT NULL,
   PEASI_ESTADO         VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PEASI_ASIGNACION_ROL PRIMARY KEY (PEASI_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEASI_ASIGNACION_ROL') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEASI_ASIGNACION_ROL' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el rol de asignacion de una persona', 
   'user', @CURRENTUSER, 'table', 'PEASI_ASIGNACION_ROL'
go

/*==============================================================*/
/* Index: PR_PEAS_PEROL_FK                                      */
/*==============================================================*/




CREATE NONCLUSTERED INDEX PR_PEAS_PEROL_FK ON PEASI_ASIGNACION_ROL (PEROL_CODIGO ASC)
go

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
CREATE TABLE PECAR_CARGO (
   PEDEP_CODIGO         VARCHAR(10)          NOT NULL,
   PECAR_CODIGO         VARCHAR(10)          NOT NULL,
   PECAR_NOMBRE         VARCHAR(20)          NOT NULL,
   PECAR_DESCRI         VARCHAR(20)          NULL,
   CONSTRAINT PK_PECAR_CARGO PRIMARY KEY (PEDEP_CODIGO, PECAR_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PECAR_CARGO') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PECAR_CARGO' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el el CARGO de un DEPARTAMENTO', 
   'user', @CURRENTUSER, 'table', 'PECAR_CARGO'
go

/*==============================================================*/
/* Index: PR_PEDEP_PECAR_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX PR_PEDEP_PECAR_FK ON PECAR_CARGO (PEDEP_CODIGO ASC)
go

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
CREATE TABLE PEDEP_DEPAR (
   PEDEP_CODIGO         VARCHAR(10)          NOT NULL,
   PEDEP_NOMBRE         VARCHAR(20)          NOT NULL,
   PEDEP_DESCRI         VARCHAR(20)          NULL,
   PEDEP_AREA           CHAR(10)             NULL,
   CONSTRAINT PK_PEDEP_DEPAR PRIMARY KEY (PEDEP_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEDEP_DEPAR') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEDEP_DEPAR' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el DEPARTAMENTO de una persona
   ', 
   'user', @CURRENTUSER, 'table', 'PEDEP_DEPAR'
go

/*==============================================================*/
/* Table: PEDOC_DOCEN                                           */
/*==============================================================*/
CREATE TABLE PEDOC_DOCEN (
   PEDOC_ID             VARCHAR(10)          NOT NULL,
   PEDOC_NOMBRES        VARCHAR(30)          NOT NULL,
   PEDOC_APELLIDOS      VARCHAR(30)          NOT NULL,
   PEDOC_EMAIL          VARCHAR(20)          NOT NULL,
   CEDULADOCENTE        VARCHAR(10)          NULL,
   CONSTRAINT PK_PEDOC_DOCEN PRIMARY KEY (PEDOC_ID)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEDOC_DOCEN') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEDOC_DOCEN' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que contiene los datos personales y de contacto de los docentes. Se asocia con los grupos que imparten durante cada periodo.', 
   'user', @CURRENTUSER, 'table', 'PEDOC_DOCEN'
go

/*==============================================================*/
/* Table: PEEMP_EMPLE                                           */
/*==============================================================*/
CREATE TABLE PEEMP_EMPLE (
   PEEMP_CODIGO         VARCHAR(10)          NOT NULL,
   PESEX_CODIGO         VARCHAR(10)          NOT NULL,
   PEESC_CODIGO         VARCHAR(10)          NULL,
   PEEMP_NOMBRE         VARCHAR(100)         NOT NULL,
   PEEMP_APELLIDO       VARCHAR(100)         NOT NULL,
   PEEMP_CORREO         VARCHAR(100)         NOT NULL,
   PEEMP_CEL            CHAR(10)             NULL,
   PEEMP_NACIM          DATETIME             NOT NULL,
   PEEMP_CARGAS         NUMERIC(2,0)         NOT NULL,
   PEEMP_DIRECCION      VARCHAR(100)         NULL,
   CEDULA               CHAR(10)             NOT NULL,
   CONSTRAINT PK_PEEMP_EMPLE PRIMARY KEY (PEEMP_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEEMP_EMPLE') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEEMP_EMPLE' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad que se utiliza para almacenar los empleados', 
   'user', @CURRENTUSER, 'table', 'PEEMP_EMPLE'
go

/*==============================================================*/
/* Index: PR_PESEX_PEEMP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX PR_PESEX_PEEMP_FK ON PEEMP_EMPLE (PESEX_CODIGO ASC)
go

/*==============================================================*/
/* Index: PR_PEESC_PEEMP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX PR_PEESC_PEEMP_FK ON PEEMP_EMPLE (PEESC_CODIGO ASC)
go

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
CREATE TABLE PEESC_ESTCIV (
   PEESC_CODIGO         VARCHAR(10)          NOT NULL,
   PEESC_DESCRI         VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PEESC_ESTCIV PRIMARY KEY (PEESC_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEESC_ESTCIV') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEESC_ESTCIV' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el estado civil de una persona', 
   'user', @CURRENTUSER, 'table', 'PEESC_ESTCIV'
go

/*==============================================================*/
/* Table: PEROL_INSTITUCIONAL                                   */
/*==============================================================*/
CREATE TABLE PEROL_INSTITUCIONAL (
   PEROL_CODIGO         VARCHAR(10)          NOT NULL,
   PEEMP_CODIGO         VARCHAR(10)          NULL,
   PEROL_NOMBRE         VARCHAR(20)          NOT NULL,
   PEROL_DESCRIPCION    VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_PEROL_INSTITUCIONAL PRIMARY KEY (PEROL_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PEROL_INSTITUCIONAL') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PEROL_INSTITUCIONAL' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el ROL INSTITUCIONAL de una persona', 
   'user', @CURRENTUSER, 'table', 'PEROL_INSTITUCIONAL'
go

/*==============================================================*/
/* Index: PR_PEROL_PEEMP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX PR_PEROL_PEEMP_FK ON PEROL_INSTITUCIONAL (PEEMP_CODIGO ASC)
go

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
CREATE TABLE PESEX_SEXO (
   PESEX_CODIGO         VARCHAR(10)          NOT NULL,
   PESEX_DESCRI         VARCHAR(50)          NOT NULL,
   CONSTRAINT PK_PESEX_SEXO PRIMARY KEY (PESEX_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('PESEX_SEXO') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'PESEX_SEXO' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para representar el sexo o genero de una persona', 
   'user', @CURRENTUSER, 'table', 'PESEX_SEXO'
go

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
CREATE TABLE XEEST_ESTAD (
   XEEST_CODIGO         CHAR(1)              NOT NULL,
   XEEST_DESCRI         VARCHAR(50)          NOT NULL,
   CONSTRAINT PK_XEEST_ESTAD PRIMARY KEY (XEEST_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEEST_ESTAD') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEEST_ESTAD' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para gestionar el estado de las difetrentes tablas', 
   'user', @CURRENTUSER, 'table', 'XEEST_ESTAD'
go

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
CREATE TABLE XEOPC_OPCIO (
   XEOPC_CODIGO         CHAR(3)              NOT NULL,
   XESIS_CODIGO         CHAR(1)              NOT NULL,
   XEOPC_DESCRI         VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_XEOPC_OPCIO PRIMARY KEY (XEOPC_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEOPC_OPCIO') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEOPC_OPCIO' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para realizar el registro de las diferentes opciones de un sistema', 
   'user', @CURRENTUSER, 'table', 'XEOPC_OPCIO'
go

/*==============================================================*/
/* Index: XR_XESIS_XEOPC_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XESIS_XEOPC_FK ON XEOPC_OPCIO (XESIS_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
CREATE TABLE XEOXP_OPCPE (
   XEOPC_CODIGO         CHAR(3)              NOT NULL,
   XEPER_CODIGO         CHAR(8)              NOT NULL,
   XEOXP_FECASI         DATETIME             NOT NULL,
   XEOXP_FECRET         DATETIME             NULL,
   CONSTRAINT PK_XEOXP_OPCPE PRIMARY KEY (XEOPC_CODIGO, XEPER_CODIGO, XEOXP_FECASI)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEOXP_OPCPE') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEOXP_OPCPE' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para llevar el registro de las opciones que pertenecen a un perfil', 
   'user', @CURRENTUSER, 'table', 'XEOXP_OPCPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEOXP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XEPER_XEOXP_FK ON XEOXP_OPCPE (XEPER_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_XEOPC_XEOXP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XEOPC_XEOXP_FK ON XEOXP_OPCPE (XEOPC_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
CREATE TABLE XEPER_PERFI (
   XEPER_CODIGO         CHAR(8)              NOT NULL,
   XEPER_DESCRI         VARCHAR(100)         NOT NULL,
   XEPER_OBSER          TEXT                 NULL,
   CONSTRAINT PK_XEPER_PERFI PRIMARY KEY (XEPER_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEPER_PERFI') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEPER_PERFI' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para realizar la gestión de los diferentes perfiles', 
   'user', @CURRENTUSER, 'table', 'XEPER_PERFI'
go

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
CREATE TABLE XESIS_SISTE (
   XESIS_CODIGO         CHAR(1)              NOT NULL,
   XESIS_DESCRI         VARCHAR(50)          NOT NULL,
   CONSTRAINT PK_XESIS_SISTE PRIMARY KEY (XESIS_CODIGO)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XESIS_SISTE') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XESIS_SISTE' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para realziar la gestión de los diferentes subsistemas', 
   'user', @CURRENTUSER, 'table', 'XESIS_SISTE'
go

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
CREATE TABLE XEUSU_USUAR (
   PEEMP_CODIGO         VARCHAR(10)          NOT NULL,
   XEUSU_PASWD          VARCHAR(16)          NOT NULL,
   XEEST_CODIGO         CHAR(1)              NOT NULL,
   XEUSU_FECCRE         DATETIME             NOT NULL,
   XEUSU_FECMOD         DATETIME             NOT NULL,
   XEUSU_PIEFIR         VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_XEUSU_USUAR PRIMARY KEY (PEEMP_CODIGO, XEUSU_PASWD)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEUSU_USUAR') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEUSU_USUAR' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad relacionada para gentionar los usuario que ingrsan al sistema', 
   'user', @CURRENTUSER, 'table', 'XEUSU_USUAR'
go

/*==============================================================*/
/* Index: XR_XEEST_XEUSU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XEEST_XEUSU_FK ON XEUSU_USUAR (XEEST_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_PEEMP_XEUSU_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_PEEMP_XEUSU_FK ON XEUSU_USUAR (PEEMP_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
CREATE TABLE XEUXP_USUPE (
   PEEMP_CODIGO         VARCHAR(10)          NOT NULL,
   XEUSU_PASWD          VARCHAR(16)          NOT NULL,
   XEPER_CODIGO         CHAR(8)              NOT NULL,
   XEUXP_FECASI         DATETIME             NOT NULL,
   XEUXP_FECRET         DATETIME             NULL,
   CONSTRAINT PK_XEUXP_USUPE PRIMARY KEY (PEEMP_CODIGO, XEUSU_PASWD, XEPER_CODIGO, XEUXP_FECASI)
)
go

IF EXISTS (SELECT 1 FROM  SYS.EXTENDED_PROPERTIES
           WHERE MAJOR_ID = OBJECT_ID('XEUXP_USUPE') AND MINOR_ID = 0)
BEGIN 
   DECLARE @CURRENTUSER SYSNAME 
SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_DROPEXTENDEDPROPERTY 'MS_Description',  
   'user', @CURRENTUSER, 'table', 'XEUXP_USUPE' 
 
END 


SELECT @CURRENTUSER = USER_NAME() 
EXECUTE SP_ADDEXTENDEDPROPERTY 'MS_Description',  
   'Entidad utilizada para realizar el registro de los diferentes usuarios que pertenecen a un perfil', 
   'user', @CURRENTUSER, 'table', 'XEUXP_USUPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEUXP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XEPER_XEUXP_FK ON XEUXP_USUPE (XEPER_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_XEUSU_XEUXP_FK                                     */
/*==============================================================*/




CREATE NONCLUSTERED INDEX XR_XEUSU_XEUXP_FK ON XEUXP_USUPE (PEEMP_CODIGO ASC,
  XEUSU_PASWD ASC)
go

ALTER TABLE AEEST_ESTUD
   ADD CONSTRAINT FK_AEEST_ES_AR_AECAR__AECAR_CA FOREIGN KEY (IDCARRERA)
      REFERENCES AECAR_CARRER (IDCARRERA)
go

ALTER TABLE AEGRU_GRUPO
   ADD CONSTRAINT FK_AEGRU_GR_ARMAT_MAT_AEEST_ES FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

ALTER TABLE AEGRU_GRUPO
   ADD CONSTRAINT FK_AEGRU_GR_AR_AEASI__AEASI_AS FOREIGN KEY (AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID)
go

ALTER TABLE AEGRU_GRUPO
   ADD CONSTRAINT FK_AEGRU_GR_AR_AEPER__AEPER_PE FOREIGN KEY (IDPERIODO)
      REFERENCES AEPER_PERIOD (IDPERIODO)
go

ALTER TABLE AEGRU_GRUPO
   ADD CONSTRAINT FK_AEGRU_GR_AR_PEDOC__PEDOC_DO FOREIGN KEY (PEDOC_ID)
      REFERENCES PEDOC_DOCEN (PEDOC_ID)
go

ALTER TABLE ARASR_PRERREQ
   ADD CONSTRAINT FK_ARASR_PR_ASIGNATUR_AEASI_AS FOREIGN KEY (AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID)
go

ALTER TABLE ARASR_PRERREQ
   ADD CONSTRAINT FK_ARASR_PR_REQ_ASIGN_AEASI_AS FOREIGN KEY (AEA_AEASI_ID)
      REFERENCES AEASI_ASIGN (AEASI_ID)
go

ALTER TABLE FEDEU_DEUDA
   ADD CONSTRAINT FK_FEDEU_DE_FR_AEEST__AEEST_ES FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

ALTER TABLE FEPAG_PAGO
   ADD CONSTRAINT FK_FEPAG_PA_FR_AEEST__AEEST_ES FOREIGN KEY (IDCARRERA, AEEST_ID)
      REFERENCES AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

ALTER TABLE PEASI_ASIGNACION_ROL
   ADD CONSTRAINT FK_PEASI_AS_PR_PEAS_P_PEROL_IN FOREIGN KEY (PEROL_CODIGO)
      REFERENCES PEROL_INSTITUCIONAL (PEROL_CODIGO)
go

ALTER TABLE PECAR_CARGO
   ADD CONSTRAINT FK_PECAR_CA_PR_PEDEP__PEDEP_DE FOREIGN KEY (PEDEP_CODIGO)
      REFERENCES PEDEP_DEPAR (PEDEP_CODIGO)
go

ALTER TABLE PEEMP_EMPLE
   ADD CONSTRAINT FK_PEEMP_EM_PR_PEESC__PEESC_ES FOREIGN KEY (PEESC_CODIGO)
      REFERENCES PEESC_ESTCIV (PEESC_CODIGO)
go

ALTER TABLE PEEMP_EMPLE
   ADD CONSTRAINT FK_PEEMP_EM_PR_PESEX__PESEX_SE FOREIGN KEY (PESEX_CODIGO)
      REFERENCES PESEX_SEXO (PESEX_CODIGO)
go

ALTER TABLE PEROL_INSTITUCIONAL
   ADD CONSTRAINT FK_PEROL_IN_PR_PEROL__PEEMP_EM FOREIGN KEY (PEEMP_CODIGO)
      REFERENCES PEEMP_EMPLE (PEEMP_CODIGO)
go

ALTER TABLE XEOPC_OPCIO
   ADD CONSTRAINT FK_XEOPC_OP_XR_XESIS__XESIS_SI FOREIGN KEY (XESIS_CODIGO)
      REFERENCES XESIS_SISTE (XESIS_CODIGO)
go

ALTER TABLE XEOXP_OPCPE
   ADD CONSTRAINT FK_XEOXP_OP_XR_XEOPC__XEOPC_OP FOREIGN KEY (XEOPC_CODIGO)
      REFERENCES XEOPC_OPCIO (XEOPC_CODIGO)
go

ALTER TABLE XEOXP_OPCPE
   ADD CONSTRAINT FK_XEOXP_OP_XR_XEPER__XEPER_PE FOREIGN KEY (XEPER_CODIGO)
      REFERENCES XEPER_PERFI (XEPER_CODIGO)
go

ALTER TABLE XEUSU_USUAR
   ADD CONSTRAINT FK_XEUSU_US_XR_PEEMP__PEEMP_EM FOREIGN KEY (PEEMP_CODIGO)
      REFERENCES PEEMP_EMPLE (PEEMP_CODIGO)
go

ALTER TABLE XEUSU_USUAR
   ADD CONSTRAINT FK_XEUSU_US_XR_XEEST__XEEST_ES FOREIGN KEY (XEEST_CODIGO)
      REFERENCES XEEST_ESTAD (XEEST_CODIGO)
go

ALTER TABLE XEUXP_USUPE
   ADD CONSTRAINT FK_XEUXP_US_XR_XEPER__XEPER_PE FOREIGN KEY (XEPER_CODIGO)
      REFERENCES XEPER_PERFI (XEPER_CODIGO)
go

ALTER TABLE XEUXP_USUPE
   ADD CONSTRAINT FK_XEUXP_US_XR_XEUSU__XEUSU_US FOREIGN KEY (PEEMP_CODIGO, XEUSU_PASWD)
      REFERENCES XEUSU_USUAR (PEEMP_CODIGO, XEUSU_PASWD)
go

