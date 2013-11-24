--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: dycicle; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dycicle;


ALTER SCHEMA dycicle OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = dycicle, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrador; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE administrador (
    nombreusuario character varying(20) NOT NULL
);


ALTER TABLE dycicle.administrador OWNER TO postgres;

--
-- Name: antecedenteacademico; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE antecedenteacademico (
    nombreusuario character varying(20) NOT NULL,
    indice numeric(5,4),
    decanato character varying(50),
    areadeestudio character varying(100) NOT NULL,
    carrera character varying(30) NOT NULL,
    opcion character varying(30) NOT NULL,
    credaprob numeric(4,0),
    anioingreso numeric(4,0),
    aniosaprob numeric(2,0),
    coordmovilidad character varying(100),
    coordacademico character varying(100),
    CONSTRAINT antecedenteacademico_aniosaprob_check CHECK ((aniosaprob >= (0)::numeric)),
    CONSTRAINT antecedenteacademico_credaprob_check CHECK ((credaprob >= (0)::numeric)),
    CONSTRAINT antecedenteacademico_indice_check CHECK (((1.0000 <= indice) AND (indice <= 5.0000)))
);


ALTER TABLE dycicle.antecedenteacademico OWNER TO postgres;

--
-- Name: archivosestudiante; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE archivosestudiante (
    nombreusuario character varying(20) NOT NULL,
    direccion character varying(200) NOT NULL
);


ALTER TABLE dycicle.archivosestudiante OWNER TO postgres;

--
-- Name: carga; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE carga (
    nombreusuario character varying(20) NOT NULL,
    direccion character varying(30) NOT NULL
);


ALTER TABLE dycicle.carga OWNER TO postgres;

--
-- Name: estudiante; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE estudiante (
    nombreusuario character varying(20) NOT NULL,
    origen character varying(50),
    primernombre character varying(30) NOT NULL,
    segundonombre character varying(30),
    primerapellido character varying(30) NOT NULL,
    segundoapellido character varying(30),
    carreraest character varying(30),
    sexo character varying(10),
    urbanizacion character varying(30),
    calle character varying(30),
    edificio character varying(30),
    apartamento character varying(20),
    ciudad character varying(30),
    estado character varying(30),
    codpostal character varying(30),
    telefonocel character varying(30),
    telefonocasa character varying(30),
    fax character varying(30),
    email character varying(30),
    fechanac character varying(40),
    nacionalidad character varying(100),
    comentario text
);


ALTER TABLE dycicle.estudiante OWNER TO postgres;

--
-- Name: estudianteinternacional; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE estudianteinternacional (
    nombreusuario character varying(20) NOT NULL,
    pasaporte character varying(100) NOT NULL,
    lenguamaterna character varying(40) NOT NULL,
    paisorigen character varying(100) NOT NULL,
    uniorigen character varying(100) NOT NULL,
    cursoespaniol character varying(4) NOT NULL
);


ALTER TABLE dycicle.estudianteinternacional OWNER TO postgres;

--
-- Name: estudianteusb; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE estudianteusb (
    nombreusuario character varying(20) NOT NULL,
    cedula character varying(10),
    carnet character varying(10) NOT NULL
);


ALTER TABLE dycicle.estudianteusb OWNER TO postgres;

--
-- Name: financiamiento; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE financiamiento (
    nombreusuario character varying(20) NOT NULL,
    ppalfuente character varying(30) NOT NULL,
    descrfuente text,
    tienebecade character varying(30) NOT NULL,
    descrbeca text
);


ALTER TABLE dycicle.financiamiento OWNER TO postgres;

--
-- Name: gestiona; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE gestiona (
    nombreusuariogestor character varying(20) NOT NULL,
    nombreusuarioestudiante character varying(20) NOT NULL,
    cambio character varying(100) NOT NULL
);


ALTER TABLE dycicle.gestiona OWNER TO postgres;

--
-- Name: gestor; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE gestor (
    nombreusuario character varying(20) NOT NULL,
    nombreg character varying(100) NOT NULL
);


ALTER TABLE dycicle.gestor OWNER TO postgres;

