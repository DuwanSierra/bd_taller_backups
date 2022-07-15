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
-- Name: telefono; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.telefono (
    telefono integer NOT NULL,
    fk_codigo_usur integer NOT NULL
);


ALTER TABLE public.telefono OWNER TO root;

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
-- Name: telefono telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT telefono_pkey PRIMARY KEY (telefono, fk_codigo_usur);


--
-- Name: telefono telefono_fk_codigo_usur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT telefono_fk_codigo_usur_fkey FOREIGN KEY (fk_codigo_usur) REFERENCES public.usuario(codigo_usur);


--
-- PostgreSQL database dump complete
--

