--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years numeric(3,2),
    planet_types character varying(50),
    galaxy_types character varying(50),
    distance_from_earth integer,
    discovery_info text,
    galaxy_id integer NOT NULL,
    star_id integer
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
-- Name: join_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.join_table (
    galaxy_id integer,
    star_id integer,
    moon_id integer,
    planet_id integer,
    name character varying(50) NOT NULL,
    join_table_id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.join_table OWNER TO freecodecamp;

--
-- Name: join_table_join_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.join_table_join_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.join_table_join_table_id_seq OWNER TO freecodecamp;

--
-- Name: join_table_join_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.join_table_join_table_id_seq OWNED BY public.join_table.join_table_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years numeric(3,2),
    planet_types character varying(50),
    galaxy_types character varying(50),
    distance_from_earth integer,
    moon_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years numeric(3,2),
    planet_types character varying(50),
    galaxy_types character varying(50),
    distance_from_earth integer,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years numeric(3,2),
    planet_types character varying(50),
    galaxy_types character varying(50),
    distance_from_earth integer,
    galaxy_id integer,
    star_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: join_table join_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_table ALTER COLUMN join_table_id SET DEFAULT nextval('public.join_table_join_table_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('G121', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 2, NULL);
INSERT INTO public.galaxy VALUES ('G12', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 3, NULL);
INSERT INTO public.galaxy VALUES ('G123', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 4, NULL);
INSERT INTO public.galaxy VALUES ('G124', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 5, NULL);
INSERT INTO public.galaxy VALUES ('G125', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 7, NULL);
INSERT INTO public.galaxy VALUES ('G126', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 8, NULL);
INSERT INTO public.galaxy VALUES ('G127', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 6, 1);
INSERT INTO public.galaxy VALUES ('G128', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 9, NULL);
INSERT INTO public.galaxy VALUES ('G129', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 10, NULL);
INSERT INTO public.galaxy VALUES ('G130', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 'text', 11, NULL);


--
-- Data for Name: join_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.join_table VALUES (1, 2, 3, 4, 'first', 1, 'This is description');
INSERT INTO public.join_table VALUES (2, 3, 4, 5, 'second', 2, 'This is description');
INSERT INTO public.join_table VALUES (3, 4, 5, 6, 'third', 3, 'This is description');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('m121', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 1);
INSERT INTO public.moon VALUES ('m122', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 2);
INSERT INTO public.moon VALUES ('m123', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 3);
INSERT INTO public.moon VALUES ('M112', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 4);
INSERT INTO public.moon VALUES ('M142', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 5);
INSERT INTO public.moon VALUES ('M1333', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 6);
INSERT INTO public.moon VALUES ('M33', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 7);
INSERT INTO public.moon VALUES ('M233', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 8);
INSERT INTO public.moon VALUES ('M633', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 9);
INSERT INTO public.moon VALUES ('M6323', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 10);
INSERT INTO public.moon VALUES ('Mr6323', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 11);
INSERT INTO public.moon VALUES ('MCr6323', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 12);
INSERT INTO public.moon VALUES ('MCr4623', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 13);
INSERT INTO public.moon VALUES ('MCrDD4623', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 14);
INSERT INTO public.moon VALUES ('MCrDh3', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 15);
INSERT INTO public.moon VALUES ('MC334445', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 16);
INSERT INTO public.moon VALUES ('MC55', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 17);
INSERT INTO public.moon VALUES ('MC554', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 18);
INSERT INTO public.moon VALUES ('MC5546', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 19);
INSERT INTO public.moon VALUES ('MC5546g', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('p121', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 1);
INSERT INTO public.planet VALUES ('p122', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 2);
INSERT INTO public.planet VALUES ('p123', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 3);
INSERT INTO public.planet VALUES ('P130', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 4);
INSERT INTO public.planet VALUES ('P131', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 5);
INSERT INTO public.planet VALUES ('P132', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 6);
INSERT INTO public.planet VALUES ('P133', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 7);
INSERT INTO public.planet VALUES ('P134', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 8);
INSERT INTO public.planet VALUES ('P135', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 9);
INSERT INTO public.planet VALUES ('P136', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 10);
INSERT INTO public.planet VALUES ('P111', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 11);
INSERT INTO public.planet VALUES ('P112', 'This is a description', true, false, 5.20, 'big', 'little', 50000, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('s121', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 1);
INSERT INTO public.star VALUES ('s122', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 2);
INSERT INTO public.star VALUES ('s123', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 3);
INSERT INTO public.star VALUES ('S128', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 4);
INSERT INTO public.star VALUES ('S129', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 5);
INSERT INTO public.star VALUES ('S130', 'This is a description', true, false, 5.20, 'big', 'little', 50000, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: join_table_join_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.join_table_join_table_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: join_table join_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_name_key UNIQUE (name);


--
-- Name: join_table join_table_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_name_key1 UNIQUE (name);


--
-- Name: join_table join_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_table
    ADD CONSTRAINT join_table_pkey PRIMARY KEY (join_table_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

