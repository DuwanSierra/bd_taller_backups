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
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (codigo_libro);


--
-- Name: libro libro_fk_codigo_editorial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_fk_codigo_editorial_fkey FOREIGN KEY (fk_codigo_editorial) REFERENCES public.editorial(codigo_editorial);


--
-- PostgreSQL database dump complete
--

