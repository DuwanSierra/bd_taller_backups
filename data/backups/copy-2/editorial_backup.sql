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
-- Name: editorial; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.editorial (
    codigo_editorial integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.editorial OWNER TO root;

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
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (codigo_editorial);


--
-- PostgreSQL database dump complete
--

