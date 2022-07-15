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
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (codigo_usur);


--
-- PostgreSQL database dump complete
--