--
-- Name: idiomas; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE idiomas (
    nombreusuario character varying(20) NOT NULL,
    nombreidioma character varying(30) NOT NULL,
    nivelverbal character varying(15) NOT NULL,
    nivelescrito character varying(15) NOT NULL,
    nivelconversacional character varying(15) NOT NULL
);


ALTER TABLE dycicle.idiomas OWNER TO postgres;

--
-- Name: logauditoria; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE logauditoria (
    nombreusuario character varying(20) NOT NULL,
    accion character varying(100) NOT NULL,
    fecha timestamp with time zone DEFAULT ('now'::text)::timestamp(2) with time zone NOT NULL
);


ALTER TABLE dycicle.logauditoria OWNER TO postgres;

--
-- Name: maneja; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE maneja (
    nombreusuario character varying(20) NOT NULL,
    nombre character varying(30) NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE dycicle.maneja OWNER TO postgres;

--
-- Name: noticias; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE noticias (
    nombre character varying(30) NOT NULL,
    informacion text NOT NULL,
    fecha timestamp with time zone DEFAULT ('now'::text)::timestamp(2) with time zone NOT NULL
);


ALTER TABLE dycicle.noticias OWNER TO postgres;

--
-- Name: planestudio; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE planestudio (
    nombreusuario character varying(20) NOT NULL,
    codigousb character varying(10) NOT NULL,
    materiausb character varying(50) NOT NULL,
    creditousb integer NOT NULL,
    codigouniv character varying(10) NOT NULL,
    materiauniv character varying(50) NOT NULL,
    creditouniv integer NOT NULL,
    CONSTRAINT planestudio_creditouniv_check CHECK ((creditouniv > 0)),
    CONSTRAINT planestudio_creditousb_check CHECK ((creditousb > 0))
);


ALTER TABLE dycicle.planestudio OWNER TO postgres;

--
-- Name: postula; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE postula (
    nombreusuariopostulante character varying(20) NOT NULL,
    codigopostulante character varying(30) NOT NULL,
    nombreusuarioestudiante character varying(20) NOT NULL
);


ALTER TABLE dycicle.postula OWNER TO postgres;

--
-- Name: postulacion; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE postulacion (
    nombreusuario character varying(20) NOT NULL,
    estadopostulacion character varying(30) NOT NULL,
    recomendacion character varying(30) NOT NULL,
    comentrecomend text,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE dycicle.postulacion OWNER TO postgres;

--
-- Name: postulante; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE postulante (
    nombreusuario character varying(20) NOT NULL,
    codigo character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL,
    nombreuniext character varying(50),
    nombrecarrera character varying(50),
    CONSTRAINT postulante_check CHECK (((((tipo)::text = 'Coordinacion'::text) AND ((nombreuniext)::text = NULL::text)) OR (((tipo)::text = 'UnivExtranjera'::text) AND ((nombrecarrera)::text = NULL::text))))
);


ALTER TABLE dycicle.postulante OWNER TO postgres;

--
-- Name: representante; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE representante (
    nombreusuario character varying(20) NOT NULL,
    nombres character varying(60) NOT NULL,
    apellidos character varying(60) NOT NULL,
    telefonocel character varying(30) NOT NULL,
    telefonohab character varying(30),
    emailrep character varying(30) NOT NULL,
    tiporelacion character varying(30) NOT NULL,
    direccion character varying(140) NOT NULL,
    CONSTRAINT representante_emailrep_check CHECK (((emailrep)::text ~~ '%@%'::text))
);


ALTER TABLE dycicle.representante OWNER TO postgres;

--
-- Name: sistema; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE sistema (
    cerrado boolean NOT NULL,
    fechaini date,
    fechafin date
);


ALTER TABLE dycicle.sistema OWNER TO postgres;

--
-- Name: universidades; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE universidades (
    nombreusuario character varying(20) NOT NULL,
    prioridad numeric(1,0) NOT NULL,
    nombreuni character varying(100) NOT NULL,
    pais character varying(100) NOT NULL,
    tipoprograma character varying(100) NOT NULL,
    nombreprograma character varying(100) NOT NULL,
    mesfechaini character varying(12),
    aniofechaini character varying(6),
    mesfechafin character varying(12),
    aniofechafin character varying(6),
    duracion character varying(15) NOT NULL,
    CONSTRAINT universidades_check CHECK (((aniofechaini)::text <= (aniofechafin)::text)),
    CONSTRAINT universidades_prioridad_check CHECK (((prioridad = 1::numeric) OR (prioridad = 2::numeric)))
);


ALTER TABLE dycicle.universidades OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: dycicle; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    nombreusuario character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    privilegio numeric(2,0) NOT NULL,
    nombre character varying(100) NOT NULL,
    contrasena character varying(30) NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    CONSTRAINT usuario_contrasena_check CHECK ((char_length((contrasena)::text) > 5)),
    CONSTRAINT usuario_email_check CHECK (((email)::text ~~ '%@%'::text)),
    CONSTRAINT usuario_privilegio_check CHECK ((((0)::numeric < privilegio) AND (privilegio < (7)::numeric)))
);


ALTER TABLE dycicle.usuario OWNER TO postgres;

--
-- Data for Name: administrador; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY administrador (nombreusuario) FROM stdin;
admin
\.


--
-- Data for Name: antecedenteacademico; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY antecedenteacademico (nombreusuario, indice, decanato, areadeestudio, carrera, opcion, credaprob, anioingreso, aniosaprob, coordmovilidad, coordacademico) FROM stdin;
brahyam	3.6575	Estudios Profesionales	Ingenieria	Ingenieria de Computacion	opcion	160	2008	4	Alexander Ramirez	Soraya Abad
andrea	3.8775	Estudios Profesionales	Ingenieria	Ingenieria de Computacion	opcion	160	2008	4	Alexander Ramirez	Soraya Abad
sofia	3.3745	Estudios Profesionales	Ingenieria	Ingenieria de Materiales	opcion	160	2008	4	Alexander Ramirez	Carlitos Machado
daniel	3.2345	Estudios Profesionales	Ingenieria	Ingenieria Mecanica	opcion	130	2008	4	Alexander Ramirez	Juvencio Perez
extranjero	4.5345	Estudios Profesionales	Ingenieria	Ingenieria de Producción	opcion	200	2007	4	Alexander Ramirez	Juvencio Perez
luis	1.0000	null	null	Ingenieria Electronica	opcion	0	0	0	null	null
ricardo	1.0000	null	null	Ingenieria Electronica	opcion	0	0	0	null	null
diego	1.0000	null	null	Ingenieria Electronica	opcion	0	0	0	null	null
ivana	1.0000	null	null	null	opcion	0	0	0	null	null
\.


--
-- Data for Name: archivosestudiante; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY archivosestudiante (nombreusuario, direccion) FROM stdin;
\.


--
-- Data for Name: carga; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY carga (nombreusuario, direccion) FROM stdin;
\.


--
-- Data for Name: estudiante; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY estudiante (nombreusuario, origen, primernombre, segundonombre, primerapellido, segundoapellido, carreraest, sexo, urbanizacion, calle, edificio, apartamento, ciudad, estado, codpostal, telefonocel, telefonocasa, fax, email, fechanac, nacionalidad, comentario) FROM stdin;
brahyam	\N	Brahyam	Steffano	Meneses	Moreno	Ingenieria de Computacion	Masculino	La Candelaria	Este 7	Jamarco	11-B	Caracas	Distrito Capital	1010	04264603899	02125518367	02125518367	ovasgus2508@gmail.com	30/12/1990	Venezolano	\N
andrea	\N	Andrea	Carolina	Machado	Moreno	Ingenieria de Computacion	Femenino	Baruta	El Placer	Esmeralda	S/N	Caracas	Miranda	1010	04266783899	02120928367	02127768367	drea.balbas@gmail.com	12/11/1990	Venezolano	\N
sofia	\N	Sofia	Luisa	Vergara	Mendoza	Ingenieria de Materiales	Femenino	Baruta	Piedra Azul	Dolores	S/N	Caracas	Miranda	1010	04266783899	02120928367	02127768367	sofia@gmail.com	15/10/1993	Venezolano	\N
daniel	\N	Daniel	Enrique	Moussa	Anaya	Ingenieria Mecanica	Masculino	El Silencio	Av. Lecuna	Edif. Granados	S	Caracas	Distrito Capital	1010	04264030368	02124816135	02125518367	daniel@gmail.com	30/12/1990	Venezolano	\N
extranjero	Rusia	Yuriv	Pdqwi	Smirnoff	Stalifnaya	Ingenieria de Producción	Masculino	El Silencio	Av. Lecuna	Edif. Granados	S	Caracas	Distrito Capital	1010	+41782372712	+418123123123	+411231231	extranjero@gmail.com	4/08/1987a	Ruso	\N
luis	null	Luis	\N	Roldao	\N	Ingenieria Electronica	1	null	null	null	null	null	null	null	null	null	null	ovasgus2508@gmail.com	2012-11-27	null	null
ricardo	null	Ricardo	\N	martin	\N	Ingenieria Electronica	1	null	null	null	null	null	null	null	null	null	null	ovasgus2508@gmail.com	2012-11-27	null	null
diego	null	Diego	\N	sanchez	\N	Ingenieria Electronica	1	null	null	null	null	null	null	null	null	null	null	ovasgus2508@gmail.com	2012-11-27	null	null
ivana	null	Ivana	null	Bratislava	null	null	0000	null	null	null	null	null	null	null	null	null	null	ovasgus2508@gmail.com	2012-11-27	null	null
\.


--
-- Data for Name: estudianteinternacional; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY estudianteinternacional (nombreusuario, pasaporte, lenguamaterna, paisorigen, uniorigen, cursoespaniol) FROM stdin;
extranjero	02267856	Ruso	Rusia	Universidad Tecnológica de Nagaoka	Si
ivana	0	null	null	null	No
\.


--
-- Data for Name: estudianteusb; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY estudianteusb (nombreusuario, cedula, carnet) FROM stdin;
brahyam	19721013	08-10738
andrea	20721013	08-10740
sofia	20721013	08-10760
daniel	20341098	08-87462
luis	null	09-10000
ricardo	null	09-10001
diego	null	09-10002
\.


--
-- Data for Name: financiamiento; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY financiamiento (nombreusuario, ppalfuente, descrfuente, tienebecade, descrbeca) FROM stdin;
brahyam	Familiar	Ganancias de mis padres	Ninguna	Ninguna
andrea	Familiar	Ganancias de mis padres	Ninguna	Ninguna
sofia	Familiar	Ganancias de mis padres	Ninguna	Ninguna
daniel	Familiar	Ganancias de mis padres	Ninguna	Ninguna
extranjero	Familiar	Ganancias de mis padres	Ninguna	Ninguna
\.


--
-- Data for Name: gestiona; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY gestiona (nombreusuariogestor, nombreusuarioestudiante, cambio) FROM stdin;
\.


--
-- Data for Name: gestor; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY gestor (nombreusuario, nombreg) FROM stdin;
gestor	Decanato de Estudios Profesionales
\.


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY idiomas (nombreusuario, nombreidioma, nivelverbal, nivelescrito, nivelconversacional) FROM stdin;
brahyam	Ingles	Avanzado	Avanzado	Avanzado
andrea	Ingles	Avanzado	Avanzado	Avanzado
sofia	Frances	Avanzado	Avanzado	Avanzado
sofia	Chino	Avanzado	Avanzado	Avanzado
daniel	Ingles	Medio	Medio	Medio
daniel	Japones	Basico	Basico	Basico
extranjero	Ingles	Medio	Medio	Medio
extranjero	Ruso	Alto	Alto	Alto
extranjero	Japones	Basico	Basico	Basico
\.


--
-- Data for Name: logauditoria; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY logauditoria (nombreusuario, accion, fecha) FROM stdin;
\.


--
-- Data for Name: maneja; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY maneja (nombreusuario, nombre, fecha) FROM stdin;
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY noticias (nombre, informacion, fecha) FROM stdin;
Inicio	holaaaaa	2013-05-21 23:06:35.97-04:30
Inicio2	chaoooo	2013-05-21 23:06:35.98-04:30
Inicio3	Adiossss	2013-05-21 23:06:35.99-04:30
\.


--
-- Data for Name: planestudio; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY planestudio (nombreusuario, codigousb, materiausb, creditousb, codigouniv, materiauniv, creditouniv) FROM stdin;
brahyam	CI-2525	Ingenieria de Software	4	HJI878	Analisis Cuantico	5
andrea	CI-2525	Ingenieria de Software	4	HJI878	Analisis Cuantico	5
sofia	MA-3425	Ingenieria de Materiales	4	HJI878	Analisis Logico	5
daniel	JS-4322	Aplicacion de Materiales	4	HY1212	Aplicacion de Materiales	5
extranjero	JS-4322	Aplicacion de Materiales	4	HY1212	Aplicacion de Materiales	5
\.


--
-- Data for Name: postula; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY postula (nombreusuariopostulante, codigopostulante, nombreusuarioestudiante) FROM stdin;
\.


--
-- Data for Name: postulacion; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY postulacion (nombreusuario, estadopostulacion, recomendacion, comentrecomend, fechacreacion) FROM stdin;
brahyam	En evaluacion	recomendacion	comentario	2013-03-09
andrea	En evaluacion	recomendacion	comentario	2013-03-09
sofia	En evaluacion	recomendacion	comentario	2013-03-09
daniel	En evaluacion	recomendacion	comentario	2013-03-09
extranjero	En evaluacion	recomendacion	comentario	2013-03-09
luis	En evaluacion	recomendacion	comentario	2013-05-21
ricardo	En evaluacion	recomendacion	comentario	2013-05-21
diego	En evaluacion	recomendacion	comentario	2013-05-21
ivana	En evaluacion	recomendacion	comentario	2013-05-21
\.


--
-- Data for Name: postulante; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY postulante (nombreusuario, codigo, tipo, nombreuniext, nombrecarrera) FROM stdin;
materiales	1500	Coordinacion	\N	Ingenieria de Materiales
computacion	0800	Coordinacion	\N	Ingenieria de Computacion
electronica	1	Coordinacion	null	Ingenieria Electronica
\.


--
-- Data for Name: representante; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY representante (nombreusuario, nombres, apellidos, telefonocel, telefonohab, emailrep, tiporelacion, direccion) FROM stdin;
brahyam	Jorge Luis	Meneses Arriba	04166119360	02125518367	jorge@gmail.com	Familiar	La Candelaria
andrea	Carlos Alfonso	Rivas Mendoza	04166119360	02125518367	carlos@gmail.com	Familiar	La Candelaria
sofia	Sancho Alfonso	Panzas Mendoza	04146239360	02126513367	sancho@gmail.com	Familiar	La Candelaria
daniel	Jesus Mauricio	Moussa Anaya	04124762312	02123241242	jesus@gmail.com	Familiar	El Silencio
extranjero	Jesus Mauricio	Moussa Anaya	04124762312	02123241242	jesus@gmail.com	Familiar	El Silencio
\.


--
-- Data for Name: sistema; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY sistema (cerrado, fechaini, fechafin) FROM stdin;
t	\N	\N
\.


--
-- Data for Name: universidades; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY universidades (nombreusuario, prioridad, nombreuni, pais, tipoprograma, nombreprograma, mesfechaini, aniofechaini, mesfechafin, aniofechafin, duracion) FROM stdin;
brahyam	1	Universidad de Siegen	Alemania	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
brahyam	2	AGH Universidad de Ciencias y Tecnología	Polonia	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
andrea	1	Universidad Estadual de Campinas	Brasil	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
andrea	2	Universidad del Valle	Colombia	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
sofia	1	Universidad Nacional de Cuyo	Argentina	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
sofia	2	Universidad Privada Santa Cruz de la Sierra	Bolivia	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
daniel	1	Universidad de Tohoku	Japón	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
daniel	2	Universidad Privada Santa Cruz de la Sierra	Bolivia	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
extranjero	1	Universidad de Tohoku	Japón	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
extranjero	2	Universidad Estadual de Campinas	Brasil	Intercambio	SMILE	Enero	2014	Enero	2015	Año Academico
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: dycicle; Owner: postgres
--

COPY usuario (nombreusuario, email, privilegio, nombre, contrasena, fechacreacion) FROM stdin;
admin	admin@sgi.com	1	Administrador	admin1234	2013-05-21
gestor	gestor@sgi.com	2	Decanato	gestor1234	2013-05-21
materiales	MaterialistasUnidos@gmail.com	3	Materiales	materiales1234	2013-05-21
computacion	ComputistasLocos@gmail.com	3	Computacion	computacion1234	2013-05-21
brahyam	meneses.brahyam@gmail.com	5	Brahyam	brahyam1234	2013-05-21
andrea	drea.balbas@gmail.com	5	Andrea	andrea1234	2013-05-21
sofia	sofia@gmail.com	5	Sofia	sofia1234	2013-05-21
daniel	daniel@gmail.com	5	Daniel	extranjero1234	2013-05-21
extranjero	exx@gmail.com	6	Yuriv	extranjero1234	2013-05-21
electronica	ovasgus2508@gmail.com	3	Coordinacion de Ingenieria Electronica	electronica1234	2013-05-21
luis	ovasgus2508@gmail.com	5	Luis Roldao	luis1234	2013-05-21
ricardo	ovasgus2508@gmail.com	5	Ricardo martin	ricardo1234	2013-05-21
diego	ovasgus2508@gmail.com	5	Diego sanchez	diego1234	2013-05-21
ivana	ovasgus2508@gmail.com	6	Ivana Bratislava	4Zg77Vfs	2013-05-21
\.


--
-- Name: pk_administrador; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrador
    ADD CONSTRAINT pk_administrador PRIMARY KEY (nombreusuario);


--
-- Name: pk_antecedenteacademico; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY antecedenteacademico
    ADD CONSTRAINT pk_antecedenteacademico PRIMARY KEY (nombreusuario);


--
-- Name: pk_archivosestudiante; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivosestudiante
    ADD CONSTRAINT pk_archivosestudiante PRIMARY KEY (nombreusuario, direccion);


--
-- Name: pk_carga; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT pk_carga PRIMARY KEY (nombreusuario, direccion);


--
-- Name: pk_estudiante; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estudiante
    ADD CONSTRAINT pk_estudiante PRIMARY KEY (nombreusuario);


--
-- Name: pk_estudianteinternacional; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estudianteinternacional
    ADD CONSTRAINT pk_estudianteinternacional PRIMARY KEY (nombreusuario, pasaporte);


--
-- Name: pk_estudianteusb; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estudianteusb
    ADD CONSTRAINT pk_estudianteusb PRIMARY KEY (nombreusuario, carnet);


--
-- Name: pk_financiamiento; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY financiamiento
    ADD CONSTRAINT pk_financiamiento PRIMARY KEY (nombreusuario, ppalfuente);


--
-- Name: pk_gestiona; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gestiona
    ADD CONSTRAINT pk_gestiona PRIMARY KEY (nombreusuariogestor, nombreusuarioestudiante);


--
-- Name: pk_gestor; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gestor
    ADD CONSTRAINT pk_gestor PRIMARY KEY (nombreusuario);


--
-- Name: pk_idiomas; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idiomas
    ADD CONSTRAINT pk_idiomas PRIMARY KEY (nombreusuario, nombreidioma);


--
-- Name: pk_logauditoria; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logauditoria
    ADD CONSTRAINT pk_logauditoria PRIMARY KEY (nombreusuario, accion, fecha);


--
-- Name: pk_maneja; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY maneja
    ADD CONSTRAINT pk_maneja PRIMARY KEY (nombreusuario, nombre, fecha);


--
-- Name: pk_noticias; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY noticias
    ADD CONSTRAINT pk_noticias PRIMARY KEY (nombre, fecha);


--
-- Name: pk_planestudio; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY planestudio
    ADD CONSTRAINT pk_planestudio PRIMARY KEY (nombreusuario, codigousb);


--
-- Name: pk_postula; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postula
    ADD CONSTRAINT pk_postula PRIMARY KEY (nombreusuariopostulante, codigopostulante, nombreusuarioestudiante);


--
-- Name: pk_postulacion; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT pk_postulacion PRIMARY KEY (nombreusuario);


--
-- Name: pk_postulante; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postulante
    ADD CONSTRAINT pk_postulante PRIMARY KEY (nombreusuario, codigo);


--
-- Name: pk_representante; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY representante
    ADD CONSTRAINT pk_representante PRIMARY KEY (nombreusuario);


--
-- Name: pk_sistema; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sistema
    ADD CONSTRAINT pk_sistema PRIMARY KEY (cerrado);


--
-- Name: pk_universidades; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY universidades
    ADD CONSTRAINT pk_universidades PRIMARY KEY (nombreusuario, nombreuni);


--
-- Name: pk_usuario; Type: CONSTRAINT; Schema: dycicle; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (nombreusuario);


--
-- Name: fk_administrador_usuario; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY administrador
    ADD CONSTRAINT fk_administrador_usuario FOREIGN KEY (nombreusuario) REFERENCES usuario(nombreusuario);


--
-- Name: fk_antecedenteacademico_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY antecedenteacademico
    ADD CONSTRAINT fk_antecedenteacademico_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_archivosestudiante_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY archivosestudiante
    ADD CONSTRAINT fk_archivosestudiante_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_carga_archivo; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT fk_carga_archivo FOREIGN KEY (nombreusuario, direccion) REFERENCES archivosestudiante(nombreusuario, direccion);


--
-- Name: fk_estudiante_usuario; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY estudiante
    ADD CONSTRAINT fk_estudiante_usuario FOREIGN KEY (nombreusuario) REFERENCES usuario(nombreusuario);


--
-- Name: fk_estudianteinternacional_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY estudianteinternacional
    ADD CONSTRAINT fk_estudianteinternacional_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_estudianteusb_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY estudianteusb
    ADD CONSTRAINT fk_estudianteusb_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_financiamiento_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY financiamiento
    ADD CONSTRAINT fk_financiamiento_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_gestiona_gestor; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY gestiona
    ADD CONSTRAINT fk_gestiona_gestor FOREIGN KEY (nombreusuariogestor) REFERENCES gestor(nombreusuario);


--
-- Name: fk_gestiona_postulacion; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY gestiona
    ADD CONSTRAINT fk_gestiona_postulacion FOREIGN KEY (nombreusuarioestudiante) REFERENCES postulacion(nombreusuario);


--
-- Name: fk_gestor_usuario; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY gestor
    ADD CONSTRAINT fk_gestor_usuario FOREIGN KEY (nombreusuario) REFERENCES usuario(nombreusuario);


--
-- Name: fk_maneja_noticias; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY maneja
    ADD CONSTRAINT fk_maneja_noticias FOREIGN KEY (nombre, fecha) REFERENCES noticias(nombre, fecha);


--
-- Name: fk_maneja_usuario; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY maneja
    ADD CONSTRAINT fk_maneja_usuario FOREIGN KEY (nombreusuario) REFERENCES administrador(nombreusuario);


--
-- Name: fk_planestudio_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY planestudio
    ADD CONSTRAINT fk_planestudio_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_postula_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY postula
    ADD CONSTRAINT fk_postula_estudiante FOREIGN KEY (nombreusuarioestudiante) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_postula_postulante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY postula
    ADD CONSTRAINT fk_postula_postulante FOREIGN KEY (nombreusuariopostulante, codigopostulante) REFERENCES postulante(nombreusuario, codigo);


--
-- Name: fk_postulacion_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT fk_postulacion_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_postulante_usuario; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY postulante
    ADD CONSTRAINT fk_postulante_usuario FOREIGN KEY (nombreusuario) REFERENCES usuario(nombreusuario);


--
-- Name: fk_representante_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY representante
    ADD CONSTRAINT fk_representante_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: fk_universidades_estudiante; Type: FK CONSTRAINT; Schema: dycicle; Owner: postgres
--

ALTER TABLE ONLY universidades
    ADD CONSTRAINT fk_universidades_estudiante FOREIGN KEY (nombreusuario) REFERENCES estudiante(nombreusuario);


--
-- Name: dycicle; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA dycicle FROM PUBLIC;
REVOKE ALL ON SCHEMA dycicle FROM postgres;
GRANT ALL ON SCHEMA dycicle TO postgres;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

