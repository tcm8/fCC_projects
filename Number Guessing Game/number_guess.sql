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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 3, 552);
INSERT INTO public.games VALUES (2, 1, 5, 457);
INSERT INTO public.games VALUES (3, 1, 1, 375);
INSERT INTO public.games VALUES (4, 6, 573, 572);
INSERT INTO public.games VALUES (5, 6, 64, 63);
INSERT INTO public.games VALUES (6, 7, 515, 514);
INSERT INTO public.games VALUES (7, 7, 58, 57);
INSERT INTO public.games VALUES (8, 6, 946, 944);
INSERT INTO public.games VALUES (9, 6, 17, 16);
INSERT INTO public.games VALUES (10, 6, 997, 996);
INSERT INTO public.games VALUES (11, 8, 127, 126);
INSERT INTO public.games VALUES (12, 8, 819, 818);
INSERT INTO public.games VALUES (13, 9, 875, 874);
INSERT INTO public.games VALUES (14, 9, 31, 30);
INSERT INTO public.games VALUES (15, 8, 530, 528);
INSERT INTO public.games VALUES (16, 8, 70, 69);
INSERT INTO public.games VALUES (17, 8, 226, 225);
INSERT INTO public.games VALUES (18, 10, 761, 760);
INSERT INTO public.games VALUES (19, 10, 879, 878);
INSERT INTO public.games VALUES (20, 11, 926, 925);
INSERT INTO public.games VALUES (21, 11, 891, 890);
INSERT INTO public.games VALUES (22, 10, 108, 106);
INSERT INTO public.games VALUES (23, 10, 493, 492);
INSERT INTO public.games VALUES (24, 10, 675, 674);
INSERT INTO public.games VALUES (25, 12, 898, 897);
INSERT INTO public.games VALUES (26, 12, 237, 236);
INSERT INTO public.games VALUES (27, 13, 392, 391);
INSERT INTO public.games VALUES (28, 13, 371, 370);
INSERT INTO public.games VALUES (29, 12, 508, 506);
INSERT INTO public.games VALUES (30, 12, 920, 919);
INSERT INTO public.games VALUES (31, 12, 425, 424);
INSERT INTO public.games VALUES (32, 14, 108, 107);
INSERT INTO public.games VALUES (33, 14, 709, 708);
INSERT INTO public.games VALUES (34, 15, 454, 453);
INSERT INTO public.games VALUES (35, 15, 299, 298);
INSERT INTO public.games VALUES (36, 14, 605, 603);
INSERT INTO public.games VALUES (37, 14, 913, 912);
INSERT INTO public.games VALUES (38, 14, 909, 908);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test');
INSERT INTO public.users VALUES (2, 'thiago');
INSERT INTO public.users VALUES (3, 'test2');
INSERT INTO public.users VALUES (4, 'user_1655835934285');
INSERT INTO public.users VALUES (5, 'user_1655835934284');
INSERT INTO public.users VALUES (6, 'user_1655836816496');
INSERT INTO public.users VALUES (7, 'user_1655836816495');
INSERT INTO public.users VALUES (8, 'user_1655837882625');
INSERT INTO public.users VALUES (9, 'user_1655837882624');
INSERT INTO public.users VALUES (10, 'user_1655838057858');
INSERT INTO public.users VALUES (11, 'user_1655838057857');
INSERT INTO public.users VALUES (12, 'user_1655838083354');
INSERT INTO public.users VALUES (13, 'user_1655838083353');
INSERT INTO public.users VALUES (14, 'user_1655838118364');
INSERT INTO public.users VALUES (15, 'user_1655838118363');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 38, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

