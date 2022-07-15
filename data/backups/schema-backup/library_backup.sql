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

