--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.school OWNER TO postgres;

--
-- Name: school_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.school_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.school_seq OWNER TO postgres;

--
-- Name: student_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_profile (
    id integer NOT NULL,
    student_id integer,
    bio character varying(255)
);


ALTER TABLE public.student_profile OWNER TO postgres;

--
-- Name: student_profile_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_profile_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_profile_seq OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    age integer NOT NULL,
    id integer NOT NULL,
    school_id integer,
    first_name character varying(20),
    last_name character varying(20),
    email character varying(255)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_seq OWNER TO postgres;

--
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school (id, name) FROM stdin;
1	fpoly
2	fpt
\.


--
-- Data for Name: student_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_profile (id, student_id, bio) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (age, id, school_id, first_name, last_name, email) FROM stdin;
0	2	1	hieu	pv	hieu@gmail.com
0	3	1	hieu1	pv	hieu1@gmail.com
0	52	1	hieu2	pv	hieu2@gmail.com
\.


--
-- Name: school_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.school_seq', 51, true);


--
-- Name: student_profile_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_profile_seq', 1, false);


--
-- Name: students_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_seq', 101, true);


--
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);


--
-- Name: student_profile student_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_pkey PRIMARY KEY (id);


--
-- Name: student_profile student_profile_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_student_id_key UNIQUE (student_id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students fk21tt8xq83kbgwd98k4dybhp1b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk21tt8xq83kbgwd98k4dybhp1b FOREIGN KEY (school_id) REFERENCES public.school(id);


--
-- Name: student_profile fk5ow5ja58upyhsq2nvjmr8t3co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT fk5ow5ja58upyhsq2nvjmr8t3co FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

