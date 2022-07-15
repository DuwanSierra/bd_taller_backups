--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.autor (
    identificacion integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.autor OWNER TO root;

--
-- Name: editorial; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.editorial (
    codigo_editorial integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.editorial OWNER TO root;

--
-- Name: ejemplar; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ejemplar (
    fk_codigo_libro integer NOT NULL,
    codigo_ejem integer NOT NULL,
    fk_codigo_ubicacion integer NOT NULL
);


ALTER TABLE public.ejemplar OWNER TO root;

--
-- Name: escribe; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.escribe (
    fk_identificacion_autor integer NOT NULL,
    fk_codigo_libro integer NOT NULL
);


ALTER TABLE public.escribe OWNER TO root;

--
-- Name: libro; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.libro (
    codigo_libro integer NOT NULL,
    titulo character varying(255) NOT NULL,
    isbn character varying(255) NOT NULL,
    edicion integer,
    no_pag integer,
    fk_codigo_editorial integer
);


ALTER TABLE public.libro OWNER TO root;

--
-- Name: prestamo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.prestamo (
    fk_codigo_ejem integer NOT NULL,
    fk_codigo_usur integer NOT NULL,
    fk_codigo_libro integer NOT NULL,
    fecha_prest timestamp without time zone NOT NULL,
    dias_prestamo integer NOT NULL,
    fecha_devol timestamp without time zone,
    valor_multa numeric(25,2) NOT NULL
);


ALTER TABLE public.prestamo OWNER TO root;

--
-- Name: telefono; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.telefono (
    telefono integer NOT NULL,
    fk_codigo_usur integer NOT NULL
);


ALTER TABLE public.telefono OWNER TO root;

--
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ubicacion (
    codigo_ubicacion integer NOT NULL,
    ubicacion character varying(255)
);


ALTER TABLE public.ubicacion OWNER TO root;

--
-- Name: ubicacion_codigo_ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ubicacion_codigo_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ubicacion_codigo_ubicacion_seq OWNER TO root;

--
-- Name: ubicacion_codigo_ubicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ubicacion_codigo_ubicacion_seq OWNED BY public.ubicacion.codigo_ubicacion;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.usuario (
    codigo_usur integer NOT NULL,
    nombre character varying(255) NOT NULL,
    codigo_postal smallint NOT NULL,
    calle character varying(255) NOT NULL,
    numero character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO root;

--
-- Name: ubicacion codigo_ubicacion; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ubicacion ALTER COLUMN codigo_ubicacion SET DEFAULT nextval('public.ubicacion_codigo_ubicacion_seq'::regclass);


--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.autor (identificacion, nombre) FROM stdin;
1030697584	Antonio Cardenas
1030697852	Juan Sepulveda
1030682324	Maria Cifuentes
1030695478	Tulio Paez
1030693214	Sebastian Rivera
\.


--
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.editorial (codigo_editorial, nombre) FROM stdin;
2015	El tiempo
2016	El pais
2017	Semana
2018	El Extranjero
\.


--
-- Data for Name: ejemplar; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ejemplar (fk_codigo_libro, codigo_ejem, fk_codigo_ubicacion) FROM stdin;
1001	5001	1
1002	5002	2
1003	5003	3
1004	5004	4
1005	5005	5
\.


--
-- Data for Name: escribe; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.escribe (fk_identificacion_autor, fk_codigo_libro) FROM stdin;
1030697584	1001
1030697852	1002
1030682324	1003
1030695478	1004
1030693214	1005
\.


--
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.libro (codigo_libro, titulo, isbn, edicion, no_pag, fk_codigo_editorial) FROM stdin;
1001	La bella y la bestia	3001	1	175	2018
1002	Titanic	3002	2	200	2015
1003	Economia para tontos	3003	1	109	2016
1004	Projectos ingenieria	3004	3	409	2017
1005	Pinoccio	3005	4	500	2018
\.


--
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.prestamo (fk_codigo_ejem, fk_codigo_usur, fk_codigo_libro, fecha_prest, dias_prestamo, fecha_devol, valor_multa) FROM stdin;
5001	4001	1001	2011-01-01 00:00:00	8	2011-01-08 00:00:00	0.00
5002	4002	1002	2011-01-01 00:00:00	4	2011-01-04 00:00:00	0.00
5003	4003	1003	2011-01-01 00:00:00	8	2011-01-08 00:00:00	0.00
5004	4004	1004	2011-01-01 00:00:00	7	2011-01-07 00:00:00	0.00
5005	4005	1005	2011-01-01 00:00:00	3	2011-01-07 00:00:00	8000.00
\.


--
-- Data for Name: telefono; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.telefono (telefono, fk_codigo_usur) FROM stdin;
7558400	4001
691985	4002
236574	4003
987365	4004
798654	4005
\.


--
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ubicacion (codigo_ubicacion, ubicacion) FROM stdin;
1	Seccion A
2	Seccion B
3	Seccion C
4	Seccion D
5	Seccion E
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.usuario (codigo_usur, nombre, codigo_postal, calle, numero) FROM stdin;
4001	Juan Arevalo	10098	42G SUR	84A-77
4002	Tereza Paez	15875	32A	64-27
4003	Mariana Sosa	16748	72C	87-32
4004	Luis Cepeda	19879	39B	44-98
4005	Miguel Diaz	10090	48 NORTE	29C-15
\.


--
-- Name: ubicacion_codigo_ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ubicacion_codigo_ubicacion_seq', 1, false);


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (identificacion);


--
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (codigo_editorial);


--
-- Name: ejemplar ejemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ejemplar
    ADD CONSTRAINT ejemplar_pkey PRIMARY KEY (codigo_ejem, fk_codigo_libro);


--
-- Name: escribe escribe_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.escribe
    ADD CONSTRAINT escribe_pkey PRIMARY KEY (fk_identificacion_autor, fk_codigo_libro);


--
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (codigo_libro);


--
-- Name: prestamo prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (fk_codigo_usur, fk_codigo_ejem, fecha_prest);


--
-- Name: telefono telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT telefono_pkey PRIMARY KEY (telefono, fk_codigo_usur);


--
-- Name: ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (codigo_ubicacion);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (codigo_usur);


--
-- Name: ejemplar ejemplar_fk_codigo_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ejemplar
    ADD CONSTRAINT ejemplar_fk_codigo_libro_fkey FOREIGN KEY (fk_codigo_libro) REFERENCES public.libro(codigo_libro);


--
-- Name: ejemplar ejemplar_fk_codigo_ubicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ejemplar
    ADD CONSTRAINT ejemplar_fk_codigo_ubicacion_fkey FOREIGN KEY (fk_codigo_ubicacion) REFERENCES public.ubicacion(codigo_ubicacion);


--
-- Name: escribe escribe_fk_codigo_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.escribe
    ADD CONSTRAINT escribe_fk_codigo_libro_fkey FOREIGN KEY (fk_codigo_libro) REFERENCES public.libro(codigo_libro);


--
-- Name: escribe escribe_fk_identificacion_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.escribe
    ADD CONSTRAINT escribe_fk_identificacion_autor_fkey FOREIGN KEY (fk_identificacion_autor) REFERENCES public.autor(identificacion);


--
-- Name: libro libro_fk_codigo_editorial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_fk_codigo_editorial_fkey FOREIGN KEY (fk_codigo_editorial) REFERENCES public.editorial(codigo_editorial);


--
-- Name: prestamo prestamo_fk_codigo_ejem_fk_codigo_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_fk_codigo_ejem_fk_codigo_libro_fkey FOREIGN KEY (fk_codigo_ejem, fk_codigo_libro) REFERENCES public.ejemplar(codigo_ejem, fk_codigo_libro);


--
-- Name: prestamo prestamo_fk_codigo_usur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_fk_codigo_usur_fkey FOREIGN KEY (fk_codigo_usur) REFERENCES public.usuario(codigo_usur);


--
-- Name: telefono telefono_fk_codigo_usur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT telefono_fk_codigo_usur_fkey FOREIGN KEY (fk_codigo_usur) REFERENCES public.usuario(codigo_usur);


--
-- PostgreSQL database dump complete
--

