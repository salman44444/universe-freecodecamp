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
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    name character varying(20) NOT NULL,
    event_type character varying(20),
    event_date date,
    decription text,
    galaxy_id integer
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_event_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    distance numeric(5,2),
    mass integer,
    type character varying(30),
    galaxy_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    surface_features text,
    orbital_period integer,
    planet_id integer
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
    name character varying(15) NOT NULL,
    mass integer,
    surface_temperature integer,
    orbital_period integer,
    has_life boolean,
    has_rings boolean,
    star_id integer
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
    mass integer,
    magnitude integer,
    type character varying(20),
    name character varying(20) NOT NULL,
    galaxy_id integer
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
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_event_id_seq'::regclass);


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
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, 'Perseid Shower', 'Meteor', '2023-08-12', 'Annual meteor shower', 1);
INSERT INTO public.celestial_events VALUES (2, 'Solar Eclipse', 'Eclipse', '2023-12-03', 'Total solar eclipse', 2);
INSERT INTO public.celestial_events VALUES (3, 'Supernova SN 2017eaw', 'Supernova', '2023-06-18', 'Bright supernova in galaxy NGC', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 2.54, 8, 'Spiral', 1);
INSERT INTO public.galaxy VALUES ('Milky Way', 26.00, 2, 'Spiral', 2);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 3.00, 1, 'Irregular', 3);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 29.30, 1, 'Spiral', 4);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 29.30, 1, 'Spiral', 5);
INSERT INTO public.galaxy VALUES ('Centaurus A', 10.00, 2, 'Elliptical', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Craters, Maria', 27, 1);
INSERT INTO public.moon VALUES (2, 'Phobes', 'Stickney crater,Grooves', 0, 2);
INSERT INTO public.moon VALUES (3, 'Triton', 'Nitrogen geysers,Ice volcanoes', -6, 3);
INSERT INTO public.moon VALUES (4, 'Europa', 'Cracks,Ice-ridged plains', 4, 1);
INSERT INTO public.moon VALUES (5, 'Titan', 'Sand dunes,Lakes,Methane seas', 16, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Craters, Grooves Bright spots', 7, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Impact craters,Geological structures', 17, 1);
INSERT INTO public.moon VALUES (8, 'lo', 'Volcanic plumes Mountains', 2, 1);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Tiger stripes,Ice plumes', 1, 2);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Herschel crater,Ice cliffs', 1, 2);
INSERT INTO public.moon VALUES (11, 'Titon', 'nitrogen geusers,Ice volcanoes', -6, 3);
INSERT INTO public.moon VALUES (12, 'Charon', 'Chasms,Craters,Canyons', 6, 4);
INSERT INTO public.moon VALUES (13, 'Phobos', 'Stickney Crater,Grooves', 0, 2);
INSERT INTO public.moon VALUES (14, 'Deimos', 'Stickney crater,Pitted Terrain', 1, 2);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Verona Rupes,Ovda Regio', 1, 5);
INSERT INTO public.moon VALUES (16, 'Dione', 'Catenae,Ice cliffs', 3, 2);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Rilles,Ice valleys', 3, 6);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Wunda crater,Troughs', 4, 6);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Odysseus crateter,Ithaca Chasma', 2, 2);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Sponge-Like apperance Chaotic rotation', 21, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'EARTH', 6, 288, 365, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 210, 686, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Neptune', 102, 72, 60190, false, true, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 5, 735, 225, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898, 165, 4332, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568, 134, 10748, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 87, 76, 30685, false, true, 2);
INSERT INTO public.planet VALUES (8, 'Mercury', 0, 700, 88, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 1, 265, 39, true, false, 3);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 0, 231, 37, true, false, 4);
INSERT INTO public.planet VALUES (11, 'Ganymede', 148, 110, 7, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Titan', 135, 92, 16, false, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, -27, 'G-type', 'Sun', 1);
INSERT INTO public.star VALUES (2, 2, -1, 'A-type', 'SIRIUS', 2);
INSERT INTO public.star VALUES (3, 20, -5, 'M-type', 'BEetelgeuse', 3);
INSERT INTO public.star VALUES (4, 1, 6, 'G-type', 'Alpha Centauri A', 6);
INSERT INTO public.star VALUES (5, 1, 6, 'K-type', 'Alpha Centauri B', 4);
INSERT INTO public.star VALUES (6, 0, 11, 'M-type', 'Proxima Centauri', 3);


--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: celestial_events celestial_events_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_event_name_key UNIQUE (name);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: celestial_events name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_events celestial_events_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

