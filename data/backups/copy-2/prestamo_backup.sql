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
-- Name: prestamo prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (fk_codigo_usur, fk_codigo_ejem, fecha_prest);


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
-- PostgreSQL database dump complete
--

