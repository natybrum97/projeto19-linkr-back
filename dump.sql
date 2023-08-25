--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    "idFollower" integer NOT NULL,
    "idFollowed" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    "hashtagText" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "idPost" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "postUrl" text NOT NULL,
    "postText" text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "repostById" integer
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: reposts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reposts (
    id integer NOT NULL,
    "idUserRepost" integer NOT NULL,
    "idUserOriginalPost" integer NOT NULL,
    "idOriginalPost" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reposts_id_seq OWNED BY public.reposts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "idUser" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: trends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trends (
    id integer NOT NULL,
    "idPost" integer NOT NULL,
    "idHashtag" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: trends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trends_id_seq OWNED BY public.trends.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "pictureUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts ALTER COLUMN id SET DEFAULT nextval('public.reposts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: trends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends ALTER COLUMN id SET DEFAULT nextval('public.trends_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (1, 2, 322, 'testezinho', '2023-08-24 20:43:00.187818');
INSERT INTO public.comments VALUES (2, 2, 322, 'carai', '2023-08-25 11:02:30.218943');


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.follows VALUES (1, 1, 1, '2023-08-22 00:49:39.372929');
INSERT INTO public.follows VALUES (57, 1, 2, '2023-08-22 13:04:55.903397');
INSERT INTO public.follows VALUES (81, 3, 2, '2023-08-23 21:41:18.900773');
INSERT INTO public.follows VALUES (83, 2, 1, '2023-08-24 20:37:47.510233');
INSERT INTO public.follows VALUES (86, 2, 3, '2023-08-25 11:08:17.405109');


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (50, '#45435345aaaaaaaaaaaaaa', '2023-08-21 23:53:19.692487');
INSERT INTO public.hashtags VALUES (51, '#433434aaa', '2023-08-21 23:53:19.692487');
INSERT INTO public.hashtags VALUES (52, '#45435345aaaaaaaaaaaaa', '2023-08-21 23:53:25.526864');
INSERT INTO public.hashtags VALUES (64, '#AAAAAAAAAAAAA', '2023-08-22 22:12:22.300102');
INSERT INTO public.hashtags VALUES (65, '#dsaasdasdsaas', '2023-08-22 22:22:27.252971');
INSERT INTO public.hashtags VALUES (66, '#testezinhooo', '2023-08-22 23:39:12.521712');
INSERT INTO public.hashtags VALUES (67, '#sdasdsdasdaasd', '2023-08-23 20:30:52.481796');
INSERT INTO public.hashtags VALUES (68, '#7547457457457457457457457457', '2023-08-23 20:31:04.66709');
INSERT INTO public.hashtags VALUES (69, '#uuuuu', '2023-08-23 20:33:16.367463');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (27, 3, 103, '2023-08-22 15:42:09.341481');
INSERT INTO public.likes VALUES (36, 2, 322, '2023-08-25 11:02:18.515213');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (91, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'hihi', '2023-08-22 15:33:01.761304', NULL);
INSERT INTO public.posts VALUES (43, 1, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'https://www.youtube.com/watch?v=saqvz-gIGDs', '2023-08-21 23:29:33.9094', NULL);
INSERT INTO public.posts VALUES (96, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'ue', '2023-08-22 15:37:25.055231', NULL);
INSERT INTO public.posts VALUES (98, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'tendi realmente n', '2023-08-22 15:38:27.838423', NULL);
INSERT INTO public.posts VALUES (99, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'tendi realmente n', '2023-08-22 15:39:33.94282', NULL);
INSERT INTO public.posts VALUES (53, 1, 'https://www.youtube.com/watch?v=saqvz-gIGDs', '#45435345aaaaaaaaaaaaaa #433434aaa', '2023-08-21 23:51:12.482536', NULL);
INSERT INTO public.posts VALUES (52, 1, 'https://www.youtube.com/watch?v=saqvz-gIGDs', '#45435345aaaaaaaaaaaaa', '2023-08-21 23:50:09.480628', NULL);
INSERT INTO public.posts VALUES (54, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 00:37:37.830359', NULL);
INSERT INTO public.posts VALUES (55, 1, 'https://www.youtube.com/watch?v=saqvz-gIGDs', ' #45435345aaaaaaaaaaaaaa #433434aaa ', '2023-08-22 01:49:24.892149', NULL);
INSERT INTO public.posts VALUES (100, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'wtffffffffffffffffff', '2023-08-22 15:39:51.305366', NULL);
INSERT INTO public.posts VALUES (101, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'hm', '2023-08-22 15:40:11.754932', NULL);
INSERT INTO public.posts VALUES (102, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'ata', '2023-08-22 15:41:42.709974', NULL);
INSERT INTO public.posts VALUES (95, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'kaka #sdasdsdasdaasd', '2023-08-22 15:36:12.014982', NULL);
INSERT INTO public.posts VALUES (61, 2, 'http://localhost:3000/timeline', 'teste', '2023-08-22 14:14:27.505426', NULL);
INSERT INTO public.posts VALUES (62, 2, 'http://localhost:3000/timeline', 'teste', '2023-08-22 14:22:50.983402', NULL);
INSERT INTO public.posts VALUES (63, 2, 'http://localhost:3000/timeline', 'teste', '2023-08-22 14:28:37.390118', NULL);
INSERT INTO public.posts VALUES (64, 2, 'http://localhost:3000/timeline', 'aaaa', '2023-08-22 14:29:04.193657', NULL);
INSERT INTO public.posts VALUES (65, 2, 'http://localhost:3000/timeline', 'aaaa', '2023-08-22 14:38:08.202196', NULL);
INSERT INTO public.posts VALUES (66, 2, 'http://localhost:3000/timeline', 'aa', '2023-08-22 14:39:32.476364', NULL);
INSERT INTO public.posts VALUES (67, 2, 'http://localhost:3000/timeline', 'aa', '2023-08-22 14:40:37.436164', NULL);
INSERT INTO public.posts VALUES (68, 2, 'http://localhost:3000/timeline', 'a', '2023-08-22 14:43:06.925995', NULL);
INSERT INTO public.posts VALUES (70, 2, 'http://localhost:3000/timeline', 'a', '2023-08-22 14:43:42.162391', NULL);
INSERT INTO public.posts VALUES (71, 2, 'http://localhost:3000/timeline', 'aa', '2023-08-22 14:44:19.990925', NULL);
INSERT INTO public.posts VALUES (73, 2, 'http://localhost:3000/timeline', 'aaaaa', '2023-08-22 14:45:00.499814', NULL);
INSERT INTO public.posts VALUES (74, 2, 'http://localhost:3000/timeline', 'aaa', '2023-08-22 14:47:05.202904', NULL);
INSERT INTO public.posts VALUES (75, 2, 'http://localhost:3000/timeline', 'aaaa', '2023-08-22 14:47:19.156521', NULL);
INSERT INTO public.posts VALUES (76, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 14:54:52.841148', NULL);
INSERT INTO public.posts VALUES (77, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 14:59:49.93354', NULL);
INSERT INTO public.posts VALUES (78, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 15:01:45.857453', NULL);
INSERT INTO public.posts VALUES (79, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 15:03:04.339676', NULL);
INSERT INTO public.posts VALUES (80, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 15:04:21.402989', NULL);
INSERT INTO public.posts VALUES (81, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaa', '2023-08-22 15:05:32.907492', NULL);
INSERT INTO public.posts VALUES (82, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '?????????????????', '2023-08-22 15:06:05.231754', NULL);
INSERT INTO public.posts VALUES (83, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '?????????????????', '2023-08-22 15:08:27.745083', NULL);
INSERT INTO public.posts VALUES (84, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '?????????????????', '2023-08-22 15:09:17.878661', NULL);
INSERT INTO public.posts VALUES (85, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '?????????????????', '2023-08-22 15:09:44.601892', NULL);
INSERT INTO public.posts VALUES (103, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'hihihihih', '2023-08-22 15:41:56.511579', NULL);
INSERT INTO public.posts VALUES (104, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaa', '2023-08-22 16:43:11.405725', NULL);
INSERT INTO public.posts VALUES (105, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:43:21.966604', NULL);
INSERT INTO public.posts VALUES (106, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:33.327979', NULL);
INSERT INTO public.posts VALUES (107, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:33.801488', NULL);
INSERT INTO public.posts VALUES (108, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:33.94352', NULL);
INSERT INTO public.posts VALUES (109, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.111238', NULL);
INSERT INTO public.posts VALUES (110, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.270459', NULL);
INSERT INTO public.posts VALUES (111, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.454585', NULL);
INSERT INTO public.posts VALUES (112, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.598217', NULL);
INSERT INTO public.posts VALUES (113, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.775113', NULL);
INSERT INTO public.posts VALUES (114, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:34.919563', NULL);
INSERT INTO public.posts VALUES (115, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.101381', NULL);
INSERT INTO public.posts VALUES (116, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.246839', NULL);
INSERT INTO public.posts VALUES (117, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.415077', NULL);
INSERT INTO public.posts VALUES (118, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.566331', NULL);
INSERT INTO public.posts VALUES (119, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.73366', NULL);
INSERT INTO public.posts VALUES (120, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:35.901436', NULL);
INSERT INTO public.posts VALUES (121, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.061879', NULL);
INSERT INTO public.posts VALUES (122, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.230337', NULL);
INSERT INTO public.posts VALUES (123, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.382014', NULL);
INSERT INTO public.posts VALUES (124, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.557432', NULL);
INSERT INTO public.posts VALUES (125, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.709745', NULL);
INSERT INTO public.posts VALUES (126, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:36.878421', NULL);
INSERT INTO public.posts VALUES (127, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.054165', NULL);
INSERT INTO public.posts VALUES (128, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.222222', NULL);
INSERT INTO public.posts VALUES (129, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.399481', NULL);
INSERT INTO public.posts VALUES (130, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.584339', NULL);
INSERT INTO public.posts VALUES (131, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.751693', NULL);
INSERT INTO public.posts VALUES (132, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:37.901634', NULL);
INSERT INTO public.posts VALUES (88, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'cuzinho #7547457457457457457457457457', '2023-08-22 15:28:00.068124', NULL);
INSERT INTO public.posts VALUES (90, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'hihi #uuuuu', '2023-08-22 15:30:41.687225', NULL);
INSERT INTO public.posts VALUES (133, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.069797', NULL);
INSERT INTO public.posts VALUES (134, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.239127', NULL);
INSERT INTO public.posts VALUES (135, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.406015', NULL);
INSERT INTO public.posts VALUES (136, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.57489', NULL);
INSERT INTO public.posts VALUES (137, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.742362', NULL);
INSERT INTO public.posts VALUES (138, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:38.918291', NULL);
INSERT INTO public.posts VALUES (139, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:39.085636', NULL);
INSERT INTO public.posts VALUES (140, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:39.238072', NULL);
INSERT INTO public.posts VALUES (141, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:39.389875', NULL);
INSERT INTO public.posts VALUES (142, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:39.557943', NULL);
INSERT INTO public.posts VALUES (143, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:45:39.711528', NULL);
INSERT INTO public.posts VALUES (144, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:06.585665', NULL);
INSERT INTO public.posts VALUES (145, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:06.736611', NULL);
INSERT INTO public.posts VALUES (146, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:06.895774', NULL);
INSERT INTO public.posts VALUES (147, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.040105', NULL);
INSERT INTO public.posts VALUES (148, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.207742', NULL);
INSERT INTO public.posts VALUES (149, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.351022', NULL);
INSERT INTO public.posts VALUES (150, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.511698', NULL);
INSERT INTO public.posts VALUES (151, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.672236', NULL);
INSERT INTO public.posts VALUES (152, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.831572', NULL);
INSERT INTO public.posts VALUES (153, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:07.975281', NULL);
INSERT INTO public.posts VALUES (154, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.136525', NULL);
INSERT INTO public.posts VALUES (155, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.287839', NULL);
INSERT INTO public.posts VALUES (156, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.456482', NULL);
INSERT INTO public.posts VALUES (157, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.615866', NULL);
INSERT INTO public.posts VALUES (158, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.79146', NULL);
INSERT INTO public.posts VALUES (159, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:08.920091', NULL);
INSERT INTO public.posts VALUES (160, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.079681', NULL);
INSERT INTO public.posts VALUES (161, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.247448', NULL);
INSERT INTO public.posts VALUES (162, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.399438', NULL);
INSERT INTO public.posts VALUES (163, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.567395', NULL);
INSERT INTO public.posts VALUES (164, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.719764', NULL);
INSERT INTO public.posts VALUES (165, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:09.879318', NULL);
INSERT INTO public.posts VALUES (166, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.046777', NULL);
INSERT INTO public.posts VALUES (167, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.223441', NULL);
INSERT INTO public.posts VALUES (168, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.363318', NULL);
INSERT INTO public.posts VALUES (169, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.520564', NULL);
INSERT INTO public.posts VALUES (170, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.690394', NULL);
INSERT INTO public.posts VALUES (171, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.839442', NULL);
INSERT INTO public.posts VALUES (172, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:10.991536', NULL);
INSERT INTO public.posts VALUES (173, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:47:11.135606', NULL);
INSERT INTO public.posts VALUES (174, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.029052', NULL);
INSERT INTO public.posts VALUES (175, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.196492', NULL);
INSERT INTO public.posts VALUES (176, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.363621', NULL);
INSERT INTO public.posts VALUES (177, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.522885', NULL);
INSERT INTO public.posts VALUES (178, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.691256', NULL);
INSERT INTO public.posts VALUES (179, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.843823', NULL);
INSERT INTO public.posts VALUES (180, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 16:50:56.986735', NULL);
INSERT INTO public.posts VALUES (181, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:00:58.046966', NULL);
INSERT INTO public.posts VALUES (182, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:25:27.566394', NULL);
INSERT INTO public.posts VALUES (183, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:26:04.007842', NULL);
INSERT INTO public.posts VALUES (184, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:33:22.701194', NULL);
INSERT INTO public.posts VALUES (185, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:37:31.337628', NULL);
INSERT INTO public.posts VALUES (186, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'aaaaaaaaaaaaaaaa', '2023-08-22 17:41:20.092547', NULL);
INSERT INTO public.posts VALUES (187, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'xxxxxxxxxxxxxxxx', '2023-08-22 17:42:50.20672', NULL);
INSERT INTO public.posts VALUES (188, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'xx222222222xxxxxxxx', '2023-08-22 17:43:20.954307', NULL);
INSERT INTO public.posts VALUES (189, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:44:33.682309', NULL);
INSERT INTO public.posts VALUES (205, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:49.270979', NULL);
INSERT INTO public.posts VALUES (192, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:43.111842', NULL);
INSERT INTO public.posts VALUES (193, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:43.42981', NULL);
INSERT INTO public.posts VALUES (194, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:43.574713', NULL);
INSERT INTO public.posts VALUES (195, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:43.725226', NULL);
INSERT INTO public.posts VALUES (196, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:43.869895', NULL);
INSERT INTO public.posts VALUES (197, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.029507', NULL);
INSERT INTO public.posts VALUES (198, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.173401', NULL);
INSERT INTO public.posts VALUES (199, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.333318', NULL);
INSERT INTO public.posts VALUES (200, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.485279', NULL);
INSERT INTO public.posts VALUES (201, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.637138', NULL);
INSERT INTO public.posts VALUES (202, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.797001', NULL);
INSERT INTO public.posts VALUES (203, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:44.949742', NULL);
INSERT INTO public.posts VALUES (204, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:45.101842', NULL);
INSERT INTO public.posts VALUES (206, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:49.41429', NULL);
INSERT INTO public.posts VALUES (207, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:49.566341', NULL);
INSERT INTO public.posts VALUES (208, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:49.718475', NULL);
INSERT INTO public.posts VALUES (209, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:49.90168', NULL);
INSERT INTO public.posts VALUES (210, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.045866', NULL);
INSERT INTO public.posts VALUES (211, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.220618', NULL);
INSERT INTO public.posts VALUES (212, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.385025', NULL);
INSERT INTO public.posts VALUES (213, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.550882', NULL);
INSERT INTO public.posts VALUES (214, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.710182', NULL);
INSERT INTO public.posts VALUES (215, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:50.886289', NULL);
INSERT INTO public.posts VALUES (216, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.038582', NULL);
INSERT INTO public.posts VALUES (217, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.198484', NULL);
INSERT INTO public.posts VALUES (218, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.366063', NULL);
INSERT INTO public.posts VALUES (219, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.533955', NULL);
INSERT INTO public.posts VALUES (220, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.694076', NULL);
INSERT INTO public.posts VALUES (221, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.845889', NULL);
INSERT INTO public.posts VALUES (222, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:51.998339', NULL);
INSERT INTO public.posts VALUES (223, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:52.142595', NULL);
INSERT INTO public.posts VALUES (224, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:52.277873', NULL);
INSERT INTO public.posts VALUES (225, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:55.593405', NULL);
INSERT INTO public.posts VALUES (226, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 17:48:55.719722', NULL);
INSERT INTO public.posts VALUES (227, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:11:17.458148', NULL);
INSERT INTO public.posts VALUES (228, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:23:23.070444', NULL);
INSERT INTO public.posts VALUES (229, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:25:49.552708', NULL);
INSERT INTO public.posts VALUES (230, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:26:24.068378', NULL);
INSERT INTO public.posts VALUES (231, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:26:46.08158', NULL);
INSERT INTO public.posts VALUES (232, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:27:47.317335', NULL);
INSERT INTO public.posts VALUES (233, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:29:48.956177', NULL);
INSERT INTO public.posts VALUES (234, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'vsu8v89vsd89vsdj89', '2023-08-22 18:30:31.162553', NULL);
INSERT INTO public.posts VALUES (235, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'testaaaaaaaaaaaaaaaa', '2023-08-22 22:11:53.857588', NULL);
INSERT INTO public.posts VALUES (236, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', 'UHUUUU #AAAAAAAAAAAAA', '2023-08-22 22:12:22.294546', NULL);
INSERT INTO public.posts VALUES (237, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:27.247371', NULL);
INSERT INTO public.posts VALUES (238, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:27.772363', NULL);
INSERT INTO public.posts VALUES (239, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:28.209845', NULL);
INSERT INTO public.posts VALUES (240, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:28.609244', NULL);
INSERT INTO public.posts VALUES (241, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:28.96957', NULL);
INSERT INTO public.posts VALUES (242, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:29.305043', NULL);
INSERT INTO public.posts VALUES (243, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:29.657303', NULL);
INSERT INTO public.posts VALUES (244, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:30.081877', NULL);
INSERT INTO public.posts VALUES (245, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:30.457006', NULL);
INSERT INTO public.posts VALUES (246, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:30.801483', NULL);
INSERT INTO public.posts VALUES (247, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:31.12121', NULL);
INSERT INTO public.posts VALUES (248, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:31.45722', NULL);
INSERT INTO public.posts VALUES (249, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:31.776867', NULL);
INSERT INTO public.posts VALUES (250, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.017082', NULL);
INSERT INTO public.posts VALUES (251, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.192765', NULL);
INSERT INTO public.posts VALUES (252, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.352546', NULL);
INSERT INTO public.posts VALUES (253, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.520962', NULL);
INSERT INTO public.posts VALUES (254, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.69649', NULL);
INSERT INTO public.posts VALUES (255, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:32.849545', NULL);
INSERT INTO public.posts VALUES (256, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.009087', NULL);
INSERT INTO public.posts VALUES (257, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.177174', NULL);
INSERT INTO public.posts VALUES (258, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.344903', NULL);
INSERT INTO public.posts VALUES (259, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.513028', NULL);
INSERT INTO public.posts VALUES (260, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.672271', NULL);
INSERT INTO public.posts VALUES (261, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:33.832439', NULL);
INSERT INTO public.posts VALUES (262, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:34.0011', NULL);
INSERT INTO public.posts VALUES (263, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:34.160677', NULL);
INSERT INTO public.posts VALUES (264, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:34.30504', NULL);
INSERT INTO public.posts VALUES (265, 1, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#dsaasdasdsaas aaaaaaa', '2023-08-22 22:22:34.448983', NULL);
INSERT INTO public.posts VALUES (266, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:12.516337', NULL);
INSERT INTO public.posts VALUES (267, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:12.871933', NULL);
INSERT INTO public.posts VALUES (268, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.034417', NULL);
INSERT INTO public.posts VALUES (269, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.186129', NULL);
INSERT INTO public.posts VALUES (270, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.347033', NULL);
INSERT INTO public.posts VALUES (271, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.51388', NULL);
INSERT INTO public.posts VALUES (272, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.681297', NULL);
INSERT INTO public.posts VALUES (273, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:13.850175', NULL);
INSERT INTO public.posts VALUES (274, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.017503', NULL);
INSERT INTO public.posts VALUES (275, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.17792', NULL);
INSERT INTO public.posts VALUES (276, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.345717', NULL);
INSERT INTO public.posts VALUES (277, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.521923', NULL);
INSERT INTO public.posts VALUES (278, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.705994', NULL);
INSERT INTO public.posts VALUES (279, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:14.882485', NULL);
INSERT INTO public.posts VALUES (280, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.050224', NULL);
INSERT INTO public.posts VALUES (281, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.219086', NULL);
INSERT INTO public.posts VALUES (282, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.403135', NULL);
INSERT INTO public.posts VALUES (283, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.577271', NULL);
INSERT INTO public.posts VALUES (284, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.737521', NULL);
INSERT INTO public.posts VALUES (285, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:15.92163', NULL);
INSERT INTO public.posts VALUES (286, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.089377', NULL);
INSERT INTO public.posts VALUES (287, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.257583', NULL);
INSERT INTO public.posts VALUES (288, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.441603', NULL);
INSERT INTO public.posts VALUES (289, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.610572', NULL);
INSERT INTO public.posts VALUES (290, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.785342', NULL);
INSERT INTO public.posts VALUES (291, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:16.985375', NULL);
INSERT INTO public.posts VALUES (292, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:17.14559', NULL);
INSERT INTO public.posts VALUES (293, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:17.321581', NULL);
INSERT INTO public.posts VALUES (294, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:17.497681', NULL);
INSERT INTO public.posts VALUES (295, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:17.665479', NULL);
INSERT INTO public.posts VALUES (296, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:17.873916', NULL);
INSERT INTO public.posts VALUES (297, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.009865', NULL);
INSERT INTO public.posts VALUES (298, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.218674', NULL);
INSERT INTO public.posts VALUES (299, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.38585', NULL);
INSERT INTO public.posts VALUES (300, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.553692', NULL);
INSERT INTO public.posts VALUES (301, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.721469', NULL);
INSERT INTO public.posts VALUES (302, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:18.905581', NULL);
INSERT INTO public.posts VALUES (303, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:19.065766', NULL);
INSERT INTO public.posts VALUES (304, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:19.233811', NULL);
INSERT INTO public.posts VALUES (305, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:39:19.4017', NULL);
INSERT INTO public.posts VALUES (306, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:57.609404', NULL);
INSERT INTO public.posts VALUES (307, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:57.901988', NULL);
INSERT INTO public.posts VALUES (308, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.060574', NULL);
INSERT INTO public.posts VALUES (309, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.22007', NULL);
INSERT INTO public.posts VALUES (310, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.396735', NULL);
INSERT INTO public.posts VALUES (311, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.548137', NULL);
INSERT INTO public.posts VALUES (312, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.708141', NULL);
INSERT INTO public.posts VALUES (313, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:58.876034', NULL);
INSERT INTO public.posts VALUES (314, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:59.044416', NULL);
INSERT INTO public.posts VALUES (315, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:59.203996', NULL);
INSERT INTO public.posts VALUES (316, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-22 23:42:59.34804', NULL);
INSERT INTO public.posts VALUES (317, 3, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'cyt', '2023-08-23 20:43:56.378993', NULL);
INSERT INTO public.posts VALUES (318, 3, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'teste', '2023-08-24 13:55:29.442411', NULL);
INSERT INTO public.posts VALUES (319, 3, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-24 14:09:28.13518', NULL);
INSERT INTO public.posts VALUES (320, 3, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-24 14:09:44.75405', NULL);
INSERT INTO public.posts VALUES (321, 3, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-24 14:10:23.256993', NULL);
INSERT INTO public.posts VALUES (322, 2, 'https://www.youtube.com/watch?v=T0YzAw4lMeI', '#testezinhooo', '2023-08-24 14:12:18.457088', NULL);
INSERT INTO public.posts VALUES (323, 3, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:05:36.944164', NULL);
INSERT INTO public.posts VALUES (324, 3, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:06:20.511305', NULL);
INSERT INTO public.posts VALUES (325, 2, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:06:57.000438', NULL);
INSERT INTO public.posts VALUES (326, 3, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:12:30.166289', NULL);
INSERT INTO public.posts VALUES (327, 3, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:15:09.718644', NULL);
INSERT INTO public.posts VALUES (328, 3, 'http://localhost:3000/timeline', 'fdsfdfd', '2023-08-25 11:15:14.157942', NULL);
INSERT INTO public.posts VALUES (329, 2, 'http://localhost:3000/timeline', 'teste', '2023-08-25 11:16:14.299897', NULL);
INSERT INTO public.posts VALUES (330, 2, 'http://localhost:3000/timeline', 'dasasdsad', '2023-08-25 11:16:18.079897', NULL);
INSERT INTO public.posts VALUES (331, 2, 'http://localhost:3000/timeline', 'dsaadsasd', '2023-08-25 11:17:27.260351', NULL);
INSERT INTO public.posts VALUES (332, 3, 'http://localhost:3000/timeline', 'cu', '2023-08-25 11:20:58.41406', NULL);
INSERT INTO public.posts VALUES (333, 3, 'http://localhost:3000/timeline', 'cu', '2023-08-25 11:21:31.251006', NULL);
INSERT INTO public.posts VALUES (334, 2, 'http://localhost:3000/timeline', 'cu', '2023-08-25 11:21:56.4402', NULL);
INSERT INTO public.posts VALUES (335, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'aaaaaaaaaaaaaaaaaaaaa', '2023-08-25 11:26:58.783406', NULL);
INSERT INTO public.posts VALUES (336, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'adasd', '2023-08-25 11:31:44.748941', NULL);
INSERT INTO public.posts VALUES (337, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'teste', '2023-08-25 11:41:35.581631', NULL);
INSERT INTO public.posts VALUES (338, 3, 'http://localhost:3000/timeline', 'aaaaaaaaaaa', '2023-08-25 11:44:49.816999', NULL);
INSERT INTO public.posts VALUES (339, 2, 'https://mangalivre.net/manga/bones/17835', 'testando repost com get more posts', '2023-08-25 11:48:38.050433', NULL);
INSERT INTO public.posts VALUES (340, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'testando dnv o repost', '2023-08-25 11:58:13.362972', NULL);
INSERT INTO public.posts VALUES (341, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'testando dnv o repost', '2023-08-25 11:58:23.245851', 3);
INSERT INTO public.posts VALUES (342, 2, 'https://www.youtube.com/watch?v=saqvz-gIGDs', 'testando dnv o repost', '2023-08-25 11:59:37.103036', 3);
INSERT INTO public.posts VALUES (345, 3, 'http://localhost:3000/timeline', 'TESTE', '2023-08-25 12:12:36.720706', NULL);
INSERT INTO public.posts VALUES (346, 3, 'http://localhost:3000/timeline', 'TESTE', '2023-08-25 12:25:53.665385', 2);


--
-- Data for Name: reposts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reposts VALUES (1, 2, 2, 322, '2023-08-25 11:01:59.830607');
INSERT INTO public.reposts VALUES (2, 2, 2, 322, '2023-08-25 11:02:49.373215');
INSERT INTO public.reposts VALUES (3, 2, 2, 316, '2023-08-25 11:02:57.7873');
INSERT INTO public.reposts VALUES (4, 2, 2, 325, '2023-08-25 11:08:37.746186');
INSERT INTO public.reposts VALUES (5, 2, 3, 324, '2023-08-25 11:12:04.460341');
INSERT INTO public.reposts VALUES (6, 3, 3, 328, '2023-08-25 11:15:39.552519');
INSERT INTO public.reposts VALUES (7, 2, 2, 330, '2023-08-25 11:16:49.096382');
INSERT INTO public.reposts VALUES (8, 2, 3, 328, '2023-08-25 11:17:46.3972');
INSERT INTO public.reposts VALUES (9, 2, 2, 334, '2023-08-25 11:27:06.943153');
INSERT INTO public.reposts VALUES (10, 3, 2, 336, '2023-08-25 11:32:06.877048');
INSERT INTO public.reposts VALUES (11, 2, 3, 338, '2023-08-25 11:46:46.589311');
INSERT INTO public.reposts VALUES (12, 3, 2, 339, '2023-08-25 11:48:53.837239');
INSERT INTO public.reposts VALUES (13, 3, 2, 340, '2023-08-25 11:58:23.240503');
INSERT INTO public.reposts VALUES (14, 3, 2, 341, '2023-08-25 11:59:37.09756');
INSERT INTO public.reposts VALUES (15, 3, 2, 342, '2023-08-25 12:01:20.669768');
INSERT INTO public.reposts VALUES (17, 2, 3, 345, '2023-08-25 12:25:53.65984');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '4347e96d-d590-4510-81ae-b5c6b04b546d', 1, '2023-08-18 18:27:12.38514');
INSERT INTO public.sessions VALUES (2, '5aadd52e-389c-4074-938e-b62f523f4456', 1, '2023-08-18 18:27:41.877684');
INSERT INTO public.sessions VALUES (3, '8aab96fe-e166-403e-a031-40deadc436c4', 1, '2023-08-18 19:53:40.176689');
INSERT INTO public.sessions VALUES (4, '5e74a8eb-43ea-44cf-97df-b8c4bf563a1d', 1, '2023-08-18 19:56:26.53096');
INSERT INTO public.sessions VALUES (5, 'dc5fbdfb-05e7-48fb-a6fb-cc763647bd2a', 1, '2023-08-18 20:08:40.621861');
INSERT INTO public.sessions VALUES (6, '9a70f8eb-eeb3-44b8-bb86-1b556c444e1c', 1, '2023-08-19 20:48:45.050261');
INSERT INTO public.sessions VALUES (7, 'fcd284df-e99d-49de-97a2-f51d772cc2c7', 1, '2023-08-19 21:14:01.288122');
INSERT INTO public.sessions VALUES (8, '9f74f5d3-6813-4b89-8a33-f28b4829597b', 2, '2023-08-19 21:29:24.870983');
INSERT INTO public.sessions VALUES (9, '9b816a7d-9a22-483f-9215-052de1c83dc1', 1, '2023-08-20 11:38:21.721821');
INSERT INTO public.sessions VALUES (10, 'd462cd99-8b56-4ea8-921a-9931424aa887', 2, '2023-08-20 11:38:49.226441');
INSERT INTO public.sessions VALUES (11, 'cba9c688-9657-4e82-bbaa-083b18630cf7', 1, '2023-08-20 12:05:30.93079');
INSERT INTO public.sessions VALUES (12, 'a1066480-ddab-4a42-a30d-42722eeea41d', 1, '2023-08-20 12:06:12.530046');
INSERT INTO public.sessions VALUES (13, '6e07aee1-2ba4-45f7-b729-9e350efd7fec', 1, '2023-08-20 12:14:05.902095');
INSERT INTO public.sessions VALUES (14, '641ef493-bde6-4939-ad22-9bb5223379a9', 1, '2023-08-20 17:10:09.899711');
INSERT INTO public.sessions VALUES (15, 'a06af790-e82c-4099-a82d-7e7fb5af69f6', 1, '2023-08-20 18:37:05.747318');
INSERT INTO public.sessions VALUES (16, '383d5128-d7a0-46c0-8c60-9424cc23ca77', 1, '2023-08-20 19:55:52.294185');
INSERT INTO public.sessions VALUES (17, '5e08e7d0-b77c-4957-bc7b-9cce81a0e91b', 1, '2023-08-20 19:56:13.476898');
INSERT INTO public.sessions VALUES (18, '2c78b0ae-f548-4585-a251-8602ea6ac0b5', 1, '2023-08-20 20:07:58.940794');
INSERT INTO public.sessions VALUES (19, '076d7ae2-9a6f-4c8d-913e-dff3463bea18', 1, '2023-08-20 20:10:53.314242');
INSERT INTO public.sessions VALUES (20, '3d75656d-0788-4a47-a747-01d8aac145f8', 1, '2023-08-20 21:14:53.078544');
INSERT INTO public.sessions VALUES (21, '000b3ab2-ba8d-427d-9fa8-56f03f5e3239', 1, '2023-08-20 22:45:58.17948');
INSERT INTO public.sessions VALUES (22, '6dc14e8a-9f4d-44b9-ac29-20c5a2f59ba1', 3, '2023-08-22 02:07:14.02565');
INSERT INTO public.sessions VALUES (23, '8f11794b-7ce3-475e-a9a2-0733affa9fe8', 3, '2023-08-22 03:07:20.98771');
INSERT INTO public.sessions VALUES (24, '83c67cb9-3a44-4786-8957-dfbc4d7e1477', 2, '2023-08-22 13:34:38.168607');
INSERT INTO public.sessions VALUES (25, '861d9785-91c3-4577-9cfa-1923b6181980', 3, '2023-08-22 13:35:54.894695');
INSERT INTO public.sessions VALUES (26, '1ca4461d-12da-4d19-b320-3fd6329af676', 2, '2023-08-22 14:11:17.94028');
INSERT INTO public.sessions VALUES (27, '2f652b8e-8fc3-4a99-9131-a571d890d819', 1, '2023-08-22 14:54:31.541871');
INSERT INTO public.sessions VALUES (28, '782c3ee6-c0c0-4b00-94da-c5737d3cb92c', 2, '2023-08-22 14:58:51.276251');
INSERT INTO public.sessions VALUES (29, '2df7dbc1-a036-44c2-adaf-1da95b927c05', 2, '2023-08-22 20:54:53.250699');
INSERT INTO public.sessions VALUES (30, 'd9a6aeab-c64a-481b-947d-33f04b3141b1', 2, '2023-08-23 20:04:24.854533');
INSERT INTO public.sessions VALUES (31, '10d2bcc6-c2c9-4fc1-b66d-ecb4b425797a', 3, '2023-08-23 20:41:47.190271');
INSERT INTO public.sessions VALUES (32, '9e307e28-a314-44d0-9fc9-ad6b35d3d08d', 2, '2023-08-23 20:43:21.760997');
INSERT INTO public.sessions VALUES (33, 'b9de677a-86e2-42e0-a0cf-c2e65bf89ec7', 3, '2023-08-23 20:43:49.40306');
INSERT INTO public.sessions VALUES (34, '5faad1c7-f41c-471a-a514-45c7ce59a612', 2, '2023-08-23 21:41:00.247511');
INSERT INTO public.sessions VALUES (35, '12bf9cf4-e4e3-4de5-a52c-d97ce54977ff', 3, '2023-08-23 21:41:15.662415');
INSERT INTO public.sessions VALUES (36, '1ed3f558-aa8d-4a5e-a942-984f48268ef0', 3, '2023-08-24 13:59:07.46423');
INSERT INTO public.sessions VALUES (37, '90803e99-5ecf-4efb-a04b-43600a31c758', 2, '2023-08-24 14:12:04.971096');
INSERT INTO public.sessions VALUES (38, '9eca7783-3fbf-417e-be6b-e03bab4f9eba', 2, '2023-08-24 19:37:13.205953');
INSERT INTO public.sessions VALUES (39, '9ce4f442-6f8b-4ef1-a165-7125a3971df3', 2, '2023-08-24 19:38:06.029266');
INSERT INTO public.sessions VALUES (40, '2c6c1cdf-aac5-4b90-9b82-47fd47751b00', 3, '2023-08-25 11:05:26.482323');


--
-- Data for Name: trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trends VALUES (112, 53, 50, '2023-08-21 23:53:19.693933');
INSERT INTO public.trends VALUES (113, 53, 51, '2023-08-21 23:53:19.693979');
INSERT INTO public.trends VALUES (114, 52, 52, '2023-08-21 23:53:25.528309');
INSERT INTO public.trends VALUES (115, 55, 50, '2023-08-22 01:49:24.894635');
INSERT INTO public.trends VALUES (116, 55, 51, '2023-08-22 01:49:24.894722');
INSERT INTO public.trends VALUES (129, 236, 64, '2023-08-22 22:12:22.301582');
INSERT INTO public.trends VALUES (130, 237, 65, '2023-08-22 22:22:27.254623');
INSERT INTO public.trends VALUES (131, 238, 65, '2023-08-22 22:22:27.778538');
INSERT INTO public.trends VALUES (132, 239, 65, '2023-08-22 22:22:28.214813');
INSERT INTO public.trends VALUES (133, 240, 65, '2023-08-22 22:22:28.614143');
INSERT INTO public.trends VALUES (134, 241, 65, '2023-08-22 22:22:28.974557');
INSERT INTO public.trends VALUES (135, 242, 65, '2023-08-22 22:22:29.310086');
INSERT INTO public.trends VALUES (136, 243, 65, '2023-08-22 22:22:29.662217');
INSERT INTO public.trends VALUES (137, 244, 65, '2023-08-22 22:22:30.084525');
INSERT INTO public.trends VALUES (138, 245, 65, '2023-08-22 22:22:30.461902');
INSERT INTO public.trends VALUES (139, 246, 65, '2023-08-22 22:22:30.806505');
INSERT INTO public.trends VALUES (140, 247, 65, '2023-08-22 22:22:31.122747');
INSERT INTO public.trends VALUES (141, 248, 65, '2023-08-22 22:22:31.462143');
INSERT INTO public.trends VALUES (142, 249, 65, '2023-08-22 22:22:31.781899');
INSERT INTO public.trends VALUES (143, 250, 65, '2023-08-22 22:22:32.01848');
INSERT INTO public.trends VALUES (144, 251, 65, '2023-08-22 22:22:32.197697');
INSERT INTO public.trends VALUES (145, 252, 65, '2023-08-22 22:22:32.357475');
INSERT INTO public.trends VALUES (146, 253, 65, '2023-08-22 22:22:32.525925');
INSERT INTO public.trends VALUES (147, 254, 65, '2023-08-22 22:22:32.701458');
INSERT INTO public.trends VALUES (148, 255, 65, '2023-08-22 22:22:32.851093');
INSERT INTO public.trends VALUES (149, 256, 65, '2023-08-22 22:22:33.014152');
INSERT INTO public.trends VALUES (150, 257, 65, '2023-08-22 22:22:33.182445');
INSERT INTO public.trends VALUES (151, 258, 65, '2023-08-22 22:22:33.350407');
INSERT INTO public.trends VALUES (152, 259, 65, '2023-08-22 22:22:33.518013');
INSERT INTO public.trends VALUES (153, 260, 65, '2023-08-22 22:22:33.677292');
INSERT INTO public.trends VALUES (154, 261, 65, '2023-08-22 22:22:33.837574');
INSERT INTO public.trends VALUES (155, 262, 65, '2023-08-22 22:22:34.006056');
INSERT INTO public.trends VALUES (156, 263, 65, '2023-08-22 22:22:34.165762');
INSERT INTO public.trends VALUES (157, 264, 65, '2023-08-22 22:22:34.310063');
INSERT INTO public.trends VALUES (158, 265, 65, '2023-08-22 22:22:34.45418');
INSERT INTO public.trends VALUES (159, 266, 66, '2023-08-22 23:39:12.523031');
INSERT INTO public.trends VALUES (160, 267, 66, '2023-08-22 23:39:12.873717');
INSERT INTO public.trends VALUES (161, 268, 66, '2023-08-22 23:39:13.040012');
INSERT INTO public.trends VALUES (162, 269, 66, '2023-08-22 23:39:13.191141');
INSERT INTO public.trends VALUES (163, 270, 66, '2023-08-22 23:39:13.348675');
INSERT INTO public.trends VALUES (164, 271, 66, '2023-08-22 23:39:13.519024');
INSERT INTO public.trends VALUES (165, 272, 66, '2023-08-22 23:39:13.686442');
INSERT INTO public.trends VALUES (166, 273, 66, '2023-08-22 23:39:13.85542');
INSERT INTO public.trends VALUES (167, 274, 66, '2023-08-22 23:39:14.023153');
INSERT INTO public.trends VALUES (168, 275, 66, '2023-08-22 23:39:14.183113');
INSERT INTO public.trends VALUES (169, 276, 66, '2023-08-22 23:39:14.350893');
INSERT INTO public.trends VALUES (170, 277, 66, '2023-08-22 23:39:14.527141');
INSERT INTO public.trends VALUES (171, 278, 66, '2023-08-22 23:39:14.71132');
INSERT INTO public.trends VALUES (172, 279, 66, '2023-08-22 23:39:14.887845');
INSERT INTO public.trends VALUES (173, 280, 66, '2023-08-22 23:39:15.055903');
INSERT INTO public.trends VALUES (174, 281, 66, '2023-08-22 23:39:15.22428');
INSERT INTO public.trends VALUES (175, 282, 66, '2023-08-22 23:39:15.409695');
INSERT INTO public.trends VALUES (176, 283, 66, '2023-08-22 23:39:15.582489');
INSERT INTO public.trends VALUES (177, 284, 66, '2023-08-22 23:39:15.742245');
INSERT INTO public.trends VALUES (178, 285, 66, '2023-08-22 23:39:15.926433');
INSERT INTO public.trends VALUES (179, 286, 66, '2023-08-22 23:39:16.094159');
INSERT INTO public.trends VALUES (180, 287, 66, '2023-08-22 23:39:16.262392');
INSERT INTO public.trends VALUES (181, 288, 66, '2023-08-22 23:39:16.446402');
INSERT INTO public.trends VALUES (182, 289, 66, '2023-08-22 23:39:16.612031');
INSERT INTO public.trends VALUES (183, 290, 66, '2023-08-22 23:39:16.790719');
INSERT INTO public.trends VALUES (184, 291, 66, '2023-08-22 23:39:16.990262');
INSERT INTO public.trends VALUES (185, 292, 66, '2023-08-22 23:39:17.150447');
INSERT INTO public.trends VALUES (186, 293, 66, '2023-08-22 23:39:17.326461');
INSERT INTO public.trends VALUES (187, 294, 66, '2023-08-22 23:39:17.502603');
INSERT INTO public.trends VALUES (188, 295, 66, '2023-08-22 23:39:17.670429');
INSERT INTO public.trends VALUES (189, 296, 66, '2023-08-22 23:39:17.879398');
INSERT INTO public.trends VALUES (190, 297, 66, '2023-08-22 23:39:18.011399');
INSERT INTO public.trends VALUES (191, 298, 66, '2023-08-22 23:39:18.223623');
INSERT INTO public.trends VALUES (192, 299, 66, '2023-08-22 23:39:18.387416');
INSERT INTO public.trends VALUES (193, 300, 66, '2023-08-22 23:39:18.558738');
INSERT INTO public.trends VALUES (194, 301, 66, '2023-08-22 23:39:18.726504');
INSERT INTO public.trends VALUES (195, 302, 66, '2023-08-22 23:39:18.910703');
INSERT INTO public.trends VALUES (196, 303, 66, '2023-08-22 23:39:19.070872');
INSERT INTO public.trends VALUES (197, 304, 66, '2023-08-22 23:39:19.238876');
INSERT INTO public.trends VALUES (198, 305, 66, '2023-08-22 23:39:19.40682');
INSERT INTO public.trends VALUES (199, 306, 66, '2023-08-22 23:42:57.615034');
INSERT INTO public.trends VALUES (200, 307, 66, '2023-08-22 23:42:57.903532');
INSERT INTO public.trends VALUES (201, 308, 66, '2023-08-22 23:42:58.065608');
INSERT INTO public.trends VALUES (202, 309, 66, '2023-08-22 23:42:58.225083');
INSERT INTO public.trends VALUES (203, 310, 66, '2023-08-22 23:42:58.398219');
INSERT INTO public.trends VALUES (204, 311, 66, '2023-08-22 23:42:58.553727');
INSERT INTO public.trends VALUES (205, 312, 66, '2023-08-22 23:42:58.713183');
INSERT INTO public.trends VALUES (206, 313, 66, '2023-08-22 23:42:58.881163');
INSERT INTO public.trends VALUES (207, 314, 66, '2023-08-22 23:42:59.049569');
INSERT INTO public.trends VALUES (208, 315, 66, '2023-08-22 23:42:59.209098');
INSERT INTO public.trends VALUES (209, 316, 66, '2023-08-22 23:42:59.353209');
INSERT INTO public.trends VALUES (210, 95, 67, '2023-08-23 20:30:52.483963');
INSERT INTO public.trends VALUES (211, 88, 68, '2023-08-23 20:31:04.671876');
INSERT INTO public.trends VALUES (212, 90, 69, '2023-08-23 20:33:16.372616');
INSERT INTO public.trends VALUES (213, 319, 66, '2023-08-24 14:09:28.140577');
INSERT INTO public.trends VALUES (214, 320, 66, '2023-08-24 14:09:44.759136');
INSERT INTO public.trends VALUES (215, 321, 66, '2023-08-24 14:10:23.262626');
INSERT INTO public.trends VALUES (216, 322, 66, '2023-08-24 14:12:18.462489');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'teste2', 'teste@gmail.com', '$2b$10$DexbMV2Z03RbLM5NU5hrsuQTQOgy.9MtA67Hn5i0hcTp2JSi15XmK', 'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png', '2023-08-18 18:27:06.884286');
INSERT INTO public.users VALUES (2, 'teste23', 'teste23@gmail.com', '$2b$10$Fq9RASL7MbMByDepJM6EMuA2jtWq12Zj0XSAHDsHrXUIVJaUW9VLW', 'data:image/jpeg;base64,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', '2023-08-19 21:29:18.509962');
INSERT INTO public.users VALUES (3, 'gabriel goes 1', 'gabrielgoes1@hotmail.com', '$2b$10$bB9.oMRQyS6kI.S2Q9310.x5XPTJzUqVGaIKdh2dJm0ME1bGTeqiy', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUWFRgVFRYZGBgaGBgaGRgZGhgaGBgYGBgZGRgYGBgcIS4lHB4rIRoaJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISHzQrJCE0NDQ0NDQ2NDQ0NjQ0NDQ0NDQ0NDQ0NDQ0NDQ0PzQ0NDQ0NDQxNDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAAECBAUGBwj/xAA+EAACAQICBgcFBwMEAwEAAAABAgADERIhBAUxQVGRBiJhcYGhsRNSwdHhBxQyQmJy8COSohYzgvEVssKD/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QAKBEAAgICAQQDAAAHAAAAAAAAAAECEQMSURMhMUEEImEUcZGh4fDx/9oADAMBAAIRAxEAPwDfAkgI4EmBFsehBR/BCLTHEecYCSCwWahxQO6x7iI/sjwMcCEUniYLYaB4DwjhYdXbjJYjBYaBKhh0SSXPbJrFchlEkqiWaYWBRhCBhEbGSLHtBwEXtZVZxECOJ5QUYO9XtgWqRWXj5RW/UPOFUYgXkCxhSnaJEoeyNaBQAtIs0sGmZArCpIVorMYNjLZXukcPdCpAaKTGDaaBUcBIMi8I2wriZ5kSJeZE4QTU17YdgUUyJEiWiiyDIIbBRXj3hGUSMNgIEGRKmSMaCwgysiVhSJAiawEIo9ooDF4CTAhVSTCdknsX1AgSYEIFHCSCQbh1IBZILCCnJimYNjUDCyYWTFMxwkGw2pFRJCSCyQWLsHUjaPaTCxwsGwaIgSQEfDHwzbGoa0YiPhitNsahrRBYsMVptgUPgkWSOGMXteImtgoEyQbJLXtFispjbC0UWWDa80TREE2jxlNAcSgxkDLraPBtREZSQriymZEy01ESDUYdkLqyq0gZZNGRalG3RtWVTGJh2pSDU5tkDVgS0YtCFJA05rRqY14o2GKazHQLTkvZCUlJhFqNxnJT5OtMtexj+xglrNCLXMW2HsS9kZIUzHWt2Qi1RA5MNIh7Mxwhhg4jhhBszUCCGSCQoIkgBBsCwQSLDDWjhZtgbAcMWGWBTjinNbNsithjYZaNOQNKa2ZSRWKyJWWTSkDTMOwbTK5WRIhysgyRlIzRXIkTDMkgRGUhXEhiMXtTEVjFY1oWhGrItUEiVkGWG0DuS9oOEb2iwZWMUm7A7hMSxjbsgSkgVhAGZRxgmURgkiwmswmUQbKImEgVhsAsIikLRQ2CjUDyakQCoYRUM49jt1DDDJhBxglpmEWmYHIOoUIJNQINVMmoiuTDqgiyYtBgdskF7YNmKwgAhFEGqwqqINich7SQW8dVEMqrGirJuVA1omP7EyyqiTCy8cNk3NlJqJkChmiRBMomnhr2ZZGUihkAplp0EE3hIPsVUrBMDIGTJ7pFjF2HQIiRaNpOkIil3YIqi7MxAVRxJOQjkgxrY6IkSBkzaeb/AGpa5q0/Z0aVRkBRmcqSpbMDCSM7ZjnKY7nJIE+ys3tf9MdF0YlXfG4/InWbxP4V8TOD1j9pVZmPsqaKm7Hdmt22IAPOcGY07o4orz3OSWST8HUv09007GUdy7fOaWqPtGqqwGkKHTeyDCw7cOw+U4OKPpHgXZ8n0VoOlJWRXRwysLgj+bYc05430E6RNo9UU3P9JzYj3GOxhwG499909hFW85ckXB0Xi4yRIqd0G9MmOXkC8mmxmkIIRG9mTtjF5E1IbYtIXs48hjjTWzUi+GhFaU1qSa1JzM7Ui6ryQaVVqyYqRWNRaDSYeVg8kHgsDiWQ0kDKweEV4rYriWVtCKBKyvCo8VyJSiy4i9ssInbKlNpcpGdOBxbo5Z2goElaIRT1IxSRAYiCcSvrfSjSoVKg2qjEX2YgOrfxtPDtP6TaT7cVWqOxDq2DG6ocJBC4VYWXLYJLLr49lceNyTfpHuTiV3nlNb7V9Jy/oUe38efd1svOBqfaZpNQWRKaEbT1nuCNoB2EeM4pYJt9isXXk9YYwbGeTU+nunKqj+k5A/E6Ndu04XUcgJBftS0hbrU0emTxVnTlcNN/DZPVD7xXk9E6S0ab6NVp1XSmrqVxuwVQxzXMniBynDfZv0lKs2g6Q4OG/sXLArZfxUwwNiN69lxuAnEa+11U0gJT9rVqU0AwirbHiN748J67C+EMc7cL2mLVN+QvlbO2e88/SdWPB9HFvySll+ya9H0yHBFwbg7+M8i+1uqpr01G1UN+9iDbkAfGdZ9n2v62lUnNUL1GVVKgi4wi9xc5/OcP9peE6SxUgnFZs72bAmXZs2SGGLhl1fo6JtSxNo4uNaIR7T0ThGtGtJWitMYST2fobrT2ujpizZRhPbbK88ZSdt0C07AWUnK4Pde+fzkM6uP8imJ1I9RuIxMrJVvEXnFZ1UFYwbSBeQLxrFaJxQOKKawah1eTV5nLVhFrSbidiNFXhFeZq1oRa0VxGRpK8njmctaFWtEcWUVF8NCK8oLVhFqRGjOFl9XhkeZy1IRa0SSZKWM1aby/QeYSVpZp6TBDI4OzlyYWzfBjzMpaZLA00T1cfzsbX27HI8Ul6KHS6ph0SqexfNlE8G09hc5T33WJSrTam4urCzC5Fxe+0ZjZOAToJTFYs7+0pdbqHEjC/wCHrKetbZuvJZPlY3K0/R04FUGmu9nldR14Q1KngZGtk9xzFwJ6bpf2f6Exupqp2K4I7+spM5DpFqdNGcUAxdMKOpa2KxJBvYAbVMri+RCfZAlia7mY17dxvM7WqKDiI3TVdiGYg5kbf52SlX0N6wwU1xMqliBtwoLsRxNt0uml3ElFtUYtfDkFYkYUOy3WKKXG3c1xffaJ0swHECPUoEHrZZZXBztbIG0VZ7sCNtgOUomQaOk6Pa8fRqFRUuHqqAre4VZrvb3rNYeHCYOmBjck3sbnO9ydpJ3mdN0V0BHqJTqoGBptkbizWB2ggzBajZnQkGzFSVuVJBIOEnO0mmlJ8lpJ6IybSZEKKdjY9sEZQhRAxWkmkSZjCXbNHVWmGnUVhxsRxB2iZynOTVs/G8DVhTo9m1bpIK24AEdxlwvOW1XpV1R13AL3qdl/KbgrXnBKNM713Vlo1JAvKxqyBqzUAtY4pU9rFDRiAqSQqzNGP3jy+kmMfvHl9JXpA6yNNasItWZYLe8eX0hFV/ePIfKK8TGWZGmtWEWtMsK/vHkPlCKj+8eQ+UR4hlmRqLXhkrzICPxPIfKFVH4nkIrxDrOuGa6V4Vasx0R+J5D5QyI/vH/GI8P6Os8eGa61YRa8y1R+J5CGSm/vHl9JKWH9G6kX6ZprpEn95lOjo7naTy+k1KGqiRc3/nhJPF3pCSljStlc6RBtXj6XoTLkLjlM50fj5CFYrCnCrRcarPPOmr30n/8ANPVp2Lipx/xnEdLqbiurN+ZButfCzfMTqwY9ZWTzTi40jBqNOj6B0RiqVTtCqi/8jib/ANVnNOJ1PRWg6USw/OxbMHYAFHoT4zrmri0c8JJNNmJ051P7JlqJ/tsxFvcY9bD+2wNu60xQg9qCMwFv/Oc7jX+mOgohgrYq9NQCNmd79/znFaSuDSXVbWxtcAZABiBbkI2O9aYmTVytHQ9GGtpIP6H+EzNfUwmk1LKEBYFVGQIIHWHebnnLnR4MaxcflQ7r/iIA9DOgr3fJ1Rv3Ji5Xgp7WHaOurPOdK4yq5ynZ6dqxajhQqqq2LBFCgDgbb2tyBnN600QA2S5w7SM8/wDq0pGS8CSxumzKZspG8l7JrXsbcd0iRKnOIGSBkJJZjHVdGNLsChOW7hu+Np11GtcTznVmlBGub24d+35+E63QdNLL1bG2R27fhunNOFys6oZEo0zbNSMakzPvb+6POROlP7o84Omw9aJp+0imV98f3R5xTdNg6sTdA7POEVBvt5mAQdh5fSHsOEDZkgiovAcvrCLh4fznBBctg8cvhDKnCxPhFbGSJAL2cvrJqF4jl9Y6L2QyKIrkOokUC7iOUIAo+iwgQbrQqKNw9JNyGSBK6dp7MIh6bLwPdYAyak7h/wCsMjt7h/x+EVyKKI1Jwfykd9rSxTAO70g1qv7h5r9IanWbeLf8haSlf+sJZ0akL5CbVOigB6o7bj5zH0fSG3Yb/uGfcTNelVe2ajs623yl/jRVttf2s489t/5M7TSt8sPgPlMt2Gy3+J5zZ03HbhtNiTbaBnn6TKrPU3Be++UlNVN/8LYpfUqPnfqn+1pzHSzRlY0sa5DHbaD+Tt2Tp6j1R+dc+7LxnO9J2a1Ms6tYuMrZXC8O6X+OrmjZn9Gc5U1bTI/DbuJ+c39REGkEA/2+psJuAAQbjvmSbzR6PuwVwHwjHe1gb9Vc7nunfngtbRx4ZPamYH2i6SyfdwotZncG2xkw4duW/Z3TmNGpu1d8swud8tuHbOx6ZVVxaMrkODUewYDYVwkgDbmyznNX1Aa9cj9Iv+3I+cTErig5HUjoOi2h51M9yXyy/PNbTCiZXu3ugZ+JvlMfVWlMgfCSMWHPK1hiv45iEQFviTtMpHC5St+BXkSX6RCMb2yBN8I3nizbWPylY6Lwy7poKOEd13zoUYx7JEpSk/LMdqIBs6DvEx9c6qAIZBbcwGyx/C4HkZ1FVBBPTutuHmDtHdBKKaAnR53VplTY/wAykROo6SauUUxUTbcYvSczaRaofyEoKSbDb8s522oKhdMRAFgFOzNlxXPpynD0nIII2g3nW9EHuKi55FGy3YgfiDEkNE3vZjskCi9kslR2/wA8JAqO2TsNFfAvARQ/PyjzWajQWiohFppw85U+6Zfib+5oy6v/AF8wT8ZLtydHfgvrTQwoVOznMxtXfr8j8TJLqse+eX1gajyMr4NVAnHz+UJiQbfUzGbUyH8RLd+zleHp6npjefC/xuIrUeWMnLhGmrUTwPP1lhK1Hiv89JlDU9C92F+/D8pap6oojYg5CJJR5Y0duEaa6RSH5lt3j5wg0uiM7rxuM/MTPOrKVrnzAyHjlCUNB0c5rYkZk3vb1Em1HllLlwjRpafSNusM++3PZLVOul8h5GUaS0vdXxGZlpKVIWIVR+0D4SUkv0Dv2Wk01Afwse5R6nIzUo6epACqx7AB6Xymfo1ekv4jbZbhzMvLrOkMsVzwHWPdl8eM6PjvXvdWcuWNuqbK+maYp20mvxOEHLxuZnCqSP8AbP8AcD8ZoaRplI9brW7j3/wSidOpm9iBxJOfnsksrcpN1f6imJUvDAMg3J6fA5TmelY69MAAABye8lbTp/vaHYw8Dect0rrKXQDcl+/E2Q7+qecr8S+rG1yNn7Y2YpYHjyl7o5Ws7pbEpUE5HJlOQOW8Fv7Znhv5fKF1XpS06oYbG6rjcbnI+B9TPVzxcoNI4MMqkmU+njg19EFgLFzu95Lek53UNI4qrkZFiATvIZi1uO6bPTIM+mJhQlUWkLhThUlyzG9rDIi+cklCwAFrASfx4/VD5X9mEojcJbQcvWAo0wM5YDTq8HOSEkPWQJjF9/KYwKpI0tslV2mDpNAzA6ujh0ek2wj6gzhdIoYGZDtBInoLZNecx0q0SzioNjZH9w2eXpEmu1jRZzonS9D6+F3XbiUf4k29TOcteXNVVylRSONrdn02+EhJWikfJ6H7S/5TIu44ecVCoHUNxHCSZe6QtFGmV/arwPMxQ+EdkUOyBqyuutbjZfmPO0ImsXOYS/cb/CZ9bXSKMk8CR8CZCn0j/RbuufhG1/Bt+WbQ0+ptwEDich6QiacSe/8ASdvZlME9IGvkCBxz+KGE/wDPvaykAj3rm/8AiLcxB03wHqLk6MO+WXIHz2Qyh2325H4fGcuvSDSMr4F8L+Qe8f8A1BVvbHypta/DKL0pcIbqR5Z0w0NmJOME7PzjyuRJ09ErXyewzuAo/wDkCcouuaxNyz2vtAI5jK3IyY1rVVvxk32Ymwj/ACU8oHjn+BWSH6dnR0Fwc2UrwOP0vbwlpdWoTcqObDynE0ukNYG2Ig8CAb80WT0jXekWzRyLZ2JUEcerUB5Sbw5OSizY68HdpqxF2Fu7GSv9py8oYaFSG+3cbHmpE8ybWNd+spqLmbqfvBH+NU38QJp6NpGmWxnGctxrgDvLExHgn7Zlmi/CPSdD0JbkX4WGZz3XBJ+E2U0FCua3vmb327DkZ5XT1/WQYC9m/U9+OzEh2jK15co9KK5sG0hE/aUNvBVFo2KDheysnO5eHR3tbV1IE4VAIG0ADIWyvxmZpejLexvbbt/tGzsM5pdeDYdJquNn9PCx47Q2YuYBdZ1GJw/enAvbGFQHtsoy5ycsbk7XYeD17N2dL7Fc7i/jiPpOW6V6PZ0qDYQUPYwJZT4gnlBHXGk55IoF73qOSO/AGMytK1q9QFHZT1r2Va+1f1vYAWvu37ZXBjlGalZsuSMouIkzAy5wFdOBPqLSSPu5/KSZLd9r856/k84qhTckm5J2nb3mHWRMkjGDwEIDHvBs0YvMYLikLls9w8zBgE5kHD5n6QpBYdW1uz5RTDK1zbgMzA02zYdssKmETNOkhWPEn+XhMXg5vna276westFFSmybyMjwYZg84BKuK6hgLbd57DJfeymT2/cNn0gv0zHFVaJXbxsewiT0IdcHPLMkbhfOdDrHRUe5GROd9xvuPwnNUcQYld26RkqHi+532r6m0bsjzH/culpz+r9LxgMp61gGF88uy0utXcbmt/x+M59GVckaGP8AmUeZf3g8D/PCKHRg3RnjVzjafFWC8wbyY1e3Ag9vXB/tmziW20eBEIrqN65bdl+UfqM3TRjjVzX2Jf8Abb1iXV1zdl2cGt42AmsdMpj8TKDuOXwjrrKl748DaDeXBtI8lCnqngSO/EfK3xlldWNbr4T2AYSO/rSa60pHI2t2leeZlpNZ0yB1wO2/DjaK5T4HjGHJUTUyE/gU9jDPzvaWaWqkGQpW2Xsi/Eg+UeprmkpyZTwANye4b5Jde07XuFI3G2Kx7Ijc36GUca9hV1MptdGt7pqOVv8AtJIHdnC0NU7vZ01W34lPWv8A8ltA0+lFFTY2777xxAEuJ0po7cVu/Z3AjPyk5PKvRSKxP2HXUmQuXYE7VGAW7cBX1g06OMGurZbQWxnn1yIGp0tUG3VIseszZdh/DnIjpiFF1K9lrAHneBRzBbwm9T1DTGZCnLMhWpnbvAz8Lzf1dqempUqGXLbfFt2g4wSLzg6XTtxuQG9wQGYjdnhIHhaRrdO6ovkmYzIUWbgSpYgEeEEcWW7l/QSU41UT0DWGho5AysB1iQRdd4BxAcOyYukaqoK1gDdthwhjfiLq1++cNV6UOWLqSpP4sOEYj29Ww8OHjJjphUW+LC97bdoA3ZG383QvDk8oMZwXk6bSdVrhIJfgSGCHLK10sOYmfp+hU0pkLYnIjrO7AA3JzJ3A5zDfpc7iwte/co7s7nxg319fa4udq257tkpDHkTTbBLJjaaQ1Cp6/X4Q7sDn+kfGZ1KoAwwkEXy35cD2iToVLMy3yvlPRUrRwtUwh7/5viV7QNSpYm+6CxMTa1u/L6zWYttUhko3F28B85W0YcdvDhLwMxh9HfLuykXQXuDY+vhBKxsSNudhx4SS1Qwv/wBjvhMPVfKYrnr33C+fcLn1mjpVUKpN+7vmW9M7L7s/HM2gZiu7sGDLtJ9d0K7hhfju390nS0XG4A27eUt09WOrXsDwvsBPjJykkMosz61MoMKi7Hcb5E8M9g3ZSpQ0QocR2XsTa9rjbznRHRCPy58dw7pJdCyta2Wez4yLl+lIqvRn0lXI4jcZCwBPxhVOfVKnsN8XLbDpolj+EX2buY4b9kT6KxyOE9hN+7bsmUkCSdgMbe6f8h8IpP7u/wCn+5vnFDaBTOTVSfzesQoniPOPFKiE00ftlldBJGTesUUxkWE1O5/N/Occ6oPvfW0UUns7HUUGoajdsge61viRLI6NsSRiNx3et4opOU3ZSME0E/0u4Ivex2WK39ZfodDiWszMDbip84opKWadF44YGjR6G07Leo19uQAEtf6M0e1y7DbcZ5kd0UU5X8jJydC+Pj4NHV3QHR3F8TqNtiFYW32O2+U1dG+zvRlzcXvsuSTx/LYWiilYSlKNtnJlSjKkR/0Bo4Y/073tax2C9utcjyvKOk9E9FVyFXIbQQQcjmL3PlFFEyTlHwymGKnLuvQIdGtGB/ALnZl5ZQlPVNEXwoo8DbzMUU5utkfs7OjjXoraVquiRZ6QUXviWwYEbMxnOD6W6FV0dsSf7TAYWJBa9swRf4b4op2fHyy28nNnxR18DdGwzIXqHESerfOwHpnL7pfFbaDeKKeqvB5hNWzDS0NkUUZAZXcWJG48IBSRnfxHaTuO3O/n3lRQBFWqjIEXvs7flM+rVtt3+ecaKBmD6BXwuD3j0l6vrdFte4uL7N3heKKQnFOXcrFtR7Df+SBt1Tnexyztc/CMdai1yrbx+Xd4xRSeiHtibWS5XuOH8EjU1ioUNmM+G7Yd8UUyiuwLYFtbrwMeKKU1QLZ//9k=', '2023-08-22 02:07:11.307685');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 86, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 69, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 36, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 346, true);


--
-- Name: reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reposts_id_seq', 17, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 40, true);


--
-- Name: trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trends_id_seq', 216, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows follows_idFollower_idFollowing_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_idFollower_idFollowing_key" UNIQUE ("idFollower", "idFollowed");


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_hashtagText_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT "hashtags_hashtagText_key" UNIQUE ("hashtagText");


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_idUser_idPost_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idUser_idPost_key" UNIQUE ("idUser", "idPost");


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: reposts reposts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT reposts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: trends trends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT trends_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_comments_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_id ON public.comments USING btree (id);


--
-- Name: idx_comments_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_post_id ON public.comments USING btree (post_id);


--
-- Name: idx_comments_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_user_id ON public.comments USING btree (user_id);


--
-- Name: comments fk_comments_post_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_comments_post_id FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: comments fk_comments_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_comments_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: follows follows_idFollower_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_idFollower_fkey" FOREIGN KEY ("idFollower") REFERENCES public.users(id);


--
-- Name: follows follows_idFollowing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_idFollowing_fkey" FOREIGN KEY ("idFollowed") REFERENCES public.users(id);


--
-- Name: likes likes_idPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id);


--
-- Name: likes likes_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: posts posts_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: posts posts_repostById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_repostById_fkey" FOREIGN KEY ("repostById") REFERENCES public.users(id);


--
-- Name: reposts reposts_idOriginalPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_idOriginalPost_fkey" FOREIGN KEY ("idOriginalPost") REFERENCES public.posts(id);


--
-- Name: reposts reposts_idUserOriginalPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_idUserOriginalPost_fkey" FOREIGN KEY ("idUserOriginalPost") REFERENCES public.users(id);


--
-- Name: reposts reposts_idUserRepost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_idUserRepost_fkey" FOREIGN KEY ("idUserRepost") REFERENCES public.users(id);


--
-- Name: sessions sessions_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: trends trends_idHashtag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT "trends_idHashtag_fkey" FOREIGN KEY ("idHashtag") REFERENCES public.hashtags(id);


--
-- Name: trends trends_idPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT "trends_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

