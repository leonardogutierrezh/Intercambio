DROP SCHEMA "dycicle" CASCADE;

CREATE SCHEMA "dycicle"
  AUTHORIZATION postgres;
GRANT ALL ON SCHEMA "dycicle" TO postgres;

/* Entidad principal USUARIO necesaria para acceder al sistema */
CREATE TABLE "dycicle".USUARIO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Email		VARCHAR(30)	NOT NULL,
	Privilegio	NUMERIC(2)	NOT NULL,
	Nombre		VARCHAR(100)	NOT NULL,
	Contrasena	VARCHAR(30)	NOT NULL,
        FechaCreacion	DATE            NOT NULL default CURRENT_DATE,
	CONSTRAINT 	PK_Usuario	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

CREATE TABLE "dycicle".SISTEMA(
        Cerrado         Boolean         NOT NULL,
        FechaIni        DATE            NULL,
        FechaFin        DATE            NULL,
        CONSTRAINT      PK_Sistema      PRIMARY KEY (Cerrado)
)
WITH (
OIDS = FALSE
);

/* Entidad ESTUDIANTE la cual contiene todos los datos
 * correspondientes  a este tipo de usuario necesarios
 * para  postularse  a  un  intercambio             */
CREATE TABLE "dycicle".ESTUDIANTE(
	NombreUsuario	VARCHAR(20)	NOT NULL,
        Origen          VARCHAR(50),
 	PrimerNombre 	VARCHAR(30)	NOT NULL,
        SegundoNombre 	VARCHAR(30),
	PrimerApellido	VARCHAR(30)	NOT NULL,
        SegundoApellido	VARCHAR(30),
        CarreraEst      VARCHAR(30),
 	Sexo		VARCHAR(10),
        Urbanizacion    VARCHAR(30), /*O sector o barrio*/
        Calle           VARCHAR(30),
        Edificio        VARCHAR(30), /*O numero de casa*/
        Apartamento     VARCHAR(20),
        Ciudad          VARCHAR(30),
        Estado          VARCHAR(30),
        CodPostal       VARCHAR(30),
	TelefonoCel	VARCHAR(30),
	TelefonoCasa	VARCHAR(30),
	Fax		VARCHAR(30),
        Email           VARCHAR(30),
	FechaNac	VARCHAR(40),
        Nacionalidad    VARCHAR(100),
	Comentario	TEXT,
	CONSTRAINT	PK_Estudiante	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  que  pertenecen  a  la  USB */
CREATE TABLE "dycicle".EstudianteUSB(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Cedula		VARCHAR(10)	,
	Carnet		VARCHAR(10)	,
	CONSTRAINT	PK_EstudianteUSB	
		PRIMARY KEY (NombreUsuario, Carnet)
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  internacionales             */
CREATE TABLE "dycicle".EstudianteInternacional(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Pasaporte	VARCHAR(100)	NOT NULL,
	LenguaMaterna	VARCHAR(40)	NOT NULL,
        PaisOrigen      VARCHAR(100)    NOT NULL,
        UniOrigen       VARCHAR(100)    NOT NULL,
        CursoEspaniol   VARCHAR(4)      NOT NULL,     
	CONSTRAINT	PK_EstudianteInternacional	
		PRIMARY KEY (NombreUsuario, Pasaporte)
);

/* En esta tabla se tienen todos los datos referentes
 * a  los  archivos  de  los  estudiantes  USB     */
CREATE TABLE "dycicle".ArchivosEstudiante(
	NombreUsuario	VARCHAR(20)	NOT NULL,	
	Direccion	VARCHAR(200)	NOT NULL,
	CONSTRAINT	PK_ArchivosEstudiante	
		PRIMARY KEY (NombreUsuario, Direccion)
);

/* En esta tabla se almacena la relacion de los estudiantes con
 * los archivos que han cargado al sistema */

CREATE TABLE "dycicle".Carga(
        NombreUsuario	VARCHAR(20)	NOT NULL,	
	Direccion	VARCHAR(30)	NOT NULL,
        CONSTRAINT	PK_Carga	
		PRIMARY KEY (NombreUsuario, Direccion)
);

/* En esta tabla se tienen todos los datos correspondientes
 * al  antecedente  academico  de  cada  estudiante      */
CREATE TABLE "dycicle".AntecedenteAcademico(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Indice		NUMERIC(5,4),
        Decanato        VARCHAR(50),
        AreaDeEstudio   VARCHAR(100)    NOT NULL,
	Carrera		VARCHAR(30)	NOT NULL,
        Opcion          VARCHAR(30)     NOT NULL,
        CredAprob       NUMERIC(4),
        AnioIngreso     NUMERIC(4),
        AniosAprob      NUMERIC(2),
        CoordMovilidad  VARCHAR(100),
        CoordAcademico  VARCHAR(100),
	CONSTRAINT	PK_AntecedenteAcademico	
		PRIMARY KEY (NombreUsuario)
);

/* En esta tabla se tienen todos los datos correspondientes
 * al  plan  de  estudios  de  cada  estudiante          */
CREATE TABLE "dycicle".PlanEstudio(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	CodigoUSB	VARCHAR(10)	NOT NULL,
	MateriaUSB	VARCHAR(50)	NOT NULL,
	CreditoUSB	INT     	NOT NULL,
	CodigoUniv	VARCHAR(10)	NOT NULL,
	MateriaUniv	VARCHAR(50)	NOT NULL,
        CreditoUniv     INT             NOT NULL,
	CONSTRAINT	PK_PlanEstudio	
		PRIMARY KEY (NombreUsuario,CodigoUSB)
);

/* En  esta  tabla  se  tienen  todos los datos necesarios
 * de los representantes de un estudiante en particular */
CREATE TABLE "dycicle".REPRESENTANTE(
       NombreUsuario   VARCHAR(20)     NOT NULL,
       Nombres         VARCHAR(60)     NOT NULL,
       Apellidos       VARCHAR(60)     NOT NULL,
       TelefonoCel     VARCHAR(30)     NOT NULL,
       TelefonoHab     VARCHAR(30),
       EmailRep        VARCHAR(30)     NOT NULL,
       TipoRelacion    VARCHAR(30)     NOT NULL,
       Direccion       VARCHAR(140)    NOT NULL,
       CONSTRAINT        PK_REPRESENTANTE
               PRIMARY KEY (NombreUsuario)
);

/* Tabla que almacena la forma de financiamiento de un estudiante  */
CREATE TABLE "dycicle".FINANCIAMIENTO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	PpalFuente      VARCHAR(30)     NOT NULL,
        DescrFuente     TEXT,
        TieneBecaDe     VARCHAR(30)     NOT NULL,
        DescrBeca       TEXT,
	CONSTRAINT	PK_FINANCIAMIENTO
		PRIMARY KEY (NombreUsuario,PpalFuente)
);

/* Tabla que almacena los administradores del sistema */
CREATE TABLE "dycicle".ADMINISTRADOR(
        NombreUsuario   VARCHAR(20)     NOT NULL,
        CONSTRAINT      PK_ADMINISTRADOR
                PRIMARY KEY(NombreUsuario)
);


/* Tabla almacena las noticias publicadas por un 
 * gestor ,  asi  como  sus  modificaciones   */
CREATE TABLE "dycicle".NOTICIAS(
	Nombre		VARCHAR(30)	NOT NULL,
	Informacion	TEXT		NOT NULL,
        Fecha		timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_NOTICIAS
		PRIMARY KEY (Nombre, Fecha)
);

/* Tabla que guarda las relaciones existentes entre los
 * gestores   y  las  noticias  que  han  gestionado */
CREATE TABLE "dycicle".Maneja(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Nombre		VARCHAR(30)	NOT NULL,
	Fecha		DATE		NOT NULL,
	CONSTRAINT	PK_Maneja
		PRIMARY KEY (NombreUsuario,Nombre, Fecha)
);	

/* Entidad POSTULANTE la cual comprende  las coordinaciones
 * y universidades extranjeras. En esta tabla se encuentran
 * todos  los  datos  pertenecientes  al  postulante     */
CREATE TABLE "dycicle".POSTULANTE(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Codigo		VARCHAR(50)	NOT NULL,
	Tipo		VARCHAR(50)	NOT NULL,
        NombreUniExt    VARCHAR(50),      
	NombreCarrera	VARCHAR(50),
	CONSTRAINT	PK_Postulante	
            PRIMARY KEY (NombreUsuario, Codigo)
)
WITH (
OIDS = FALSE
);

/* Un postulante puede postular a un estudiante */
CREATE TABLE "dycicle".Postula(
	NombreUsuarioPostulante	VARCHAR(20)	NOT NULL,
	CodigoPostulante	VARCHAR(30)	NOT NULL,
	NombreUsuarioEstudiante	VARCHAR(20)	NOT NULL,
	CONSTRAINT		PK_Postula	PRIMARY KEY (NombreUsuarioPostulante, CodigoPostulante, NombreUsuarioEstudiante)
)
WITH (
OIDS = FALSE
);

/* Entidad POSTULACION identificada por el usuario al que pertenece */
CREATE TABLE "dycicle".POSTULACION(
	NombreUsuario       VARCHAR(20)     NOT NULL,
	EstadoPostulacion   VARCHAR(30)     NOT NULL,
        Recomendacion       VARCHAR(30)     NOT NULL,
        ComentRecomend      TEXT,
        FechaCreacion       DATE            NOT NULL default CURRENT_DATE,
	CONSTRAINT          PK_Postulacion	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* Entidad GESTOR la cual comprende la DRIC y decanatos
 * En  esta  tabla  se   encuentran  todos  los   datos
 * pertenecientes   al   gestor                      */
CREATE TABLE "dycicle".GESTOR(
	NombreUsuario	VARCHAR(20)	NOT NULL,
        NombreG         VARCHAR(100)     NOT NULL,
	CONSTRAINT	PK_GESTOR	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

 CREATE TABLE "dycicle".Universidades(
       NombreUsuario   VARCHAR(20)     NOT NULL,
       Prioridad       NUMERIC(1)      NOT NULL,
       NombreUni       VARCHAR(100)    NOT NULL,
       Pais            VARCHAR(100)    NOT NULL,
       TipoPrograma    VARCHAR(100)    NOT NULL,
       NombrePrograma  VARCHAR(100)    NOT NULL,
       MesFechaIni     VARCHAR(12),
       AnioFechaIni    VARCHAR(6),
       MesFechaFin     VARCHAR(12),
       AnioFechaFin    VARCHAR(6),
       Duracion        VARCHAR(15)     NOT NULL,
       CONSTRAINT      PK_Universidades    PRIMARY KEY (NombreUsuario, NombreUni)
)
WITH(
OIDS = FALSE
);

/* Un gestor puede gestionar/editar una postulacion */
CREATE TABLE "dycicle".Gestiona(
	NombreUsuarioGestor	VARCHAR(20)	NOT NULL,
	NombreUsuarioEstudiante	VARCHAR(20)	NOT NULL,
	Cambio		VARCHAR(100)	NOT NULL,
	CONSTRAINT 	PK_Gestiona	PRIMARY KEY (NombreUsuarioGestor, NombreUsuarioEstudiante)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede acceder al log de auditoria */
CREATE TABLE "dycicle".LogAuditoria(
        NombreUsuario	VARCHAR(20)	NOT NULL,
	Accion		VARCHAR(100)	NOT NULL,
        Fecha   	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_LogAuditoria	PRIMARY KEY (NombreUsuario,Accion,Fecha)
)
WITH (
OIDS = FALSE
);

/* Entidad IDIOMAS la cual contiene, para cada idioma,
 * el nombre del idioma  y  su nivel tanto verbal como
 * escrito                                          */
CREATE TABLE "dycicle".IDIOMAS(
        NombreUsuario   VARCHAR(20)     NOT NULL,
	NombreIdioma	VARCHAR(30)	NOT NULL,
	NivelVerbal	VARCHAR(15)	NOT NULL,
	NivelEscrito	VARCHAR(15)	NOT NULL,
        NivelConversacional VARCHAR(15) NOT NULL,
        NivelAuditivo VARCHAR(15) NOT NULL,
	CONSTRAINT 	PK_IDIOMAS	PRIMARY KEY (NombreUsuario,NombreIdioma)
)
WITH (
OIDS = FALSE
);

-------------------------------------------------------------
----------------------RESTRICCIONES--------------------------
-------------------------------------------------------------

-------------------------USUARIO---------------------------------
/* Rango de los Privilegios */
ALTER TABLE "dycicle".USUARIO  ADD
  CHECK ((0 < Privilegio) AND (Privilegio < 7));

/* Longitud de contrasena mayor a 6 caracteres para un usuario*/
ALTER TABLE "dycicle".USUARIO ADD
  CHECK (char_length(Contrasena) > 5);

/* El email de un usuario debe contener un @ */
ALTER TABLE "dycicle".USUARIO ADD
  CHECK (Email ~~ '%@%');

-------------------------ESTUDIANTE--------------------------------
/* Claves foraneas de ESTUDIANTE a USUARIO */
ALTER TABLE "dycicle".ESTUDIANTE ADD
  CONSTRAINT FK_Estudiante_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;

----------------------ESTUDIANTE USB--------------------------------- 
/* Claves foraneas de EstudianteUSB */
ALTER TABLE "dycicle".EstudianteUSB ADD
  CONSTRAINT FK_EstudianteUSB_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".ESTUDIANTE;

---------------------ESTUDIANTE Internacional---------------------------
/*Las opciones sobre tomar un curso de español son Si o No 
ALTER TABLE "dycicle".EstudianteInternacional ADD
  CHECK (CursoEspaniol ~~ 'Sí' OR CursoEspaniol ~~ 'No')*/

/* Claves foraneas de EstudianteInternacional */
ALTER TABLE "dycicle".EstudianteInternacional ADD
  CONSTRAINT FK_EstudianteInternacional_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;

------------------------Archivos estudiante------------------------------
/* Claves foraneas de ArchivosEstudiante */
ALTER TABLE "dycicle".ArchivosEstudiante ADD
  CONSTRAINT FK_ArchivosEstudiante_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;  

------------------------------Carga-------------------------------------
/* Claves foraneas de Carga*/
ALTER TABLE "dycicle".Carga ADD
  CONSTRAINT FK_Carga_Archivo FOREIGN KEY (NombreUsuario, Direccion)
    REFERENCES "dycicle".ArchivosEstudiante;
  
----------------------ANTECEDENTE ACADEMICO-----------------------------
/* El indice debe estar entre 1 y 5 */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CHECK ((1.0000 <= Indice) AND (Indice <= 5.0000));

/* La cantidad de creditos aprobados es mayor que 0 */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CHECK (CredAprob >= 0);

/*La cantidad de años aprobados debe ser mayor que cero*/
ALTER TABLE "dycicle".AntecedenteAcademico ADD
    CHECK (AniosAprob >= 0);

/* Claves foraneas de AntecedenteAcademico */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CONSTRAINT FK_AntecedenteAcademico_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;
    
--------------------------PLAN DE ESTUDIO------------------------------
/*La cantidad de creditos debe ser mayor que 0*/
ALTER TABLE "dycicle".PlanEstudio ADD
  CHECK (CreditoUSB > 0);

ALTER TABLE "dycicle".PlanEstudio ADD
  CHECK (CreditoUniv > 0);

/* Claves foraneas de PlanEstudio */
ALTER TABLE "dycicle".PlanEstudio ADD
  CONSTRAINT FK_PlanEstudio_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;    
  
----------------------------REPRESENTANTE------------------------------ 
/* El email de un representante debe contener un @ */
ALTER TABLE "dycicle".REPRESENTANTE ADD
  CHECK (EmailRep ~~ '%@%');

/* Claves foraneas de Representante */
ALTER TABLE "dycicle".Representante ADD
  CONSTRAINT FK_Representante_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;

----------------------------FINANCIAMIENTO------------------------------    
/*Claves foraneas de Financiamiento */
ALTER TABLE "dycicle".FINANCIAMIENTO ADD
        CONSTRAINT FK_Financiamiento_Estudiante FOREIGN KEY (NombreUsuario)
                REFERENCES "dycicle".Estudiante;

----------------------------ADMINISTRADOR------------------------------
/*Claves foraneas de Administrador*/
ALTER TABLE "dycicle".ADMINISTRADOR ADD
        CONSTRAINT FK_ADMINISTRADOR_USUARIO FOREIGN KEY (NombreUsuario)
                REFERENCES "dycicle".USUARIO;   

----------------------------MANEJA------------------------------
/* Claves foraneas de Maneja */
ALTER TABLE "dycicle".Maneja ADD
  CONSTRAINT FK_Maneja_USUARIO FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".ADMINISTRADOR;

ALTER TABLE "dycicle".Maneja ADD
  CONSTRAINT FK_Maneja_NOTICIAS FOREIGN KEY (Nombre, Fecha)
    REFERENCES "dycicle".NOTICIAS;
    
----------------------------POSTULANTE------------------------------
/* En POSTULANTE: Si Tipo=Coordinacion => NombreUniExt=NULL 
          Si Tipo=UnivExtranjera => NombreCarrera=NULL*/
ALTER TABLE "dycicle".POSTULANTE ADD
    CHECK ((Tipo='Coordinacion' AND NombreUniExt=NULL) OR
           (Tipo='UnivExtranjera' AND NombreCarrera=NULL));   

/* Claves foraneas de POSTULANTE */
ALTER TABLE "dycicle".POSTULANTE ADD
  CONSTRAINT FK_Postulante_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;

-------------------------------POSTULA----------------------------------
/* Claves foraneas de Postula */
ALTER TABLE "dycicle".Postula ADD
  CONSTRAINT FK_Postula_Estudiante FOREIGN KEY (NombreUsuarioEstudiante)
    REFERENCES "dycicle".ESTUDIANTE (NombreUsuario);

ALTER TABLE "dycicle".Postula ADD
  CONSTRAINT FK_Postula_Postulante FOREIGN KEY (NombreUsuarioPostulante, CodigoPostulante)
    REFERENCES "dycicle".POSTULANTE (NombreUsuario, Codigo);

-----------------------------POSTULACION--------------------------------    
/*Claves foraneas de postulacion*/
ALTER TABLE "dycicle".POSTULACION ADD
  CONSTRAINT FK_Postulacion_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante(NombreUsuario);
    
-----------------------------GESTOR----------------------------------
/* Claves foraneas de GESTOR */
ALTER TABLE "dycicle".GESTOR ADD
  CONSTRAINT FK_GESTOR_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;
    
-----------------------------UNIVERSIDADES------------------------------
/*La prioridad de una universidad es 1 o 2 segun sea primera o segunda opcion*/
ALTER TABLE "dycicle".Universidades ADD
  CHECK (Prioridad = '1' OR Prioridad = '2');

/*El año de inicio tiene que ser menor o igual que el año de fin*/
ALTER TABLE "dycicle".Universidades ADD
  CHECK (AnioFechaIni <= AnioFechaFin);

/* Clave foranea de Universidades*/
ALTER TABLE "dycicle".Universidades ADD
       CONSTRAINT FK_Universidades_Estudiante FOREIGN KEY (NombreUsuario)
               REFERENCES "dycicle".ESTUDIANTE;

-------------------------------GESTIONA--------------------------------
/* Claves foraneas de Gestiona */
ALTER TABLE "dycicle".Gestiona ADD
  CONSTRAINT FK_Gestiona_GESTOR FOREIGN KEY (NombreUsuarioGestor)
    REFERENCES "dycicle".GESTOR(NombreUsuario);

ALTER TABLE "dycicle".Gestiona ADD
  CONSTRAINT FK_Gestiona_Postulacion FOREIGN KEY (NombreUsuarioEstudiante)
    REFERENCES "dycicle".POSTULACION(NombreUsuario);



/* INSERT de un usuario administrador por defecto */
INSERT INTO "dycicle".USUARIO VALUES ( 'admin','admin@sgi.com', 1, 'Administrador', 'admin1234');
INSERT INTO "dycicle".ADMINISTRADOR VALUES ('admin');

/*INSERT de gestor*/

INSERT INTO "dycicle".USUARIO VALUES ( 'gestor','gestor@sgi.com', 2, 'Decanato', 'gestor1234');
INSERT INTO "dycicle".GESTOR VALUES ('gestor','Decanato de Estudios Profesionales');

/*INSERT de dos postulantes: Materiales y computacion*/
INSERT INTO "dycicle".USUARIO VALUES ( 'materiales','MaterialistasUnidos@gmail.com', 3, 'Materiales', 'materiales1234');
INSERT INTO "dycicle".POSTULANTE VALUES ('materiales','1500','Coordinacion',null,'Ingenieria de Materiales');
INSERT INTO "dycicle".USUARIO VALUES ( 'computacion','ComputistasLocos@gmail.com', 3, 'Computacion', 'computacion1234');
INSERT INTO "dycicle".POSTULANTE VALUES ('computacion','0800','Coordinacion',null,'Ingenieria de Computacion');

/*INSERT de estudiantes de computacion*/
INSERT INTO "dycicle".USUARIO VALUES ( 'brahyam','meneses.brahyam@gmail.com', 5, 'Brahyam', 'brahyam1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'brahyam',null,'Brahyam','Steffano','Meneses','Moreno','Ingenieria de Computacion','Masculino','La Candelaria','Este 7','Jamarco','11-B','Caracas','Distrito Capital','1010','04264603899','02125518367','02125518367','ovasgus2508@gmail.com','30/12/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'brahyam','19721013','08-10738');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('brahyam','3.6575','Estudios Profesionales','Ingenieria','Ingenieria de Computacion','opcion','160','2008','4','Alexander Ramirez','Soraya Abad');
INSERT INTO "dycicle".POSTULACION VALUES ('brahyam','En evaluacion','recomendacion','comentario','2013-03-09');

INSERT INTO "dycicle".PLANESTUDIO VALUES ('brahyam','CI-2525','Ingenieria de Software',4,'HJI878','Analisis Cuantico',5);
INSERT INTO "dycicle".PLANESTUDIO VALUES ('brahyam','CI-2525','Ingenier Software',4,'HJI8','Analisis Cuantico',5);
INSERT INTO "dycicle".PLANESTUDIO VALUES ('brahyam','CI25','Ingenieria de Software',4,'HJ78','Anisis Cuano',3);

INSERT INTO "dycicle".REPRESENTANTE VALUES ('brahyam','Jorge Luis','Meneses Arriba','04166119360','02125518367','jorge@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('brahyam','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('brahyam',1,'Universidad de Siegen','Alemania','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('brahyam',2,'AGH Universidad de Ciencias y Tecnología','Polonia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'brahyam','Ingles','Avanzado','Avanzado','Avanzado','Avanzado');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'andrea','drea.balbas@gmail.com', 5, 'Andrea', 'andrea1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'andrea',null,'Andrea','Carolina','Machado','Moreno','Ingenieria de Computacion','Femenino','Baruta','El Placer','Esmeralda','S/N','Caracas','Miranda','1010','04266783899','02120928367','02127768367','drea.balbas@gmail.com','12/11/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'andrea','20721013','08-10740');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('andrea','3.8775','Estudios Profesionales','Ingenieria','Ingenieria de Computacion','opcion','160','2008','4','Alexander Ramirez','Soraya Abad');
INSERT INTO "dycicle".POSTULACION VALUES ('andrea','En evaluacion','recomendacion','comentario','2013-03-09');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('andrea','CI-2525','Ingenieria de Software',4,'HJI878','Analisis Cuantico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('andrea','Carlos Alfonso','Rivas Mendoza','04166119360','02125518367','carlos@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('andrea','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('andrea',1,'Universidad Estadual de Campinas','Brasil','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('andrea',2,'Universidad del Valle','Colombia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'andrea','Ingles','Avanzado','Avanzado','Avanzado','Avanzado');

/*INSERT de estudiantes de materiales*/
INSERT INTO "dycicle".USUARIO VALUES ( 'sofia','sofia@gmail.com', 5, 'Sofia', 'sofia1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'sofia',null,'Sofia','Luisa','Vergara','Mendoza','Ingenieria de Materiales','Femenino','Baruta','Piedra Azul','Dolores','S/N','Caracas','Miranda','1010','04266783899','02120928367','02127768367','sofia@gmail.com','15/10/1993','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'sofia','20721013','08-10760');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('sofia','3.3745','Estudios Profesionales','Ingenieria','Ingenieria de Materiales','opcion','160','2008','4','Alexander Ramirez','Carlitos Machado');
INSERT INTO "dycicle".POSTULACION VALUES ('sofia','En evaluacion','recomendacion','comentario','2013-03-09');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('sofia','MA-3425','Ingenieria de Materiales',4,'HJI878','Analisis Logico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('sofia','Sancho Alfonso','Panzas Mendoza','04146239360','02126513367','sancho@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('sofia','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',1,'Universidad Nacional de Cuyo','Argentina','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',2,'Universidad Privada Santa Cruz de la Sierra','Bolivia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Frances','Avanzado','Avanzado','Avanzado','Avanzado');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Chino','Avanzado','Avanzado','Avanzado','Avanzado');

/*INSERT de estudiantes de mecanica*/
INSERT INTO "dycicle".USUARIO VALUES ( 'daniel','daniel@gmail.com', 5, 'Daniel', 'extranjero1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'daniel',null,'Daniel','Enrique','Moussa','Anaya','Ingenieria Mecanica','Masculino','El Silencio','Av. Lecuna','Edif. Granados','S','Caracas','Distrito Capital','1010','04264030368','02124816135','02125518367','daniel@gmail.com','30/12/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'daniel','20341098','08-87462');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('daniel','3.2345','Estudios Profesionales','Ingenieria','Ingenieria Mecanica','opcion','130','2008','4','Alexander Ramirez','Juvencio Perez');
INSERT INTO "dycicle".POSTULACION VALUES ('daniel','En evaluacion','recomendacion','comentario','2013-03-09');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('daniel','JS-4322','Aplicacion de Materiales',4,'HY1212','Aplicacion de Materiales',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('daniel','Jesus Mauricio','Moussa Anaya','04124762312','02123241242','jesus@gmail.com','Familiar','El Silencio');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('daniel','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('daniel',1,'Universidad de Tohoku','Japón','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('daniel',2,'Universidad Privada Santa Cruz de la Sierra','Bolivia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'daniel','Ingles','Medio','Medio','Medio','Avanzado');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'daniel','Japones','Basico','Basico','Basico','Avanzado');


/*INSERT de estudiantes extranjeros*/
INSERT INTO "dycicle".USUARIO VALUES ( 'extranjero','exx@gmail.com', 6, 'Yuriv', 'extranjero1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'extranjero','Rusia','Yuriv','Pdqwi','Smirnoff','Stalifnaya','Ingenieria de Producción','Masculino','El Silencio','Av. Lecuna','Edif. Granados','S','Caracas','Distrito Capital','1010','+41782372712','+418123123123','+411231231','extranjero@gmail.com','4/08/1987a','Ruso',null);
INSERT INTO "dycicle".ESTUDIANTEINTERNACIONAL VALUES ( 'extranjero','02267856','Ruso','Rusia','Universidad Tecnológica de Nagaoka','Si');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('extranjero','4.5345','Estudios Profesionales','Ingenieria','Ingenieria de Producción','opcion','200','2007','4','Alexander Ramirez','Juvencio Perez');
INSERT INTO "dycicle".POSTULACION VALUES ('extranjero','En evaluacion','recomendacion','comentario','2013-03-09');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('extranjero','JS-4322','Aplicacion de Materiales',4,'HY1212','Aplicacion de Materiales',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('extranjero','Jesus Mauricio','Moussa Anaya','04124762312','02123241242','jesus@gmail.com','Familiar','El Silencio');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('extranjero','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('extranjero',1,'Universidad de Tohoku','Japón','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('extranjero',2,'Universidad Estadual de Campinas','Brasil','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'extranjero','Ingles','Medio','Medio','Medio','Avanzado');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'extranjero','Ruso','Alto','Alto','Alto','Avanzado');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'extranjero','Japones','Basico','Basico','Basico','Avanzado');
-----------------------------------------------------------------------
/*PRUEBA DE NOTICIAS*/
INSERT INTO "dycicle".Noticias VALUES ('Inicio','holaaaaa');
INSERT INTO "dycicle".Noticias VALUES ('Inicio2','chaoooo');
INSERT INTO "dycicle".Noticias VALUES ('Inicio3','Adiossss');

INSERT INTO "dycicle".Sistema VALUES (FALSE);

INSERT INTO "dycicle".usuario VALUES ('electronica', 'ovasgus2508@gmail.com', 3, 'Coordinacion de Ingenieria Electronica', 'electronica1234', '2013-05-21');
INSERT INTO "dycicle".usuario VALUES ('luis', 'ovasgus2508@gmail.com', 5, 'Luis Roldao', 'luis1234', '2013-05-21');
INSERT INTO "dycicle".usuario VALUES ('ricardo', 'ovasgus2508@gmail.com', 5, 'Ricardo martin', 'ricardo1234', '2013-05-21');
INSERT INTO "dycicle".usuario VALUES ('diego', 'ovasgus2508@gmail.com', 5, 'Diego sanchez', 'diego1234', '2013-05-21');
INSERT INTO "dycicle".usuario VALUES ('ivana', 'ovasgus2508@gmail.com', 6, 'Ivana Bratislava', '4Zg77Vfs', '2013-05-21');

INSERT INTO "dycicle".estudiante VALUES ('luis', 'null', 'Luis', NULL, 'Roldao', NULL, 'Ingenieria Electronica', '1', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'ovasgus2508@gmail.com', '2012-11-27', 'null', 'null');
INSERT INTO "dycicle".estudiante VALUES ('ricardo', 'null', 'Ricardo', NULL, 'martin', NULL, 'Ingenieria Electronica', '1', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'ovasgus2508@gmail.com', '2012-11-27', 'null', 'null');
INSERT INTO "dycicle".estudiante VALUES ('diego', 'null', 'Diego', NULL, 'sanchez', NULL, 'Ingenieria Electronica', '1', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'ovasgus2508@gmail.com', '2012-11-27', 'null', 'null');
INSERT INTO "dycicle".estudiante VALUES ('ivana', 'null', 'Ivana', 'null', 'Bratislava', 'null', 'null', '0000', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'ovasgus2508@gmail.com', '2012-11-27', 'null', 'null');

INSERT INTO "dycicle".estudianteinternacional VALUES ('ivana', '0', 'null', 'null', 'null', 'No');
INSERT INTO "dycicle".estudianteusb VALUES ('luis', 'null', '09-10000');
INSERT INTO "dycicle".estudianteusb VALUES ('ricardo', 'null', '09-10001');
INSERT INTO "dycicle".estudianteusb VALUES ('diego', 'null', '09-10002');

INSERT INTO "dycicle".antecedenteacademico VALUES ('luis', 1.0000, 'null', 'null', 'Ingenieria Electronica', 'opcion', 0, 0, 0, 'null', 'null');
INSERT INTO "dycicle".antecedenteacademico VALUES ('ricardo', 1.0000, 'null', 'null', 'Ingenieria Electronica', 'opcion', 0, 0, 0, 'null', 'null');
INSERT INTO "dycicle".antecedenteacademico VALUES ('diego', 1.0000, 'null', 'null', 'Ingenieria Electronica', 'opcion', 0, 0, 0, 'null', 'null');
INSERT INTO "dycicle".antecedenteacademico VALUES ('ivana', 1.0000, 'null', 'null', 'null', 'opcion', 0, 0, 0, 'null', 'null');

INSERT INTO "dycicle".postulacion VALUES ('luis', 'En evaluacion', 'recomendacion', 'comentario', '2013-05-21');
INSERT INTO "dycicle".postulacion VALUES ('ricardo', 'En evaluacion', 'recomendacion', 'comentario', '2013-05-21');
INSERT INTO "dycicle".postulacion VALUES ('diego', 'En evaluacion', 'recomendacion', 'comentario', '2013-05-21');
INSERT INTO "dycicle".postulacion VALUES ('ivana', 'En evaluacion', 'recomendacion', 'comentario', '2013-05-21');

INSERT INTO "dycicle".postulante VALUES ('electronica', '1', 'Coordinacion', 'null', 'Ingenieria Electronica');