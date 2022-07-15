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
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (identificacion);


--
-- PostgreSQL database dump complete
--

