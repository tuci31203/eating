--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

-- Started on 2024-12-09 05:16:37

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
-- TOC entry 215 (class 1259 OID 16619)
-- Name: goal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal (
    user_id integer NOT NULL,
    nutrient_id integer NOT NULL,
    amount numeric(10,2) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16622)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredient (
    ingredient_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unit_name character varying(20)
);


--
-- TOC entry 217 (class 1259 OID 16625)
-- Name: ingredient_contains_nutrient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredient_contains_nutrient (
    ingredient_id integer NOT NULL,
    nutrient_id integer NOT NULL,
    amount numeric(10,4)
);


--
-- TOC entry 218 (class 1259 OID 16628)
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
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ingredient_ingredient_id_seq OWNED BY public.ingredient.ingredient_id;


--
-- TOC entry 219 (class 1259 OID 16629)
-- Name: meal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meal (
    meal_id integer NOT NULL,
    type character varying(20) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    datetime_truncated_to_minute timestamp with time zone GENERATED ALWAYS AS (date_bin('00:01:00'::interval, datetime, '2024-01-01 07:00:00+07'::timestamp with time zone)) STORED NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16632)
-- Name: meal_includes_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meal_includes_ingredient (
    meal_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    amount numeric(10,2)
);


--
-- TOC entry 221 (class 1259 OID 16635)
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
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 221
-- Name: meal_meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meal_meal_id_seq OWNED BY public.meal.meal_id;


--
-- TOC entry 222 (class 1259 OID 16636)
-- Name: nutrient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nutrient (
    nutrient_id integer NOT NULL,
    name character varying(50) NOT NULL,
    unit_name character varying(20) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16639)
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
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 223
-- Name: nutrient_nutrient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nutrient_nutrient_id_seq OWNED BY public.nutrient.nutrient_id;


--
-- TOC entry 224 (class 1259 OID 16640)
-- Name: recipe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe (
    recipe_id integer NOT NULL,
    title character varying(100) NOT NULL,
    total_time character varying NOT NULL,
    instructions text
);


--
-- TOC entry 225 (class 1259 OID 16645)
-- Name: recipe_includes_ingredient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe_includes_ingredient (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    amount numeric(10,2)
);


--
-- TOC entry 226 (class 1259 OID 16648)
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
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipe_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recipe_recipe_id_seq OWNED BY public.recipe.recipe_id;


--
-- TOC entry 227 (class 1259 OID 16649)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    gender character(1) NOT NULL,
    hashed_pw character varying(100) NOT NULL,
    current_weight double precision,
    target_weight double precision,
    timeframe integer
);


--
-- TOC entry 228 (class 1259 OID 16652)
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
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4724 (class 2604 OID 16653)
-- Name: ingredient ingredient_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredient_ingredient_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16654)
-- Name: meal meal_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal ALTER COLUMN meal_id SET DEFAULT nextval('public.meal_meal_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16655)
-- Name: nutrient nutrient_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient ALTER COLUMN nutrient_id SET DEFAULT nextval('public.nutrient_nutrient_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16656)
-- Name: recipe recipe_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipe_recipe_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16657)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4731 (class 2606 OID 16662)
-- Name: goal goal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_pkey PRIMARY KEY (user_id, nutrient_id);


--
-- TOC entry 4737 (class 2606 OID 16664)
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_pkey PRIMARY KEY (ingredient_id, nutrient_id);


--
-- TOC entry 4733 (class 2606 OID 16666)
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (ingredient_id);


--
-- TOC entry 4743 (class 2606 OID 16668)
-- Name: meal_includes_ingredient meal_includes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_pkey PRIMARY KEY (meal_id, ingredient_id);


--
-- TOC entry 4739 (class 2606 OID 16670)
-- Name: meal meal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_pkey PRIMARY KEY (meal_id);


--
-- TOC entry 4741 (class 2606 OID 16763)
-- Name: meal meal_type_user_id_datetime_truncated_to_minute_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_type_user_id_datetime_truncated_to_minute_key UNIQUE (type, user_id, datetime_truncated_to_minute);


--
-- TOC entry 4745 (class 2606 OID 16672)
-- Name: nutrient nutrient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient
    ADD CONSTRAINT nutrient_pkey PRIMARY KEY (nutrient_id);


--
-- TOC entry 4751 (class 2606 OID 16674)
-- Name: recipe_includes_ingredient recipe_includes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_pkey PRIMARY KEY (recipe_id, ingredient_id);


--
-- TOC entry 4749 (class 2606 OID 16676)
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (recipe_id);


--
-- TOC entry 4735 (class 2606 OID 16748)
-- Name: ingredient unique_ingredient_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT unique_ingredient_name UNIQUE (name);


--
-- TOC entry 4747 (class 2606 OID 16678)
-- Name: nutrient unique_nutrient_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nutrient
    ADD CONSTRAINT unique_nutrient_name UNIQUE (name);


--
-- TOC entry 4753 (class 2606 OID 16756)
-- Name: users unique_users_user_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_users_user_name UNIQUE (user_name);


--
-- TOC entry 4755 (class 2606 OID 16680)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4756 (class 2606 OID 16737)
-- Name: goal goal_nutrient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_nutrient_id_fkey FOREIGN KEY (nutrient_id) REFERENCES public.nutrient(nutrient_id);


--
-- TOC entry 4757 (class 2606 OID 16686)
-- Name: goal goal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 4758 (class 2606 OID 16691)
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- TOC entry 4759 (class 2606 OID 16696)
-- Name: ingredient_contains_nutrient ingredient_contains_nutrient_nutrient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredient_contains_nutrient
    ADD CONSTRAINT ingredient_contains_nutrient_nutrient_id_fkey FOREIGN KEY (nutrient_id) REFERENCES public.nutrient(nutrient_id);


--
-- TOC entry 4761 (class 2606 OID 16701)
-- Name: meal_includes_ingredient meal_includes_ingredient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- TOC entry 4762 (class 2606 OID 16732)
-- Name: meal_includes_ingredient meal_includes_ingredient_meal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_includes_ingredient
    ADD CONSTRAINT meal_includes_ingredient_meal_id_fkey FOREIGN KEY (meal_id) REFERENCES public.meal(meal_id) ON DELETE CASCADE;


--
-- TOC entry 4760 (class 2606 OID 16711)
-- Name: meal meal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 4763 (class 2606 OID 16716)
-- Name: recipe_includes_ingredient recipe_includes_ingredient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);


--
-- TOC entry 4764 (class 2606 OID 16742)
-- Name: recipe_includes_ingredient recipe_includes_ingredient_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_includes_ingredient
    ADD CONSTRAINT recipe_includes_ingredient_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(recipe_id) ON DELETE CASCADE;


-- Completed on 2024-12-09 05:16:37

--
-- PostgreSQL database dump complete
--

