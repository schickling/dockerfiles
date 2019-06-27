--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 10.8

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: user_details; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.user_details (
    user_id integer NOT NULL,
    username character varying(255) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    gender character varying(10) DEFAULT NULL::character varying,
    password character varying(50) DEFAULT NULL::character varying,
    status integer
);


ALTER TABLE public.user_details OWNER TO "user";

--
-- Name: user_details_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_details_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_user_id_seq OWNER TO "user";

--
-- Name: user_details_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.user_details_user_id_seq OWNED BY public.user_details.user_id;


--
-- Name: user_details user_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_details ALTER COLUMN user_id SET DEFAULT nextval('public.user_details_user_id_seq'::regclass);


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.user_details (user_id, username, first_name, last_name, gender, password, status) FROM stdin;
1	rogers63	david	john	Female	asdfa	1
2	mike28	rogers	paul	Male	afda	1
3	rivera92	david	john	Male	asdf	1
4	ross95	maria	sanders	Male	asdf	1
5	paul85	morris	miller	Female	asdf	1
6	smith34	daniel	michael	Female	sa	1
7	james84	sanders	paul	Female	fds	1
8	daniel53	mark	mike	Male	sdfa	1
9	brooks80	morgan	maria	Female	fasdf	1
10	morgan65	paul	miller	Female	fdsa	1
\.


--
-- Name: user_details_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_details_user_id_seq', 1, false);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

