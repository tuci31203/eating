--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

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
-- Name: goal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal (
    user_id integer NOT NULL,
    nutrient_id integer NOT NULL,
    amount numeric(10,2) NOT NULL
);


--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredient (
    ingredient_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unit_name character varying(20)
);


--
-- Name: ingredient_contains_nutrient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredient_contains_nutrient (
    ingredient_id integer NOT NULL,
    nutrient_id integer NOT NULL,
    amount numeric(10,2)
);


--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ingredient_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ingredient_ingredient_id_seq OWNED BY public.ingredient.ingredient_id;


--
-- Name: meal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meal (
    meal_id integer NOT NULL,
    type character varying(20) NOT NULL,
    datetime timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: meal_includes_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meal_includes_ingredient (
    meal_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    amount numeric(10,2)
);


--
-- Name: meal_meal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meal_meal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meal_meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meal_meal_id_seq OWNED BY public.meal.meal_id;


--
-- Name: nutrient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nutrient (
    nutrient_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unit_name character varying(20) NOT NULL
);


--
-- Name: nutrient_nutrient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nutrient_nutrient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nutrient_nutrient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nutrient_nutrient_id_seq OWNED BY public.nutrient.nutrient_id;


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe (
    recipe_id integer NOT NULL,
    title character varying(100) NOT NULL,
    total_time integer NOT NULL,
    instructions text
);


--
-- Name: recipe_includes_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe_includes_ingredient (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    amount numeric(10,2)
);


--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recipe_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recipe_recipe_id_seq OWNED BY public.recipe.recipe_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    gender character(1) NOT NULL,
    hashed_pw character(30) NOT NULL,
    current_weight double precision,
    target_weight double precision,
    timeframe integer
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: ingredient ingredient_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredient_ingredient_id_seq'::regclass);


--
-- Name: meal meal_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal ALTER COLUMN meal_id SET DEFAULT nextval('public.meal_meal_id_seq'::regclass);


--
-- Name: nutrient nutrient_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient ALTER COLUMN nutrient_id SET DEFAULT nextval('public.nutrient_nutrient_id_seq'::regclass);


--
-- Name: recipe recipe_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipe_recipe_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: goal goal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_pkey PRIMARY KEY (user_id, nutrient_id);


--
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_pkey PRIMARY KEY (ingredient_id, nutrient_id);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (ingredient_id);


--
-- Name: meal_includes_ingredient meal_includes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_pkey PRIMARY KEY (meal_id, ingredient_id);


--
-- Name: meal meal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_pkey PRIMARY KEY (meal_id);


--
-- Name: nutrient nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient
    ADD CONSTRAINT nutrient_pkey PRIMARY KEY (nutrient_id);


--
-- Name: recipe_includes_ingredient recipe_includes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_pkey PRIMARY KEY (recipe_id, ingredient_id);


--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (recipe_id);


--
-- Name: nutrient unique_nutrient_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient
    ADD CONSTRAINT unique_nutrient_name UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: goal goal_nutrient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_nutrient_id_fkey FOREIGN KEY (nutrient_id) REFERENCES public.nutrient(nutrient_id) ON DELETE CASCADE;


--
-- Name: goal goal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_nutrient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_nutrient_id_fkey FOREIGN KEY (nutrient_id) REFERENCES public.nutrient(nutrient_id);


--
-- Name: meal_includes_ingredient meal_includes_ingredient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- Name: meal_includes_ingredient meal_includes_ingredient_meal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_meal_id_fkey FOREIGN KEY (meal_id) REFERENCES public.meal(meal_id);


--
-- Name: meal meal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: recipe_includes_ingredient recipe_includes_ingredient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- Name: recipe_includes_ingredient recipe_includes_ingredient_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(recipe_id);


--
-- PostgreSQL database dump complete
--

