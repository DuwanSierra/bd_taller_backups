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
-- Name: ubicacion codigo_ubicacion; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ubicacion ALTER COLUMN codigo_ubicacion SET DEFAULT nextval('public.ubicacion_codigo_ubicacion_seq'::regclass);


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
-- Name: ubicacion_codigo_ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ubicacion_codigo_ubicacion_seq', 1, false);


--
-- Name: ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (codigo_ubicacion);


--
-- PostgreSQL database dump complete
--

