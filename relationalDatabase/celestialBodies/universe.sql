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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: fill; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fill (
    fill_id integer NOT NULL,
    name character varying(30) NOT NULL,
    value integer,
    checked boolean
);


ALTER TABLE public.fill OWNER TO freecodecamp;

--
-- Name: fill_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fill_id_seq OWNER TO freecodecamp;

--
-- Name: fill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fill_id_seq OWNED BY public.fill.fill_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_in_mpc numeric(5,4),
    app_magnitude numeric(4,2),
    diameter_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    radius_in_km numeric(8,4),
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    earth_mass numeric(6,3),
    earth_radii numeric(6,3)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    solar_mass numeric(6,3),
    has_planet boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: fill fill_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fill ALTER COLUMN fill_id SET DEFAULT nextval('public.fill_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: fill; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fill VALUES (1, 'one', 1, true);
INSERT INTO public.fill VALUES (2, 'two', 2, true);
INSERT INTO public.fill VALUES (3, 'three', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0080, NULL, 87400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 0.7780, 4.17, 152000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 0.8400, 6.19, 61100);
INSERT INTO public.galaxy VALUES (4, 'Barnards', 0.5700, 9.32, 7000);
INSERT INTO public.galaxy VALUES (5, 'WLM', 0.9330, 11.03, 11500);
INSERT INTO public.galaxy VALUES (6, 'Leo P', 1.6200, 16.89, 3690);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon/Luna', 1738.0000, 'Synchronous rotation');
INSERT INTO public.moon VALUES (2, 7, 'Phobos', 11.2670, 'Synchronous rotation');
INSERT INTO public.moon VALUES (3, 7, 'Deimos', 6.2000, 'Synchronous rotation');
INSERT INTO public.moon VALUES (4, 3, 'Io', 1821.6000, 'Galilean group');
INSERT INTO public.moon VALUES (5, 3, 'Europa', 1560.8000, 'Galilean group');
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', 2634.1000, 'Galilean group');
INSERT INTO public.moon VALUES (7, 3, 'Callisto', 2410.3000, 'Galilean group');
INSERT INTO public.moon VALUES (8, 3, 'Amalthea', 83.5000, 'Inner moon');
INSERT INTO public.moon VALUES (9, 3, 'Himalia', 69.8000, 'Himalia group');
INSERT INTO public.moon VALUES (10, 3, 'Elara', 43.0000, 'Himalia group');
INSERT INTO public.moon VALUES (11, 3, 'Pasiphae', 30.0000, 'Himalia group');
INSERT INTO public.moon VALUES (12, 3, 'Sinope', 19.0000, 'Himalia group');
INSERT INTO public.moon VALUES (13, 3, 'Lysithea', 18.0000, 'Himalia group');
INSERT INTO public.moon VALUES (14, 3, 'Carme', 23.0000, 'Himalia group');
INSERT INTO public.moon VALUES (15, 3, 'Ananke', 14.0000, 'Ananke group');
INSERT INTO public.moon VALUES (16, 3, 'Leda', 10.0000, 'Himalia group');
INSERT INTO public.moon VALUES (17, 3, 'Thebe', 49.3000, 'Amalthea group');
INSERT INTO public.moon VALUES (18, 3, 'Adrastea', 8.2000, 'Amalthea group');
INSERT INTO public.moon VALUES (19, 3, 'Metis', 21.5000, 'Amalthea group');
INSERT INTO public.moon VALUES (20, 3, 'Callirrhoe', 4.5000, 'Pasiphea group');
INSERT INTO public.moon VALUES (21, 3, 'Themisto', 4.0000, 'Themisto group');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 3, 'Earth/Terra', 1.000, 1.000);
INSERT INTO public.planet VALUES (2, 3, 'Mercury', 0.055, 0.383);
INSERT INTO public.planet VALUES (3, 3, 'Jupiter', 317.800, 10.973);
INSERT INTO public.planet VALUES (6, 3, 'Venus', 0.815, 0.950);
INSERT INTO public.planet VALUES (7, 3, 'Mars', 0.107, 0.532);
INSERT INTO public.planet VALUES (8, 3, 'Saturn', 95.159, 9.140);
INSERT INTO public.planet VALUES (9, 3, 'Uranus', 14.536, 4.000);
INSERT INTO public.planet VALUES (10, 3, 'Neptune', 17.147, 3.850);
INSERT INTO public.planet VALUES (5, 5, 'Proxima Centauri b', 1.070, NULL);
INSERT INTO public.planet VALUES (4, 5, 'Proxima Centauri d', 0.260, NULL);
INSERT INTO public.planet VALUES (11, 5, 'Proxima Centauri c', 7.000, NULL);
INSERT INTO public.planet VALUES (12, 8, 'Barnards Star b', 0.092, 0.317);
INSERT INTO public.planet VALUES (13, 8, 'Barnards Star c', 0.138, 0.472);
INSERT INTO public.planet VALUES (14, 8, 'Barnards Star d', 0.078, 0.376);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 1, 'Sun/Sol', 1.000, true);
INSERT INTO public.star VALUES (4, 1, 'Betelguese', 14.000, false);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 0.122, true);
INSERT INTO public.star VALUES (7, 1, 'Alpha Centauri B/Toliman', 0.909, false);
INSERT INTO public.star VALUES (6, 1, 'Alpha Centauri A/RK', 1.079, true);
INSERT INTO public.star VALUES (8, 1, 'Barnards Star', 0.144, false);


--
-- Name: fill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fill_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: fill fill_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fill
    ADD CONSTRAINT fill_name_key UNIQUE (name);


--
-- Name: fill fill_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fill
    ADD CONSTRAINT fill_pkey PRIMARY KEY (fill_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

