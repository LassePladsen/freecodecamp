--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'hasle', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1715092346488', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1715092346487', 0, NULL);
INSERT INTO public.users VALUES (5, '2', 0, NULL);
INSERT INTO public.users VALUES (1, 'lasse', 3, 3);
INSERT INTO public.users VALUES (7, 'user_1715093766352', 1, 922);
INSERT INTO public.users VALUES (6, 'user_1715093766353', 4, 264);
INSERT INTO public.users VALUES (9, 'user_1715093797444', 1, 9);
INSERT INTO public.users VALUES (8, 'user_1715093797445', 4, 233);
INSERT INTO public.users VALUES (10, 'llllllllllllllllllllll', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1715093869749', 1, 676);
INSERT INTO public.users VALUES (11, 'user_1715093869750', 4, 67);
INSERT INTO public.users VALUES (14, 'user_1715093888099', 1, 190);
INSERT INTO public.users VALUES (13, 'user_1715093888100', 4, 287);
INSERT INTO public.users VALUES (15, 'user_1715093910346', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1715093910345', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1715093951550', 1, 15);
INSERT INTO public.users VALUES (17, 'user_1715093951551', 4, 154);
INSERT INTO public.users VALUES (19, 'lase', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1715093988625', 1, 819);
INSERT INTO public.users VALUES (20, 'user_1715093988626', 4, 221);
INSERT INTO public.users VALUES (22, 'mordi', 0, NULL);
INSERT INTO public.users VALUES (23, 'awdwad', 0, NULL);
INSERT INTO public.users VALUES (24, 'aawdwadwadaw', 0, NULL);
INSERT INTO public.users VALUES (25, 'awoldpawkdwakdaw', 1, 11);
INSERT INTO public.users VALUES (27, 'user_1715094307448', 2, 271);
INSERT INTO public.users VALUES (26, 'user_1715094307449', 5, 89);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

