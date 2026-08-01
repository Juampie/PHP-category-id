--
-- PostgreSQL database dump
--

\restrict hdOnaljOvNcJQ2KqXLBMGeKuYngALJdvse0MFuUNnYCoZm0l2NXSUuAidcvmE7G

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-07-31 20:12:34

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
-- TOC entry 220 (class 1259 OID 16424)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE categories; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.categories IS 'Категории товаров';


--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 222 (class 1259 OID 16438)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    price numeric(10,2) NOT NULL,
    description text,
    category_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products IS 'Товары';


--
-- TOC entry 221 (class 1259 OID 16437)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 4861 (class 2604 OID 16427)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 16441)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 5022 (class 0 OID 16424)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, 'Электроника', 'Смартфоны, ноутбуки, аксессуары', '2026-07-31 16:26:20.658488+03');
INSERT INTO public.categories VALUES (2, 'Книги', 'Художественная и техническая литература', '2026-07-31 16:26:20.658488+03');
INSERT INTO public.categories VALUES (3, 'Одежда', 'Мужская, женская, детская одежда', '2026-07-31 16:26:20.658488+03');


--
-- TOC entry 5024 (class 0 OID 16438)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'Смартфон X', 599.99, '6.5" экран, 128GB, камера 48MP', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (2, 'Ноутбук Pro', 1299.00, '16GB RAM, 512GB SSD, Intel i7', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (3, 'Беспроводные наушники', 89.90, 'шумоподавление, 20ч работы', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (4, 'Война и мир', 15.50, 'роман Л.Н. Толстого', 2, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (5, 'Книга по PHP', 45.00, 'современный PHP 8', 2, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (6, 'Футболка хлопок', 19.99, 'размер M, белый', 3, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (7, 'Джинсы классические', 49.95, 'синие, размер 32/32', 3, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (8, 'Смартфон X', 599.99, '6.5" экран, 128GB, камера 48MP', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (9, 'Ноутбук Pro', 1299.00, '16GB RAM, 512GB SSD, Intel i7', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (10, 'Беспроводные наушники', 89.90, 'шумоподавление, 20ч работы', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (11, 'Война и мир', 15.50, 'роман Л.Н. Толстого', 2, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (12, 'Книга по PHP', 45.00, 'современный PHP 8', 2, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (13, 'Футболка хлопок', 19.99, 'размер M, белый', 3, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (14, 'Джинсы классические', 49.95, 'синие, размер 32/32', 3, '2026-07-31 16:26:28.579867+03');


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 14, true);


--
-- TOC entry 4867 (class 2606 OID 16436)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 4869 (class 2606 OID 16434)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 16451)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 1259 OID 16457)
-- Name: idx_products_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_category_id ON public.products USING btree (category_id);


--
-- TOC entry 4873 (class 2606 OID 16452)
-- Name: products fk_products_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE RESTRICT;


-- Completed on 2026-07-31 20:12:34

--
-- PostgreSQL database dump complete
--

\unrestrict hdOnaljOvNcJQ2KqXLBMGeKuYngALJdvse0MFuUNnYCoZm0l2NXSUuAidcvmE7G

