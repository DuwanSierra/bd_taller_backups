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
-- Name: escribe; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.escribe (
    fk_identificacion_autor integer NOT NULL,
    fk_codigo_libro integer NOT NULL
);


ALTER TABLE public.escribe OWNER TO root;

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
-- Name: escribe escribe_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.escribe
    ADD CONSTRAINT escribe_pkey PRIMARY KEY (fk_identificacion_autor, fk_codigo_libro);


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
-- PostgreSQL database dump complete
--

