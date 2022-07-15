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
-- Name: ejemplar; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ejemplar (
    fk_codigo_libro integer NOT NULL,
    codigo_ejem integer NOT NULL,
    fk_codigo_ubicacion integer NOT NULL
);


ALTER TABLE public.ejemplar OWNER TO root;

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
-- Name: ejemplar ejemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ejemplar
    ADD CONSTRAINT ejemplar_pkey PRIMARY KEY (codigo_ejem, fk_codigo_libro);


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
-- PostgreSQL database dump complete
--

