--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: cupcakes; Type: TABLE; Schema: public; Owner: joel
--

CREATE TABLE public.cupcakes (
    id integer NOT NULL,
    name character varying(20),
    owner_id integer NOT NULL
);


ALTER TABLE public.cupcakes OWNER TO joel;

--
-- Name: cupcakes_id_seq; Type: SEQUENCE; Schema: public; Owner: joel
--

CREATE SEQUENCE public.cupcakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cupcakes_id_seq OWNER TO joel;

--
-- Name: cupcakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joel
--

ALTER SEQUENCE public.cupcakes_id_seq OWNED BY public.cupcakes.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: joel
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.persons OWNER TO joel;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: joel
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO joel;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joel
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: cupcakes id; Type: DEFAULT; Schema: public; Owner: joel
--

ALTER TABLE ONLY public.cupcakes ALTER COLUMN id SET DEFAULT nextval('public.cupcakes_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: joel
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Data for Name: cupcakes; Type: TABLE DATA; Schema: public; Owner: joel
--

COPY public.cupcakes (id, name, owner_id) FROM stdin;
2	choc	1
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: joel
--

COPY public.persons (id, name) FROM stdin;
1	bob
\.


--
-- Name: cupcakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joel
--

SELECT pg_catalog.setval('public.cupcakes_id_seq', 2, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joel
--

SELECT pg_catalog.setval('public.persons_id_seq', 1, true);


--
-- Name: cupcakes cupcakes_pkey; Type: CONSTRAINT; Schema: public; Owner: joel
--

ALTER TABLE ONLY public.cupcakes
    ADD CONSTRAINT cupcakes_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: joel
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: cupcakes cupcakes_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joel
--

ALTER TABLE ONLY public.cupcakes
    ADD CONSTRAINT cupcakes_owner_fkey FOREIGN KEY (owner_id) REFERENCES public.persons(id);


--
-- PostgreSQL database dump complete
--

