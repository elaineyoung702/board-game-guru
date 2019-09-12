--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

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
-- Name: bg_tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.bg_tags (
    tagged_bg_id integer NOT NULL,
    user_id integer,
    bg_id integer,
    tag_id integer
);


ALTER TABLE public.bg_tags OWNER TO vagrant;

--
-- Name: bg_tags_tagged_bg_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.bg_tags_tagged_bg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bg_tags_tagged_bg_id_seq OWNER TO vagrant;

--
-- Name: bg_tags_tagged_bg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.bg_tags_tagged_bg_id_seq OWNED BY public.bg_tags.tagged_bg_id;


--
-- Name: boardgames; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.boardgames (
    bg_id integer NOT NULL,
    bg_name character varying NOT NULL,
    thumbnail_url character varying NOT NULL,
    image_url character varying NOT NULL,
    description text NOT NULL,
    playtime integer NOT NULL,
    min_time integer NOT NULL,
    max_time integer NOT NULL,
    year_published integer NOT NULL,
    min_players integer NOT NULL,
    max_players integer NOT NULL,
    suggested_players integer NOT NULL,
    designer character varying(100) NOT NULL,
    publisher character varying NOT NULL
);


ALTER TABLE public.boardgames OWNER TO vagrant;

--
-- Name: boardgames_bg_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.boardgames_bg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boardgames_bg_id_seq OWNER TO vagrant;

--
-- Name: boardgames_bg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.boardgames_bg_id_seq OWNED BY public.boardgames.bg_id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.favorites (
    fav_id integer NOT NULL,
    user_id integer,
    bg_id integer
);


ALTER TABLE public.favorites OWNER TO vagrant;

--
-- Name: favorites_fav_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.favorites_fav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_fav_id_seq OWNER TO vagrant;

--
-- Name: favorites_fav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.favorites_fav_id_seq OWNED BY public.favorites.fav_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.tags (
    tag_id integer NOT NULL,
    tag_name character varying(75) NOT NULL,
    tag_description text NOT NULL
);


ALTER TABLE public.tags OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_tag_id_seq OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags.tag_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: bg_tags tagged_bg_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags ALTER COLUMN tagged_bg_id SET DEFAULT nextval('public.bg_tags_tagged_bg_id_seq'::regclass);


--
-- Name: boardgames bg_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.boardgames ALTER COLUMN bg_id SET DEFAULT nextval('public.boardgames_bg_id_seq'::regclass);


--
-- Name: favorites fav_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites ALTER COLUMN fav_id SET DEFAULT nextval('public.favorites_fav_id_seq'::regclass);


--
-- Name: tags tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.tags ALTER COLUMN tag_id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: bg_tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.bg_tags (tagged_bg_id, user_id, bg_id, tag_id) FROM stdin;
1	1	161936	2
2	1	161936	9
3	1	233312	2
4	1	233312	4
5	1	233312	7
6	1	37111	1
7	1	37111	2
8	1	37111	12
9	1	1198	1
10	1	1198	6
11	1	1198	7
12	1	37111	11
13	2	161936	2
14	2	161936	9
15	2	233312	2
16	2	233312	4
17	2	233312	7
18	2	37111	1
19	2	37111	2
20	2	37111	12
21	2	1198	1
22	2	1198	6
23	2	1198	7
24	2	37111	11
25	3	161936	2
26	3	161936	9
27	3	233312	2
28	3	233312	4
29	3	233312	7
30	3	37111	1
31	3	37111	2
32	3	37111	12
33	3	1198	1
34	3	1198	6
35	3	1198	7
36	3	37111	11
37	4	161936	2
38	4	161936	9
39	4	233312	2
40	4	233312	4
41	4	233312	7
42	4	37111	1
43	4	37111	2
44	4	37111	12
45	4	1198	1
46	4	1198	6
47	4	1198	7
48	4	37111	11
49	5	161936	2
50	5	161936	9
51	5	233312	2
52	5	233312	4
53	5	233312	7
54	5	37111	1
55	5	37111	2
56	5	37111	12
57	5	1198	1
58	5	1198	6
59	5	1198	7
60	5	37111	11
61	6	161936	2
62	6	161936	9
63	6	233312	2
64	6	233312	4
65	6	233312	7
66	6	37111	1
67	6	37111	2
68	6	37111	12
69	6	1198	1
70	6	1198	6
71	6	1198	7
72	6	37111	11
73	7	161936	2
74	7	161936	9
75	7	233312	2
76	7	233312	4
77	7	233312	7
78	7	37111	1
79	7	37111	2
80	7	37111	12
81	7	1198	1
82	7	1198	6
83	7	1198	7
84	7	37111	11
85	8	161936	2
86	8	161936	9
87	8	233312	2
88	8	233312	4
89	8	233312	7
90	8	37111	1
91	8	37111	2
92	8	37111	12
93	8	1198	1
94	8	1198	6
95	8	1198	7
96	8	37111	11
97	9	161936	2
98	9	161936	9
99	9	233312	2
100	9	233312	4
101	9	233312	7
102	9	37111	1
103	9	37111	2
104	9	37111	12
105	9	1198	1
106	9	1198	6
107	9	1198	7
108	9	37111	11
109	10	161936	2
110	10	161936	9
111	10	233312	2
112	10	233312	4
113	10	233312	7
114	10	37111	1
115	10	37111	2
116	10	37111	12
117	10	1198	1
118	10	1198	6
119	10	1198	7
120	10	37111	11
121	11	161936	2
122	11	161936	9
123	11	233312	2
124	11	233312	4
125	11	233312	7
126	11	37111	1
127	11	37111	2
128	11	37111	12
129	11	1198	1
130	11	1198	6
131	11	1198	7
132	11	37111	11
133	12	161936	2
134	12	161936	9
135	12	233312	2
136	12	233312	4
137	12	233312	7
138	12	37111	1
139	12	37111	2
140	12	37111	12
141	12	1198	1
142	12	1198	6
143	12	1198	7
144	12	37111	11
145	13	161936	2
146	13	161936	9
147	13	233312	2
148	13	233312	4
149	13	233312	7
150	13	37111	1
151	13	37111	2
152	13	37111	12
153	13	1198	1
154	13	1198	6
155	13	1198	7
156	13	37111	11
157	14	161936	2
158	14	161936	9
159	14	233312	2
160	14	233312	4
161	14	233312	7
162	14	37111	1
163	14	37111	2
164	14	37111	12
165	14	1198	1
166	14	1198	6
167	14	1198	7
168	14	37111	11
169	15	161936	2
170	15	161936	9
171	15	233312	2
172	15	233312	4
173	15	233312	7
174	15	37111	1
175	15	37111	2
176	15	37111	12
177	15	1198	1
178	15	1198	6
179	15	1198	7
180	15	37111	11
181	16	161936	2
182	16	161936	9
183	16	233312	2
184	16	233312	4
185	16	233312	7
186	16	37111	1
187	16	37111	2
188	16	37111	12
189	16	1198	1
190	16	1198	6
191	16	1198	7
192	16	37111	11
193	17	161936	2
194	17	161936	9
195	17	233312	2
196	17	233312	4
197	17	233312	7
198	17	37111	1
199	17	37111	2
200	17	37111	12
201	17	1198	1
202	17	1198	6
203	17	1198	7
204	17	37111	11
205	18	161936	2
206	18	161936	9
207	18	233312	2
208	18	233312	4
209	18	233312	7
210	18	37111	1
211	18	37111	2
212	18	37111	12
213	18	1198	1
214	18	1198	6
215	18	1198	7
216	18	37111	11
217	19	161936	2
218	19	161936	9
219	19	233312	2
220	19	233312	4
221	19	233312	7
222	19	37111	1
223	19	37111	2
224	19	37111	12
225	19	1198	1
226	19	1198	6
227	19	1198	7
228	19	37111	11
229	20	161936	2
230	20	161936	9
231	20	233312	2
232	20	233312	4
233	20	233312	7
234	20	37111	1
235	20	37111	2
236	20	37111	12
237	20	1198	1
238	20	1198	6
239	20	1198	7
240	20	37111	11
241	21	161936	2
242	21	161936	9
243	21	233312	2
244	21	233312	4
245	21	233312	7
246	21	37111	1
247	21	37111	2
248	21	37111	12
249	21	1198	1
250	21	1198	6
251	21	1198	7
252	21	37111	11
253	22	161936	2
254	22	161936	9
255	22	233312	2
256	22	233312	4
257	22	233312	7
258	22	37111	1
259	22	37111	2
260	22	37111	12
261	22	1198	1
262	22	1198	6
263	22	1198	7
264	22	37111	11
265	23	161936	2
266	23	161936	9
267	23	233312	2
268	23	233312	4
269	23	233312	7
270	23	37111	1
271	23	37111	2
272	23	37111	12
273	23	1198	1
274	23	1198	6
275	23	1198	7
276	23	37111	11
277	24	161936	2
278	24	161936	9
279	24	233312	2
280	24	233312	4
281	24	233312	7
282	24	37111	1
283	24	37111	2
284	24	37111	12
285	24	1198	1
286	24	1198	6
287	24	1198	7
288	24	37111	11
289	25	161936	2
290	25	161936	9
291	25	233312	2
292	25	233312	4
293	25	233312	7
294	25	37111	1
295	25	37111	2
296	25	37111	12
297	25	1198	1
298	25	1198	6
299	25	1198	7
300	25	37111	11
301	26	161936	2
302	26	161936	9
303	26	233312	2
304	26	233312	4
305	26	233312	7
306	26	37111	1
307	26	37111	2
308	26	37111	12
309	26	1198	1
310	26	1198	6
311	26	1198	7
312	26	37111	11
313	27	161936	2
314	27	161936	9
315	27	233312	2
316	27	233312	4
317	27	233312	7
318	27	37111	1
319	27	37111	2
320	27	37111	12
321	27	1198	1
322	27	1198	6
323	27	1198	7
324	27	37111	11
325	28	161936	2
326	28	161936	9
327	28	233312	2
328	28	233312	4
329	28	233312	7
330	28	37111	1
331	28	37111	2
332	28	37111	12
333	28	1198	1
334	28	1198	6
335	28	1198	7
336	28	37111	11
337	29	161936	2
338	29	161936	9
339	29	233312	2
340	29	233312	4
341	29	233312	7
342	29	37111	1
343	29	37111	2
344	29	37111	12
345	29	1198	1
346	29	1198	6
347	29	1198	7
348	29	37111	11
349	30	161936	2
350	30	161936	9
351	30	233312	2
352	30	233312	4
353	30	233312	7
354	30	37111	1
355	30	37111	2
356	30	37111	12
357	30	1198	1
358	30	1198	6
359	30	1198	7
360	30	37111	11
361	31	161936	2
362	31	161936	9
363	31	233312	2
364	31	233312	4
365	31	233312	7
366	31	37111	1
367	31	37111	2
368	31	37111	12
369	31	1198	1
370	31	1198	6
371	31	1198	7
372	31	37111	11
373	32	161936	2
374	32	161936	9
375	32	233312	2
376	32	233312	4
377	32	233312	7
378	32	37111	1
379	32	37111	2
380	32	37111	12
381	32	1198	1
382	32	1198	6
383	32	1198	7
384	32	37111	11
385	33	161936	2
386	33	161936	9
387	33	233312	2
388	33	233312	4
389	33	233312	7
390	33	37111	1
391	33	37111	2
392	33	37111	12
393	33	1198	1
394	33	1198	6
395	33	1198	7
396	33	37111	11
397	34	161936	2
398	34	161936	9
399	34	233312	2
400	34	233312	4
401	34	233312	7
402	34	37111	1
403	34	37111	2
404	34	37111	12
405	34	1198	1
406	34	1198	6
407	34	1198	7
408	34	37111	11
409	35	161936	2
410	35	161936	9
411	35	233312	2
412	35	233312	4
413	35	233312	7
414	35	37111	1
415	35	37111	2
416	35	37111	12
417	35	1198	1
418	35	1198	6
419	35	1198	7
420	35	37111	11
421	36	161936	2
422	36	161936	9
423	36	233312	2
424	36	233312	4
425	36	233312	7
426	36	37111	1
427	36	37111	2
428	36	37111	12
429	36	1198	1
430	36	1198	6
431	36	1198	7
432	36	37111	11
433	37	161936	2
434	37	161936	9
435	37	233312	2
436	37	233312	4
437	37	233312	7
438	37	37111	1
439	37	37111	2
440	37	37111	12
441	37	1198	1
442	37	1198	6
443	37	1198	7
444	37	37111	11
445	38	161936	2
446	38	161936	9
447	38	233312	2
448	38	233312	4
449	38	233312	7
450	38	37111	1
451	38	37111	2
452	38	37111	12
453	38	1198	1
454	38	1198	6
455	38	1198	7
456	38	37111	11
457	39	161936	2
458	39	161936	9
459	39	233312	2
460	39	233312	4
461	39	233312	7
462	39	37111	1
463	39	37111	2
464	39	37111	12
465	39	1198	1
466	39	1198	6
467	39	1198	7
468	39	37111	11
469	40	161936	2
470	40	161936	9
471	40	233312	2
472	40	233312	4
473	40	233312	7
474	40	37111	1
475	40	37111	2
476	40	37111	12
477	40	1198	1
478	40	1198	6
479	40	1198	7
480	40	37111	11
481	41	161936	2
482	41	161936	9
483	41	233312	2
484	41	233312	4
485	41	233312	7
486	41	37111	1
487	41	37111	2
488	41	37111	12
489	41	1198	1
490	41	1198	6
491	41	1198	7
492	41	37111	11
493	42	161936	2
494	42	161936	9
495	42	233312	2
496	42	233312	4
497	42	233312	7
498	42	37111	1
499	42	37111	2
500	42	37111	12
501	42	1198	1
502	42	1198	6
503	42	1198	7
504	42	37111	11
505	43	161936	2
506	43	161936	9
507	43	233312	2
508	43	233312	4
509	43	233312	7
510	43	37111	1
511	43	37111	2
512	43	37111	12
513	43	1198	1
514	43	1198	6
515	43	1198	7
516	43	37111	11
517	44	161936	2
518	44	161936	9
519	44	233312	2
520	44	233312	4
521	44	233312	7
522	44	37111	1
523	44	37111	2
524	44	37111	12
525	44	1198	1
526	44	1198	6
527	44	1198	7
528	44	37111	11
529	45	161936	2
530	45	161936	9
531	45	233312	2
532	45	233312	4
533	45	233312	7
534	45	37111	1
535	45	37111	2
536	45	37111	12
537	45	1198	1
538	45	1198	6
539	45	1198	7
540	45	37111	11
541	46	161936	2
542	46	161936	9
543	46	233312	2
544	46	233312	4
545	46	233312	7
546	46	37111	1
547	46	37111	2
548	46	37111	12
549	46	1198	1
550	46	1198	6
551	46	1198	7
552	46	37111	11
553	47	161936	2
554	47	161936	9
555	47	233312	2
556	47	233312	4
557	47	233312	7
558	47	37111	1
559	47	37111	2
560	47	37111	12
561	47	1198	1
562	47	1198	6
563	47	1198	7
564	47	37111	11
565	48	161936	2
566	48	161936	9
567	48	233312	2
568	48	233312	4
569	48	233312	7
570	48	37111	1
571	48	37111	2
572	48	37111	12
573	48	1198	1
574	48	1198	6
575	48	1198	7
576	48	37111	11
577	49	161936	2
578	49	161936	9
579	49	233312	2
580	49	233312	4
581	49	233312	7
582	49	37111	1
583	49	37111	2
584	49	37111	12
585	49	1198	1
586	49	1198	6
587	49	1198	7
588	49	37111	11
589	50	161936	2
590	50	161936	9
591	50	233312	2
592	50	233312	4
593	50	233312	7
594	50	37111	1
595	50	37111	2
596	50	37111	12
597	50	1198	1
598	50	1198	6
599	50	1198	7
600	50	37111	11
601	51	161936	2
602	51	161936	9
603	51	233312	2
604	51	233312	4
605	51	233312	7
606	51	37111	1
607	51	37111	2
608	51	37111	12
609	51	1198	1
610	51	1198	6
611	51	1198	7
612	51	37111	11
613	52	161936	2
614	52	161936	9
615	52	233312	2
616	52	233312	4
617	52	233312	7
618	52	37111	1
619	52	37111	2
620	52	37111	12
621	52	1198	1
622	52	1198	6
623	52	1198	7
624	52	37111	11
625	53	161936	2
626	53	161936	9
627	53	233312	2
628	53	233312	4
629	53	233312	7
630	53	37111	1
631	53	37111	2
632	53	37111	12
633	53	1198	1
634	53	1198	6
635	53	1198	7
636	53	37111	11
637	54	161936	2
638	54	161936	9
639	54	233312	2
640	54	233312	4
641	54	233312	7
642	54	37111	1
643	54	37111	2
644	54	37111	12
645	54	1198	1
646	54	1198	6
647	54	1198	7
648	54	37111	11
649	55	161936	2
650	55	161936	9
651	55	233312	2
652	55	233312	4
653	55	233312	7
654	55	37111	1
655	55	37111	2
656	55	37111	12
657	55	1198	1
658	55	1198	6
659	55	1198	7
660	55	37111	11
661	56	161936	2
662	56	161936	9
663	56	233312	2
664	56	233312	4
665	56	233312	7
666	56	37111	1
667	56	37111	2
668	56	37111	12
669	56	1198	1
670	56	1198	6
671	56	1198	7
672	56	37111	11
673	57	161936	2
674	57	161936	9
675	57	233312	2
676	57	233312	4
677	57	233312	7
678	57	37111	1
679	57	37111	2
680	57	37111	12
681	57	1198	1
682	57	1198	6
683	57	1198	7
684	57	37111	11
685	58	161936	2
686	58	161936	9
687	58	233312	2
688	58	233312	4
689	58	233312	7
690	58	37111	1
691	58	37111	2
692	58	37111	12
693	58	1198	1
694	58	1198	6
695	58	1198	7
696	58	37111	11
697	59	161936	2
698	59	161936	9
699	59	233312	2
700	59	233312	4
701	59	233312	7
702	59	37111	1
703	59	37111	2
704	59	37111	12
705	59	1198	1
706	59	1198	6
707	59	1198	7
708	59	37111	11
709	60	161936	2
710	60	161936	9
711	60	233312	2
712	60	233312	4
713	60	233312	7
714	60	37111	1
715	60	37111	2
716	60	37111	12
717	60	1198	1
718	60	1198	6
719	60	1198	7
720	60	37111	11
721	61	161936	2
722	61	161936	9
723	61	233312	2
724	61	233312	4
725	61	233312	7
726	61	37111	1
727	61	37111	2
728	61	37111	12
729	61	1198	1
730	61	1198	6
731	61	1198	7
732	61	37111	11
733	62	161936	2
734	62	161936	9
735	62	233312	2
736	62	233312	4
737	62	233312	7
738	62	37111	1
739	62	37111	2
740	62	37111	12
741	62	1198	1
742	62	1198	6
743	62	1198	7
744	62	37111	11
745	63	161936	2
746	63	161936	9
747	63	233312	2
748	63	233312	4
749	63	233312	7
750	63	37111	1
751	63	37111	2
752	63	37111	12
753	63	1198	1
754	63	1198	6
755	63	1198	7
756	63	37111	11
757	64	161936	2
758	64	161936	9
759	64	233312	2
760	64	233312	4
761	64	233312	7
762	64	37111	1
763	64	37111	2
764	64	37111	12
765	64	1198	1
766	64	1198	6
767	64	1198	7
768	64	37111	11
769	65	161936	2
770	65	161936	9
771	65	233312	2
772	65	233312	4
773	65	233312	7
774	65	37111	1
775	65	37111	2
776	65	37111	12
777	65	1198	1
778	65	1198	6
779	65	1198	7
780	65	37111	11
781	66	161936	2
782	66	161936	9
783	66	233312	2
784	66	233312	4
785	66	233312	7
786	66	37111	1
787	66	37111	2
788	66	37111	12
789	66	1198	1
790	66	1198	6
791	66	1198	7
792	66	37111	11
793	67	161936	2
794	67	161936	9
795	67	233312	2
796	67	233312	4
797	67	233312	7
798	67	37111	1
799	67	37111	2
800	67	37111	12
801	67	1198	1
802	67	1198	6
803	67	1198	7
804	67	37111	11
805	68	161936	2
806	68	161936	9
807	68	233312	2
808	68	233312	4
809	68	233312	7
810	68	37111	1
811	68	37111	2
812	68	37111	12
813	68	1198	1
814	68	1198	6
815	68	1198	7
816	68	37111	11
817	69	161936	2
818	69	161936	9
819	69	233312	2
820	69	233312	4
821	69	233312	7
822	69	37111	1
823	69	37111	2
824	69	37111	12
825	69	1198	1
826	69	1198	6
827	69	1198	7
828	69	37111	11
829	70	161936	2
830	70	161936	9
831	70	233312	2
832	70	233312	4
833	70	233312	7
834	70	37111	1
835	70	37111	2
836	70	37111	12
837	70	1198	1
838	70	1198	6
839	70	1198	7
840	70	37111	11
841	71	161936	2
842	71	161936	9
843	71	233312	2
844	71	233312	4
845	71	233312	7
846	71	37111	1
847	71	37111	2
848	71	37111	12
849	71	1198	1
850	71	1198	6
851	71	1198	7
852	71	37111	11
853	72	161936	2
854	72	161936	9
855	72	233312	2
856	72	233312	4
857	72	233312	7
858	72	37111	1
859	72	37111	2
860	72	37111	12
861	72	1198	1
862	72	1198	6
863	72	1198	7
864	72	37111	11
865	73	161936	2
866	73	161936	9
867	73	233312	2
868	73	233312	4
869	73	233312	7
870	73	37111	1
871	73	37111	2
872	73	37111	12
873	73	1198	1
874	73	1198	6
875	73	1198	7
876	73	37111	11
877	74	161936	2
878	74	161936	9
879	74	233312	2
880	74	233312	4
881	74	233312	7
882	74	37111	1
883	74	37111	2
884	74	37111	12
885	74	1198	1
886	74	1198	6
887	74	1198	7
888	74	37111	11
889	75	161936	2
890	75	161936	9
891	75	233312	2
892	75	233312	4
893	75	233312	7
894	75	37111	1
895	75	37111	2
896	75	37111	12
897	75	1198	1
898	75	1198	6
899	75	1198	7
900	75	37111	11
901	76	161936	2
902	76	161936	9
903	76	233312	2
904	76	233312	4
905	76	233312	7
906	76	37111	1
907	76	37111	2
908	76	37111	12
909	76	1198	1
910	76	1198	6
911	76	1198	7
912	76	37111	11
913	77	161936	2
914	77	161936	9
915	77	233312	2
916	77	233312	4
917	77	233312	7
918	77	37111	1
919	77	37111	2
920	77	37111	12
921	77	1198	1
922	77	1198	6
923	77	1198	7
924	77	37111	11
925	78	161936	2
926	78	161936	9
927	78	233312	2
928	78	233312	4
929	78	233312	7
930	78	37111	1
931	78	37111	2
932	78	37111	12
933	78	1198	1
934	78	1198	6
935	78	1198	7
936	78	37111	11
937	79	161936	2
938	79	161936	9
939	79	233312	2
940	79	233312	4
941	79	233312	7
942	79	37111	1
943	79	37111	2
944	79	37111	12
945	79	1198	1
946	79	1198	6
947	79	1198	7
948	79	37111	11
\.


--
-- Data for Name: boardgames; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.boardgames (bg_id, bg_name, thumbnail_url, image_url, description, playtime, min_time, max_time, year_published, min_players, max_players, suggested_players, designer, publisher) FROM stdin;
13	Catan	https://cf.geekdo-images.com/thumb/img/g8LvJsd2oLAub6AEKN_Xpdoi8Sw=/fit-in/200x150/pic2419375.jpg	https://cf.geekdo-images.com/original/img/A-0yDJkve0avEicYQ4HoNO-HkK8=/0x0/pic2419375.jpg	In Catan (formerly The Settlers of Catan), players try to be the dominant force on the island of Catan by building settlements, cities, and roads. On each turn dice are rolled to determine what resources the island produces. Players collect these resources (cards)—wood, grain, brick, sheep, or stone—to build up their civilizations to get to 10 victory points and win the game.\n\nSetup includes randomly placing large hexagonal tiles (each showing a resource or the desert) in a honeycomb shape and surrounding them with water tiles, some of which contain ports of exchange. Number disks, which will correspond to die rolls (two 6-sided dice are used), are placed on each resource tile. Each player is given two settlements (think: houses) and roads (sticks) which are, in turn, placed on intersections and borders of the resource tiles. Players collect a hand of resource cards based on which hex tiles their last-placed house is adjacent to. A robber pawn is placed on the desert tile.\n\nA turn consists of possibly playing a development card, rolling the dice, everyone (perhaps) collecting resource cards based on the roll and position of houses (or upgraded cities—think: hotels) unless a 7 is rolled, turning in resource cards (if possible and desired) for improvements, trading cards at a port, and trading resource cards with other players. If a 7 is rolled, the active player moves the robber to a new hex tile and steals resource cards from other players who have built structures adjacent to that tile.\n\nPoints are accumulated by building settlements and cities, having the longest road and the largest army (from some of the development cards), and gathering certain development cards that simply award victory points. When a player has gathered 10 points (some of which may be held in secret), he announces his total and claims the win.\n\nCatan has won multiple awards and is one of the most popular games in recent history due to its amazing ability to appeal to experienced gamers as well as those new to the hobby.\n\nDie Siedler von Catan was originally published by KOSMOS and has gone through multiple editions. It was licensed by Mayfair and has undergone four editions as The Settlers of Catan. In 2015, it was formally renamed Catan to better represent itself as the core and base game of the Catan series. It has been re-published in two travel editions, portable edition and compact edition, as a special gallery edition (replaced in 2009 with a family edition), as an anniversary wooden edition, as a deluxe 3D collector's edition, in the basic Simply Catan, as a beginner version, and with an entirely new theme in Japan and Asia as Settlers of Catan: Rockman Edition. Numerous spin-offs and expansions have also been made for the game.\n\n	120	60	120	1995	3	4	4	Klaus Teuber	KOSMOS
15	Cosmic Encounter	https://cf.geekdo-images.com/thumb/img/Xn1-EXrcWMzhKTxP1Xbax1fDjiU=/fit-in/200x150/pic19502.jpg	https://cf.geekdo-images.com/original/img/je30ddxHNUfoCnGWJ7yvAhdt1ao=/0x0/pic19502.jpg	By request of Fantasy Flight Games, Board Game Geek lists the various editions of Cosmic Encounter in separate entries. Each edition is the same game at its core, but the features, compatible expansions, and production differ among them. This entry is for the original 1977 Eon version.\n\nPlayers represent alien races that are seeking to spread themselves onto five foreign worlds.  To accomplish this, they make challenges against other players and enlist the aid of interested parties.  But alien powers, which are unique to each race, give players ways to bend or outright break some rule in the game.\n\nThe game continues until one player occupies five planets in other systems to win. Shared victories are possible and a player need not occupy one's own system to win.\n\n	90	90	90	1977	2	6	4	Peter Olotka	Eon
34	Arkham Horror	https://cf.geekdo-images.com/thumb/img/PDKzijL4CNSmJ_y4gkkyjchg3kI=/fit-in/200x150/pic309648.jpg	https://cf.geekdo-images.com/original/img/ONHK8tna66y8DCGXjDrB-UFeKm0=/0x0/pic309648.jpg	Arkham Horror is a cooperative adventure game themed around H.P Lovecraft's Cthulhu Mythos.  The game has players exploring the town of Arkham as they attempt to stop unmentionable horrors from spilling into the world. It's possible for everyone to go insane and lose in this game.\n\nRe-implemented in:\n\nArkham Horror (2005)\n\n	180	180	180	1987	1	8	4	Lynn Willis	Chaosium
74	Apples to Apples	https://cf.geekdo-images.com/thumb/img/SLrCC5Vc1K2qxQ-sw3U4lHk9nQk=/fit-in/200x150/pic213515.jpg	https://cf.geekdo-images.com/original/img/hk2t6NE3MDErfwv0A4vbsImnSWY=/0x0/pic213515.jpg	The party game Apples to Apples consists of two decks of cards: Things and Descriptions. Each round, the active player draws a Description card (which features an adjective like "Hairy" or "Smarmy") from the deck, then the other players each secretly choose the Thing card in hand that best matches that description and plays it face-down on the table. The active player then reveals these cards and chooses the Thing card that, in his opinion, best matches the Description card, which he awards to whoever played that Thing card. This player becomes the new active player for the next round.\n\nOnce a player has won a pre-determined number of Description cards, that player wins.\n\nNote: "Party Box" editions include all cards from Apples to Apples: Expansion Set #1 and Apples to Apples: Expansion Set #2\n\n	30	30	30	1999	4	10	6	Mark Alan Osterhaus	Beverly Enterprises, Inc.
163	Balderdash	https://cf.geekdo-images.com/thumb/img/c6ofMooAX4QE9Xesd8lfVNKVyfY=/fit-in/200x150/pic40574.jpg	https://cf.geekdo-images.com/original/img/MF5BpX_Vpx21a8xBaCOo4OuKwq8=/0x0/pic40574.jpg	A clever repackaging of the parlor game Dictionary, Balderdash contains several cards with real words nobody has heard of.  After one of those words has been read aloud, players try to come up with definitions that at least sound plausible, because points are later awarded for every opposing player who guessed that your definition was the correct one.\n\nVersions of the game as a parlor game go back at least as far as 1970, although Balderdash itself was not published until 1984.\n\nMattel republished Balderdash in 2006 in a form that derives its gameplay from the sequel Beyond Balderdash.\n\nRe-implemented by:\n\n    Beyond Balderdash / Absolute Balderdash\n    Kokkelimonke Jubileum\n\n\n\n\nRe-implements:\n\n    Beyond Balderdash*\n\n\n\n\n\n    In a peculiar situation, this game was reimplemented by Beyond/Absolute Balderdash and then combined back into the original title (Balderdash) but with the rules and cards from Beyond/Absolute; while Tactic re-published their version of Beyond/Absolute combined with the original Balderdash and called it Kokkelimonke Jubileum.\n\n\n	60	60	60	1984	2	6	6	Paul Toyne	Barnes & Noble
171	Chess	https://cf.geekdo-images.com/thumb/img/v4iQ22pft-lihR4m0D9aid05qLE=/fit-in/200x150/pic260745.jpg	https://cf.geekdo-images.com/original/img/kjE_203UAzAopd1voyWKAvXqFHw=/0x0/pic260745.jpg	Chess is a two-player, abstract strategy board game that represents medieval warfare on an 8x8 board with alternating light and dark squares. Opposing pieces, traditionally designated White and Black, are initially lined up on either side. Each type of piece has a unique form of movement and capturing occurs when a piece, via its movement, occupies the square of an opposing piece. Players take turns moving one of their pieces in an attempt to capture, attack, defend, or develop their positions. Chess games can end in checkmate, resignation, or one of several types of draws. Chess is one of the most popular games in the world, played by millions of people worldwide at home, in clubs, online, by correspondence, and in tournaments. Between two highly skilled players, chess can be a beautiful thing to watch, and a game can provide great entertainment even for novices. There is also a large literature of books and periodicals about chess, typically featuring games and commentary by chess masters.\n\nThe current form of the game emerged in Southern Europe during the second half of the 15th century after evolving from a similar, much older game of Indian origin. The tradition of organized competitive chess began in the 16th century. The first official World Chess Champion, Wilhelm Steinitz, claimed his title in 1886. The current World Champion is Magnus Carlsen, Norway. Chess is also a recognized sport of the International Olympic Committee.\n\n	60	60	60	1475	2	2	2	(Uncredited)	(Public Domain)
188	Go	https://cf.geekdo-images.com/thumb/img/jldK9or5F1ke_hBn_jd-Rbnl1F8=/fit-in/200x150/pic1728832.jpg	https://cf.geekdo-images.com/original/img/bCv9Y06nWX1rt7Qn1GuCEOyDov0=/0x0/pic1728832.jpg	By all appearances, it's just two players taking turns laying stones on a 19×19 (or smaller) grid of intersections.  But once its basic rules are understood, Go shows its staggering depth. One can see why many people say it's one of the most elegant brain-burning abstract games in history, with players trying to claim territory by walling off sections of the board and surrounding each other's stones.  The game doesn't end until the board fills up, or, more often, when both players agree to end it, at which time whoever controls the most territory wins.\n\nThe earliest mention of Go (åœæ£‹ (wéi qí)- "surrounding game") appears in the "Analects" of Confucius (551-479 BC), while the earliest physical evidence is a 17×17 Go board discovered in 1952 in a tomb of the former Han dynasty (206 BC- 9 AD). There is a tangle of conflicting popular and scholarly anecdotes attributing its invention to two Chinese emperors, an imperial vassal and court astrologers. One story has it that Go was invented by the legendary Emperor Yao (ruled 2357-2256 BC) as an amusement for his idiot son. A second claims that the Emperor Shun (ruled 2255-2205 BC) created the game in hopes of improving his weak-minded son's mental prowess. A third says the person named Wu, a vassal of the Emperor Jie (ruled 1818-1766 BC), invented Go (as well as games of cards). Finally, a fourth story suggests that Go was developed by court astrologers during the Zhou dynasty (1045-255 BC).\n\nA Go set, consisting of a very general-purpose grid and colored stones, can also be used to play a variety of other abstract strategy games, such as  Connect6, Go-Moku, Pente, and others.\n\n	180	30	180	-2200	2	2	2	(Uncredited)	(Public Domain)
320	Scrabble	https://cf.geekdo-images.com/thumb/img/ND1lWJtIymBjl3YzfSV3q3MB1Xk=/fit-in/200x150/pic404651.jpg	https://cf.geekdo-images.com/original/img/lVqLm3lRviB_an3_gAqhvSJ6riA=/0x0/pic404651.jpg	In this classic word game, players use their seven drawn letter-tiles to form words on the gameboard.  Each word laid out earns points based on the commonality of the letters used, with certain board spaces giving bonuses.  But a word can only be played if it uses at least one already-played tile or adds to an already-played word.  This leads to slightly tactical play, as potential words are rejected because they would give an opponent too much access to the better bonus spaces.\n\nSkip-a-cross was licensed by Selchow & Righter and manufactured by Cadaco. Both games have identical rules but Skip-a-cross has tiles and racks made of cardboard instead of wood. The game was also published because not enough Scrabble games were manufactured to meet the demand.\n\n	90	90	90	1948	2	4	2	Alfred Mosher Butts	(Unknown)
811	Rummikub	https://cf.geekdo-images.com/thumb/img/S22WSylcwkkKRvJ_xBwSZl86txg=/fit-in/200x150/pic2286966.jpg	https://cf.geekdo-images.com/original/img/4H8X72woji1Ujckz0mPbNxrftbU=/0x0/pic2286966.jpg	The game is based on the traditional middle-eastern game of Okey. First created in the 1930s and sold in hand-produced versions until the late 1970s.\n\nSimilar to the Rummy that you play with cards - you try to get rid of all your tiles by forming numbers into runs of 3 tiles or more, or 3 to 4 of a kind. The colors of the numbers on the tiles are like card suits. This game may start rather uneventfully, but when the players start putting more and more tiles in play, the options for your upcoming turns can become more complex, challenging, and exciting (from areyougame.com).\n\n	60	60	60	1977	2	4	4	Ephraim Hertzano	(Unknown)
822	Carcassonne	https://cf.geekdo-images.com/thumb/img/kqE4YJSm5PVkocYGl-V_IJcZQw4=/fit-in/200x150/pic2337577.jpg	https://cf.geekdo-images.com/original/img/o4p6f88SGE899BTNMzTvERVWZ-M=/0x0/pic2337577.jpg	Carcassonne is a tile-placement game in which the players draw and place a tile with a piece of southern French landscape on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, etcetera. Having placed a tile, the player can then decide to place one of his meeples on one of the areas on it: on the city as a knight, on the road as a robber, on a cloister as a monk, or on the grass as a farmer. When that area is complete, that meeple scores points for its owner.\n\nDuring a game of Carcassonne, players are faced with decisions like: "Is it really worth putting my last meeple there?" or "Should I use this tile to expand my city, or should I place it near my opponent instead, giving him a hard time to complete his project and score points?" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.\n\nFirst game in the Carcassonne series.\n\n\t\t\t\t\n\t\t\t\t\tBeschreibung\n\nEine mittelalterliche Landschaft mit Städten und Klöstern, Straßen und Wiesen. Mit Taktik und ihren Gefolgsleuten (Meeple) dehnen die Spieler in diesem raffinierten Legespiel ihren Einfluss auf die einzelnen Bereiche ständig aus. Und das mit wachsender Begeisterung!\nCarcassonne ist ein Legespiel, bei dem die Spieler verdeckt Landschaftsplättchen ziehen und an die bestehende Landschaft passend anlegen müssen. Auf den Plättchen sind Städte, Straßen, Klöster und Grasland in verschiedenen Kombinationen dargestellt. Wenn dann das Plättchen passend angelegt wurde, darf der Spieler entscheiden, ob auf das gerade angelegte Plättchen ein Meeple als Ritter (in Stadt), Wegelagerer (auf Straße), Mönch (in Kloster) oder Bauer (auf Wiese) eingesetzt werden soll, vor allem wenn es vielleicht gerade der letzte ist...\n\n	45	30	45	2000	2	5	2	Klaus-Jürgen Wrede	Hans im Glück
859	Illuminati	https://cf.geekdo-images.com/thumb/img/mtVBeyyKY5Tw5PBucobCaJhzcY4=/fit-in/200x150/pic55406.jpg	https://cf.geekdo-images.com/original/img/DRXGRLLJG9ySKNBwNItKDhRtkeg=/0x0/pic55406.jpg	Illuminati is a classic Steve Jackson (I) game of world domination. Each player takes on the role of a secret society attempting to spread its tendrils into special interest groups throughout the world.\n\nThe game consists of three different cards (illuminati cards, group cards, and special event cards) and money. During a player's turn, a new card is drawn from a deck containing both group cards and special event cards. If it is a special event, the player in turn keeps the card and plays it when desired. If it is a group card, it is turned up along with any other face-up cards. The player in turn may then attempt to take over any group. This can be either a group on the table or a group already controlled by another player. If another player already controls the group it is more difficult to take it over, but not impossible.\n\nHow difficult it is to take over a group depends on the strength of the controlling group, the resistance of the group being taken over, the proximity of the group being taken over to the controlling player's illuminati card (if someone already controls it), and other factors. Once this is determined, both the attacking and defending player can modify the odds further by spending "megabucks". Once a group is taken over, it has to be attached to the card structure the player already controls. How cards can be attached to each other is limited by in- and outbound arrows on the cards, and maintaining a well-structured tree of groups can be vital to success.\n\nThe winning condition for each player is different and depends on what illuminati card that player has.\n\nThis first edition contains 54 small black and white cards.\n\nExpanded by:\n\n    Illuminati Expansion Set 1\n    Illuminati Expansion Set 2\n    Illuminati Expansion Set 3\n\n\n\n\nRe-published as:\n\n    Illuminati:  Deluxe Edition\n\n\n\n\nCCG Version:\n\n    Illuminati: New World Order\n\n\n\n\nMagazine Articles:\n\n    Imagine (Issue 6 - Sep 1983)\n        European Illuminati - New cards.\n    \n    The Space Gamer (Issue 59 - Jan 1983)\n        Illuminating the Post Office - Converting six groups to Illuminati.\n    \n    Space Gamer (Issue 72 - Jan 1985)\n        Death to Deadheads! - Variant rules for Illuminati, The Evil Geniuses Are Here! - Variant new cards for Illuminati, More Groups Illuminated! - A couple more illuminated groups for Illuminati, The Monty Python Illuminati - The British Illuminati, 24 groups, and 3 special cards with a Monty Python theme.\n    \n\n\n\n\n	120	60	120	1982	2	6	5	Steve Jackson (I)	Steve Jackson Games
891	Cranium	https://cf.geekdo-images.com/thumb/img/RDUSRr36B9VlXwy4WFDxVvzp-Hc=/fit-in/200x150/pic180029.jpg	https://cf.geekdo-images.com/original/img/zWh4ODKPZRL1W0KMkDQJa-2OY7I=/0x0/pic180029.jpg	Cranium bills itself as the "whole-brain" game.  It's a party game that borrows from a host of other popular party games of recent times.  Players have to successfully complete activities in each of four sections to win:  In \n - Creative Cat : A player must clue a word to his or her teammates by drawing it, sculpting it in clay, or drawing it with his or her eyes closed.\n - Data Head :  A variety of trivia questions.  \n - Word Worm : Players unscramble words, spell challenging words, guess definitions, identify words with letters left out, or spell words backwords.  \n - Star Performer : players must whistle a song, impersonate a celebrity, or act out a clue.\n\nCranium has elements similar to those of Pictionary, Charades, Trivial Pursuit: Genus Edition, Celebrities, Huggermugger, Claymania, etc.\n\nExpanded by:\n\n    Cranium Booster Box 1\n    Cranium Booster Box 2\n    Cranium New York Booster Pack\n\n\n\n\n	60	60	60	1998	4	16	8	Richard Tait	Cranium, Inc.
1198	SET	https://cf.geekdo-images.com/thumb/img/u2hUKMtcxuZuvYQZZA5qQh9g-oQ=/fit-in/200x150/pic73045.jpg	https://cf.geekdo-images.com/original/img/XglXKFE5mejlJzxVkOkSTIiK4Mc=/0x0/pic73045.jpg	In SET, each card contains 1-3 objects, with all of the objects on a card having the same color, shape and shading, e.g., two purple shaded ovals. Colors, shapes, and shadings come in three different types: green, purple and red; oval, diamond and squiggle; and solid, shaded and outlined.\n\nAll players compete simultaneously and try to claim sets of cards in a single pass through the deck. A set consists of three cards that are either all alike or all different in each attribute. For example, if all three cards have the same number of objects, but three different shapes, shadings, and colors, then those cards are a set; if two of the cards have a common attribute that is not shared by the third, they are not a set.\n\nTo play, one person takes the deck and lays out twelve cards face up. The first person to spot a set collects those three cards; if the player was mistaken, then this player cannot claim a set until after another player has done so. After someone has claimed a set, the cardholder lays out three more cards. (If all players agree that no sets can be claimed, then the cardholder lays out three more cards. These cards aren't replaced after someone claims a set.) Whoever claims the most sets wins!\n\n	30	30	30	1988	2	20	4	Marsha J. Falco	Set Enterprises, Inc.
1258	Phase 10	https://cf.geekdo-images.com/thumb/img/p1uCZTN73US31T6THUF7_Gq6_Lw=/fit-in/200x150/pic2449279.jpg	https://cf.geekdo-images.com/original/img/ClquYnofVGzrA3ytNU0RbjEyqbI=/0x0/pic2449279.jpg	A rummy-type card game where players compete to be the first to finish completing all ten phases.  Phases include collecting runs of numbers, collecting certain number of a given color cards, etc.  The first player to finish completing the 10th phase wins.  In case of ties, the player with the fewest number of points wins.\n\n	45	45	45	1982	2	6	4	Kenneth Johnson	ASS Altenburger Spielkarten
1294	Clue	https://cf.geekdo-images.com/thumb/img/7mHlUayEbH9PI6Y4Mq4_2-SM9-Y=/fit-in/200x150/pic884234.jpg	https://cf.geekdo-images.com/original/img/mvyZlnqzp5xuq26haVSLGCXMuYk=/0x0/pic884234.jpg	The classic detective game!  In Clue, players move from room to room in a mansion to solve the mystery of: who done it, with what, and where?  Players are dealt character, weapon, and location cards after the top card from each card type is secretly placed in the confidential file in the middle of the board.  Players must move to a room and then make an accusation against a character saying they did it in that room with a specific weapon.  The player to the left must show one of any cards accused to the accuser if in that player's hand.  Through deductive reasoning each player must figure out which character, weapon, and location are in the secret file.  To do this, each player must uncover what cards are in other players hands by making more and more accusations.  Once a player knows what cards the other players are holding, they will know what cards are in the secret file.  A great game for those who enjoy reasoning and thinking things out.\n\n	45	45	45	1949	3	6	4	Anthony E. Pratt	Hasbro
1297	Trivial Pursuit: Star Wars Classic Trilogy Collector's Edition	https://cf.geekdo-images.com/thumb/img/nt5gRyLWKVEkeQ4o8FALlNIiv6I=/fit-in/200x150/pic137509.jpg	https://cf.geekdo-images.com/original/img/E1V35_DOs6RKc6QifP16s2sMFyU=/0x0/pic137509.jpg	In this version of Trivial Pursuit players must answer questions based on the original Star Wars movies.\n\n	90	90	90	1998	2	4	4	(Uncredited)	Hasbro
1301	Netrunner	https://cf.geekdo-images.com/thumb/img/ZbJp0v_GzLxiCwmGDCoiqv3i2KA=/fit-in/200x150/pic92015.jpg	https://cf.geekdo-images.com/original/img/_dFylK5hbovrT5HNkZgqYpJWFCs=/0x0/pic92015.jpg	Netrunner is a cyberpunk-themed collectible card game.  The two players are the Corp (who wins by completing Agendas) and the Runner (who wins by infiltrating the Corp and liberating Agendas).\n\nEach side has a limited number of both actions and bits (money) to spend per turn; bits are gone once used, and actions must be spent to gain more.\nAn important thing when evaluating the power of cards is to see the Bit per action ratio.\n\nOne unique feature of this game is that the Runner physically moves on the "board" created by facedown Corp cards.  It has the feel of a "capture the flag" game, with the Runner moving in dataforts to steal Agendas from the Corp.\n\nAnother unique feature is that the Cards are NOT the primary strategy of the game; in fact, players can win by simply "playing with the rules" itself (a concept difficult to understand if you've never played Netrunner).\n\nBoth players play as both Corp and Runner in a game, one after the other, with each player's Runner going against the opponent's Corp.  A winning match provides 10 points and the loser scores points equal to the number of agenda points scored/liberated. The winner of the game is the one who has the most points in the 2 submatches.\n\nThough Netrunner is traditionally a two-player duel, there are formats that allow for more players (called "The Big Sell Out").\n\nRichard Garfield himself considered Netrunner as his best boardgame design instead of CCG design game, and he loves games that include bluffing mechanics; with Netrunner, bluffing is an integral part of the game.\n\nWhen it was released in 1996, many gaming magazines gave Netrunner critical acclaim as the best CCG ever designed.   Even today, most of them still consider this to be true.\n\n	45	45	45	1996	2	2	2	Richard Garfield	Wizards of the Coast
1339	Dungeon!	https://cf.geekdo-images.com/thumb/img/ZLJOrbWqcg73x5Rkdc5qEQDdp3o=/fit-in/200x150/pic1998857.jpg	https://cf.geekdo-images.com/original/img/X9Q8mOqv5BHNWhogsAeYbr2_OIM=/0x0/pic1998857.jpg	In many ways Dungeon! is similar to Dungeons & Dragons, although much simplified and transformed into a board game. Players explore a dungeon that is divided into levels of increasing difficulty, fighting monsters for valuable treasure. As players venture deeper into the dungeon, the monsters become more difficult and the treasure more valuable. Several character classes each have slightly different fighting abilities – most notably the wizard, who can cast spells. Combat is simulated using dice; players roll the dice to attack a monster, and if unsuccessful, the dice are rolled to determine the effect of the monster's counter-attack.\n\nThe winner is the first player to bring a certain amount of treasure back to the Dungeon's entrance.\n\nReimplemented by:\n\n\n    The Classic Dungeon\n    The New Dungeon\n\n\n	30	30	30	1975	1	8	4	Steve Winter	ASS Altenburger Spielkarten
1406	Monopoly	https://cf.geekdo-images.com/thumb/img/08UWIW8s31pSdo-5fxPhWg5CaCg=/fit-in/200x150/pic4235383.jpg	https://cf.geekdo-images.com/original/img/YIoseMjEJX5vxUaw-JuD4rUOfWE=/0x0/pic4235383.jpg	Theme\nPlayers take the part of land owners, attempting to buy and then develop their land. Income is gained by other players visiting their properties and money is spent when they visit properties belonging to other players. When times get tough, players may have to mortgage their properties to raise cash for fines, taxes and other misfortunes.\n\nGameplay\nOn his turn, a player rolls two dice and moves that number of spaces around the board. If the player lands on an as-yet-unowned property, he has the opportunity to buy it and add it to his portfolio or allow the bank to auction it to the highest bidder. If a player owns all the spaces within a color group, he may then build houses and hotels on these spaces, generating even more income from opponents who land there. If he lands on a property owned by another player, he must pay that player rent according to the value of the land and any buildings on it. There are other places on the board which can not be bought, but instead require the player to draw a card and perform the action on the card, pay taxes, collect income, or even go to jail.\n\nGoal\nThe goal of the game is to be the last player remaining with any money.\n\nCultural impact on rules\nMonopoly is unusual in that the game has official, printed rules, but most players learn how to play from others, never actually learning the correct way to play. This has led to the canonization of a number of house rules that make the game more palatable to children (and sore losers) but harm the gameplay by preventing players from going bankrupt or slowing down the rate of property acquisition. One common house rule has players put any money paid to the bank in the center of the board, which jackpot a player may earn by landing on Free Parking. This prevents the game from removing money from play, and since players collect $200 each time they pass Go, this results in ever-increasing bankrolls and players surviving rents that should have bankrupted them. Another house rule allows players to take "loans" from the bank instead of going bankrupt, which means the game will never end. Some house rules arise out of ignorance rather than attempts to improve the game. For instance, many players don't know that properties landed on but left unbought go up for auction, and even some that know to auction don't know that the bidding starts at $1, meaning a player may pay well below the listed price for an auctioned property.\n\nBackground\nIn the USA in 1933, Charles Darrow devised Monopoly based on an earlier game by Elizabeth J. Magie. The patent was filed 31st August 1935 while the game was on sale in America. Based on an earlier game, The Landlord's Game, it was at first rejected by Parker Bros., as being too complicated to be a success. How wrong could they be! It came to the UK in 1936, made under licence by Waddingtons. Darrow died in 1967 having realised he had developed one of the most successful board games of all times. It was awarded as Game of the Century by the TRA (Toy Retailers Association).\n\nMonopoly was patented in 1935 by Charles Darrow and released by Parker Brothers. The game was actually one of a number of variants in existence at the time, all of which date back to an earlier, 1904 game by Elizabeth J. Magie called The Landlord's Game. Magie was a proponent of the Single Tax put forth by famous author Henry George.  The game was designed to show the evils of earning money from renting land (as it leads to the destitution of all but one player) and the virtues of the proposed Single Tax - players could choose to play under regular rules or alternate "Single Tax" rules.\n\nThe game didn't really go anywhere and Magie lost interest in it. Variations of the game evolved, however, and homemade versions traveled up and down the Atlantic coast and even as far west as Michigan and Texas, being developed all along the way. Eventually the game was noticed by Charles Darrow, who introduced it to the world in its current form.\n\nRe-implements:\n\n    The Landlord's Game\n\n\n\n\nExpanded by:\nOfficial\n\n    Monopoly Stock Exchange Add-on\n    Monopoly Free Parking Mini Game\n    Monopoly Get Out of Jail Mini Game\n\n\n\n\nUnofficial\n\n    Super Add-ons: Monopoly\n    Entrepreneur's Accessory to Monopoly\n    Game Spice: Monopoly Expansion\n    Mafiopoly\n    Monopoly: Mob Rule Expansion Deck\n    Final Fantasy Monopoly\n\n\n\n\n	180	60	180	1933	2	8	4	Elizabeth J. Magie (Phillips)	(Unknown)
1501	Masterpiece	https://cf.geekdo-images.com/thumb/img/ZMm0L6H9WKcete3q9her3zkK96c=/fit-in/200x150/pic190269.jpg	https://cf.geekdo-images.com/original/img/5EtIP_S8P011Lj45JqLaf7AbuKw=/0x0/pic190269.jpg	Van Gogh, Rembrandt, Renoir --- paintings by the world's most famous artists are on the auction block, for sale to the highest bidder. How high will you bid before the tension and bluffing get to you? And how good's your eye --- can you spot a forgery when you buy one?\n\nThe MASTERPIECE game combines the excitement of a fast-paced board game with the glamour and sophistication of a game that deals with fine art. Some of the world's greatest paintings, illustrated in full-color postcards, are an integral part of gameplay.\n\nThe high-stakes world of international art --- and the power plays of an auction --- will entertain and enlighten as you join a particularly eccentric group of collectors who've all come in search of a MASTERPIECE.\n\nEach player takes the role of an art collector and tries to amass the greatest fortune in cash and the value of art pieces in their collection.\n\nThe painting cards are randomized and placed face down in a stack.  Matching size value cards are also mixed and placed face down in a stack.  These value cards indicate the worth of the painting ranging from forgery (zero) to $1,000,000.  Each player receives an equal sum of money and one painting with value card which are clipped together so that all players can see the painting and only the owning player can see the value.  When paintings are drawn from the stack, a value card is clipped to them in this fashion.  Players move around the board by die roll and land on spaces that allow the player to collect money from the bank, receive a painting from the stack, sell a painting to the bank for its value, sell a painting to the bank for a specified amount, auction one of their paintings to the highest bidding opponent, or auction the top painting in the stack to the highest bidder.\n\nThe game ends when the painting stack is exhausted.  Players add the values of their paintings to their cash on hand.  The player with the largest total wins.\n\n	60	60	60	1970	3	6	5	Christian Thee	Alga
1927	Munchkin	https://cf.geekdo-images.com/thumb/img/saJlX2v5E2boJNNAU-QPq12DHXs=/fit-in/200x150/pic1871016.jpg	https://cf.geekdo-images.com/original/img/vp7LtUmBZgIRMwa8qwRpVkHIFnU=/0x0/pic1871016.jpg	\t\t\t\t\n\t\t\t\t\tPublisher's Description\n\nGo down in the dungeon. Kill everything you meet. Backstab your friends and steal their stuff. Grab the treasure and run.\n\nAdmit it. You love it.\n\nThis award-winning card game, designed by Steve Jackson, captures the essence of the dungeon experience... with none of that stupid roleplaying stuff. You and your friends compete to kill monsters and grab magic items. And what magic items! Don the Horny Helmet and the Boots of Butt-Kicking. Wield the Staff of Napalm... or maybe the Chainsaw of Bloody Dismemberment. Start by slaughtering the Potted Plant and the Drooling Slime, and work your way up to the Plutonium Dragon...\n\nAnd it's illustrated by John Kovalic! Fast-playing and silly, Munchkin can reduce any roleplaying group to hysteria. And, while they're laughing, you can steal their stuff.\n\n\t\t\t\t\n\t\t\t\t\tOther\n\nPart of the Munchkin series.\n\nMunchkin is a satirical card game based on the clichés and oddities of Dungeons and Dragons and other role-playing games. Each player starts at level 1 and the winner is the first player to reach level 10. Players can acquire familiar D&D style character classes during the game which determine to some extent the cards they can play.\n\nThere are two types of cards - treasure and encounters. Each turn the current players 'kicks down the door' - drawing an encounter card from the deck. Usually this will involve battling a monster. Monsters have their own levels and players must try and overcome it using the levels, weapons and powers they have acquired during the game or run away. Other players can chose to help the player or hinder by adding extra monsters to the encounter. Defeating a monster will usually result in drawing treasure cards and acquiring levels.  Being defeated by a monster results in "bad stuff" which usually involves losing levels and treasure.\n\nIn May 2010, Steve Jackson Games made the "big announcement." Many rules and cards were changed. See The Great 2010 Munchkin Changeover for details. Of note to Munchkin fans, the Kneepads of Allure card, which had been removed in the 14th printing, was added back to the game but modified to be less powerful.\n\n\t\t\t\t\n\t\t\t\t\tSequels:\n\n\n    The Good, the Bad, and the Munchkin\n    Munchkin Apocalypse\n    Munchkin Axe Cop\n    Munchkin Bites!\n    Munchkin Booty\n    Munchkin Conan\n    Munchkin Cthulhu\n    Munchkin Fu\n    Munchkin Impossible\n    Munchkin Legends\n    Munchkin Pathfinder\n    Munchkin Zombies\n    Star Munchkin\n    Super Munchkin\n\n\n\t\t\t\t\n\t\t\t\t\tRelated Board Games\n\n\n    Munchkin Quest\n\n\n\t\t\t\t\n\t\t\t\t\tOnline play\n\n\n     Vassal does not support Munchkin anymore. Former link: Vassal Module\n\n\n\t\t\t\t\n\t\t\t\t\tPegasus Expansions\n\n\n    Munchkin Sammlerbox\n    Munchkin Sammlerkoffer\n    Munchkin Promotional Bookmarks\n    Munchkin Weihnachtsedition - The same as Munchkin, but with a promotional button that grants the wearer extra treasure (when worn in December). \n\n\n\t\t\t\t\n\t\t\t\t\tOnline Playthrough\n\nThere's a great YouTube playthrough with Will Wheaton and Steve Jackson (yes, the Steve Jackson) found here LINK\n\n	120	60	120	2001	3	6	4	Steve Jackson (I)	Steve Jackson Games
2001	Trivial Pursuit: Family Edition	https://cf.geekdo-images.com/thumb/img/-nKKr7CSUPva9DDpwSkPywElIdQ=/fit-in/200x150/pic4194266.jpg	https://cf.geekdo-images.com/original/img/Ca1ZVg_Il-IAabKQYUNuQPiyJqk=/0x0/pic4194266.jpg	Like Trivial Pursuit, but you have both senior and junior questions in different boxes, so the whole family can play it.\n\n	90	90	90	1993	2	36	4	(Uncredited)	Hasbro
2002	Magical Maze	https://cf.geekdo-images.com/thumb/img/SkepF0ePSzl2WTKBat1O0bTLfMI=/fit-in/200x150/pic41906.jpg	https://cf.geekdo-images.com/original/img/Wk0_ZwB7zmFFJ9Ske9UzeWYj1hE=/0x0/pic41906.jpg	With the aid of the Wizard, you'll try to get the gold (a magnet underneath the labyrinth), to your own corner of the game board. You'll need to remember the way, except there are goblins trying to stop you.\n\nWhen the Wizard lowers his arm, you move back a square and the next player then tries to make it towards his corner instead.\n\n	20	20	20	1994	2	4	4	Gilbert Lévy	Jumbo
2223	UNO	https://cf.geekdo-images.com/thumb/img/Vqkf_w4oaY__07ZiwrpofsIxHNQ=/fit-in/200x150/pic981505.jpg	https://cf.geekdo-images.com/original/img/z3OFp3362X0ZPf5CIc5vfxzwDsg=/0x0/pic981505.jpg	Players race to empty their hands and catch opposing players with cards left in theirs, which score points. In turns, players attempt to play a card by matching its color, number, or word to the topmost card on the discard pile. If unable to play, players draw a card from the draw pile, and if still unable to play, they pass their turn. Wild and special cards spice things up a bit.\n\nUNO is a commercial version of Crazy Eights, a public domain card game played with a standard deck of playing cards.\n\nThis entry includes all themed versions of UNO that do not include new cards.\n\n	30	30	30	1971	2	10	4	Merle Robbins	(Unknown)
2243	Yahtzee	https://cf.geekdo-images.com/thumb/img/vroA4iMIzREc06g-2OzjXzKFliE=/fit-in/200x150/pic378237.jpg	https://cf.geekdo-images.com/original/img/S9AmoNh3ZPyVXLxoqhOA7MBCN7M=/0x0/pic378237.jpg	Yahtzee is a classic dice game played with 5 dice.  Each player's turn consists of rolling the dice up to 3 times in hope of making 1 of 13 categories.  Examples of categories are 3 of a kind, 4 of a kind, straight, full house, etc.  Each player tries to fill in a score for each category, but this is not always possible.  When all players have entered a score or a zero for all 13 categories, the game ends and total scores are compared.\n\nThe traditional (public domain) game Yacht predates the trademarked game, and has slightly different scoring.\n\nThere are four basic scoring difference between the tradition game Yacht and Yahtzee.  They are:  1) Yacht has no Three of a Kind category, 2) there are no bonuses in Yacht, 3) there are no Joker rules in Yacht, and 4) the Full House category is scored as the sum of the dice.  The other scoring rules are identical between the two games.\n\nTravel versions of the game use a device that keeps the dice captured within compartments of a plastic box and allows players to "lock" a particular die between rolls.\n\n	30	30	30	1956	2	10	4	Edwin S. Lowe	(Public Domain)
2281	Pictionary	https://cf.geekdo-images.com/thumb/img/yKm-UonnR86fanmX61yMaALzQQs=/fit-in/200x150/pic336863.jpg	https://cf.geekdo-images.com/original/img/OchC2NWBLP_5aijcy9-_2xl1go8=/0x0/pic336863.jpg	Playing Pictionary may remind you of Charades, but with drawing on paper instead of acting out the answers.  In Pictionary, though, both teams' (or even all three teams') clue givers may be drawing at the same time as players strive to be the first to guess the correct answer.  When the answer is not designated "All Play," one team simply tries to come up with the answer before the timer runs out, which is usually but not always possible thanks to the varying difficulty levels of the answers.  No great drawing talent is required; instead, players gain an edge if they have a good imagination when guessing, empathy for their team mates, and/or a general ability to communicate in restricted circumstances.  A board is provided, just to keep score on, which focuses the competition.  Pictionary was a big hit when it first appeared and has been a classic on the party game scene ever since.\n\n	90	90	90	1985	3	16	8	Rob Angel	APEX Spiel und Hobby
2407	Sorry!	https://cf.geekdo-images.com/thumb/img/wRPUkMTejzUedSBiXdUJraQqrd0=/fit-in/200x150/pic1187187.jpg	https://cf.geekdo-images.com/original/img/IzDr7EwSlYtqzKrz2h3OVnNg5xY=/0x0/pic1187187.jpg	Slide Pursuit Game\n\nRace your four game pieces from Start around the board to your Home in this Pachisi type game. By turning over a card from the draw deck and following its instructions, players move their pieces around the game board, switch places with players, and knock opponents' pieces off the track and back to their Start position.\n\nSlides are located at various places around the game board. When a player's piece lands at the beginning of one of these slides not of its own color, it automatically advances to the end, removing any piece on the slide and sending it back to Start.\n\nGame moves are directed exclusively by cards from the play-action deck.  If one plays the normal version in which one card is drawn from the deck each turn, the outcome has a huge element of luck.  Sorry can be made more of a strategic game (and more appealing to adults) by dealing five cards to each player at the start of the game and allowing the player to choose which card he/she will play each turn.  In this version, at the end of each turn, a new card is drawn from the deck to replace the card that was played, so that each player is always working from five cards.\n\nA player's fortunes can change dramatically in one or two rounds of play through the use of Sorry cards, the "11" cards (which give the player the option of trading places with an opponent's piece on the track), and the fact that it is possible to move from Start to Home without circumnavigating the full board by making judicious use of the "backward 4" cards.\n\n	30	30	30	1929	2	4	4	William Henry Storey	Basic Fun, Inc.
2452	Jenga	https://cf.geekdo-images.com/thumb/img/YtKddEt4Wba3QWxPMTM0oIoLG8c=/fit-in/200x150/pic275096.jpg	https://cf.geekdo-images.com/original/img/4zJnRX_hgbqUERAlIlxT0psqoyY=/0x0/pic275096.jpg	A tower building game.\n\nJenga is played with 54 wooden blocks; each block is 3 times as long as it is wide, and slightly smaller in height than in width. The blocks are stacked in a tower formation; each story is three blocks placed adjacent to each other along their long side, and each story is placed perpendicular to the previous (so, for example, if the blocks in the first story are pointing north-south, the second story blocks will point east-west). There are therefore 18 stories to the Jenga tower. Since stacking the blocks neatly can be tedious, a plastic loading tray is included.\n\nOnce the tower is built, the person who built the tower moves first. Moving in Jenga consists of taking one and only one block from any story except the completed top story of the tower at the time of the turn, and placing it on the topmost story in order to complete it. Only one hand at a time may be used to remove a block; both hands can be used, but only one hand may be on the tower at a time. Blocks may be bumped to find a loose block that will not disturb the rest of the tower. Any block that is moved out of place may be left out of place if it is determined that it will knock the tower over if it is removed. The turn ends when the next person to move touches the tower, although he or she can wait 10 seconds before moving for the previous turn to end if they believe the tower will fall in that time.\n\nThe game ends when the tower falls in any significant way -- in other words, any piece falls from the tower, other than the piece being knocked out to move to the top. The loser is the person who made the tower fall (i.e. whose turn it was when the tower fell); the winner is the person who moved before the loser.\n\nThe same game concept was published in 1984 by Fagus under the name "Hoppla - eins zuviel!"\n\n	20	20	20	1983	1	8	4	Leslie Scott	(Unknown)
2453	Blokus	https://cf.geekdo-images.com/thumb/img/b9feAHVD4OdrOrexeIay0LPfVbk=/fit-in/200x150/pic2197702.jpg	https://cf.geekdo-images.com/original/img/YAFla7Wy8VSzT6RGTGQOCt-9JfI=/0x0/pic2197702.jpg	Blokus (officially pronounced "Block us") is an abstract strategy game with transparent, Tetris-shaped, colored pieces that players are trying to play onto the board.  The only caveat to placing a piece is that it may not lie adjacent to your other pieces, but instead must be placed touching at least one corner of your pieces already on the board.\n\nThere is a solitaire variation where one player tries to get rid of all the pieces in a single sitting.\n\nComponents:\nBlokus Game Board (400 squares)\n84 game pieces (four 21-piece sets of red, green, blue, and yellow)\nEach color inlcudes:\n\n     1 one-square piece\n     1 piece with 2 squares\n     2 pieces with 3 squares\n     5 pieces with 4 squares\n     12 pieces with 5 squares\n\n\n\n\nGoal of the Game:\n\nEach player has to fit as many of his/her 21 pieces on the board as possible.\n\nHow to Play:\n1.  Each player chooses a color and places that set of 21 pieces in front of his/her side of the board.  The order of play is as follows: blue, yellow, red, and then green.\n\n2.  The first player (blue) places any of his/her pieces in a corner square.  Play proceeds clockwise around the board (yellow, red, and green), each player putting their first piece down in one of the corner squares.\n\n3.  Play continues as each player lays down one piece during a turn.\n\nEach new piece must touch at least one other piece of the same color, but only at the corners.\n\nNo flat edges of same color pieces can touch.\n\nThere are no restrictions on how pieces of different colors can touch one another.\n\n4.  Whenever a player is unable to place one of his/her remaining pieces on the board, that player must pass his/her turn.\n\nEnd of Game:\nThe game ends when all players are blocked from laying down any more of their pieces.  This also includes any players who may have placed all of their pieces on the board.  Scores are tallied, and the player with the highest score is the winner.\n\nScoring:\nEach player counts the number of unit squares in his/her remaining pieces (1 unit square = -1 point).\n\nA player earns +15 points if all his/her pieces have been placed on the board plus 5 additional bonus points if the last piece placed on the board was the smallest piece (one square).\n\nThere are unauthorized versions of the game published under various names, including The Strategy Game, Tetris, Blokád (unofficial Hungarian version with cardboard pieces) and The Family Chess Game.\n\n	20	20	20	2000	2	4	4	Bernard Tavitian	Educational Insights
2655	Hive	https://cf.geekdo-images.com/thumb/img/QRIjEgV1_HH5x27_MAK_--oWSLU=/fit-in/200x150/pic791151.jpg	https://cf.geekdo-images.com/original/img/_EUpzmJKbLkOwYMZA_sOmyjGnlI=/0x0/pic791151.jpg	From the Publisher:\n\nHive is a highly addictive strategic game for two players that is not restricted by a board and can be played anywhere on any flat surface. Hive is made up of twenty two pieces, eleven black and eleven white, resembling a variety of creatures each with a unique way of moving.\n\nWith no setting up to do, the game begins when the first piece is placed down. As the subsequent pieces are placed this forms a pattern that becomes the playing surface (the pieces themselves become the board). Unlike other such games, the pieces are never eliminated and not all have to be played. The object of the game is to totally surround your opponent's queen, while at the same time trying to block your opponent from doing likewise to your queen. The player to totally surround his opponent's queen wins the game.\n\nHive FAQ - please read before posting questions in the forum!\n\n	20	20	20	2001	2	2	2	John Yianni	Gen42 Games
2679	Mouse Trap	https://cf.geekdo-images.com/thumb/img/4FItHWz4AM9wDaf6snhwPpvbhqM=/fit-in/200x150/pic94317.jpg	https://cf.geekdo-images.com/original/img/MrJmLk8zOrrbSB6tRHROq0JYNDQ=/0x0/pic94317.jpg	Mouse Trap pits 2-4 players against each other as mice trying to navigate through a complex mousetrap.  They build the Rube Goldberg inspired mousetrap as they move their mice across the board.  They also try to collect cheese cards, which allow them to move other mice to cheese wheel which is the bait for the trap.  Once the mousetrap has been completely constructed, players can attempt to capture each others' mice in it by turning the crank, which activates the mousetrap.  If the mousetrap doesn't malfunction, the mouse is captured and out of the game.  The winner is the last mouse who avoids being trapped.  The main appeal of Mouse Trap is the ridiculously complex contraption that is the mousetrap.  Somehow even young children can figure out how to assemble it from the blueprints on the board, and everyone enjoys watching it do its magic.\n\n	30	30	30	1963	2	4	4	Burt Meyer	Arxon
2719	Connect Four	https://cf.geekdo-images.com/thumb/img/RbMram5xq-BllPwPUXzLhtEZx2w=/fit-in/200x150/pic859430.jpg	https://cf.geekdo-images.com/original/img/lrJ1p0AI4ghZdmZkEzwIle3YDUw=/0x0/pic859430.jpg	Connect 4 is a well known vertical game played with "checkers" (it is more akin to Tic Tac Toe or Go Moku).\n\nThe board is placed in the stand to hold it vertically and the players drop checkers into one of the 7 slots, each of which holds 6 of the "checker's" men, until one player succeeds in getting 4 in a row--horizontally, vertically or diagonally.\n\nThe game is actually non-proprietary and nicer adult versions can be found under the name The Captain's Mistress.\n\n	10	10	10	1974	2	2	2	Howard Wexler	(Public Domain)
2921	The Game of Life	https://cf.geekdo-images.com/thumb/img/KYcbJ_MwMu8CSB0X0OTsLIVwYyo=/fit-in/200x150/pic288405.jpg	https://cf.geekdo-images.com/original/img/pf_B8zrtboWZtYSp2kBtVNk8WQE=/0x0/pic288405.jpg	This game attempts to mirror life events many people go through from going to college, raising a family, buying a home, working and retiring.\n\nThe intent of the game is to have the most assets at the end of the game, assets are earned primarily by working and earning tokens with dollars amount on them.  Additionally the first person to complete the course gets additional money tokens.\n\nThere is a very linear board that you move along by spinning a wheel or landing on spaces that tell you to move to a specific space or forward or back.  There are a handful of intersections where you can choose to go one direction or another but they ultimately have similar spaces and meet back up quickly.  There are a handful of choices regarding insurance and investments but for the most part it is a game of luck.\n\nNote -- this entry covers many versions of the game with different rule sets.  In general, the newer the printing the gentler the rules.  The 1960s original can be quite brutal if the players choose to act on all the options made available to them.  The most recent versions are suitable for young children without parental supervision.\n\n	60	60	60	1960	2	6	4	Bill Markham	Alga
2957	Trivial Pursuit: The 1980's	https://cf.geekdo-images.com/thumb/img/bCzJJpO3Zy5dPtscoJE8D1kem64=/fit-in/200x150/pic34010.jpg	https://cf.geekdo-images.com/original/img/wAtkRM4dGxzR7z6btdLO_Du7NhU=/0x0/pic34010.jpg	A 1980's themed version of Trivial Pursuit.  1000 cards. Six new categories include Entertainment, In the News, Personalities, Sports & Leisure, That's Life,  and Wild Card.\n\n	90	90	90	1989	2	6	6	(Uncredited)	Parker Brothers
5839	Trivial Pursuit: Walt Disney Family Edition Card Set	https://cf.geekdo-images.com/thumb/img/blUr5FFB8cZpUNXECPYCg9Kvv4o=/fit-in/200x150/pic24686.jpg	https://cf.geekdo-images.com/original/img/1nKGECnH9aKH1xofYHswwR7k26I=/0x0/pic24686.jpg	This is yet another version of the Trivial Pursuit: Genus Edition Master game featuring Disney questions.\n\nIt contains the following categories:\n\n    World of Places\n    World of People\n    World of Science\n    World of Music\n    World of Fantasy\n    World of Leisure\n\n\n\n\nLike other expansions it contains two boxes of questions. The blue box has questions for adults and the gold box has questions for younger players.  Every card has a mixture of generic trivia questions and Disney questions, with at least one Disney question per card.\n\n	90	90	90	1985	2	6	4	Chris Haney	Horn Abbot Ltd.
3076	Puerto Rico	https://cf.geekdo-images.com/thumb/img/pYFq1WbW-LIQCvWCFxjQuDC-nho=/fit-in/200x150/pic158548.jpg	https://cf.geekdo-images.com/original/img/RvdWBkmDks7AN8sodR4PyVcponA=/0x0/pic158548.jpg	In Puerto Rico players assume the roles of colonial governors on the island of Puerto Rico. The aim of the game is to amass victory points by shipping goods to Europe or by constructing buildings.\n\nEach player uses a separate small board with spaces for city buildings, plantations, and resources. Shared between the players are three ships, a trading house, and a supply of resources and doubloons.\n\nThe resource cycle of the game is that players grow crops which they exchange for points or doubloons. Doubloons can then be used to buy buildings, which allow players to produce more crops or give them other abilities. Buildings and plantations do not work unless they are manned by colonists.\n\nDuring each round, players take turns selecting a role card from those on the table (such as "Trader" or "Builder"). When a role is chosen, every player gets to take the action appropriate to that role. The player that selected the role also receives a small privilege for doing so - for example, choosing the "Builder" role allows all players to construct a building, but the player who chose the role may do so at a discount on that turn. Unused roles gain a doubloon bonus at the end of each turn, so the next player who chooses that role gets to keep any doubloon bonus associated with it. This encourages players to make use of all the roles throughout a typical course of a game.\n\nPuerto Rico uses a variable phase order mechanic, where a "governor" token is passed clockwise to the next player at the conclusion of a turn. The player with the token begins the round by choosing a role and taking the first action.\n\nPlayers earn victory points for owning buildings, for shipping goods, and for manned "large buildings." Each player's accumulated shipping chips are kept face down and come in denominations of one or five. This prevents other players from being able to determine the exact score of another player. Goods and doubloons are placed in clear view of other players and the totals of each can always be requested by a player. As the game enters its later stages, the unknown quantity of shipping tokens and its denominations require players to consider their options before choosing a role that can end the game.\n\nIn 2011 and mostly afterwards, Puerto Rico was published to include both Puerto Rico: Expansion I – New Buildings and Puerto Rico: Expansion II – The Nobles.   These versions are included in the other game entry Puerto Rico (with two expansions), not this regular game entry for Puerto Rico.\n\n	150	90	150	2002	3	5	4	Andreas Seyfarth	alea
3837	Rat-a-Tat Cat	https://cf.geekdo-images.com/thumb/img/46lNHGB69iUkV_16YrrKcuUJAdA=/fit-in/200x150/pic147435.jpg	https://cf.geekdo-images.com/original/img/2j5HQZOQ4D9Ycff1jEcaYYtEV4A=/0x0/pic147435.jpg	Get rid of the rats and go for the cats! In Rat-a-Tat Cat, less is always better, and you want to go out with the lowest score. Can you remember the numbers on the other players' cards? Can you keep a poker face, but notice when another player looks pleased? Sharpen your memory and your timing, and have fun with the cool cats and bad rats of Rat-a-Tat Cat.  This is the Gamewright version.\n\n1996 Mensa Select\n\nRepublished 2002 by Amigo as Biberbande:\n\nBiberbande is a card game for Ages 6 and up, the object of which is to improve your initial unknown 4-card hand so that you have a lower sum of cards than the other players. There are 66 cards in the deck, which consists of ranks 0-9 (four of ranks 0-8 and nine 9's) and 3 different types of action cards (9 "Exchange", 7 "Spy", and 5 "2 X draw"). Four cards are dealt face down to each player so that no player knows the values of her cards. The four cards are then arranged in a row and each player may briefly look at her outer two cards. A player's turn consists of drawing a card from the top of the draw pile or discard pile. If the player drew from the draw pile, there are several possible actions: If it is a number card, she may replace one of her face down cards with it (placing it face down) or she may simply discard it. If it is an action card, she may carry out the action or ignore the action. If a player draws the top card of the discard pile, she must replace one of her face down cards with it (placed face down). A player may knock at the end of her turn meaning that each other player has one more turn before the round is over. When the round ends, players turn over their cards and add up their values. The player with the lowest total value wins. Generally the game is played with as many rounds as there are players. Player interaction comes in the form of the action cards. The 'Exchange' card allows a player to exchange one of his cards with one of his opponents. The 'Spy' card allows a player to look at one of his own cards. Finally the "2X look" card allows a player to look at the top card of the draw pile, then keep it or throw it away. If she throws it away, she must use the next card in the draw pile.\n\n	10	10	10	1995	2	6	4	Ann Stambler	Gamewright
3955	BANG!	https://cf.geekdo-images.com/thumb/img/lzPoB0cL20ysgtE5Lc5C6oslpoM=/fit-in/200x150/pic1170986.jpg	https://cf.geekdo-images.com/original/img/ZgLAhswnvphPH_FplkciAQ-J9ic=/0x0/pic1170986.jpg	"The Outlaws hunt the Sheriff. The Sheriff hunts the Outlaws. The Renegade plots secretly, ready to take one side or the other. Bullets fly. Who among the gunmen is a Deputy, ready to sacrifice himself for the Sheriff? And who is a merciless Outlaw, willing to kill him? If you want to find out, just draw (your cards)!" (From back of box)\n\nThe card game BANG! recreates an old-fashioned spaghetti western shoot-out, with each player randomly receiving a Character card to determine special abilities, and a secret Role card to determine their goal.\n\nFour different Roles are available, each with a unique victory condition:\n\n     Sheriff - Kill all Outlaws and the Renegade\n     Deputy - Protect the Sheriff and kill any Outlaws\n     Outlaw - Kill the Sheriff\n     Renegade - Be the last person standing\n\n\n\n\nA player's Role is kept secret, except for the Sheriff. Character cards are placed face up on table, and also track strength (hand limit) in addition to special ability.\n\nThere are 22 different types of cards in the draw deck. Most common are the BANG! cards, which let you shoot at another player, assuming the target is within "range" of your current gun.  The target player can play a "MISSED!" card to dodge the shot.  Other cards can provide temporary boosts while in play (for example, different guns to improve your firing range) and special one-time effects to help you or hinder your opponents (such as Beer to restore health, or Barrels to hide behind during a shootout). A horse is useful for keeping your distance from unruly neighbors, while the Winchester can hit a target at range 5. The Gatling is a deadly exception where range doesn't matter: it can only be used once, but targets all other players at the table!\n\nInformation on the cards is displayed using language-independent symbols, and 7 summary/reference cards are included.\n\n	40	20	40	2002	4	7	7	Emiliano Sciarra	dV Giochi
4143	Guess Who?	https://cf.geekdo-images.com/thumb/img/jexD6pQO5PScpkXq358fjfYHNIE=/fit-in/200x150/pic335812.jpg	https://cf.geekdo-images.com/original/img/Fapg_eLu0LCjeBm_ramBX9jTKFY=/0x0/pic335812.jpg	The mystery face game where you flip over a collection of faces with different color hair, eye color, hair, hats, glasses etc.  to deduce who the secret person is that your opponent has chosen. You flip over the hooked tiles as you narrow your choices by asking characteristic questions.\n\n	20	20	20	1979	2	2	2	Theora Design	Cartamundi
4991	Apples to Apples Kids	https://cf.geekdo-images.com/thumb/img/Hu0yXMxieqJnCXXrmM8fZDxjcRg=/fit-in/200x150/pic315009.jpg	https://cf.geekdo-images.com/original/img/h0lQIn47EiJZ-LrsZqrHkaDnHRk=/0x0/pic315009.jpg	As its name implies, this is a version of Apples to Apples designed for kids, although the basic game still works well with adults, too.  Compared to the original game, this edition features simplified words that even young children can understand and has no "suggestive" words that adults would be uncomfortable explaining to the kids.\n\nOut of the Box re-named this editon in 2007 from Apples to Apples Junior! to Apples to Apples Kids.\n\nNote: This is a different game from Apples to Apples Junior; In 2007, when Apples to Apples Junior! was changed to Apples to Apples Kids, Apples to Apples Junior 9+ was changed to Apples to Apples Junior.\n\nPart of the Apples to Apples Series.\n\n	30	30	30	2001	4	10	6	Mark Alan Osterhaus	Mattel
5048	Candy Land	https://cf.geekdo-images.com/thumb/img/0NacJhPepRghf91BIY1iIr0wu7w=/fit-in/200x150/pic162151.jpg	https://cf.geekdo-images.com/original/img/O6P0ZcWI-YbVi181oiiiSR9qe9E=/0x0/pic162151.jpg	A child can begin by just recognizing basic colors. Each player advances along the rainbow path through the peppermint stick forest, the gingerbread plum tree and the gumdrop mountain. The players use the plastic gingerbread man as the playing pieces. There are colorful pieces in four colors and cards.\n\n“The Legend of the Lost Candy Castle” is printed inside the box and can be read out loud. The game parts can be stored below it. The game board is colorful and has lots of yummy candy references. You play the game by moving the gingerbread playing pieces on the gameboard spaces that match the colors and pictures of the drawn cards. The object is to be the first player to reach the candy castle. There are specific directions to play. You can play with one color block, two color blocks and picture cards. If you are the first person to reach the last purple space, or move beyond the last purple space, you reach candy castle and have won the game. There are barriers along the way, like the gooey gumdrops, getting lost in the lollipop woods, or stuck in the molasses swamp.\n\n	30	30	30	1949	2	4	4	Eleanor Abbott	Hasbro
5432	Chutes and Ladders	https://cf.geekdo-images.com/thumb/img/HKb3B2AT_CyWbK2222QUq4s78ts=/fit-in/200x150/pic4542661.jpg	https://cf.geekdo-images.com/original/img/oF7J9WH63OEe5GU3X922ljeRS2Y=/0x0/pic4542661.jpg	Traditional game from ancient India was brought to the UK in 1892 and first commercially published in the USA by Milton Bradley in 1943 (as Chutes and Ladders).  Players travel along the squares sometimes using ladders, which represent good acts, that allow the player to come closer to nirvana while the snakes were slides into evil.\n\n	30	30	30	-200	2	6	4	(Uncredited)	(Public Domain)
5522	UNO Rummy-Up	https://cf.geekdo-images.com/thumb/img/mFd0cVTcRATTzAwa_PTbBnoCou8=/fit-in/200x150/pic332159.jpg	https://cf.geekdo-images.com/original/img/_vA8px0dvZnkJY5uxhrrKHmC1t4=/0x0/pic332159.jpg	UNO Rummy-Up combines two favorite classics, UNO and Rummikub, into one game.  In this game, colorful UNO tiles are played like rummy but also use special UNO rules that make this game fun and exciting."\n\nA variation of Rummikub that adds the Draw Four, Draw Two, Reverse, and other special cards from the UNO card game.  The object is still getting rid of all your tiles and having the lowest score.\n\n	60	60	60	1993	2	4	4	(Uncredited)	International Games
6541	Articulate!	https://cf.geekdo-images.com/thumb/img/Cqf6O03raXud6GZlxQeZlI-46XU=/fit-in/200x150/pic112473.jpg	https://cf.geekdo-images.com/original/img/JxYn8aT2B8U8wehWQ1uL3_7ARb8=/0x0/pic112473.jpg	Try to get your partner to say as many words from a particular category written on the cards within the thirty second time limit, you may only pass once. Move your team pawn forward a number of spaces on the board equal to the number of words you got correct. If you land on an Orange or Red space, spin the spinner for a chance to move yourself 2 or 3 spaces forward, or move an opponent piece 2 or 3 spaces back. If you land on a spade space, try to get you team mate to say the word on the card before any other team can say it. Whoever answers correctly gets a turn immediately.\nCategories include Person, World, Object, Action, Nature and Random. First team to make it around the board and successfully answer a spade category (chosen from any of the above) wins the game.\n\n	60	60	60	1992	4	8	6	Andrew Bryceson	Drumond Park Ltd.
7336	Trivial Pursuit: The Lord of the Rings Movie Trilogy Collector's Edition	https://cf.geekdo-images.com/thumb/img/9WJuF5Rxxcj3x_tdP70vKEaLiBw=/fit-in/200x150/pic194133.jpg	https://cf.geekdo-images.com/original/img/SSu8pzRWC1eBKyTemfQxv2kdZ4M=/0x0/pic194133.jpg	Classic Trivial Pursuit game play with 1,800 The Lord of the Rings questions based on the movie trilogy.  Answer correctly to collect all the scoring wedges.  Then race to the center of the gameboard to win!  Includes 4 collectible pewter tokens and special advanced fan gameplay rules."\n\n	120	120	120	2003	2	4	4	(Uncredited)	Hasbro
7927	Trivial Pursuit: Junior	https://cf.geekdo-images.com/thumb/img/o-tZhgiHsfA2iWmVri5DcBWz5g4=/fit-in/200x150/pic1193655.jpg	https://cf.geekdo-images.com/original/img/Vf91zdiIjHmOcxi-ICIEH9ZEt8c=/0x0/pic1193655.jpg	Trivial Pursuit "Created especially for children Ages 6 - 10".\nThe question categories are:\nOn the Move\nSongs and Stories\nEvery Day\nFun\nScience and Nature\nGames\n\n	60	60	60	1992	2	4	1	(Uncredited)	Hasbro
9209	Ticket to Ride	https://cf.geekdo-images.com/thumb/img/WRanmC5bMp81aFJHqzOi7Kcj-5g=/fit-in/200x150/pic38668.jpg	https://cf.geekdo-images.com/original/img/bOcAJxw-W-B2Gz0x67z8bjqzJgY=/0x0/pic38668.jpg	With elegantly simple gameplay, Ticket to Ride can be learned in under 15 minutes. Players collect cards of various types of train cars they then use to claim railway routes in North America. The longer the routes, the more points they earn. Additional points come to those who fulfill Destination Tickets – goal cards that connect distant cities; and to the player who builds the longest continuous route.\n\n"The rules are simple enough to write on a train ticket – each turn you either draw more cards, claim a route, or get additional Destination Tickets," says Ticket to Ride author, Alan R. Moon. "The tension comes from being forced to balance greed – adding more cards to your hand, and fear – losing a critical route to a competitor."\n\nTicket to Ride continues in the tradition of Days of Wonder's big format board games featuring high-quality illustrations and components including: an oversize board map of North America, 225 custom-molded train cars, 144 illustrated cards, and wooden scoring markers.\n\nSince its introduction and numerous subsequent awards, Ticket to Ride has become the BoardGameGeek epitome of a "gateway game" -- simple enough to be taught in a few minutes, and with enough action and tension to keep new players involved and in the game for the duration.\n\nPart of the Ticket to Ride series.\n\n	60	30	60	2004	2	5	4	Alan R. Moon	Days of Wonder
9220	Saboteur	https://cf.geekdo-images.com/thumb/img/G3hBcPutljcUb7_JSG9sNDJ4ZRY=/fit-in/200x150/pic3989824.jpg	https://cf.geekdo-images.com/original/img/jhL_ucB9VxMroXQc5Zx0oGstH2U=/0x0/pic3989824.jpg	Players take on the role of dwarves. As miners, they are in a mine, hunting for gold. Suddenly, a pick axe swings down and shatters the mine lamp. The saboteur has struck. But which of the players are saboteurs? Will you find the gold, or will the fiendish actions of the saboteurs lead them to it first? After three rounds, the player with the most gold is the winner.\n\nWith the help of Dwarf Cards, the players are assigned their role: either miner or saboteur. The roles are kept secret- they are only revealed at the end of the round.\n\nThe Start Card and the three Goal Cards are placed onto the table, each seven cards away from the start and one card between each Goal Card. The Goal Cards are placed face-down. The gold is on one of the Goal Cards, but nobody knows which.\n\nPlayers have cards in hand. On a player's turn, he must do one of three things: place a Path Card into the mine, play an Action Card in front of a player, or pass.\n\nThe Path Cards form paths leading to the Goal Cards. Path Cards must be played next to a already-played Path Card. All paths on the Path Card must match those on the already-played cards, and Path Cards may not be played sideways.\n\nThe miners are trying to build an uninterrupted path from the Start Card to a Goal Card, while the saboteurs are trying to prevent this. They shouldn't try and be too obvious about it, however, lest they be immediately discovered.\n\nAction Cards can be placed in front of any player, including oneself. Action Cards let the players help or hinder one another, as well as obtain information about the Goal Cards.\n\nOnce a player places a Path Card that reaches the gold, the round is over. The miners have won and receive cards with gold pieces as their reward.\n\nThe round is also over if the gold could not be reached. In that case, the saboteurs have won and receive the gold pieces.\n\nOnce the Gold Cards have been distributed, the next round begins. The game is over at the end of the third round, with the player with the most gold pieces being the winner.\n\n	30	30	30	2004	3	10	7	Fréderic Moyersoen	AMIGO
9963	Santorini	https://cf.geekdo-images.com/thumb/img/7wniEx2U3_RXzflmUjQyY7gSvjQ=/fit-in/200x150/pic42278.jpg	https://cf.geekdo-images.com/original/img/xEc-S1X7N35m4lW7di0iiYh8dss=/0x0/pic42278.jpg	You are a god out of Greek mythology. Compete against fellow gods to get a loyal follower on top of a temple on the beautiful island of Santorini. Each turn you move, and then build a part of the temple. Be careful where you build lest the opposing god get the advantage. Strategic thinking and your unique godly power will win the day.\n\nSantorini includes 75 wooden tiles; 10 wooden domes; and 4 wooden men - all whitewashed and packaged in a white box. Eight Greek god cards are included. Each depicts a classic Greek sculpture of the god and a description of their unique godly power. (The first, bagged, edition included pieces for a third player and only five god cards.)\n\nThe rules, god cards and extra god cards can be downloaded from the Files section.  The rules are file Santorini2007.doc.\n\n	20	20	20	2004	2	3	2	Gord!	(Self-Published)
10547	Betrayal at House on the Hill	https://cf.geekdo-images.com/thumb/img/-5KCQJ0PvzUWVSV96rQkzxa8aNY=/fit-in/200x150/pic828598.jpg	https://cf.geekdo-images.com/original/img/0Rb-Vnb2ImPLxv0jBU2dmUolbOU=/0x0/pic828598.jpg	From the press release:\n\nBetrayal at House on the Hill quickly builds suspense and excitement as players explore a haunted mansion of their own design, encountering spirits and frightening omens that foretell their fate. With an estimated one hour playing time, Betrayal at House on the Hill is ideal for parties, family gatherings or casual fun with friends.\n\nBetrayal at House on the Hill is a tile game that allows players to build their own haunted house room by room, tile by tile, creating a new thrilling game board every time. The game is designed for three to six people, each of whom plays one of six possible characters.\n\nSecretly, one of the characters betrays the rest of the party, and the innocent members of the party must defeat the traitor in their midst before it’s too late! Betrayal at House on the Hill will appeal to any game player who enjoys a fun, suspenseful, and strategic game.\n\nBetrayal at House on the Hill includes detailed game pieces, including character cards, pre-painted plastic figures, and special tokens, all of which help create a spooky atmosphere and streamline game play.\n\nAn updated reprint of Betrayal at House on the Hill was released on October 5, 2010.\n\n	60	60	60	2004	3	6	5	Teeuwynn Woodruff	Avalon Hill Games, Inc.
10681	Apples to Apples Junior	https://cf.geekdo-images.com/thumb/img/UG9icqUAPjPkz7hUIb1at37j8K4=/fit-in/200x150/pic459377.jpg	https://cf.geekdo-images.com/original/img/ISQUYsLYYSCgE4cLNjBJ-6plaqk=/0x0/pic459377.jpg	As its name implies, this is a version of Apples to Apples designed for kids, although the basic game still works well with adults, too. The version has card optimized for middle-school aged children (9+). Also good for advanced grade-school aged children.\n\nCompared to the original game, this edition features simplified words that even young children can understand and has no "suggestive" words that adults would be uncomfortable explaining to the kids.\n\nOut of the Box changed the name of this game in 2007 from Apples to Apples Junior 9+ to Apples to Apples Junior.  The Junior 9+ edition was originally sold in a small (288-card) box. It was changed to a bigger (576-card) box when the name was changed to Junior.\n\nNote: Apples to Apples Kids was formerly called Apples to Apples Junior!, but was changed to Apples to Apples Kids when Apples to Apples Junior 9+ was changed to Apples to Apples Junior.\n\nPart of the Apples to Apples Series.\n\n	30	30	30	2002	4	10	6	Mark Alan Osterhaus	Mattel
11542	Eclipse	https://cf.geekdo-images.com/thumb/img/5x7lPMCyk2xtp9k34wld66AC8TI=/fit-in/200x150/pic1316296.jpg	https://cf.geekdo-images.com/original/img/AV8JJlF53m4BFB2d_96al1IDiRs=/0x0/pic1316296.jpg	The Ball and Chain Game is an abstract game for two. The oblong board contains hexagonal spaced holes for the ball-shaped pieces to rest. Each player has one large Guard and five pairs of smaller Prisoner pieces. Each pair of Prisoners is connected by a metal chain: two short chains and three long. A Prisoner may move as far as the chain will allow (1 or 2 spaces) while its partner stays put. The opponent's Prisoners may be temporarily immobilized by crossing one of your chains over theirs. The Guard moves one space at a time in any hex-axial direction. If, on your turn, you are unable to move your Guard, you lose.\n\n	15	15	15	1999	2	2	2	Mirko Marchesi	Gigamic
16992	Tsuro	https://cf.geekdo-images.com/thumb/img/Dawqh509ZzihC7IxqfMM5w_s1Gs=/fit-in/200x150/pic875761.jpg	https://cf.geekdo-images.com/original/img/RnYj0vhdTav6LaS53HR3yKPo4ag=/0x0/pic875761.jpg	From the publisher:\n\nA beautiful and beautifully simple game of laying a tile before your own token to continue its path on each turn.  The goal is to keep your token on the board longer than anyone else's, but as the board fills up this becomes harder because there are fewer empty spaces left... and another player's tile may also extend your own path in a direction you'd rather not go.  Easy to introduce to new players, Tsuro lasts a mere 15 minutes and actually does work for any number from 2 to 8.\n\nTheme:\n\nTsuro has an Asian spiritual theme - the lines representing the "many roads that lead to divine wisdom", and the game as a whole representing "the classic quest for enlightenment".\n\nThis theme is very light and the game essentially plays as an abstract.\n\nGameplay:\n\nThe game consists of tiles with twisting lines on them, a 6x6 grid on which to lay these tiles and a token for each player. Each player has a hand of tiles. On your turn you do two things: place a tile from your hand onto the board next to your token and move your token as far as it can go along the line it is currently on, until it is stopped by an empty space with no tile in (yet), the edge of the board or colliding with another player's token. If your token reaches the edge of the board or collides with another player's token, you are out of the game. The aim of the game is to be the last player left with a token on the board. Strategy therefore consists of trying to drive your opponents either into each other or off the board whilst extending your own route in directions that will make it difficult for your opponents to do the same.\n\nOther notes:\n\nTsuro was originally patented by McMurchie in 1979 under the name Squiggle Game, but was apparently not published at that time.  Somewhat similar to Metro and Spaghetti Junction.\n\n	15	15	15	2004	2	8	4	Tom McMurchie	Calliope Games
25669	Qwirkle	https://cf.geekdo-images.com/thumb/img/clWvZBP-uXugwC4BnJUo5kdRxsU=/fit-in/200x150/pic309353.jpg	https://cf.geekdo-images.com/original/img/FnLhG5NDbel24voh8nbdYXAYji0=/0x0/pic309353.jpg	The abstract game of Qwirkle consists of 108 wooden blocks with six different shapes in six different colors. There is no board, players simply use an available flat surface.\n\nPlayers begin the game with six blocks. The start player places blocks of a single matching attribute (color or shape but not both) on the table. Thereafter, a player adds blocks adjacent to at least one previously played block. The blocks must all be played in a line and match, without duplicates, either the color or shape of the previous block.\n\nPlayers score one point for each block played plus all blocks adjacent. It is possible for a block to score in more than one direction. If a player completes a line containing all six shapes or colors, an additional six points are scored. The player then refills his hand to six blocks.\n\nThe game ends when the draw bag is depleted and one player plays all of his remaining blocks, earning a six point bonus. The player with the high score wins.\n\n	45	45	45	2006	2	4	4	Susan McKinley Ross	MindWare
30549	Pandemic	https://cf.geekdo-images.com/thumb/img/HEKrtpTC1y1amXh5cKnVvowyE5Y=/fit-in/200x150/pic1534148.jpg	https://cf.geekdo-images.com/original/img/j-pfXZ_0GmOowohzD_T6NDAWGSA=/0x0/pic1534148.jpg	In Pandemic, several virulent diseases have broken out simultaneously all over the world! The players are disease-fighting specialists whose mission is to treat disease hotspots while researching cures for each of four plagues before they get out of hand.\n\nThe game board depicts several major population centers on Earth. On each turn, a player can use up to four actions to travel between cities, treat infected populaces, discover a cure, or build a research station. A deck of cards provides the players with these abilities, but sprinkled throughout this deck are Epidemic! cards that accelerate and intensify the diseases' activity. A second, separate deck of cards controls the "normal" spread of the infections.\n\nTaking a unique role within the team, players must plan their strategy to mesh with their specialists' strengths in order to conquer the diseases. For example, the Operations Expert can build research stations which are needed to find cures for the diseases and which allow for greater mobility between cities; the Scientist needs only four cards of a particular disease to cure it instead of the normal five—but the diseases are spreading quickly and time is running out. If one or more diseases spreads beyond recovery or if too much time elapses, the players all lose. If they cure the four diseases, they all win!\n\nThe 2013 edition of Pandemic includes two new characters—the Contingency Planner and the Quarantine Specialist—not available in earlier editions of the game.\n\nPandemic is the first game in the Pandemic series.\n\n	45	45	45	2008	2	4	4	Matt Leacock	Z-Man Games, Inc.
98778	Hanabi	https://cf.geekdo-images.com/thumb/img/43_iOPRGbt6KUK1iwH4T38-4XYY=/fit-in/200x150/pic2007286.jpg	https://cf.geekdo-images.com/original/img/Wkrf8z3pMlOFKwxafbw9-Ob404s=/0x0/pic2007286.jpg	Hanabi—named for the Japanese word for "fireworks"—is a cooperative game in which players try to create the perfect fireworks show by placing the cards on the table in the right order. (In Japanese, hanabi is written as èŠ±ç«; these are the ideograms flower and fire, respectively.)\n\nThe card deck consists of five different colors of cards, numbered 1–5 in each color. For each color, the players try to place a row in the correct order from 1–5. Sounds easy, right? Well, not quite, as in this game you hold your cards so that they're visible only to other players. To assist other players in playing a card, you must give them hints regarding the numbers or the colors of their cards. Players must act as a team to avoid errors and to finish the fireworks display before they run out of cards.\n\nAn extra suit of cards, rainbow colored, is also provided for advanced or variant play.\n\nHanabi was originally published as part of Hanabi & Ikebana.\n\n	25	25	25	2010	2	5	4	Antoine Bauza	ABACUSSPIELE
31260	Agricola	https://cf.geekdo-images.com/thumb/img/zl48oz7IeKlgWJVBLYd0nFJumdA=/fit-in/200x150/pic259085.jpg	https://cf.geekdo-images.com/original/img/L-UBO3rBOmvIrZHZLSXOypyAUPw=/0x0/pic259085.jpg	Description from BoardgameNews\n\nIn Agricola, you're a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you'll find on a farm: collecting clay, wood, or stone; building fences; and so on. You might think about having kids in order to get more work accomplished, but first you need to expand your house. And what are you going to feed all the little rugrats?\n\nThe game supports many levels of complexity, mainly through the use (or non-use) of two of its main types of cards, Minor Improvements and Occupations. In the beginner's version (called the Family Variant in the U.S. release), these cards are not used at all. For advanced play, the U.S. release includes three levels of both types of cards; Basic (E-deck), Interactive (I-deck), and Complex (K-deck), and the rulebook encourages players to experiment with the various decks and mixtures thereof. Aftermarket decks such as the Z-Deck and the L-Deck also exist.\n\nAgricola is a turn-based game. There are 14 game rounds occurring in 6 stages, with a Harvest at the end of each stage (after Rounds 4, 7, 9, 11, 13, and 14).\nEach player starts with two playing tokens (farmer and spouse) and thus can take two turns, or actions, per round. There are multiple options, and while the game progresses, you'll have more and more: first thing in a round, a new action card is flipped over.\nProblem: Each action can be taken by only one player each round, so it's important to do some things with high preference.\nEach player also starts with a hand of 7 Occupation cards (of more than 160 total) and 7 Minor Improvement cards (of more than 140 total) that he/she may use during the game if they fit in his/her strategy. Speaking of which, there are countless strategies, some depending on your card hand. Sometimes it's a good choice to stay on course, and sometimes it is better to react to your opponents' actions.\n\n	150	30	150	2007	1	5	4	Uwe Rosenberg	Lookout Games
31481	Galaxy Trucker	https://cf.geekdo-images.com/thumb/img/90es3_t2C0hkBKwUFBRCGWU9TQ4=/fit-in/200x150/pic3926631.jpg	https://cf.geekdo-images.com/original/img/v0GLWVGXtaYIglLktLUBRr3s4gE=/0x0/pic3926631.jpg	In a galaxy far, far away... they need sewer systems, too. Corporation Incorporated builds them. Everyone knows their drivers -- the brave men and women who fear no danger and would, if the pay was good enough, even fly through Hell.\n Now you can join them. You will gain access to prefabricated spaceship components cleverly made from sewer pipes. Can you build a space ship durable enough to weather storms of meteors? Armed enough to defend against pirates? Big enough to carry a large crew and valuable cargo? Fast enough to get there first?\n\nOf course you can. Become a Galaxy Trucker. It's loads of fun.\n\nGalaxy Trucker is a tile laying game that plays out over two phases: building and flying. The goal is to have the most credits at the end of the game. You can earn credits by delivering goods, defeating pirates, building an efficient ship, and being the furthest along the track at the end of the flying phase.\n\nBuilding happens in real time and has players build their personal space ships by grabbing tiles from the middle of the table before the timer runs out. Tiles start out facedown so they won't know what they have until they take it, but they may choose to return it faceup if they don't want it. They must place the tiles they keep in a legal manner in their space ship. Usually this just means lining up the connectors appropriately (single to single, double to double, universal to anything) but also includes proper positioning of guns and engines. Tiles represent a variety of things including guns, engines, storage containers, crew cabins, shields, and batteries. They may also peek at the cards they will encounter in phase 2, but they must sacrifice building time to do this. At any time players may call their ships finished and take an order marker from the center.\n\nOnce building is completed, and ships have been checked for errors, the flight begins. The flight cards are shuffled and player markers are placed on the flight board according to the order markers taken. Cards are revealed one at a time and players interact with them in order. They may include things such as pirates, abandoned vessels, disease outbreaks, meteor showers, worlds with goods to pick up, player-on-player combat zones, and other various things.\n\nMost of the cards will cause players to move back on the flight track and they must decide if the delay is worth their efforts. When all the cards are encountered players sell any goods they have collected, collect their rewards for finishing in first, second, or third place or having the most intact ship, and then lose some credits for damaged components. Space can be a very dangerous place and it is not uncommon to see your ship break into smaller and smaller pieces or lose some very valuable cargo off the side. If your ship gets damaged too much you can get knocked out of the race, so be careful!\n\n3 rounds of this are done, and in each round players get a bigger board to build a ship that can hold more components. After the 3rd round the player with the most credits wins!\n\n	60	60	60	2007	2	4	4	Vlaada Chvátil	Czech Games Edition
36235	The Duke	https://cf.geekdo-images.com/thumb/img/xXdRB3vf9Oovw8cJkGL352OvW6c=/fit-in/200x150/pic1688903.jpg	https://cf.geekdo-images.com/original/img/zh066RK2KgO_6WisVj5VSbSup0k=/0x0/pic1688903.jpg	Levy. Maneuver. Conquer.\n\nThe Duke is a dynamic, tile-based strategy game with an old-world, feudal theme, high-quality wooden playing pieces, and an innovative game mechanism in its double-sided tiles. Each side represents a different posture – often considered to be defensive or offensive – and demonstrates exactly what the piece can do within the turn. At the end of a move (or after the use of a special ability), the tile is flipped to its other side, displaying a new offensive or defensive posture.\n\nEach posture conveys different options for maneuver and attack. The full circle is a standard Move, the hollow circle the Jump, the arrow provides for the Slide, the star a special Strike ability and so on. Each turn a player may select any tile to maneuver, attempting to defend his own troops while positioning himself to capture his opponent's tiles. If you end your movement in a square occupied by an opponent's tile, you capture that tile. Capture your opponent's Duke to win!\n\nPlayers start the game by placing their Duke in one of the two middle squares on their side of the game board. Two Footman are then placed next to the Duke. Each turn a player may choose to either move a single tile or randomly draw a new tile from the bag. With fifteen different Troop Tiles, all double-sided, and nineteen total pieces for each player (plus special optional tiles), the variety of game play is limitless.\n\nBeyond the endless variety of the basic game, Terrain Tiles introduce a variety of game play options, altering the game board. These rules also include several alternate objectives, such as the challenging Dark Rider game which pits five Pikeman against a lone Knight.\n\n	30	30	30	2013	2	2	2	Stephen McLaughlin	Catalyst Game Labs
37111	Battlestar Galactica: The Board Game	https://cf.geekdo-images.com/thumb/img/NpZjJd2NgxSJV2WrlB_U1e89txY=/fit-in/200x150/pic354500.jpg	https://cf.geekdo-images.com/original/img/-hZFpTm-evjyuLD_bj-y845-4f8=/0x0/pic354500.jpg	Battlestar Galactica: The Board Game is an exciting game of mistrust, intrigue, and the struggle for survival. Based on the epic and widely-acclaimed Sci Fi Channel series, Battlestar Galactica: The Board Game puts players in the role of one of ten of their favorite characters from the show. Each playable character has their own abilities and weaknesses, and must all work together in order for humanity to have any hope of survival. However, one or more players in every game secretly side with the Cylons. Players must attempt to expose the traitor while fuel shortages, food contaminations, and political unrest threatens to tear the fleet apart.\n\nAfter the Cylon attack on the Colonies, the battered remnants of the human race are on the run, constantly searching for the next signpost on the road to Earth. They face the threat of Cylon attack from without, and treachery and crisis from within. Humanity must work together if they are to have any hope of survival…but how can they, when any of them may, in fact, be a Cylon agent?\n\nBattlestar Galactica: The Board Game is a semi-cooperative game for 3-6 players ages 10 and up that can be played in 2-3 hours. Players choose from pilots, political leaders, military leaders, or engineers to crew Galactica. They are also dealt a loyalty card at the start of the game to determine if they are a human or Cylon along with an assortment of skill cards based on their characters abilities. Players then can move and take actions either on Galactica, on Colonial 1, or in a Viper. They need to collect skill cards, fend off Cylon ships, and keep Galactica and the fleet jumping. Each turn also brings a Crisis Card, various tasks that players must overcome. Players need to play matching skill cards to fend off the problems; skill cards that don't match hinder the players success. Fate could be working against the crew, or there could be a traitorous Cylon! As players get closer and closer towards reaching their Earth, another round of loyalty cards are passed out and more Cylons may turn up. If players can keep their up their food stores, fuel levels, ship morale, and population, and they can keep Galactica in one piece long enough to make it to Earth, the Humans win the game. But if the Cylon players reveal themselves at the right moment and bring down Galactica, the Humans have lost.\n\nOfficial Site, Rules & FAQ: http://www.fantasyflightgames.com/edge_minisite_sec.asp?eidm=18&esem=4\nUnofficial FAQ for really tricky questions: http://boardgamegeek.com/wiki/page/Battlestar_Galactica_FAQ\n\n	180	120	180	2008	3	6	5	Corey Konieczka	Fantasy Flight Games
37904	Formula D	https://cf.geekdo-images.com/thumb/img/9MEeNsk25Fs8njaWd4mCo4MxUF0=/fit-in/200x150/pic519914.jpg	https://cf.geekdo-images.com/original/img/l-hnRVQg97lQyEjss9JXkL4RGXw=/0x0/pic519914.jpg	Formula D is a high stakes Formula One type racing game where the players race simulated cars with the hope of crossing the finish line first.  This is a re-release of Formula DÃ© with several changes from the original format. Whilst old tracks can be used with the updated Formula D rules, the new game features boards that have an F1 track and a Street Track on the other side. These street tracks each have a novel inclusion or two to add greater theme -\n\nThe game mechanisms are a simple race, get to the finish line first!  However, players have to use a significant amount of planning, and rely on quite a bit of luck.  Each player manages when to shift gears, with each gear providing a different speed.  (For example, 4th gear is a die that rolls random numbers from 7 to 12 for spaces moved.)  Each turn, players may move up one gear, stay in that gear, or move down gears.  This forces players to match possible rolls with the optimum distance for that turn, and hopefully plan ahead.  However, speed is not the only issue!  Corners have a "stop" rule that requires players to stop once, twice, or three times on that corner in consecutive turns or face a penalty.  This creates an effective speed limit to the corners. \n Of course, things do not always go as planned!  Players take penalties if they miss their roll, bump into another car, are blocked by other cars, have to brake heavily, or have to downshift several gears.  These are taken off of a car’s attributes (Tire health, Brake wear, Transmission Gears, Body, engine, and Suspension).  Losing the maximum in any of these categories will result in elimination, or a severe setback for that car.  This requires that players manage their car’s health, plan for their best path, and have good luck on their rolls.  This high amount of luck gives the game its family appeal, and lets weaker players have a chance at winning once in a while.\n\nHowever, the fun does not end with a single race!  The rules include the ability to customize your cars, use a pre-generated character, add Slipstreaming (Drafting) rules and road debris, and change tire types to modify your distance rolls.  There are also variations for a single lap race, or multiple laps with pit stops to repair some of your damage points.  In addition, numerous expansion tracks can be purchased to vary the demands on each driver and car.  Each track may also have weather effects (rain) that change car handling and die rolls due to skidding on wet track.  This opens up the game for rally rules giving championship points over a number of races.\n\nFormula D adds a few items that are not in the original Formula De:  There is the added excitement of illegal racing in the streets of big cities - anything goes!  This adds custom cars, nitro acceleration, drifting in the curves, dirty tricks, gun battles, and trash on the road to add more variation.  A basic change is the use of a "Dashboard" with movable pegs to manage your car’s attributes instead of the paper forms from Formula De.  There are also two sets of pre-painted cars; a Formula 1 set and the Street Race set of stock cars.  The street cars come with "Character" profiles to give a bit of role-playing to the game.  Finally, the old category of "Fuel" for the car has been renamed Transmission Wear to give a better thematic fit to the effect of multiple downshifting.\n\nThe popularity of this game has given it a lot of expansions, some simplifications to the rules (See Formula DÃ© Mini), and a lot of "after market" parts.  There are also fan expansions and tracks for the very dedicated player.  In many ways, this has become a multiple game system.\n\n	60	60	60	2008	2	10	6	Eric Randall	Asmodee
39856	Dixit	https://cf.geekdo-images.com/thumb/img/-pTlIzjMjawpDvdG3TBwsUrHrk4=/fit-in/200x150/pic3483909.jpg	https://cf.geekdo-images.com/original/img/m74nctbYaqTy03r8s_i_KTyvbYQ=/0x0/pic3483909.jpg	2010 Spiel des Jahres Winner\n\nOne player is the storyteller for the turn and looks at the images on the 6 cards in her hand. From one of these, she makes up a sentence and says it out loud (without showing the card to the other players).\n\nEach other player selects the card in their hands which best matches the sentence and gives the selected card to the storyteller, without showing it to the others.\n\nThe storyteller shuffles her card with all the received cards. All pictures are shown face up and every player has to bet upon which picture was the storyteller's.\n\nIf nobody or everybody finds the correct card, the storyteller scores 0, and each of the other players scores 2. Otherwise the storyteller and whoever found the correct answer score 3. Players score 1 point for every vote for their own card.\n\nThe game ends when the deck is empty or if a player scores 30 points. In either case, the player with the most points wins the game.\n\nThe base game and all expansions have 84 cards each.\n\n	30	30	30	2008	3	6	6	Jean-Louis Roubira	Libellud
40381	Masters Gallery	https://cf.geekdo-images.com/thumb/img/AFHwWXBOWzgTSE4jGV7yreD5ZLE=/fit-in/200x150/pic1547983.jpg	https://cf.geekdo-images.com/original/img/sTb04a5E00znV5YKKAOGLcIBvhI=/0x0/pic1547983.jpg	In Masters Gallery, players are art critics and gallery owners at the same time, trying to pump up the value of certain artists before cashing in their works. The works of five artists – Vermeer, Degas, Renoir, Monet and Van Gogh – are in play. Each player starts with a hand of masterpiece cards, and on a turn you play one on the table to show a stake in the fate of that artist; some masterpiece cards include special actions that allow you to play a second card, draw an extra card, increase the value of a certain artist, or have everyone play a masterpiece card at once.\n\nWhen a certain number of works from one artist are on the table, the round ends, and each work from the most well-represented artists are sold for $1-3. Masters Gallery lasts four rounds, with players receiving additional masterpiece cards prior to new rounds and the value of an artist's work increasing based on past performance. The player with the most money after four rounds wins.\n\nMasters Gallery depicts classic works of art on its cards; Modern Art: The Card Game, which features identical game play, uses "modern art" along the lines used in designer Reiner Knizia's Modern Art board game.\n\n	30	20	30	2009	2	5	4	Reiner Knizia	Eagle-Gryphon Games
40398	Monopoly Deal Card Game	https://cf.geekdo-images.com/thumb/img/frV7YS_u3XYVNZhswxatq9ZI3-I=/fit-in/200x150/pic716758.jpg	https://cf.geekdo-images.com/original/img/sExC40CylWBJvonJeXubmblKTfc=/0x0/pic716758.jpg	(from the box):\nThe fast-paced, addictive card game where your luck can change in the play of a card!  Collect 3 complete property sets, but beware Debt Collectors, Forced Deals and the dreaded Deal Breakers, which could change your fortunes at any time!\n\nMONOPOLY DEAL - the card game where anything can happen!\n\nHow to win: Be the first player to collect 3 three full property sets of different colors.\n\nThe Cards: \nAction Cards may be played to initiate the action printed on the card or may be used as money of the value noted in the upper left and lower right corners.\nProperty Cards some denote a specific property and some are wild.  They show property name, set to which they belong (or in which sets they may be used), rental costs, number of properties in their set and their value when used to make payments. \nHouse/Hotel Cards may be used to increase the rental cost of a property set.  They also have a monetary value for use in making payments.\nMoney Cards are used to make payments.\n\nPlay:\nDraw two cards from the draw pile, or if you start your turn with no cards, draw five.\nPlay up to three cards from your hand face up either as: money into your bank, properties or improvements into your collection, or actions.  Action cards allow you to collect rent, receive money, take properties from others or cancel another action.  Cards placed in your bank may only be used as money.  When you must make a payment, you may use money from your bank or properties and improvements in your collection, but not cards in your hand.\nDiscard cards in excess of seven from your hand to the bottom of the draw pile.\n\nWin by announcing it on your turn when you have three complete property sets of different colors.  This ends the game.\n\n	15	15	15	2008	2	5	4	Katharine Chapman	ASS Altenburger Spielkarten
43443	Castle Panic	https://cf.geekdo-images.com/thumb/img/IgWfEJ63ailu4y7vOmsaSH06u-M=/fit-in/200x150/pic496923.jpg	https://cf.geekdo-images.com/original/img/xOimjOG95u8pxQhByVDTT1vkMYA=/0x0/pic496923.jpg	The forest is filled with all sorts of monsters. They watched and waited as you built your castle and trained your soldiers, but now they've gathered their army and are marching out of the woods. Can you work with your friends to defend your castle against the horde, or will the monsters tear down your walls and destroy the precious castle towers? You will all win or lose together, but in the end only one player will be declared the Master Slayer!\n\nCastle Panic is a cooperative, light strategy game for 1 to 6 players ages 10 and up. Players must work together to defend their castle, in the center of the board, from monsters that attack out of the forest at the edges of the board. Players trade cards, hit and slay monsters, and plan strategies together to keep their castle towers intact. The players either win or lose together, but only the player with the most victory points is declared the Master Slayer. Players must balance the survival of the group with their own desire to win.\n\n	60	60	60	2009	1	6	4	Justin De Witt	Fireside Games
50381	Cards Against Humanity	https://cf.geekdo-images.com/thumb/img/RXuwz8i7pH7X7IXnVNeWAGXeHVc=/fit-in/200x150/pic2909692.jpg	https://cf.geekdo-images.com/original/img/jg6r3iBsIWQAIFhrcGlQ1o-ZfzQ=/0x0/pic2909692.jpg	"A party game for horrible people."\n\nPlay begins with a judge, known as the "Card Czar", choosing a black question or fill-in-the-blank card from the top of the deck and showing it to all players.  Each player holds a hand of ten white answer cards at the beginning of each round, and passes a card (sometimes two) to the Card Czar, face-down, representing their answer to the question on the card. The card czar determines which answer card(s) are funniest in the context of the question or fill-in-the-blank card. The player who submitted the chosen card(s) is given the question card to represent an "Awesome Point", and then the player to the left of the new Card Czar becomes the new Czar for the next round. Play continues until the players agree to stop, at which point the player with the most Awesome Points is the winner.\n\nThis, so far, sounds like the popular and fairly inoffensive Apples to Apples. While the games are similar, the sense of humor required is very different. The game encourages players to poke fun at practically every awkward or taboo subject including race, religion, gender, poverty, torture, alcoholism, drugs, sex (oh yes), abortion, child abuse, celebrities, and those everyday little annoyances like "Expecting a burp and vomiting on the floor".\n\nIn addition, there are a few extra rules.  First, some question cards are "Pick 2" or cards, which require each participant to submit two cards in sequence to complete their answer. Second, a gambling component also exists.  If a question is played which a player believes they have two possible winning answers for, they may bet an Awesome Point to play a single second answer.  If the player who gambled wins, they retain the wagered point, but if they lose, the player who contributed the winning answer takes both points.\n\nFrom the website:\n\n"Cards Against Humanity is distributed under a Creative Commons Attribution-Noncommercial-Share Alike license - that means you can use and remix the game for free, but you can't sell it. Feel free to contact us at cardsagainsthumanity@gmail.com."\n\n	30	30	30	2009	4	30	6	Eliot Weinstein	(Self-Published)
65244	Forbidden Island	https://cf.geekdo-images.com/thumb/img/HHXWNMiV-E2KKATrDYd94EVAV_w=/fit-in/200x150/pic646458.jpg	https://cf.geekdo-images.com/original/img/GxHuu04GdLw8PAnt9SOYRU5gR1A=/0x0/pic646458.jpg	Forbidden Island is a visually stunning cooperative board game. Instead of winning by competing with other players like most games, everyone must work together to win the game. Players take turns moving their pawns around the 'island', which is built by arranging the many beautifully screen-printed tiles before play begins. As the game progresses, more and more island tiles sink, becoming unavailable, and the pace increases. Players use strategies to keep the island from sinking, while trying to collect treasures and items. As the water level rises, it gets more difficult- sacrifices must be made.\n\nWhat causes this game to truly stand out among co-op and competitive games alike is the extreme detail that has been paid to the physical components of the game. It comes in a sturdy and organized tin of good shelf storage size. The plastic treasure pieces and wooden pawns are well crafted and they fit just right into the box. The cards are durable, well printed, and easy to understand. The island tiles are the real gem: they are screen-printed with vibrant colors, each with a unique and pleasing image.\n\nWith multiple levels of difficulty, different characters to choose from (each with a special ability of their own), many optional island formats and game variations available, Forbidden Island has huge replay value. The game can be played by as few as two players and up to four (though it can accommodate five). More players translates into a faster and more difficult game, though the extra help can make all the difference. This is a fun game, tricky for players of almost any age. Selling for under twenty dollars, oddly, Forbidden Island is a rare game of both quality and affordable price.\n For those who enjoy Forbidden Island, a follow-up project by Gamewright titled Forbidden Desert was released in 2013.\n\nFrom the publisher's website:\n\nDare to discover Forbidden Island! Join a team of fearless adventurers on a do-or-die mission to capture four sacred treasures from the ruins of this perilous paradise. Your team will have to work together and make some pulse-pounding maneuvers, as the island will sink beneath every step! Race to collect the treasures and make a triumphant escape before you are swallowed into the watery abyss!\n\n	30	30	30	2010	2	4	4	Matt Leacock	Gamewright
102548	Dungeon Fighter	https://cf.geekdo-images.com/thumb/img/lQUtbu88F2JazmQv_fT57j8OeK4=/fit-in/200x150/pic2411495.png	https://cf.geekdo-images.com/original/img/iPlI0qufM7kXjYE44nYQVMMaIJ0=/0x0/pic2411495.png	Explore spooky dungeons, find glorious treasure, buy powerful magic items, and challenge the most horrible creatures. Will your party be able to defeat the final boss?\n\nIn Dungeon Fighter, a fully cooperative board game, players take on the roles of heroes venturing deep into a three-tier dungeon. Along the way, they explore the dungeon, search its many rooms, and face endless hordes of vicious monsters. Best of all, your skill determines the ability of your character. Can you kill Medusa without looking into her eyes, defeat the Minotaur in the labyrinth, or resist the breath of the dragon? Will you be able to hit a target by throwing the dice under your leg with your eyes closed?\n\nYou will feel truly part of a centuries-old battle between good and evil...with a touch of foolish stupidity.\n\n	60	45	60	2011	1	6	3	Lorenzo Tucci Sorrentino	Cranio Creations
68448	7 Wonders	https://cf.geekdo-images.com/thumb/img/Grz-qM9xwxlvQGK7B-MiljtO9pQ=/fit-in/200x150/pic860217.jpg	https://cf.geekdo-images.com/original/img/3DP_RW5lTX0WrV67s8qi8CsiXoQ=/0x0/pic860217.jpg	You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.\n\n7 Wonders lasts three ages. In each age, players receive seven cards from a particular deck, choose one of those cards, then pass the remainder to an adjacent player. Players reveal their cards simultaneously, paying resources if needed or collecting resources or interacting with other players in various ways. (Players have individual boards with special powers on which to organize their cards, and the boards are double-sided). Each player then chooses another card from the deck they were passed, and the process repeats until players have six cards in play from that age. After three ages, the game ends.\n\nIn essence, 7 Wonders is a card development game. Some cards have immediate effects, while others provide bonuses or upgrades later in the game. Some cards provide discounts on future purchases. Some provide military strength to overpower your neighbors and others give nothing but victory points. Each card is played immediately after being drafted, so you'll know which cards your neighbor is receiving and how his choices might affect what you've already built up. Cards are passed left-right-left over the three ages, so you need to keep an eye on the neighbors in both directions.\n\nThough the box of earlier editions is listed as being for 3–7 players, there is an official 2-player variant included in the instructions.\n\n	30	30	30	2010	2	7	4	Antoine Bauza	Repos Production
70323	King of Tokyo	https://cf.geekdo-images.com/thumb/img/iEQpTdf7xHrGznRhdNBMiKy_mIM=/fit-in/200x150/pic3043734.jpg	https://cf.geekdo-images.com/original/img/ajEqmO5djVibsC72Ek1citOCJNA=/0x0/pic3043734.jpg	In King of Tokyo, you play mutant monsters, gigantic robots, and strange aliens—all of whom are destroying Tokyo and whacking each other in order to become the one and only King of Tokyo.\n\nAt the start of each turn, you roll six dice, which show the following six symbols: 1, 2, or 3 Victory Points, Energy, Heal, and Attack. Over three successive throws, choose whether to keep or discard each die in order to win victory points, gain energy, restore health, or attack other players into understanding that Tokyo is YOUR territory.\n\nThe fiercest player will occupy Tokyo, and earn extra victory points, but that player can't heal and must face all the other monsters alone!\n\nTop this off with special cards purchased with energy that have a permanent or temporary effect, such as the growing of a second head which grants you an additional die, body armor, nova death ray, and more.... and it's one of the most explosive games of the year!\n\nIn order to win the game, one must either destroy Tokyo by accumulating 20 victory points, or be the only surviving monster once the fighting has ended.\n\nFirst Game in the King of Tokyo series\n\n	30	30	30	2011	2	6	4	Richard Garfield	IELLO
70919	Takenoko	https://cf.geekdo-images.com/thumb/img/6KTmKEfbsPgEFnMnHlYL5DIHHmU=/fit-in/200x150/pic1912529.jpg	https://cf.geekdo-images.com/original/img/7SDbClO-4sN6LICvfySB3jrFUhU=/0x0/pic1912529.jpg	A long time ago at the Japanese Imperial court, the Chinese Emperor offered a giant panda bear as a symbol of peace to the Japanese Emperor. Since then, the Japanese Emperor has entrusted his court members (the players) with the difficult task of caring for the animal by tending to his bamboo garden.\n\nIn Takenoko, the players will cultivate land plots, irrigate them, and grow one of the three species of bamboo (Green, Yellow, and Pink) with the help of the Imperial gardener to maintain this bamboo garden. They will have to bear with the immoderate hunger of this sacred animal for the juicy and tender bamboo. The player who manages his land plots best, growing the most bamboo while feeding the delicate appetite of the panda, will win the game.\n\n	45	45	45	2011	2	4	3	Antoine Bauza	Bombyx
82168	Escape from the Aliens in Outer Space	https://cf.geekdo-images.com/thumb/img/8JWf_7JbY3x2QWvZ_VziaJL2dEI=/fit-in/200x150/pic2792336.png	https://cf.geekdo-images.com/original/img/PO5bvfkKDURjfen6mt1zOnoyxvg=/0x0/pic2792336.png	Escape from the Aliens in Outer Space is a card game of strategy and bluff set on a badly damaged deep space research ship. On-board systems have failed, plunging the ship into darkness. But even worse: A mysterious alien plague has crept aboard and is transforming the human crew into horrendous monsters! The remaining crewmen desperately try to save their lives by escaping from the derelict spaceship, but in the darkness the aliens are lurking...hungry for human flesh.\n\nThe game is played on a hexagon-based map that represents the spaceship. Each player is given a map sheet and a pencil. Map sheets must be of the same zone, and every zone has its specific name. Starting from the first player and continuing clockwise, every turn, each player must make a movement. To do so, the player must write on their map sheet the coordinates of the sector to which they are moving. Every time the players move to the gray (dangerous) sectors they have to draw a card; these cards make the players tell the others their position or lie about it, depending on the card. Every card is kept secret from other players.\n\nThe humans' objective is to save themselves using the escape hatches, while the aliens' objective is to hunt down the humans. Each player's identity and position is kept secret; you will need to interpret the movements and behaviors of the other players to learn who and where they really are.\n\n	45	20	45	2010	2	8	6	Nicolò Tedeschi	Cranio Creations
97903	Terror in Meeple City	https://cf.geekdo-images.com/thumb/img/Cf0Jl49VasOxa9T-2VV8TRb9tZE=/fit-in/200x150/pic2482302.jpg	https://cf.geekdo-images.com/original/img/-HiIrTHv7aw8c4mDYvnGs1SXQD4=/0x0/pic2482302.jpg	In Terror in Meeple City (formerly known as Rampage), you arrive in Meeple City as a gigantic, famished, scaly-skinned monster! Your goal: Dig your claws and dirty paws into the asphalt, destroy buildings, and devour innocent meeples – in short: sow terror while having fun. The monster who has caused the most damage after the carnage finally ends wins the game.\n\nThe buildings in Meeple City are comprised of floor tiles and meeples, with the meeples serving as pillars that support the floors. Four wooden vehicles are on the ground in the eight neighborhoods in the city. Each monster, which consists of a wooden paws disc and a wooden body, starts in one corner of the game board. On a turn you take two actions from four possibilities, repeating an action if desired:\n\n\n    Move: Pick up your monster body, flick the paws disc, then place the body back on the disc.\n    Demolish: If your paws are on the sidewalk surrounding a building, you can pick up your monster body, drop it onto a building, then collect any floors that have no meeples on them.\n    Toss a vehicle: If you're in a neighborhood with a vehicle, you can pick up the vehicle, place it on your body, then flick the vehicle at a building or another monster.\n    Breathe: Even while away from sidewalks with no vehicles, you can cause destruction by placing your chin on your monster's body and blowing across the board.\n\n\nMonsters tend to be messy when obtaining meals, but if you knock meeples off the city board, you might be punished for letting food go to waste, costing you a tooth or letting other players take an additional action. After your two actions, you can eat unprotected meeples on the ground in your neighborhood, but you can eat only as many as the number of teeth you have. If you knock another monster to the ground, you break off one of its teeth, thereby keeping it from stealing your food! Meeples come in six colors, with the colors representing different types of inhabitants: blue (journalists), green (military), yellow (blondes), grey (old people), red (heroes), and black (businessmen). For each set of six you collect in your stomach, you score 10 points at game's end. You score points for collecting floors and teeth, too, and you can also score for achieving the goal on your character card.\n\nIn addition to the character card, each player has a power card and a superpower card unique to his monster, with the former lasting the entire game and the latter being a one-shot effect that's revealed only upon use.\n\nTerror in Meeple City includes rules for monsters that evolve over the course of the game, that lose points for meeples not in sets, and that want to combine two game boards to allow for play with up to eight players.\n\n	45	45	45	2013	2	4	4	Ludovic Maublanc	Repos Production
98229	Pictomania	https://cf.geekdo-images.com/thumb/img/K4T8BA1AL7CJ-ae9Z1kfrgHV1pM=/fit-in/200x150/pic2360788.png	https://cf.geekdo-images.com/original/img/fE3JrBLq7DKkX5IxQRj2HJkkdcM=/0x0/pic2360788.png	Pictomania is a drawing game in which everyone is both drawing and guessing at the same time, giving a chance for those who excel only at one or the other skill to crush the dreams of other players.\n\nPictomania lasts five rounds, and at the start of each round, you set up six randomly drawn cards on card racks visible to all players. Cards are double-sided, come in four levels of difficulty, and include seven related words on a single side. In addition to a set of guessing cards, scoring tokens, marker and drawing board, each player receives one symbol card and one number card, which together indicate which word or phrase on the revealed cards that player must draw. Bonus tokens equal to one less than the number of players are placed in the center of the table.\n\nPlayers simultaneously look at their cards and start to draw. While drawing, they can also watch what others are doing and place a guess card on that player's stack. Only one guess per player is allowed, and once you make a guess, you can't change your mind. Other players will ideally be playing guess cards on your stack, too. Once you have finished drawing and guessing – and you're not required to do either – take the highest-valued bonus token from the center of the table and take no other actions. Once the final bonus token is claimed, the round ends.\n\nOne by one, players reveal what they were drawing and the guesses that others made. Those who guess your word earn one of your scoring tokens, with early guessers earning more points, while those who guess incorrectly have their card placed in the center of the table. Once all the guesses are resolved, you determine the black sheep – the player who made the worst guesses. If a single player has more cards in the center of the table then anyone else, then his bonus token (if any) counts as negative points. What's more, if no one guessed your word, then you throw away your bonus token, scoring nothing for it. You sum positive points for the round (a bonus token scored, and scoring tokens from the words you guessed correctly), then subtract points for the black sheep "bonus" and all the scoring tokens you didn't give away to determine your final score for the round, which could be negative.\n\nReset the bonus and scoring tokens, set up six new cards, hand out the symbol and number cards and start another round. The player with the highest score after five rounds wins.\n\n	25	25	25	2011	3	6	6	Vlaada Chvátil	Czech Games Edition
102652	Sentinels of the Multiverse	https://cf.geekdo-images.com/thumb/img/6siAiU5wG1NN8NFckD0N8LjGLUE=/fit-in/200x150/pic1296144.jpg	https://cf.geekdo-images.com/original/img/8iUgi62Jau7TF00eudHL_n_zxuA=/0x0/pic1296144.jpg	A mad scientist holds the world hostage with his terrifying inventions. An alien warlord from a far away galaxy brings his limitless army of bizarre minions to conquer the planet. A giant rampaging robot cuts a swath of destruction across the coast, destroying major population centers. And who will stand in their way? A team of heroes, all with impressive powers and abilities stand between the world and the forces of evil. Will you help them? Answer the call to protect the multiverse!\n\nSentinels of the Multiverse is a cooperative, fixed-deck card game with a comic book flavor. Each player plays as one of ten heroes, against one of four villains, and the battle takes place in one of four different dynamic environments.\n\nEach player, after selecting one of the heroes, plays a deck of 40 cards against the villain and environment decks, which "play themselves", requiring the players to put the top card of the appropriate deck into play on the villain and environment turns. On each player's turn, they may play a card from their hand, use a power printed on one of their cards in play, and draw a card from their deck. Each round starts with the villain turn, continues clockwise around the table, then concludes with the environment turn. Each villain has various advantages, such as starting with certain cards in play, as specified by the villain character card. Play continues until the heroes reduce the villain to 0 or fewer HP, or until the villain defeats the heroes, either via a win condition or by reducing all the heroes to 0 or fewer HP.\n\n	60	30	60	2011	2	5	4	Adam Rebottaro	Greater Than Games
110327	Lords of Waterdeep	https://cf.geekdo-images.com/thumb/img/26Ef_y4lLwV5qhRgZUAEpkno55g=/fit-in/200x150/pic1116080.jpg	https://cf.geekdo-images.com/original/img/PTVnjG9ersdKq6feZTpq5SkiPPw=/0x0/pic1116080.jpg	Game description from the publisher:\n\nWaterdeep, the City of Splendors – the most resplendent jewel in the Forgotten Realms, and a den of political intrigue and shady back-alley dealings. In this game, the players are powerful lords vying for control of this great city. Its treasures and resources are ripe for the taking, and that which cannot be gained through trickery and negotiation must be taken by force!\n\nIn Lords of Waterdeep, a strategy board game for 2-5 players, you take on the role of one of the masked Lords of Waterdeep, secret rulers of the city. Through your agents, you recruit adventurers to go on quests on your behalf, earning rewards and increasing your influence over the city. Expand the city by purchasing new buildings that open up new actions on the board, and hinder – or help – the other lords by playing Intrigue cards to enact your carefully laid plans.\n\nDuring the course of play, you may gain points or resources through completing quests, constructing buildings, playing intrigue cards or having other players utilize the buildings you have constructed.  At the end of 8 rounds of play, the player who has accrued the most points wins the game.\n\n	120	60	120	2012	2	5	4	Rodney Thompson	Wizards of the Coast
123260	Suburbia	https://cf.geekdo-images.com/thumb/img/ErmY_grQAOtH4zy2Hxg2AIeiAf8=/fit-in/200x150/pic1418335.jpg	https://cf.geekdo-images.com/original/img/v2kosqFeCkidrDEnKQYZSk-qH_k=/0x0/pic1418335.jpg	Plan, build, and develop a small town into a major metropolis. Use hex-shaped building tiles to add residential, commercial, civic, and industrial areas, as well as special points of interest that provide benefits and take advantage of the resources of nearby towns. Your goal is to have your borough thrive and end up with a greater population than any of your opponents.\n\nSuburbia is a tile-laying game in which each player tries to build up an economic engine and infrastructure that will be initially self-sufficient, and eventually become both profitable and encourage population growth. As your town grows, you'll modify both your income and your reputation. As your income increases, you'll have more cash on hand to purchase better and more valuable buildings, such as an international airport or a high rise office building. As your reputation increases, you'll gain more and more population (and the winner at the end of the game is the player with the largest population).\n\nDuring each game, players compete for several unique goals that offer an additional population boost – and the buildings available in each game vary, so you'll never play the same game twice!\n\n	90	90	90	2012	1	4	3	Ted Alspach	Bézier Games
123540	Tokaido	https://cf.geekdo-images.com/thumb/img/fhAMbCTDE7LFTOWoLsSnIfgaIEw=/fit-in/200x150/pic3747956.png	https://cf.geekdo-images.com/original/img/F5OFQxeuYjEtPUnczM6tlXFAm2Y=/0x0/pic3747956.png	In Tokaido, each player is a traveler crossing the "East sea road", one of the most magnificent roads of Japan. While traveling, you will meet people, taste fine meals, collect beautiful items, discover great panoramas, and visit temples and wild places but at the end of the day, when everyone has arrived at the end of the road you'll have to be the most initiated traveler – which means that you'll have to be the one who discovered the most interesting and varied things.\n\nThe potential action spaces in Tokaido are laid out on a linear track, with players advancing down this track to take actions. The player who is currently last on the track takes a turn by advancing forward on the track to their desired action and taking that action, so players must choose whether to advance slowly in order to get more turns, or to travel more rapidly to beat other players to their desired action spaces.\n\nThe action spaces allow a variety of actions that will score in different, but roughly equal, ways. Some action spaces allow players to collect money, while others offer players a way to spend that money to acquire points.  Other action spaces allow players to engage in various set collections that score points for assembling those sets.  Some action spaces simply award players points for stopping on them, or give the player a randomly determined action from all of the other types.\n\nAll of the actions in Tokaido are very simple, and combined with a unique graphic design, Tokaido offers players a peaceful zen mood in its play.\n\n	45	45	45	2012	2	5	4	Antoine Bauza	Funforge
124361	Concordia	https://cf.geekdo-images.com/thumb/img/Ap4Vj-Gb0Z64bxDUf7ulr52rFMw=/fit-in/200x150/pic3453267.jpg	https://cf.geekdo-images.com/original/img/abKLQBfHHaouqsLx7GGiIzqXBu8=/0x0/pic3453267.jpg	Two thousand years ago, the Roman Empire ruled the lands around the Mediterranean Sea. With peace at the borders, harmony inside the provinces, uniform law, and a common currency, the economy thrived and gave rise to mighty Roman dynasties as they expanded throughout the numerous cities. Guide one of these dynasties and send colonists to the remote realms of the Empire; develop your trade network; and appease the ancient gods for their favor — all to gain the chance to emerge victorious!\n\nConcordia is a peaceful strategy game of economic development in Roman times for 2-5 players aged 13 and up. Instead of looking to the luck of dice or cards, players must rely on their strategic abilities. Be sure to watch your rivals to determine which goals they are pursuing and where you can outpace them! In the game, colonists are sent out from Rome to settle down in cities that produce bricks, food, tools, wine, and cloth. Each player starts with an identical set of playing cards and acquires more cards during the game. These cards serve two purposes:\n\n\n    They allow a player to choose actions during the game.\n    They are worth victory points (VPs) at the end of the game. \n\n\nConcordia is a strategy game that requires advance planning and consideration of your opponent's moves. Every game is different, not only because of the sequence of new cards on sale but also due to the modular layout of cities. (One side of the game board shows the entire Roman Empire with 30 cities for 3-5 players, while the other shows Roman Italy with 25 cities for 2-4 players.) When all cards have been sold or after the first player builds his 15th house, the game ends. The player with the most VPs from the gods (Jupiter, Saturnus, Mercurius, Minerva, Vesta, etc.) wins the game.\n\n	100	100	100	2013	2	5	4	Mac Gerdts	PD-Verlag
172242	Exploding Kittens: NSFW Deck	https://cf.geekdo-images.com/thumb/img/TxEigL5CVkmx1abe9ZKkugChMCU=/fit-in/200x150/pic2815278.jpg	https://cf.geekdo-images.com/original/img/jOlEGT4WWuCOaUtvyz0jNrVhni0=/0x0/pic2815278.jpg	Originally an expansion for Exploding Kittens, the most successful Kickstarer project ever, that contained cards that were too horrific and/or incredible to be included in a kid safe version. As a stretch goal this was turned into a stand alone game that can be combined with the standard Exploding Kittens deck. If you combine the two decks, you can go up to 9 players. 10 with Imploding Kittens\n\n	20	10	20	2015	2	5	5	Shane Small	(Self-Published)
124708	Mice and Mystics	https://cf.geekdo-images.com/thumb/img/8WuMrzEKo_PGwiDUJVyiiw6Xl9E=/fit-in/200x150/pic1312072.jpg	https://cf.geekdo-images.com/original/img/wdy7-YpSjOhHVnTSlMnkfk6JLCs=/0x0/pic1312072.jpg	In Mice and Mystics, players take on the roles of those still loyal to the king – but to escape the clutches of Vanestra, they have been turned into mice! Play as cunning field mice who must race through a castle now twenty times larger than before. The castle would be a dangerous place with Vanestra's minions in control, but now countless other terrors also await heroes who are but the size of figs. Play as nimble Prince Collin and fence your way past your foes, or try Nez Bellows, the burly smith. Confound your foes as the wizened old mouse Maginos, or protect your companions as Tilda, the castle's former healer. Every player will have a vital role in the quest to warn the king, and it will take careful planning to find Vanestra's weakness and defeat her.\n\nMice and Mystics is a cooperative adventure game in which the players work together to save an imperiled kingdom. They will face countless adversaries such as rats, cockroaches, and spiders, and of course the greatest of all horrors: the castle's housecat, Brodie. Mice and Mystics is a boldly innovative game that thrusts players into an ever-changing, interactive environment, and features a rich storyline that the players help create as they play the game. The Cheese System allows players to hoard the crumbs of precious cheese they find on their journey, and use it to bolster their mice with grandiose new abilities and overcome seemingly insurmountable odds.\n\nMice and Mystics will provide any group of friends with an unforgettable adventure they will be talking about for years to come – assuming they can all squeak by...\n\n\n\nExpansion advice:\n\nFor those who have expansions for this game the recommended order by the game designer for playing them is as follows (see original post HERE):\n\n        Sorrow and Remembrance (Base game)\n        Cat's Cradle (Lost Chapter 1)\n        Heart of Glorm\n        The Ghost of Castle Andon (Lost Chapter 2)\n        Downwood Tales\n        Portents of Importance (Lost Chapter 3), connected to the story in Tail Feathers\n    \n\n\n\n\n	90	60	90	2012	1	4	4	Jerry Hawthorne	Plaid Hat Games
124742	Android: Netrunner	https://cf.geekdo-images.com/thumb/img/fJp94uxjjBE5bGT0IxWZ5ePpe8A=/fit-in/200x150/pic3738560.jpg	https://cf.geekdo-images.com/original/img/Wbp__Fl6QDKqzealhK2SDpoEk_g=/0x0/pic3738560.jpg	Welcome to New Angeles, home of the Beanstalk. From our branch offices in this monument of human achievement, NBN proudly broadcasts all your favorite media programming. We offer fully comprehensive streaming in music and threedee, news and sitcoms, classic movies and sensies. We cover it all. Ours is a brave new age, and as humanity hurtles into space and the future with an astonishing series of new advances every day, NBN and our affiliates are keeping pace, bringing you all the vid that's fit to view.\n\nAndroid: Netrunner is an asymmetrical Living Card Game for two players. Set in the cyberpunk future of Android and Infiltration, the game pits a megacorporation and its massive resources against the subversive talents of lone runners.\n\nCorporations seek to score agendas by advancing them. Doing so takes time and credits. To buy the time and earn the credits they need, they must secure their servers and data forts with "ice". These security programs come in different varieties, from simple barriers, to code gates and aggressive sentries. They serve as the corporation's virtual eyes, ears, and machine guns on the sprawling information superhighways of the network.\n\nIn turn, runners need to spend their time and credits acquiring a sufficient wealth of resources, purchasing the necessary hardware, and developing suitably powerful ice-breaker programs to hack past corporate security measures. Their jobs are always a little desperate, driven by tight timelines, and shrouded in mystery. When a runner jacks-in and starts a run at a corporate server, he risks having his best programs trashed or being caught by a trace program and left vulnerable to corporate countermeasures. It's not uncommon for an unprepared runner to fail to bypass a nasty sentry and suffer massive brain damage as a result. Even if a runner gets through a data fort's defenses, there's no telling what it holds. Sometimes, the runner finds something of value. Sometimes, the best he can do is work to trash whatever the corporation was developing.\n\nThe first player to seven points wins the game, but not likely before he suffers some brain damage or bad publicity.\n\nThe Revised Core Set for Android: Netrunner released in late 2017 includes cards from the original Core Set released in 2012 as well as cards from the Genesis Cycle and Spin Cycle series of Data Packs. While the cards in this set have been released previously, the art on some of them is new.\n\n	45	45	45	2012	2	2	2	Lukas Litzsinger	Fantasy Flight Games
126163	Tzolk'in: The Mayan Calendar	https://cf.geekdo-images.com/thumb/img/RFxQzKDZgLqZ6oCtclSQHMbDlfk=/fit-in/200x150/pic1413480.jpg	https://cf.geekdo-images.com/original/img/b_3SHZiUpcmrIT5hU8wVF0SDX8k=/0x0/pic1413480.jpg	Tzolkin: The Mayan Calendar presents a new game mechanism: dynamic worker placement. Players representing different Mayan tribes place their workers on giant connected gears, and as the gears rotate they take the workers to different action spots.\n\nDuring a turn, players can either (a) place one or more workers on the lowest visible spot of the gears or (b) pick up one or more workers. When placing workers, they must pay corn, which is used as a currency in the game. When they pick up a worker, they perform certain actions depending on the position of the worker. Actions located "later" on the gears are more valuable, so it's wise to let the time work for you – but players cannot skip their turn; if they have all their workers on the gears, they have to pick some up. \n\nThe game ends after one full revolution of the central Tzolkin gear. There are many paths to victory. Pleasing the gods by placing crystal skulls in deep caves or building many temples are just two of those many paths...\n\n	90	90	90	2012	2	4	4	Daniele Tascini	Czech Games Edition
129437	Legendary: A Marvel Deck Building Game	https://cf.geekdo-images.com/thumb/img/3iHQT7yoRs_1qn-KaF4NR9b1Sp8=/fit-in/200x150/pic1430769.jpg	https://cf.geekdo-images.com/original/img/Zs228bvKFb5jHoYvscyYBAph-QY=/0x0/pic1430769.jpg	Legendary: A Marvel Deck Building Game is set in the Marvel Comics universe. To set up the game, players choose a mastermind villain (Magneto, Loki, Dr. Doom, etc.), stack that particular villain's attack cards underneath it, then modify the villain deck as needed based on that villain's particular scheme. Players then choose a number of hero decks – Spider-Man, Hulk, Cyclops, Wolverine, etc. – and shuffle them together; since players use only a handful of hero decks out of the fifteen included, the hero deck can vary widely in terms of what's available.\n\nOver the course of the game, players will recruit powerful hero cards to add to their deck in order to build a stronger and more resourceful deck. Players need to build both their recruitment powers (to enlist more heroes) and their fighting ability (to combat the villains who keep popping up to cause trouble). Players recruit heroes from an array of five cards, with empty slots refilled as needed. At the start of a player's turn, he reveals a villain and adds it to the row of villains. This row has a limited number of spaces, and if it fills up, the earliest villain to arrive escapes, possibly punishing the heroes in some way. Some villains also take an action when showing up for the first time, such as kidnapping an innocent bystander. The villain deck also contains "master strike" cards, and whenever one of these shows up, the mastermind villain (controlled by the game) takes a bonus action.\n\nAs players fight and defeat villains, they collect those cards, which will be worth points at game's end. Players can also fight the mastermind; if a player has enough fighting power, he claims one of the attack cards beneath the mastermind, which has a particular effect on the game. If all of these cards are claimed, the game ends and players tally their points to see who wins. If the mastermind completes his scheme, however – having a certain number of villains escape, for example, or imposing a certain number of wounds on the heroes – then the players all lose.\n\n	45	45	45	2012	1	5	3	Devin Low	Upper Deck Entertainment
131357	Coup	https://cf.geekdo-images.com/thumb/img/ZsRtgIExTwWphMDZPH1hG-CR8os=/fit-in/200x150/pic2016054.jpg	https://cf.geekdo-images.com/original/img/4zmqrQ4v-rufRQM_oinFDQ6HykI=/0x0/pic2016054.jpg	You are head of a family in an Italian city-state, a city run by a weak and corrupt court. You need to manipulate, bluff and bribe your way to power. Your object is to destroy the influence of all the other families, forcing them into exile. Only one family will survive...\n\nIn Coup, you want to be the last player with influence in the game, with influence being represented by face-down character cards in your playing area.\n\nEach player starts the game with two coins and two influence – i.e., two face-down character cards; the fifteen card deck consists of three copies of five different characters, each with a unique set of powers:\n\n\n     Duke: Take three coins from the treasury. Block someone from taking foreign aid.\n     Assassin: Pay three coins and try to assassinate another player's character.\n     Contessa: Block an assassination attempt against yourself.\n     Captain: Take two coins from another player, or block someone from stealing coins from you.\n     Ambassador: Draw two character cards from the Court (the deck), choose which (if any) to exchange with your face-down characters, then return two. Block someone from stealing coins from you.\n\n\nOn your turn, you can take any of the actions listed above, regardless of which characters you actually have in front of you, or you can take one of three other actions:\n\n\n     Income: Take one coin from the treasury.\n     Foreign aid: Take two coins from the treasury.\n     Coup: Pay seven coins and launch a coup against an opponent, forcing that player to lose an influence. (If you have ten coins or more, you must take this action.)\n\n\nWhen you take one of the character actions – whether actively on your turn, or defensively in response to someone else's action – that character's action automatically succeeds unless an opponent challenges you. In this case, if you can't (or don't) reveal the appropriate character, you lose an influence, turning one of your characters face-up. Face-up characters cannot be used, and if both of your characters are face-up, you're out of the game.\n\nIf you do have the character in question and choose to reveal it, the opponent loses an influence, then you shuffle that character into the deck and draw a new one, perhaps getting the same character again and perhaps not.\n\nThe last player to still have influence – that is, a face-down character – wins the game!\n\nA new & optional character called the Inquisitor has been added (currently, the only English edition with the Inquisitor included is the Kickstarter Version from Indie Boards & Cards. Copies in stores may not be the Kickstarter versions and may only be the base game). The Inquisitor character cards may be used to replace the Ambassador cards.\n\n\n     Inquisitor: Draw one character card from the Court deck and choose whether or not to exchange it with one of your face-down characters. OR Force an opponent to show you one of their character cards (their choice which). If you wish it, you may then force them to draw a new card from the Court deck. They then shuffle the old card into the Court deck. Block someone from stealing coins from you.\n\n\n	15	15	15	2012	2	6	5	Rikki Tahta	Indie Boards & Cards
133473	Sushi Go!	https://cf.geekdo-images.com/thumb/img/0y6Je0vh3QP_BhYHNxn6w8TafHk=/fit-in/200x150/pic1900075.jpg	https://cf.geekdo-images.com/original/img/IlYW00i351ucPwf_aHiE0v-HNdM=/0x0/pic1900075.jpg	In the super-fast sushi card game Sushi Go!, you are eating at a sushi restaurant and trying to grab the best combination of sushi dishes as they whiz by. Score points for collecting the most sushi rolls or making a full set of sashimi. Dip your favorite nigiri in wasabi to triple its value! And once you've eaten it all, finish your meal with all the pudding you've got! But be careful which sushi you allow your friends to take; it might be just what they need to beat you!\n\nSushi Go! takes the card-drafting mechanism of Fairy Tale and 7 Wonders and distills it into a twenty-minute game that anyone can play. The dynamics of "draft and pass" are brought to the fore, while keeping the rules to a minimum. As you see the first few hands of cards, you must quickly assess the make-up of the round and decide which type of sushi you'll go for. Then, each turn you'll need to weigh which cards to keep and which to pass on. The different scoring combinations allow for some clever plays and nasty blocks. Round to round, you must also keep your eye on the goal of having the most pudding cards at the end of the game!\n\n	15	15	15	2013	2	5	4	Phil Walker-Harding	Adventureland Games
230802	Azul	https://cf.geekdo-images.com/thumb/img/_ed_JktpgFwTr2WjEQgYMzHBvOQ=/fit-in/200x150/pic3718275.jpg	https://cf.geekdo-images.com/original/img/9-SR48jyfxs4At6255sjHoly2sw=/0x0/pic3718275.jpg	Introduced by the Moors, azulejos (originally white and blue ceramic tiles) were fully embraced by the Portuguese when their king Manuel I, on a visit to the Alhambra palace in Southern Spain, was mesmerized by the stunning beauty of the Moorish decorative tiles. The king, awestruck by the interior beauty of the Alhambra, immediately ordered that his own palace in Portugal be decorated with similar wall tiles. As a tile-laying artist, you have been challenged to embellish the walls of the Royal Palace of Evora.\n\nIn the game Azul, players take turns drafting colored tiles from suppliers to their player board. Later in the round, players score points based on how they've placed their tiles to decorate the palace. Extra points are scored for specific patterns and completing sets; wasted supplies harm the player's score. The player with the most points at the end of the game wins.\n\n	45	30	45	2017	2	4	2	Michael Kiesling	Next Move Games
136063	Forbidden Desert	https://cf.geekdo-images.com/thumb/img/gm5d7sO006n-WTSG2ynzyLz169A=/fit-in/200x150/pic1528722.jpg	https://cf.geekdo-images.com/original/img/wYvf6LExNhb3rflp_QYmCK_NhMc=/0x0/pic1528722.jpg	Game description from the publisher:\n\nGear up for a thrilling adventure to recover a legendary flying machine buried deep in the ruins of an ancient desert city. You'll need to coordinate with your teammates and use every available resource if you hope to survive the scorching heat and relentless sandstorm. Find the flying machine and escape before you all become permanent artifacts of the forbidden desert!\n\nIn Forbidden Desert, a thematic sequel to Forbidden Island, players take on the roles of brave adventurers who must throw caution to the wind and survive both blistering heat and blustering sand in order to recover a legendary flying machine buried under an ancient desert city. While featuring cooperative gameplay similar to Forbidden Island, Forbidden Desert is a fresh, new game based around an innovative set of mechanisms such as an ever-shifting board, individual resource management, and a unique method for locating the flying machine parts.\n\n	45	45	45	2013	2	5	4	Matt Leacock	Gamewright
139976	Cthulhu Wars	https://cf.geekdo-images.com/thumb/img/SSfzmASLzl3JWMngSvLfvaciIkM=/fit-in/200x150/pic3527761.jpg	https://cf.geekdo-images.com/original/img/JZDhEpMVbGBunW4z12KpBtYX070=/0x0/pic3527761.jpg	Cthulhu Wars is a strategy boardgame in which the players take the part of alien races and gods taken from the Cthulhu mythos created by H. P. Lovecraft. The game is physically large, and includes sixty-four  figurines of the cultists, monsters, aliens, and Great Old Ones that range in height from approximately 20 mm to nearly 180 mm.\n\nThe game takes place on a map of Earth. Each player takes the part of one of four factions included in the base game. At the start of a turn, players Gather Power, then, during a series of Action Rounds, they spend this Power to accomplish various tasks, such as recruiting Cultists, moving units, engaging in battle, summoning monsters, building Gates, casting spells, and Awakening their Great Old One. When all players run out of Power, the Action phase ends and the next turn begins. Victory is determined by accumulating points on the Doom Track. The first player to 30 is the lone victor *if* he has unlocked all six of spell books.\n\nDriving the strategy are a player's wish to expand his power base, and his need to accomplish six tasks to acquire his faction's spell books. Each faction has a unique set of monsters, spell books, and special abilities, and has different requirements to acquire its spell books. All factions have multiple strategies open to them.\n\nThe base game supports 2-4 players (the map supports 5 players), but with new factions and maps released as expansions it can support up to 8 players.\n\n	120	90	120	2015	2	4	4	Lincoln Petersen	Petersen Games
143884	Machi Koro	https://cf.geekdo-images.com/thumb/img/DSYk4MtXVS2eP6-X0qWYGGOCMpM=/fit-in/200x150/pic4783831.png	https://cf.geekdo-images.com/original/img/-0UXAhHj3Q992K_q2lOVDkjgjTo=/0x0/pic4783831.png	Welcome to the city of Machi Koro. You've just been elected Mayor. Congrats! Unfortunately the citizens have some pretty big demands: jobs, a theme park, a couple of cheese factories and maybe even a radio tower. A tough proposition since the city currently consists of a wheat field, a bakery and a single die.\n\nArmed only with your trusty die and a dream, you must grow Machi Koro into the largest city in the region. You will need to collect income from developments, build public works, and steal from your neighbors' coffers. Just make sure they aren't doing the same to you!\n\nMachi Koro is a fast-paced game for 2-4 players. Each player wants to develop the city on their own terms in order to complete all of the landmarks under construction faster than their rivals. On their turn, each player rolls one or two dice. If the sum of the dice rolled matches the number of a building that a player owns, they get the effect of that building; in some cases opponents will also benefit from your dice (just as you can benefit from theirs). Then, with money in hand a player can build a landmark or a new building, ideally adding to the wealth of their city on future turns. The first player to construct all of their landmarks wins!\n\n	30	30	30	2012	2	4	4	Masao Suganuma	Grounding
145659	Scoville	https://cf.geekdo-images.com/thumb/img/Wpoc45CnkUyWQS9GZsWbIklF_3w=/fit-in/200x150/pic1903464.jpg	https://cf.geekdo-images.com/original/img/eksuZRUexg40DnFbPuNE5pvPxXA=/0x0/pic1903464.jpg	The town of Scoville likes it hot! Very hot! That means they love their peppers – but they're too busy eating them to grow the peppers themselves. That's where you come in.\n\nYou've been hired by the town of Scoville to meet their need for heat. Your role as an employee of Scoville is to crossbreed peppers to create the hottest new breeds. You'll have to manage the auctioning, planting, and harvesting of peppers, then you'll be able to help the town by fulfilling their orders and creating new pepper breeds. Help make the town of Scoville a booming success! Let's get planting!\n\nA round of Scoville consists of a blind auction, which determines player order, a planting phase, a harvesting phase, and a fulfillment phase. Each round, the players plant peppers in the fields. Throughout the game, the available opportunities for crossbreeding increase as more peppers are planted. When harvesting, players move their pawn through the fields, and whenever they move between two planted fields, they harvest peppers. If, for example, they harvest between fields of red and yellow peppers, they crossbreed those and harvest an orange pepper. Harvested peppers are then used to fulfill the town's peppery desires!\n\n	90	60	90	2014	2	6	4	Ed Marriott	Tasty Minstrel Games
146021	Eldritch Horror	https://cf.geekdo-images.com/thumb/img/V_13CBO7zMMfQsUhF6jUAy_nAeg=/fit-in/200x150/pic1872452.jpg	https://cf.geekdo-images.com/original/img/i0zxc-H4TlTFB-yE1v4gcLy3XfY=/0x0/pic1872452.jpg	Game description from the publisher:\n\nAcross the globe, ancient evil is stirring. Now, you and your trusted circle of colleagues must travel around the world, working against all odds to hold back the approaching horror. Foul monsters, brutal encounters, and obscure mysteries will take you to your limit and beyond. All the while, you and your fellow investigators must unravel the otherworldy mysteries scattered around the globe in order to push back the gathering mayhem that threatens to overwhelm humanity. The end draws near! Do you have the courage to prevent global destruction?\n\nEldritch Horror is a cooperative game of terror and adventure in which one to eight players take the roles of globetrotting investigators working to solve mysteries, gather clues, and protect the world from an Ancient One – that is, an elder being intent on destroying our world. Each Ancient One comes with its own unique decks of Mystery and Research cards, which draw you deeper into the lore surrounding each loathsome creature. Discover the true name of Azathoth or battle Cthulhu on the high seas.\n\nWhile the tasks on these Mystery cards (along with the locations of otherworldly gates, menacing monsters, and helpful clues) will often inform both your travel plans and the dangers you confront, you can find adventure anywhere in the world...even where you least expect it. It is during the Encounter Phase of each turn that players resolve combat or, alternatively, build their investigators' personal stories by reading an encounter narrative from one of several types of Encounter cards. You might go head to head with a monster in Istanbul or find yourself in a tough spot with the crime syndicate in a major city. Maybe you will embark on an expedition to the Pyramids or research a clue you uncover in the unnamed wilderness. You may even find your way through a gate and explore a dimension beyond time and space.\n\nShould you fail an encounter, the cost is steep. If you are fortunate, you will merely incur physical or mental trauma. However, you might also be compelled to take a Condition card, which represents a specific injury or restriction gained throughout your journey, such as a Leg Injury or Amnesia. You could find yourself getting in over your head to acquire assets and receive a Debt condition – or maybe you'll owe a favor to something far more insidious than a debt collector, and enter into a Dark Pact! Whatever your condition, you would be wise to find a resolution with haste; many conditions have a "reckoning effect" which, if triggered, ensure a much more sinister fate.\n\nAll the while, the arrival of the Ancient One approaches. Its malign influence is manifested in Eldritch Horror as you draw Mythos Cards, which govern the appearance of otherworldly gates, fearsome monsters, and other ominous elements. Mythos cards keep your investigators under pressure, introducing new threats, even as the arrival of the Great Old One draws nearer! Since the investigators draw a new Mythos card each round, they're certain to have their hands full battling foul creatures and following up on strange rumors, even as they work to solve their three all-important mysteries.\n\nWith twelve unique investigators, two hundred-fifty tokens, and over three hundred cards, Eldritch Horror presents an epic, world-spanning adventure with each and every game.\n\n	240	120	240	2013	1	8	4	Nikki Valens	Fantasy Flight Games
148228	Splendor	https://cf.geekdo-images.com/thumb/img/x-l6MKgcj-wBZfgX1ttvO5MRcJ4=/fit-in/200x150/pic1904079.jpg	https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg	Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops—all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.\n\nOn your turn, you may (1) collect chips (gems), or (2) buy and build a card, or (3) reserve one card. If you collect chips, you take either three different kinds of chips or two chips of the same kind. If you buy a card, you pay its price in chips and add it to your playing area. To reserve a card—in order to make sure you get it, or, why not, your opponents don't get it—you place it in front of you face down for later building; this costs you a round, but you also get gold in the form of a joker chip, which you can use as any gem.\n\nAll of the cards you buy increase your wealth as they give you a permanent gem bonus for later buys; some of the cards also give you prestige points. In order to win the game, you must reach 15 prestige points before your opponents do.\n\n	30	30	30	2014	2	4	3	Marc André	Space Cowboys
152241	Ultimate Werewolf	https://cf.geekdo-images.com/thumb/img/_hYQrvSlgN46hO60byl8IAMMikI=/fit-in/200x150/pic1878507.png	https://cf.geekdo-images.com/original/img/JMelOetv9YGX1E7K0o41ZhtCVo8=/0x0/pic1878507.png	Ultimate Werewolf is an interactive game of deduction for two teams: Villagers and Werewolves. The Villagers don't know who the Werewolves are, and the Werewolves are trying to remain undiscovered while they slowly eliminate the Villagers one at a time. A Moderator (who isn't on a team) runs the game.\n\nUltimate Werewolf takes place over a series of game days and nights. Each day, the players discuss who among them is a Werewolf, and vote out a player. Each night, the Werewolves choose a player to eliminate, while the Seer learns if one player is a Werewolf or not. The game is over when either all the Villagers or all the Werewolves are eliminated.\n\nUltimate Werewolf, a new edition of the award-winning, best-selling werewolf title from Bézier Games, has been reimagined to allow new players to quickly get up and running, with a larger box, totally rewritten and simplified rules, and a guide for the included roles. With all-new art and a great new card design, it's the perfect way to introduce groups of 7-30 people to Werewolf.\n\n	60	60	60	2014	5	30	12	Ted Alspach	Bézier Games
155068	Arcadia Quest	https://cf.geekdo-images.com/thumb/img/U3nBFdfBTy1xYq-TMsNrGiDLt8M=/fit-in/200x150/pic2305263.jpg	https://cf.geekdo-images.com/original/img/lB5mc2bDPP2fNjvnBJLkSQvM2ps=/0x0/pic2305263.jpg	In Arcadia Quest, players lead guilds of intrepid heroes on an epic campaign to dethrone the vampire lord and reclaim the mighty Arcadia for their own. But only one guild may lead in the end, so players must battle against each other as well as against the monstrous occupying forces.\n\nArcadia Quest is a campaign-based game for 2 to 4 players, where each player controls a guild of three unique heroes, facing off against the other players and the various monsters controlled by the game. Players need to accomplish a series of quests in order to win each scenario and choose where to go next in the campaign.\n\nPlayers are able to choose the path their campaign takes, navigating through six out of eleven available scenarios, so each time the campaign is played it can have a different configuration of scenarios. As the campaign progresses, the heroes are able to acquire new weapons, equipment and abilities that give them powerful options to tackle the obstacles ahead. Furthermore, by fulfilling specific quests in a scenario, players unlock exclusive features in subsequent scenarios.\n\n	60	60	60	2014	2	4	4	Fred Perret	CMON Limited
156546	Monikers	https://cf.geekdo-images.com/thumb/img/MTaoWAfoJOkI1PqFTAEYiCn1fdI=/fit-in/200x150/pic4912737.png	https://cf.geekdo-images.com/original/img/vE92_kuwb0_fBX3VlAm4ZT4IP5o=/0x0/pic4912737.png	Monikers is a party game based on the public domain game Celebrity, where players take turns attempting to get their teammates to guess names by describing or imitating well-known people.\n\nIn the first round, clue givers can say anything they want, except for the name itself. For the second round, clue givers can only say one word. And in the final round, clue givers can’t say anything at all: they can only use gestures and charades.\n\nBased on the public domain game known as Celebrities.\n\n	60	60	60	2015	4	20	8	Justin Vickers	Palm Court
156689	Legendary: A Marvel Deck Building Game – Villains	https://cf.geekdo-images.com/thumb/img/jq2x-cscn3P5Qbp6pz7jDvbNusU=/fit-in/200x150/pic2081108.jpg	https://cf.geekdo-images.com/original/img/gDB4CImtqbtanMmbsJ7eBE-dbJY=/0x0/pic2081108.jpg	The Legendary universe gets flipped upside down in Legendary: Villains – Marvel Deck Building Game, and you can now play as villains trying to take out the heroes protecting the city!\n\nThe goal of the game remains roughly the same as in the first Legendary game as players can work both with and against other players to overcome obstacles that the game throws at them. In this case, however, players use the super villains of the Marvel Universe — including Venom, Magneto and Loki — to battle superheroes such as the X-Men, the Avengers and Spider-Friends.\n\nLegendary: Villains – Marvel Deck Building Game is a standalone game that includes all the cards needed to play.\n\n	45	45	45	2014	1	5	3	Devin Low	Upper Deck Entertainment
157969	Sheriff of Nottingham	https://cf.geekdo-images.com/thumb/img/18ToCY0hvajoDtgqXaB6T7inL8Y=/fit-in/200x150/pic2075830.jpg	https://cf.geekdo-images.com/original/img/LhRnbdwJ77VnRI_yQg2ZFiwEq1E=/0x0/pic2075830.jpg	Prince John is coming to Nottingham! Players, in the role of merchants, see this as an opportunity to make quick profits by selling goods in the bustling city during the Prince's visit. However, players must first get their goods through the city gate, which is under the watch of the Sheriff of Nottingham. Should you play it safe with legal goods and make a profit, or risk it all by sneaking in illicit goods? Be mindful, though, as the Sheriff always has his eyes out for liars and tricksters and if he catches one, he very well may confiscate those goods for himself!\n\nIn Sheriff of Nottingham, players will not only be able to experience Nottingham as a merchant of the city, but each turn one player will step into the shoes of the Sheriff himself. Players declare goods they wish to bring into the city, goods that are secretly stored in their burlap sack. The Sheriff must then determine who gets into the city with their goods, who gets inspected, and who may have their goods confiscated!\n\nDo you have what it takes to be seen as an honest merchant? Will you make a deal with the Sheriff to let you in? Or will you persuade the Sheriff to target another player while you quietly slip by the gate? Declare your goods, negotiate deals, and be on the lookout for the Sheriff of Nottingham!\n\nSheriff of Nottingham is the first game in the Dice Tower Essentials Line from Arcane Wonders.\n\n	60	60	60	2014	3	5	5	André Zatz	Arcane Wonders
159515	Operation F.A.U.S.T.	https://cf.geekdo-images.com/thumb/img/32_d2MZWwJs04apAKFpebkEbyzE=/fit-in/200x150/pic2307300.jpg	https://cf.geekdo-images.com/original/img/G1dNyILSuuzR93SmvP0OWYQqDTo=/0x0/pic2307300.jpg	In Operation F.A.U.S.T. (Fine Art Underground: Stolen Treasures), players take on roles of independent art patrons in occupied France during WWII. This was a period when Europe's greatest treasures were at risk of being looted by the Einsatzstab Reichsleiter Rosenberg (ERR), a special unit of the Third Reich tasked with plundering cultural valuables.\n\nEach player will work to acquire the most prestigious collection of art treasures through bluffing and deception. The first player to reach $1,000,000 in black market art value immediately wins the game.\n\nPlayers execute one of multiple possible actions on each turn with the goal of gaining enough intelligence to recover at risk master works.â€¨\n\nPlayer’s may use deception to advance their goals, but risk losing their intel if caught in a lie. When a player earns enough intel, they may acquire a piece of art that has a specific, but secret black market value. Art gained may be forged or considered “degenerate” making it more easily confiscated.\n\nTo win this highly interactive game, a player must take risks, use cunning misdirection, uncover and remember where valuable art resides, and employ strategies to acquire the most valuable collection more quickly than the competition.\n\n	30	30	30	2015	3	8	5	Robert Burke	Robert Burke Games
160499	King of New York	https://cf.geekdo-images.com/thumb/img/WaW2VsdMYT0Xh3JWcuLA9e-L85Y=/fit-in/200x150/pic2407103.jpg	https://cf.geekdo-images.com/original/img/R0dEpSy_FsE2iKVDL9Gn5Z8TYx0=/0x0/pic2407103.jpg	There's always something happening in the city that never sleeps. Maybe it's the lights, maybe it's the energy, or maybe it's the giant monsters trying to demolish the place!\n\nKing of New York is a standalone game from designer Richard Garfield that keeps the core ideas of King of Tokyo while introducing new ways to play. As in KoT, your goal is to be the first monster to collect 20 victory points (VPs) or to be the last monster standing. On your turn, you roll six dice up to three times, then carry out the actions on those dice. Claws cause damage to other monsters, hearts heal damage to yourself, and energy is stored up so that you can purchase power cards that provide unique effects not available to anyone else.\n\nWhat's new in King of New York is that you can now try to become a star in the big city; more specifically, you can achieve "Fame", which nets you VPs, but superstar status is fleeting, so enjoy your time in the spotlight.\n\nThe game board for King of New York is larger than in KoT with each monster occupying a district in the city and everyone trying to shine in Manhattan. When you attack, you can displace a monster in another district, whether to escape military forces or to find new smashing opportunities. Yes, smashing because you can now destroy buildings and get bonuses for doing so, but the more destruction you cause, the more intense the military response.\n\nThe monsters from King of New York can be used in KoT and vice versa, but the power cards are specific to this game.\n\nPart of the King of Tokyo series.\n\n	40	40	40	2014	2	6	4	Richard Garfield	IELLO
161936	Pandemic Legacy: Season 1	https://cf.geekdo-images.com/thumb/img/WI5NmPd9C3PpRvHKoP4a0Ettlao=/fit-in/200x150/pic2452831.png	https://cf.geekdo-images.com/original/img/P_SwsOtPLqgk2ScCgI2YrI9Rg6I=/0x0/pic2452831.png	Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game. At the beginning, the game starts very similar to basic Pandemic, in which your team of disease-fighting specialists races against the clock to travel around the world, treating disease hotspots while researching cures for each of four plagues before they get out of hand.\n\nDuring a player's turn, they have four actions available, with which they may travel around in the world in various ways (sometimes needing to discard a card), build structures like research stations, treat diseases (removing one cube from the board; if all cubes of a color have been removed, the disease has been eradicated), trade cards with other players, or find a cure for a disease (requiring five cards of the same color to be discarded while at a research station). Each player has a unique role with special abilities to help them at these actions.\n\nAfter a player has taken their actions, they draw two cards. These cards can include epidemic cards, which will place new disease cubes on the board, and can lead to an outbreak, spreading disease cubes even further. Outbreaks additionally increase the panic level of a city, making that city more expensive to travel to.\n\nEach month in the game, you have two chances to achieve that month's objectives. If you succeed, you win and immediately move on to the next month. If you fail, you have a second chance, with more funding for beneficial event cards.\n\nDuring the campaign, new rules and components will be introduced. These will sometimes require you to permanently alter the components of the game; this includes writing on cards, ripping up cards, and placing permanent stickers on components. Your characters can gain new skills, or detrimental effects. A character can even be lost entirely, at which point it's no longer available for play.\n\nPart of the Pandemic series\n\n	60	60	60	2015	2	4	4	Matt Leacock	Z-Man Games, Inc.
162886	Spirit Island	https://cf.geekdo-images.com/thumb/img/t9mRnhW6swyL2nPSScv9iroCyZQ=/fit-in/200x150/pic3615739.png	https://cf.geekdo-images.com/original/img/RmP2yBDA0LE-ZFWrEXAkgRuYjn0=/0x0/pic3615739.png	In the most distant reaches of the world, magic still exists, embodied by spirits of the land, of the sky, and of every natural thing. As the great powers of Europe stretch their colonial empires further and further, they will inevitably lay claim to a place where spirits still hold power - and when they do, the land itself will fight back alongside the islanders who live there.\n\nSpirit Island is a complex and thematic cooperative game about defending your island home from colonizing Invaders. Players are different spirits of the land, each with its own unique elemental powers. Every turn, players simultaneously choose which of their power cards to play, paying energy to do so. Using combinations of power cards that match a spirit's elemental affinities can grant free bonus effects. Faster powers take effect immediately, before the Invaders spread and ravage, but other magics are slower, requiring forethought and planning to use effectively. In the Spirit phase, spirits gain energy, and choose how / whether to Grow: to reclaim used power cards, to seek for new power, or to spread presence into new areas of the island.\n\nThe Invaders expand across the island map in a semi-predictable fashion. Each turn they explore into some lands (portions of the island); the next turn, they build in those lands, forming settlements and cities. The turn after that, they ravage there, bringing blight to the land and attacking any native islanders present.\n\nThe islanders fight back against the Invaders when attacked, and lend the spirits some other aid, but may not always do so exactly as you'd hoped. Some Powers work through the islanders, helping them (eg) drive out the Invaders or clean the land of blight.\n\nThe game escalates as it progresses: spirits spread their presence to new parts of the island and seek out new and more potent powers, while the Invaders step up their colonization efforts. Each turn represents 1-3 years of alternate-history.\n\nAt game start, winning requires destroying every last settlement and city on the board - but as you frighten the Invaders more and more, victory becomes easier: they'll run away even if some number of settlements or cities remain. Defeat comes if any spirit is destroyed, if the island is overrun by blight, or if the Invader deck is depleted before achieving victory.\n\nThe game includes different adversaries to fight against (eg: a Swedish Mining Colony, or a Remote British Colony). Each changes play in different ways, and offers a different path of difficulty boosts to keep the game challenging as you gain skill.\n\n	120	90	120	2017	1	4	2	R. Eric Reuss	Greater Than Games
163908	This House Is Haunted	https://cf.geekdo-images.com/thumb/img/IF_MxZlJsI5Vr7RDGXkTMJsQZZs=/fit-in/200x150/pic2393348.png	https://cf.geekdo-images.com/original/img/GvS2VlKd_RNIUDk2ID2AkOSNXhw=/0x0/pic2393348.png	This House Is Haunted is a new silly and spooky exploration-based card game where you use your house as the game board! Combining elements of co-operative play and secret rogue players with unbelievably immersive gameplay, This House is Haunted is a truly original experience.\n\nWhat's the story? Well, it appears your house is haunted by demonic spirits! Will you banish the evil presence or become possessed yourself? Bust out the flashlights, explore your darkened home, avoid terrible curses, survive haunted rooms, all the while not know which of your friends you can actually trust...\n\nEach turn players begin in the designated Home Room where the current leader decides what rooms in the haunted house players will go to in order to draw cards. There are 6 different types of cards that can be drawn. Seals, Blessings, Curses, Demon Marks, Hexes, and Haunting Cards. Haunting Cards trap players in rooms, where they must follow the card's instructions and terrorize visiting players. Our brave human players are attempting to retrieve enough Seal Cards and get them back to the Home Room, but if they draw too many demon Mark Cards they can become possessed and secretly change to the demon's team.\n\n	60	60	60	2014	4	8	8	Gabriel Gomez	Brain Punch Games
167791	Terraforming Mars	https://cf.geekdo-images.com/thumb/img/yFqQ569DfL8NSTGTUw0vF9SCR7k=/fit-in/200x150/pic3536616.jpg	https://cf.geekdo-images.com/original/img/o8z_levBVArPUKI7ZrIysZEs1A0=/0x0/pic3536616.jpg	In the 2400s, mankind begins to terraform the planet Mars. Giant corporations, sponsored by the World Government on Earth, initiate huge projects to raise the temperature, the oxygen level, and the ocean coverage until the environment is habitable. In Terraforming Mars, you play one of those corporations and work together in the terraforming process, but compete for getting victory points that are awarded not only for your contribution to the terraforming, but also for advancing human infrastructure throughout the solar system, and doing other commendable things.\n\nThe players acquire unique project cards (from over two hundred different ones) by buying them to their hand. The projects (cards) can represent anything from introducing plant life or animals, hurling asteroids at the surface, building cities, to mining the moons of Jupiter and establishing greenhouse gas industries to heat up the atmosphere. The cards can give you immediate bonuses, as well as increasing your production of different resources. Many cards also have requirements and they become playable when the temperature, oxygen, or ocean coverage increases enough. Buying cards is costly, so there is a balance between buying cards (3 megacredits per card) and actually playing them (which can cost anything between 0 to 41 megacredits, depending on the project). Standard Projects are always available to complement your cards.\n\nYour basic income, as well as your basic score, is based on your Terraform Rating (starting at 20), which increases every time you raise one of the three global parameters. However, your income is complemented with your production, and you also get VPs from many other sources.\n\nEach player keeps track of their production and resources on their player boards, and the game uses six types of resources: MegaCredits, Steel, Titanium, Plants, Energy, and Heat. On the game board, you compete for the best places for your city tiles, ocean tiles, and greenery tiles. You also compete for different Milestones and Awards worth many VPs. Each round is called a generation (guess why) and consists of the following phases:\n\n1) Player order shifts clockwise.\n2) Research phase: All players buy cards from four privately drawn.\n3) Action phase: Players take turns doing 1-2 actions from these options: Playing a card, claiming a Milestone, funding an Award, using a Standard project, converting plant into greenery tiles (and raising oxygen), converting heat into a temperature raise, and using the action of a card in play. The turn continues around the table (sometimes several laps) until all players have passed.\n4) Production phase: Players get resources according to their terraform rating and production parameters.\n\nWhen the three global parameters (temperature, oxygen, ocean) have all reached their goal, the terraforming is complete, and the game ends after that generation. Count your Terraform Rating and other VPs to determine the winning corporation!\n\n	120	120	120	2016	1	5	3	Jacob Fryxelius	FryxGames
169124	Flick 'em Up!	https://cf.geekdo-images.com/thumb/img/8rX_8dVaNbWvYotSyL2f1H6GQPQ=/fit-in/200x150/pic2439671.png	https://cf.geekdo-images.com/original/img/DVKmaZ7JCO7kalEiPMOKgGs6Gl0=/0x0/pic2439671.png	The cities in the West are not the safest place to be. In the disc-flicking game Flick 'em Up!, you can become an outlaw and rob banks, free prisoners, attack innocent bystanders... or you could become the Sheriff and try to protect the people of your city from these bandits!\n\nRelive the great adventures of the West, face your enemies in street duels, use different guns and tactics to get what you want. You can follow the scenarios or create your own—the choice is yours, cowboy!\n\n	45	30	45	2015	2	10	4	Jean Yves Monpertuis	Pretzel Games
173346	7 Wonders Duel	https://cf.geekdo-images.com/thumb/img/cwWMq5feF7O4O82HJOK3WE5IZ6o=/fit-in/200x150/pic3376065.jpg	https://cf.geekdo-images.com/original/img/M6wL1YFgW-PsdtJ328m2QiJf1K8=/0x0/pic3376065.jpg	In many ways 7 Wonders Duel resembles its parent game 7 Wonders as over three ages players acquire cards that provide resources or advance their military or scientific development in order to develop a civilization and complete wonders.\n\nWhat's different about 7 Wonders Duel is that, as the title suggests, the game is solely for two players, with the players not drafting cards simultaneously from hands of cards, but from a display of face-down and face-up cards arranged at the start of a round. A player can take a card only if it's not covered by any others, so timing comes into play as well as bonus moves that allow you to take a second card immediately. As in the original game, each card that you acquire can be built, discarded for coins, or used to construct a wonder.\n\nEach player starts with four wonder cards, and the construction of a wonder provides its owner with a special ability. Only seven wonders can be built, though, so one player will end up short.\n\nPlayers can purchase resources at any time from the bank, or they can gain cards during the game that provide them with resources for future building; as you acquire resources, the cost for those particular resources increases for your opponent, representing your dominance in this area.\n\nA player can win 7 Wonders Duel in one of three ways: each time you acquire a military card, you advance the military marker toward your opponent's capital, giving you a bonus at certain positions; if you reach the opponent's capital, you win the game immediately; similarly, if you acquire any six of seven different scientific symbols, you achieve scientific dominance and win immediately; if none of these situations occurs, then the player with the most points at the end of the game wins.\n\n	30	30	30	2015	2	2	2	Bruno Cathala	Repos Production
169786	Scythe	https://cf.geekdo-images.com/thumb/img/ZpuWhZuKrFry__SY8CTRuQp35rk=/fit-in/200x150/pic3163924.jpg	https://cf.geekdo-images.com/original/img/enxCZt0Cn78-rlvmPvGtOej1ios=/0x0/pic3163924.jpg	It is a time of unrest in 1920s Europa. The ashes from the first great war still darken the snow. The capitalistic city-state known simply as “The Factory”, which fueled the war with heavily armored mechs, has closed its doors, drawing the attention of several nearby countries.\n\nScythe is an engine-building game set in an alternate-history 1920s period. It is a time of farming and war, broken hearts and rusted gears, innovation and valor. In Scythe, each player represents a character from one of five factions of Eastern Europe who are attempting to earn their fortune and claim their faction's stake in the land around the mysterious Factory. Players conquer territory, enlist new recruits, reap resources, gain villagers, build structures, and activate monstrous mechs.\n\nEach player begins the game with different resources (power, coins, combat acumen, and popularity), a different starting location, and a hidden goal. Starting positions are specially calibrated to contribute to each faction’s uniqueness and the asymmetrical nature of the game (each faction always starts in the same place).\n\nScythe gives players almost complete control over their fate. Other than each player’s individual hidden objective card, the only elements of luck or variability are “encounter” cards that players will draw as they interact with the citizens of newly explored lands. Each encounter card provides the player with several options, allowing them to mitigate the luck of the draw through their selection. Combat is also driven by choices, not luck or randomness.\n\nScythe uses a streamlined action-selection mechanism (no rounds or phases) to keep gameplay moving at a brisk pace and reduce downtime between turns. While there is plenty of direct conflict for players who seek it, there is no player elimination.\n\nEvery part of Scythe has an aspect of engine-building to it. Players can upgrade actions to become more efficient, build structures that improve their position on the map, enlist new recruits to enhance character abilities, activate mechs to deter opponents from invading, and expand their borders to reap greater types and quantities of resources. These engine-building aspects create a sense of momentum and progress throughout the game. The order in which players improve their engine adds to the unique feel of each game, even when playing one faction multiple times.\n\n	115	90	115	2016	1	5	4	Jamey Stegmaier	Stonemaier Games
171131	Captain Sonar	https://cf.geekdo-images.com/thumb/img/GU81dh5VyVWiy1mHI028ALT3Gsw=/fit-in/200x150/pic3013621.png	https://cf.geekdo-images.com/original/img/rVAq1lKg98oU6tvLjERL-ZNiMfc=/0x0/pic3013621.png	At the bottom of the ocean, no one will hear you scream!\n\nIn Captain Sonar, you and your teammates control a state-of-the-art submarine and are trying to locate an enemy submarine in order to blow it out of the water before they can do the same to you. Every role is important, and the confrontation is merciless. Be organized and communicate because a captain is nothing without his crew: the Chief Mate, the Radio Operator, and the Engineer.\n\nAll the members of a team sit on one side of the table, and they each take a particular role on the submarine, with the division of labor for these roles being dependent on the number of players in the game: One player might be the captain, who is responsible for moving the submarine and announcing some details of this movement; another player is manning the sonar in order to listen to the opposing captain's orders and try to decipher where that sub might be in the water; a third player might be working in the munitions room to prepare torpedoes, mines and other devices that will allow for combat.\n\nCaptain Sonar can be played in two modes: turn-by-turn or simultaneous. In the latter set-up, all the members of a team take their actions simultaneously while trying to track what the opponents are doing, too. When a captain is ready to launch an attack, the action pauses for a moment to see whether a hit has been recorded — then play resumes with the target having snuck away while the attacker paused or with bits of metal now scattered across the ocean floor.\n\nMultiple maps are included with varying levels of difficulty.\n\n	60	45	60	2016	2	8	8	Yohan Lemonnier	Matagot
171233	The Big Book of Madness	https://cf.geekdo-images.com/thumb/img/lNSkTw4ercOfA5z1cURVnV4tdII=/fit-in/200x150/pic2750172.jpg	https://cf.geekdo-images.com/original/img/PDUi7MvHSOcGqAa1WvVWg1w0fAM=/0x0/pic2750172.jpg	So far your first year at the Elementary College has been slightly disappointing. They taught you to light a flickering flame at the tip of your finger, but other than that you've spent much more time reading books than learning powerful spells as future great wizards like you should.\n\nSo when you heard about the Big Book of Madness hidden in the great school library, you couldn't help but to sneak in and peek in this intriguing tome in spite of your professors' warnings. When you slowly lift the cover of the terrible book, dozens of dreadful creatures rush out, threatening to destroy the world itself! This was your mistake, and only you can fix it now! Learn from the library to fight back against the monsters, and try not to sink into insanity...\n\nThe Big Book of Madness is a challenging co-operative game in which the players are magic students who must act as a team to turn all the pages of the book, then shut it by defeating the terrible monsters they've just freed.\n\nEach player has their own element deck that they build during the game and use for several purposes, such as learning or casting a spell, adding a new element to their deck, destroy or healing a curse. Spells allow you to support your playmates, improve your deck, draw cards, etc. — but the monsters from the book fight back. Each comes with terrible curses that are triggered every turn unless you dispel them in time. They will make you discard elements, add madness cards to your deck, or lose spells...\n\nIf you manage to turn six pages and defeat all of the monsters, you win the game!\n\n	90	60	90	2015	2	5	3	Maxime Rambourg	IELLO
171890	Best Treehouse Ever	https://cf.geekdo-images.com/thumb/img/q5t6JVtHwCTzDE_UzfvrY6NSLfI=/fit-in/200x150/pic2375542.png	https://cf.geekdo-images.com/original/img/6wwoQ3yNRvDXCRBL044556iSB3Y=/0x0/pic2375542.png	Who hasn't dreamed of building the best treehouse in the world? Now it's time to live that dream!\n\nIn Best Treehouse Ever, players compete to build their best treehouse, outfitting their treehouse with cool rooms, while also making sure that their tree doesn't tip over and that their rooms are more impressive than all of their friends' rooms at the end of the game.\n\nBuilding takes place over three weeks/rounds, and in each round, players use card drafting and spatial reasoning to add five new rooms to their treehouse. Players must pay attention to the other treehouses being built since they take turns determining which types of rooms score for everyone at the end of each round.\n\nAt the end of the third week, the winner is the player with the best treehouse ever!\n\n	20	20	20	2015	2	4	4	Scott Almes	2Geeks
172225	Exploding Kittens	https://cf.geekdo-images.com/thumb/img/qW31_tueq5049lRyZ--sPI-rlBU=/fit-in/200x150/pic2691976.png	https://cf.geekdo-images.com/original/img/XW9wAqKOy8kvH6TqxtuwAdFuAoo=/0x0/pic2691976.png	Exploding Kittens is a kitty-powered version of Russian Roulette. Players take turns drawing cards until someone draws an exploding kitten and loses the game. The deck is made up of cards that let you avoid exploding by peeking at cards before you draw, forcing your opponent to draw multiple cards, or shuffling the deck.\n\nThe game gets more and more intense with each card you draw because fewer cards left in the deck means a greater chance of drawing the kitten and exploding in a fiery ball of feline hyperbole.\n\n	15	15	15	2015	2	5	4	Shane Small	(Self-Published)
174430	Gloomhaven	https://cf.geekdo-images.com/thumb/img/e7GyV4PaNtwmalU-EQAGecwoBSI=/fit-in/200x150/pic2437871.jpg	https://cf.geekdo-images.com/original/img/lDN358RgcYvQfYYN6Oy2TXpifyM=/0x0/pic2437871.jpg	Gloomhaven  is a game of Euro-inspired tactical combat in a persistent world of shifting motives. Players will take on the role of a wandering adventurer with their own special set of skills and their own reasons for traveling to this dark corner of the world. Players must work together out of necessity to clear out menacing dungeons and forgotten ruins. In the process, they will enhance their abilities with experience and loot, discover new locations to explore and plunder, and expand an ever-branching story fueled by the decisions they make.\n\nThis is a game with a persistent and changing world that is ideally played over many game sessions. After a scenario, players will make decisions on what to do, which will determine how the story continues, kind of like a “Choose Your Own Adventure” book. Playing through a scenario is a cooperative affair where players will fight against automated monsters using an innovative card system to determine the order of play and what a player does on their turn.\n\nEach turn, a player chooses two cards to play out of their hand. The number on the top card determines their initiative for the round. Each card also has a top and bottom power, and when it is a player’s turn in the initiative order, they determine whether to use the top power of one card and the bottom power of the other, or vice-versa. Players must be careful, though, because over time they will permanently lose cards from their hands. If they take too long to clear a dungeon, they may end up exhausted and be forced to retreat.\n\n	120	60	120	2017	1	4	3	Isaac Childres	Cephalofair Games
178900	Codenames	https://cf.geekdo-images.com/thumb/img/jEZ06Ca_jj1919XUS4DgBaaxAN8=/fit-in/200x150/pic2582929.jpg	https://cf.geekdo-images.com/original/img/MJ6MNz8-_rb1C2VUTnYBTYOiiy0=/0x0/pic2582929.jpg	Two rival spymasters know the secret identities of 25 agents. Their teammates know the agents only by their CODENAMES.\n\nIn Codenames, two teams compete to see who can make contact with all of their agents first. Spymasters give one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right color while avoiding those that belong to the opposing team. And everyone wants to avoid the assassin.\n\nCodenames: Win or lose, it's fun to figure out the clues.\n\n	15	15	15	2015	2	8	6	Vlaada Chvátil	Czech Games Edition
181304	Mysterium	https://cf.geekdo-images.com/thumb/img/J6CuMx6ErFJcgrQtqziiwTgviZI=/fit-in/200x150/pic2601683.jpg	https://cf.geekdo-images.com/original/img/0Roco0dhRvVW8QUZjUl2N-Yn9bg=/0x0/pic2601683.jpg	In the 1920s, Mr. MacDowell, a gifted astrologer, immediately detected a supernatural being upon entering his new house in Scotland. He gathered eminent mediums of his time for an extraordinary séance, and they have seven hours to make contact with the ghost and investigate any clues that it can provide to unlock an old mystery.\n\nUnable to talk, the amnesiac ghost communicates with the mediums through visions, which are represented in the game by illustrated cards. The mediums must decipher the images to help the ghost remember how he was murdered: Who did the crime? Where did it take place? Which weapon caused the death? The more the mediums cooperate and guess well, the easier it is to catch the right culprit.\n\nIn Mysterium, a reworking of the game system present in Tajemnicze Domostwo, one player takes the role of ghost while everyone else represents a medium. To solve the crime, the ghost must first recall (with the aid of the mediums) all of the suspects present on the night of the murder. A number of suspect, location and murder weapon cards are placed on the table, and the ghost randomly assigns one of each of these in secret to a medium.\n\nEach hour (i.e., game turn), the ghost hands one or more vision cards face up to each medium, refilling their hand to seven each time they share vision cards. These vision cards present dreamlike images to the mediums, with each medium first needing to deduce which suspect corresponds to the vision cards received. Once the ghost has handed cards to the final medium, they start a two-minute sandtimer. Once a medium has placed their token on a suspect, they may also place clairvoyancy tokens on the guesses made by other mediums to show whether they agree or disagree with those guesses.\n\nAfter time runs out, the ghost reveals to each medium whether the guesses were correct or not. Mediums who guessed correctly move on to guess the location of the crime (and then the murder weapon), while those who didn't keep their vision cards and receive new ones next hour corresponding to the same suspect. Once a medium has correctly guessed the suspect, location and weapon, they move their token to the epilogue board and receive one clairvoyancy point for each hour remaining on the clock. They can still use their remaining clairvoyancy tokens to score additional points.\n\nIf one or more mediums fail to identify their proper suspect, location and weapon before the end of the seventh hour, then the ghost has failed and dissipates, leaving the mystery unsolved. If, however, they have all succeeded, then the ghost has recovered enough of its memory to identify the culprit.\n\nMediums then group their suspect, location and weapon cards on the table and place a number by each group. The ghost then selects one group, places the matching culprit number face down on the epilogue board, picks three vision cards — one for the suspect, one for the location, and one for the weapon — then shuffles these cards. Players who have achieved few clairvoyancy points flip over one vision card at random, then secretly vote on which suspect they think is guilty; players with more points then flip over a second vision card and vote; then those with the most points see the final card and vote.\n\nIf a majority of the mediums have identified the proper suspect, with ties being broken by the vote of the most clairvoyant medium, then the killer has been identified and the ghost can now rest peacefully. If not, well, perhaps you can try again...\n\n	42	42	42	2015	2	7	5	Oleg Sidorenko	Libellud
185154	Wizard School	https://cf.geekdo-images.com/thumb/img/3s4bEcggLLcH9Tr5z4Ii4fkHjCI=/fit-in/200x150/pic2691084.png	https://cf.geekdo-images.com/original/img/idZdGNcYsdMX6L9G7AncorKbzZc=/0x0/pic2691084.png	Wizard School is like normal school, except it's a card game where you have to carefully manage your abilities and resources to make sure that you don't flunk out of the most prosaic magical academy in all the world.\n\nWizard School is a cooperative card game in which 2-5 players take turns at passing tests, besting monsters in the most epic group project of all time. And yes, you are graded cumulatively. When one of you fails, you all flunk out.\n\nDifficulty and length of games can be managed by choosing from among 20 different graduation cards, which helps ensure that each game is a new experience.\n\nYour goal may be to graduate, but you can’t let the monsters overrun the school. As they pile up, you’re forced to use your magic just to stay alive, and you may have nothing left to pass the Graduation Milestones. If you reach an F (on the Graduation Card), it’s Game Over.\n\n	90	40	90	2016	2	5	5	Eric Johns	DFTBA Games
193621	Joking Hazard	https://cf.geekdo-images.com/thumb/img/Uf6WJ09hj3pIi3Bpy03Zf6ckUd0=/fit-in/200x150/pic3218812.jpg	https://cf.geekdo-images.com/original/img/c5ZKHgR0yxXJiyV49GRp-uni2gA=/0x0/pic3218812.jpg	From the creators of Cyanide & Happiness comes a card game where players compete to finish an awful comic strip.\n\nThe creators said:\n\n"Someone on the Internet once told us that making stick figure comics is easy as hell, and that we were ugly and stupid.\n\nThey were right on all counts. So, after crying for a few hours, we created the Random Comic Generator which since its inception in 2014 has entertained millions with its computer-generated comedy.\n\nAfter a few weeks of playing with the Random Comic Generator, we started to wonder if its hundreds of random panels might lend themselves to a card game, where you compete against your friends to finish a comic with a funny punchline.  So we printed out all of the RCG panels and started playing with them."\n\nDraw 7 cards. The deck plays the first card, select a Judge to play the second, then everyone selects a third card to create a three panel comic strip.  The Judge picks a winner.\n\nThe game includes a deck of 250 unique panel cards - that’s 15.4 million combinations of comics!\n\n	90	30	90	2016	3	10	5	(Uncredited)	Breaking Games
194594	Dice Forge	https://cf.geekdo-images.com/thumb/img/hT0kIPSm8G6POP88QlVqXLwQdlQ=/fit-in/200x150/pic3477004.jpg	https://cf.geekdo-images.com/original/img/2RZLNEGrkZxF9Napw_dnqEbbnl4=/0x0/pic3477004.jpg	Heroes, stand ready! The gods are offering a seat in heaven to whichever hero defeats their rivals. Your courage and wits will be your most precious allies as you use divine dice to gather resources along the road to victory.\n\nYour divine dice are exceptional, with removable faces! Customize your dice to make them more powerful as the game progresses. Sacrifice gold to the gods to obtain enhanced die faces. Upgrade your dice to produce the resources you need. Overcome ordeals concocted by the gods to grow in glory and earn rewards. Skillfully manage the luck of the dice and take charge of your destiny. Only the greatest will ascend to the heavens!\n\nDice Forge is a development game featuring innovative mechanics based on dice with removable faces. In this dice crafting game, players build their own dice. Roll your dice, manage your resources, complete ordeals before your opponents and explore multiple winning strategies.\n\nNow you control the luck of the dice!\n\n	45	45	45	2017	2	4	4	Régis Bonnessée	Libellud
194607	Mystic Vale	https://cf.geekdo-images.com/thumb/img/2Zqo40GeXqK6VnPzF_IN7vu0kos=/fit-in/200x150/pic3287905.png	https://cf.geekdo-images.com/original/img/oO8OoLA0tcXcNazc_HFYVFdww48=/0x0/pic3287905.png	A curse has been placed on the Valley of Life. Hearing the spirits of nature cry out for aid, clans of druids have arrived, determined to use their blessings to heal the land and rescue the spirits. It will require courage and also caution, as the curse can overwhelm the careless who wield too much power.\n\nIn Mystic Vale, 2 to 4 players take on the role of druidic clans trying to cleanse the curse upon the land. Each turn, you play cards into your field to gain powerful advancements and useful vale cards. Use your power wisely, or decay will end your turn prematurely. Score the most victory points to win the game!\n\nMystic Vale uses the innovative "Card Crafting System", which lets you not only build your deck, but build the individual cards in your deck, customizing each card's abilities to exactly the strategy you want to follow.\n\n	45	45	45	2016	2	4	2	John D. Clair	Alderac Entertainment Group
195856	Bloodborne: The Card Game	https://cf.geekdo-images.com/thumb/img/qF_I8hOBtCzPgmQhhAggxLmIqow=/fit-in/200x150/pic3297526.jpg	https://cf.geekdo-images.com/original/img/wY_CVe06xKmAimYiQN0RKRL2eM8=/0x0/pic3297526.jpg	Bloodborne: The Card Game is based on the Chalice Dungeons in the video game Bloodborne — the ever-changing labyrinths and tombs carved out by the Great Ones beneath the fallen city of Yharnam, where horrifying creatures reside. Players compete to kill monsters and take their blood.\n\nIn general, Bloodborne is a game about risk management with a bit of group think, inventory management/upgrades, and tactical play. You start with a hand of basic weapons, which you get to upgrade to improve your fighting combos and capabilities.\n\nEach turn, one monster chosen at random attacks players, who fight back as a team, with everyone playing a card from their hand simultaneously to attempt to kill the monster. Players collect blood from the monster, assuming it dies, based on how much damage they dealt. Monsters can fight back with exploding dice that can potentially deal infinite damage.\n\nPlayers can fight as long as they want, but if they die in combat, they lose their progress. Players can opt out of fighting to bank their blood and save it permanently. Collected blood counts as victory points.\n\nSays designer Eric M. Lang, "My goal with Bloodborne was to channel the intensity and frustration of the video game into a contest between players. Lots of death."\n\n	45	30	45	2016	3	5	5	Eric M. Lang	Asmodee
198773	Codenames: Pictures	https://cf.geekdo-images.com/thumb/img/aFloSnsyUz2lGVj3gzUpcV7EAWM=/fit-in/200x150/pic3476592.jpg	https://cf.geekdo-images.com/original/img/3eKT0zKPngjPLWx2aIr2Mgv1IMI=/0x0/pic3476592.jpg	What are these strange symbols on the map? They are code for locations where spies must contact secret agents!\n\nTwo rival spymasters know the agent in each location. They deliver coded messages telling their field operatives where to go for clandestine meetings. Operatives must be clever. A decoding mistake could lead to an unpleasant encounter with an enemy agent – or worse, with the assassin! Both teams race to contact all their agents, but only one team can win.\n\nCodenames: Pictures differs from the original Codenames in that the agents are no longer represented by a single word, but by an image that contains multiple elements.\n\n	15	15	15	2016	2	8	6	Vlaada Chvátil	Czech Games Edition
205637	Arkham Horror: The Card Game	https://cf.geekdo-images.com/thumb/img/66qtunbh0lfNhBrynkLruHyfZeY=/fit-in/200x150/pic3122349.jpg	https://cf.geekdo-images.com/original/img/EQ0Kl-bH9RCI5aJWVLnAlAfo00E=/0x0/pic3122349.jpg	Description from the publisher:\n\nSomething evil stirs in Arkham, and only you can stop it. Blurring the traditional lines between roleplaying and card game experiences, Arkham Horror: The Card Game is a Living Card Game of Lovecraftian mystery, monsters, and madness!\n\nIn the game, you and your friend (or up to three friends with two Core Sets) become characters within the quiet New England town of Arkham. You have your talents, sure, but you also have your flaws. Perhaps you've dabbled a little too much in the writings of the Necronomicon, and its words continue to haunt you. Perhaps you feel compelled to cover up any signs of otherworldly evils, hampering your own investigations in order to protect the quiet confidence of the greater population. Perhaps you'll be scarred by your encounters with a ghoulish cult.\n\nNo matter what compels you, no matter what haunts you, you'll find both your strengths and weaknesses reflected in your custom deck of cards, and these cards will be your resources as you work with your friends to unravel the world's most terrifying mysteries.\n\nEach of your adventures in Arkham Horror LCG carries you deeper into mystery. You'll find cultists and foul rituals. You'll find haunted houses and strange creatures. And you may find signs of the Ancient Ones straining against the barriers to our world...\n\nThe basic mode of play in Arkham LCG is not the adventure, but the campaign. You might be scarred by your adventures, your sanity may be strained, and you may alter Arkham's landscape, burning buildings to the ground. All your choices and actions have consequences that reach far beyond the immediate resolution of the scenario at hand — and your actions may earn you valuable experience with which you can better prepare yourself for the adventures that still lie before you.\n\n	120	60	120	2016	1	2	2	Matthew Newman	Fantasy Flight Games
209685	Century: Spice Road	https://cf.geekdo-images.com/thumb/img/OLP83FLrJVFLHMfmCpKhUQYX7pg=/fit-in/200x150/pic3339551.jpg	https://cf.geekdo-images.com/original/img/kF-vMNTT5iY7Ui3UPhjbtMX6YAk=/0x0/pic3339551.jpg	Century: Spice Road is the first in a series of games that explores the history of each century with spice-trading as the theme for the first installment.  In Century: Spice Road, players are caravan leaders who travel the famed silk road to deliver spices to the far reaches of the continent for fame and glory. Each turn, players perform one of four actions:\n\n\n     Establish a trade route (by taking a market card)\n     Make a trade or harvest spices (by playing a card from hand)\n     Fulfill a demand (by meeting a victory point card's requirements and claiming it)\n     Rest (by taking back into your hand all of the cards you've played)\n\n\nThe last round is triggered once a player has claimed their fifth victory point card, then whoever has the most victory points wins.\n\n	45	30	45	2017	2	5	4	Emerson Matsuuchi	Plan B Games
217085	Unearth	https://cf.geekdo-images.com/thumb/img/d6X4A6PDMcM3gZnI-6SRERFhe5c=/fit-in/200x150/pic3579391.jpg	https://cf.geekdo-images.com/original/img/XWIq4HzCPMIu3L7IR1XFCmXcK-8=/0x0/pic3579391.jpg	Long ago, your ancestors built great cities across the world. Now your tribe must explore forests, deserts, islands, mountains, and caverns to find these lost cities. Claim the ruins, build places of power, and restore the glory of a bygone age.\n\nUnearth is a bend-your-luck game of dice placement and set collection. Designed by Jason Harner and Matthew Ransom, it plays in under an hour with 2-4 players. Each player leads a tribe of Delvers, represented by five dice (3 six-sided, 1 four-sided, and 1 eight-sided). Players take turns rolling and placing dice in an attempt to claim Ruins.\n\nThe game's elegant core mechanic is accessible to players of all skill levels. High rolls help players claim Ruins, while low rolls help players collect Stones. This opens two paths to victory: claiming sets of Ruins or using Stones to build Wonders. Delver cards help you affect your dice rolls or dice in play, and Wonders can grant abilities that impact the late game.\n\n	60	30	60	2017	2	4	3	Matthew Ransom	Asmodee
217372	The Quest for El Dorado	https://cf.geekdo-images.com/thumb/img/UQhbfgNbwCNs9HpEFBDXv4Obwyw=/fit-in/200x150/pic3617168.jpg	https://cf.geekdo-images.com/original/img/vu2VOkIZo9u0lv5vWfxax0vavDw=/0x0/pic3617168.jpg	In The Quest for El Dorado, players take the roles of expedition leaders who have embarked on a search for the legendary land of gold in the dense jungles of South America. Each player assembles and equips their own team, hiring various helpers from the scout to the scientist to the aborigine. All of them have one goal in mind: Reaching the golden border first and winning all of the riches for themselves. Whoever chooses the best tactics will be rewarded!\n\n	60	30	60	2017	2	4	4	Reiner Knizia	Ravensburger Spieleverlag GmbH
220775	Codenames: Disney Family Edition	https://cf.geekdo-images.com/thumb/img/qrwJhPgXOMzl-jNzuNdmpOvcSYk=/fit-in/200x150/pic3626220.jpg	https://cf.geekdo-images.com/original/img/l18VOE9jJuDlcpq0Oady6fSizA8=/0x0/pic3626220.jpg	In Codenames, two teams compete to see who can guess all of their words correctly first — but those words are hiding in plain sight in a 5x5 or grid that includes the words of the other team, neutral words, and an game over card that will cause you to lose the game immediately if you guess it. One person on each team is a spymaster and only these two know which words belong to each team. Spymasters take turns giving one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right color while avoiding those that belong to the opposing team — and everyone wants to avoid the game over card. This version also comes with 4x4 grid cards with no game over spot to make it more accessible for families and children.\n\nThe Disney Family Edition of Codenames combines the hit social word game with some of Disney’s most beloved properties from the past 90 years. Including both pictures and words, it’s family fun for Disney fans of all ages.Codenames: Disney Family Edition keeps the Codenames gameplay, while featuring characters and locations from over 90 years of Disney and Pixar films..\n\n	15	15	15	2017	2	8	6	Vlaada Chvátil	Cranio Creations
221107	Pandemic Legacy: Season 2	https://cf.geekdo-images.com/thumb/img/Xp6rc5wIno45tY6wUST4p65Tf88=/fit-in/200x150/pic3763549.jpg	https://cf.geekdo-images.com/original/img/DbXh4TeZPoJ_tSlX2KRGdVcBd8s=/0x0/pic3763549.jpg	Description from the publisher:\n\nThe world almost ended 71 years ago...\n\nThe plague came out of nowhere and ravaged the world. Most died within a week. Nothing could stop it. The world did its best. It wasn't good enough.\n\nFor three generations, we, the last fragments of humanity have lived on the seas, on floating stations called "havens." Far from the plague, we are able to provide supplies to the mainland to keep them (and us) from succumbing completely.\n\nWe've managed to keep a network of the largest known cities in the world alive. Things have been tough the past few years. Cities far away from the havens have fallen off our grid...\n\nTomorrow, a small group of us head out into what's left of the world. We don't know what we'll find.\n\nPandemic Legacy: Season 2 is an epic cooperative game for 2 to 4 players. Unlike most other games, this one is working against you. What's more, some of the actions you take in Pandemic Legacy will carry over to future games. No two worlds will ever be alike!\n\nPart of the Pandemic series.\n\n	60	60	60	2017	2	4	4	Matt Leacock	Z-Man Games, Inc.
224037	Codenames: Duet	https://cf.geekdo-images.com/thumb/img/-8Q28KTPuyxLa9jTUSxITYsCdbI=/fit-in/200x150/pic3596681.jpg	https://cf.geekdo-images.com/original/img/2_ZxcqriVqf3AzVwzfibM6iGzG4=/0x0/pic3596681.jpg	Codenames Duet keeps the basic elements of Codenames — give one-word clues to try to get someone to identify your agents among those on the table — but now you're working together as a team to find all of your agents. (Why you don't already know who your agents are is a question that Congressional investigators will get on your back about later!)\n\nTo set up play, lay out 25 word cards in a 5×5 grid. Place a key card in the holder so that each player sees one side of the card. Each player sees a 5×5 grid on the card, with nine of the squares colored green (representing your agents) and three squares colored black (representing assassins). Three of the nine squares on each side are also green on the other side, one assassin is black on both sides, one is green on the other side and the other is an innocent bystander on the other side.\n\nCollectively, you need to reveal all fifteen agents — without revealing an assassin — before time runs out in order to win the game. Either player can decide to give the first one-word clue to the other player, along with a number. Whoever receives the clue places a finger on a card to identify that agent. If correct, they can attempt to identify another one. If they identify a bystander, then their guessing time ends. If they identify an assassin, you both lose! Unlike regular Codenames, they can keep guessing as long as they keep identifying an agent each time; this is useful for going back to previous clues and finding ones they missed earlier. After the first clue is given, players alternate giving clues.\n\n	30	15	30	2017	2	4	2	Scot Eaton	Czech Games Edition
225694	Decrypto	https://cf.geekdo-images.com/thumb/img/eJQBsZysPwhX_Gb6_0gmPsJfzqY=/fit-in/200x150/pic3759421.jpg	https://cf.geekdo-images.com/original/img/Nq39bGSnCjYDhmwNQlFdNHoSjsQ=/0x0/pic3759421.jpg	Players compete in two teams in Decrypto, with each trying to correctly interpret the coded messages presented to them by their teammates while cracking the codes they intercept from the opposing team.\n\nIn more detail, each team has their own screen, and in this screen they tuck four cards in pockets numbered 1-4, letting everyone on the same team see the words on these cards while hiding the words from the opposing team. In the first round, each team does the following: One team member takes a code card that shows three of the digits 1-4 in some order, e.g., 4-2-1. They then give a coded message that their teammates must use to guess this code. For example, if the team's four words are "pig", "candy", "tent", and "son", then I might say "Sam-striped-pink" and hope that my teammates can correctly map those words to 4-2-1. If they guess correctly, great; if not, we receive a black mark of failure.\n\nStarting in the second round, a member of each team must again give a clue about their words to match a numbered code. If I get 2-4-3, I might now say, "sucker-prince-stake". The other team then attempts to guess our numbered code. If they're correct, they receive a white mark of success; if not, then my team must guess the number correctly or take a black mark of failure. (Guessing correctly does nothing except avoid failure and give the opposing team information about what our hidden words might be.)\n\nThe rounds continue until a team collects either its second white mark (winning the game) or its second black mark (losing the game). Games typically last between 4-7 rounds. If neither team has won after eight rounds, then each team must attempt to guess the other team's words; whichever team guesses more words correctly wins.\n\n	45	15	45	2018	3	8	6	Thomas Dagenais-Lespérance	Le Scorpion Masqué
228660	Betrayal at Baldur's Gate	https://cf.geekdo-images.com/thumb/img/HlZWD2fJ2NbishY-7s0a7QxVYro=/fit-in/200x150/pic3581400.png	https://cf.geekdo-images.com/original/img/ZcE6HzWM_W17aD9g_rzBrCsAZZc=/0x0/pic3581400.png	Description from the publisher:\n\nThe shadow of Bhaal has come over Baldur's Gate, summoning monsters and other horrors from the darkness!\n\nAs you build and explore the iconic city's dark alleys and deadly catacombs, you must work with your fellow adventurers to survive the terrors ahead. That is, until some horrific evil turns one — or possibly more — of you against each other. Was it a mind flayer's psionic blast or the whisperings of a deranged ghost that caused your allies to turn traitor? You have no choice but to keep your enemies close!\n\nBased on the award-winning Betrayal at House on the Hill board game, in Betrayal at Baldur's Gate you'll return to Baldur's Gate again and again thanks to the fifty included scenarios only to discover it's never the same game twice.\n\nCan you and your party survive the madness, or will you succumb to the mayhem and split (or slaughter!) the party?\n\n	60	60	60	2017	3	6	5	Mike Mearls	Avalon Hill Games, Inc.
229491	Edge of Darkness	https://cf.geekdo-images.com/thumb/img/qK5MwF0tJ7hIpOS3mZ4rUsGlF7o=/fit-in/200x150/pic3691121.jpg	https://cf.geekdo-images.com/original/img/mFZnVsCLILQA2rlN2cxYGzmFAh8=/0x0/pic3691121.jpg	Edge of Darkness is the third Card Crafting Game from Alderac Entertainment Group designed by John D. Clair. Edge of Darkness combines Card Crafting, Worker Placement, shared deck-building, and a whole new Threat Challenge system in a medium-weight euro-style board game of 60 to 120 minutes for 1 to 4 players.\n\nPlayers are the heads of powerful guilds in the City. Each Guild vies with the others to become the leaders of the City in a desperate struggle against great evil. But the Guilds must also work together because the dangers facing the city can harm them all.\n\nThe Guilds exert their control in the city by sending agents to various locations where they can generate resources or abilities and enable the Guild to take actions. Guilds grow in power as they maneuver their agents and loyalists into positions of importance in the districts and organizations of the City. Over time the Guilds can seek to create synergies between the places their agents have been assigned and the tendrils of influence the Guilds have connected to the City's infrastructure.\n\nTo win a Guild must have the most power in the city when the game ends. Power is gained having the allegiance of important citizens and nobles, by accumulating wealth, and by undertaking actions beneficial to the City such as defending it from external and internal threats.\n\nHere are some highlights of the mechanics in the game:\n\n\n     Card Crafting: Similar to the original card-crafting game, Mystic Vale, all cards are constructed of crafting slips which have game content on 1/3rd of the slip and are transparent on the other 2/3rds. During the game players will construct cards, combining (sleeving) different effects onto one card (ideally in ways that make strategic sense). However, unlike Mystic Vale, the transparent cards are double-sided, and when you upgrade the "good" side of the cards (front), you also add strength to the "bad" side of the cards (back).\n     Group deckbuilding using one shared deck: Rather than having your own deck, there is a central deck that all players draw from and discard to. Different players will have the allegiance of different cards in that deck. Using other players' cards means you have to pay them. During the game you can claim allegiance of more cards in the deck by sleeving a slip into the card with your color and seal.\n     Card-driven worker placement: While your actions are card-driven, most costs in the game are in the form of opportunity cost. Advancements don't have a cost, instead they require the use of workers to a greater or lesser degree depending on the power of the card. e.g. many effects require placing or pulling workers from different city locations as dictated by the card effects. Since you have a limited number of workers to use, you will constantly be choosing to forgo one useful thing in order to do another.\n     Threat Tower:  There is a Threat Tower which dictates when and whom Threats will attack. Cards leave the shared deck and enter the Threat Board, where they accumulate Threat Cubes on each player's turn. These cubes are color-coded, and when a threshold number of cubes of a given color accumulate on a card, it attacks the City. If the color matches one of the players, it attacks that player. If the color is black, it attacks all players!\n     Modular set up: Edge of Darkness will come with 12 Locations. Each game you use only 10 of these Locations, which can be specifically selected or chosen randomly, making for a lot of variety from game-to-game in the types of challenges you will face and the strategies you will need to employ. These Locations are comprised of a Location Board and Crafting Slips. Location Boards may specify special rules for worker placement, or extend the basic rules with all new systems. For example, a combination of Location Boards can be used to assemble a party of heroes to take the fight to the Threat Tower and engage in a Monster Hunt!\n\n\n	120	120	120	2019	1	4	3	John D. Clair	Alderac Entertainment Group
233312	Stuffed Fables	https://cf.geekdo-images.com/thumb/img/WsEH8Gb6k0KpeOQUU40NAIHMxPo=/fit-in/200x150/pic3708878.jpg	https://cf.geekdo-images.com/original/img/_qm1FBu5oN7XcONKTjUR1fz7ja8=/0x0/pic3708878.jpg	Stuffed Fables is an unusual adventure game in which players take on the roles of brave stuffies seeking to save the child they love from a scheming, evil mastermind. Make daring melee attacks, leap across conveyor belts, or even steer a racing wagon down a peril-filled hill. The game delivers a thrilling narrative driven by player choices. Players explore a world of wonder and danger, unlocking curious discoveries. The chapters of Stuffed Fables explore the many milestones of a child's life, creating a memorable tale ideal for families, as well as groups of adults who haven't forgotten their childlike sense of wonder.\n\nStuffed Fables is the first "AdventureBook Game", a new product line from Plaid Hat Games in which all of the action takes place in the unique storybook — a book that acts as your rules reference, story guide, and game board, all in one! Each adventure in the game takes place over several pages of the immersive AdventureBook. The book opens flat onto the table to reveal a colorful map or other illustration central to playing the game, with choices, story, and special rules on the opposite page.\n\nOn their turn, a player draws five dice from the bag. The colors of the dice drawn determine the types of actions and options available to the player. White dice can re-stuff stuffies injured in battle. Red dice perform melee attacks while green dice perform ranged attacks. Yellow dice search while blue dice are used for special actions and purple dice can be used as any color. Most dice can always find a strategic use, including moving, using items, or contributing to group tasks. Players can store dice for later, combine dice for stronger actions, or use them one-at-a-time for multiple activations. As turns go by, black dice are also drawn, and after enough appear, minions emerge or attack, and the dice bag is reset!\n\nPlayers can encourage each other by sharing dice or their precious stuffing. In addition to fighting minions, each page of the storybook offers numerous points of interest, charming characters to interact or trade with, as well as many unusual challenges. And each page is but one chapter that folds into a branching, overarching story with a multitude of items and a special discovery deck full of surprises.\n\n	90	60	90	2018	2	4	4	Jerry Hawthorne	Plaid Hat Games
234396	Muse	https://cf.geekdo-images.com/thumb/img/Un3HzP1--UnkJA2fXoLggtA9Iwc=/fit-in/200x150/pic3719954.jpg	https://cf.geekdo-images.com/original/img/1BRAkNV5ClljefhzU_hHMOuiA-Q=/0x0/pic3719954.jpg	Where will your muse guide you?\n\nLead your teammates to inspiration using cryptic clues and surreal imagery in Muse, a beautiful party game with over one hundred fully-illustrated cards.\n\nPlay cooperatively at lower player counts, or divide into teams for competitive play with four or more at the table — the game is played the same either way! As a muse, you need to be creative to give the right clue within the constraints of the inspiration card you've been dealt, hoping to lead your team to their masterpiece. As artists, you work alongside one another to decipher that clue, and correctly choose the piece of art from the line-up.\n\nChallenge your creativity, listen closely, and let your muse guide you to your masterpiece!\n\n	30	30	30	2017	2	12	4	Jordan Sorenson	999 Games
242302	Space Base	https://cf.geekdo-images.com/thumb/img/c6gt0iV4UUuTugv87HAYZMcVwlM=/fit-in/200x150/pic4017302.jpg	https://cf.geekdo-images.com/original/img/9w90BBO7t_9oi5KM0B1qBzt3qEw=/0x0/pic4017302.jpg	In Space Base, players assume the roles of Commodores of a small fleet of ships. Ships begin docked at their stations and are then deployed to sectors as new ships are commissioned under your command. Use cargo vessels to engage in trade and commerce; mining vessels to build reoccurring base income; and carriers to spread your influence. Establish new colonies for a new Commodore in a sector to gain even more influence. Gain enough influence and you can be promoted to Admiral!\n\nSpace Base is a quick-to-learn, quick-to-play dice game using the core "I roll, everyone gets stuff" mechanism seen in other games. It's also a strategic engine builder using a player board (your space base) and tableaus of ship cards you can buy and add to your board. The cards you buy and the order you buy them in have interesting implications on your engine beyond just the ability on the card you buy, making for a different type of engine construction than seen in similar games. Players can take their engine in a number of directions: long odds and explosive gains, low luck and steady income, big end-game combos to launch from last to first, or a mix-and-match approach. Ultimately, Space Base is a game you can just start playing and teach everyone how to play in the first round or two and has a satisfying blend of dice-chucking luck and challenging strategic choices.\n\n	60	60	60	2018	2	5	3	John D. Clair	Alderac Entertainment Group
244992	The Mind	https://cf.geekdo-images.com/thumb/img/e8cgrpzLqovSRPtHw5aLwgckHkc=/fit-in/200x150/pic3979766.png	https://cf.geekdo-images.com/original/img/-6UV1oIzR-DqAyewaSImVThz6ZU=/0x0/pic3979766.png	The Mind is more than just a game. It's an experiment, a journey, a team experience in which you can't exchange information, yet will become one to defeat all the levels of the game.\n\nIn more detail, the deck contains cards numbered 1-100, and during the game you try to complete 12, 10, or 8 levels of play with 2, 3, or 4 players. In a level, each player receives a hand of cards equal to the number of the level: one card in level 1, two cards in level 2, etc. Collectively you must play these cards into the center of the table on a single discard pile in ascending order but you cannot communicate with one another in any way as to which cards you hold. You simply stare into one another's eyes, and when you feel the time is right, you play your lowest card. If no one holds a card lower than what you played, great, the game continues! If someone did, all players discard face up all cards lower than what you played, and you lose one life.\n\nYou start the game with a number of lives equal to the number of players. Lose all your lives, and you lose the game. You start with one shuriken as well, and if everyone wants to use a shuriken, each player discards their lowest card face up, giving everyone information and getting you closer to completing the level. As you complete levels, you might receive a reward of a shuriken or an extra life. Complete all the levels, and you win!\n\nFor an extra challenge, play The Mind in extreme mode with all played cards going onto the stack face down. You don't look at the cards played until the end of a level, losing lives at that time for cards played out of order.\n\n	15	15	15	2018	2	4	4	Wolfgang Warsch	Nürnberger-Spielkarten-Verlag
245271	Forbidden Sky	https://cf.geekdo-images.com/thumb/img/nFBpmPaBBm5fDlfaZivmCRPQvTI=/fit-in/200x150/pic4177924.jpg	https://cf.geekdo-images.com/original/img/J8BuhWMEJagWrAJCtrTN6r06SB4=/0x0/pic4177924.jpg	Soar to dizzying heights in the electrifying cooperative adventure. Work as a team to explore a mysterious platform that floats at the center of a savage storm. Connect a circuit of cables to launch a secret rocket — all before you are struck by lightning or blown off to the depths below. It's a high-wire act that will test your team's capacity for courage and cooperation. One false step and you all could be grounded…permanently!\n\nThis latest installment in the Forbidden... game series takes you to new heights with several novel challenges, including collectively planning a terrain using only limited information and constructing a real electrical circuit.\n\n	60	60	60	2018	2	5	4	Matt Leacock	Gamewright
249821	Codenames: Harry Potter	https://cf.geekdo-images.com/thumb/img/DdWHblHsjM5t-aTDalbxw9aY3Vo=/fit-in/200x150/pic4281839.jpg	https://cf.geekdo-images.com/original/img/UaVXqlR-eAJ9estUAzOAT20SYLk=/0x0/pic4281839.jpg	Codenames: Harry Potter features the gameplay from Codenames Duet, with players working together to reveal all the right cards before they run out of time or summon Lord Voldemort or another dark wizard.\n\nThe cards that players need to guess feature a word or phrase on one side and an image on the other.\n\n	15	15	15	2018	2	2	2	Vlaada Chvátil	The OP
254640	Just One	https://cf.geekdo-images.com/thumb/img/_N4I26N4DY7Pv2PMa2Ysf6r2pkg=/fit-in/200x150/pic4268499.jpg	https://cf.geekdo-images.com/original/img/WFsA4z8bPaByWIDS_QwC5lFwIIM=/0x0/pic4268499.jpg	Just One is a cooperative party game in which you play together to discover as many mystery words as possible. Find the best clue to help your teammate. Be unique, as all identical clues will be cancelled!\n\nA complete game is played over 13 cards. The goal is to get a score as close to 13 as possible. In case of a right answer, the players score 1 point. In case of wrong answer, they lose the current card as well as the top card of the deck. Thus losing 2 points. In case of lack of answer, the players only lose the current card, and therefore only 1 point.\n\nYou have the choice – make the difference!\n\nSmall Historical Point:\n\nOriginally, Just One was called We Are The Word and was published by Fun Consortium.\n\nRepos Production bought the rights in early 2018 and adapted the game. The Sombrero-wearing Belgians decided to improve the quality of the components, add 50 new words, and change the name of the game. Following this new edition, the game went from having only a French edition to having a world-wide edition.\n\n	20	20	20	2018	3	7	6	Bruno Sautter	Repos Production
266192	Wingspan	https://cf.geekdo-images.com/thumb/img/wvfZwwtcqpth4bgHnh4M-EhUCXg=/fit-in/200x150/pic4458123.jpg	https://cf.geekdo-images.com/original/img/V_R5oe5Huj5guJaBhgbQkZR1PLE=/0x0/pic4458123.jpg	Wingspan is a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games.\n\nYou are bird enthusiasts—researchers, bird watchers, ornithologists, and collectors—seeking to discover and attract the best birds to your network of wildlife preserves. Each bird extends a chain of powerful combinations in one of your habitats (actions). These habitats  focus on several key aspects of growth:\n\n\n     Gain food tokens via custom dice in a birdfeeder dice tower\n     Lay eggs using egg miniatures in a variety of colors\n     Draw from hundreds of unique bird cards and play them\n\n\nThe winner is the player with the most points after 4 rounds.\n\nIf you enjoy Terraforming Mars and Gizmos, we think this game will take flight at your table.\n\n—description from the publisher\n\n	70	40	70	2019	1	5	3	Elizabeth Hargrave	Stonemaier Games
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.favorites (fav_id, user_id, bg_id) FROM stdin;
1	1	233312
2	1	234396
3	1	198773
4	1	171233
5	1	161936
6	1	143884
7	1	136063
8	1	1198
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.tags (tag_id, tag_name, tag_description) FROM stdin;
1	Competitive	Players play against each other and compete to                 win via direct conflict
2	Cooperative	Players play against the game and work together                 towards the same goal
3	Eurogame	Players compete to win with indirect conflict,                 emphasizing individual development and comparative achievement
4	Light Strategy	Easy strats
5	Heavy Strategy	Not for the lighthearted!
6	Classic	Old School Games
7	Family	Good for kids and parents of all ages
8	Mature/Adult	For mature audiences only
9	Legacy	Game incorporates a changing board and ongoing                 story plotline
10	Expansion	Branch off of an original game
11	Easily Portable	Easy to take on the go!
12	Hidden Role	Who are the good guys? Who are badguiz?
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, name, email, password) FROM stdin;
1	Elaine	elaine@test.com	test
2	Jack	jack@test.com	test
3	Vonny	vonny@test.com	test
4	Romain	romain@test.com	test
5	Ashley	ashley@test.com	test
6	Jay	jay@test.com	test
7	Jeff	jeff@test.com	test
8	Chance	chance@test.com	test
9	Natalie	natalie@test.com	test
10	Shadi	shadi@test.com	test
11	Alyssa	alyssa@test.com	test
12	Meggie	meggie@test.com	test
13	Steph	steph@test.com	test
14	kiko	kiko@test.com	test
15	CJ	cj@test.com	test
16	Mario Speedwagon	Mario_Speedwagon@test.com	test
17	Petey Cruiser	Petey_Cruiser@test.com	test
18	Anna Sthesia	Anna_Sthesia@test.com	test
19	Paul Molive	Paul_Molive@test.com	test
20	Anna Mull	Anna_Mull@test.com	test
21	Gail Forcewind	Gail_Forcewind@test.com	test
22	Paige Turner	Paige_Turner@test.com	test
23	Bob Frapples	Bob_Frapples@test.com	test
24	Walter Melon	Walter_Melon@test.com	test
25	Nick R. Bocker	Nick_R._Bocker@test.com	test
26	Barb Ackue	Barb_Ackue@test.com	test
27	Buck Kinnear	Buck_Kinnear@test.com	test
28	Greta Life	Greta_Life@test.com	test
29	Ira Membrit	Ira_Membrit@test.com	test
30	Shonda Leer	Shonda_Leer@test.com	test
31	Brock Lee	Brock_Lee@test.com	test
32	Maya Didas	Maya_Didas@test.com	test
33	Pete Sariya	Pete_Sariya@test.com	test
34	Monty Carlo	Monty_Carlo@test.com	test
35	Sal Monella	Sal_Monella@test.com	test
36	Sue Vaneer	Sue_Vaneer@test.com	test
37	Cliff Hanger	Cliff_Hanger@test.com	test
38	Barb Dwyer	Barb_Dwyer@test.com	test
39	Terry Aki	Terry_Aki@test.com	test
40	Cory Ander	Cory_Ander@test.com	test
41	Robin Banks	Robin_Banks@test.com	test
42	Jimmy Changa	Jimmy_Changa@test.com	test
43	Barry Wine	Barry_Wine@test.com	test
44	Wilma Mumduya	Wilma_Mumduya@test.com	test
45	Buster Hyman	Buster_Hyman@test.com	test
46	Poppa Cherry	Poppa_Cherry@test.com	test
47	Zack Lee	Zack_Lee@test.com	test
48	Don Stairs	Don_Stairs@test.com	test
49	Saul T. Balls	Saul_T._Balls@test.com	test
50	Peter Pants	Peter_Pants@test.com	test
51	Hal Appeno 	Hal_Appeno_@test.com	test
52	Otto Matic	Otto_Matic@test.com	test
53	Moe Fugga	Moe_Fugga@test.com	test
54	Graham Cracker	Graham_Cracker@test.com	test
55	Tom Foolery	Tom_Foolery@test.com	test
56	Al Dente	Al_Dente@test.com	test
57	Bud Wiser	Bud_Wiser@test.com	test
58	Polly Tech	Polly_Tech@test.com	test
59	Holly Graham	Holly_Graham@test.com	test
60	Frank N. Stein	Frank_N._Stein@test.com	test
61	Cam L. Toe	Cam_L._Toe@test.com	test
62	Pat Agonia	Pat_Agonia@test.com	test
63	Tara Zona	Tara_Zona@test.com	test
64	Barry Cade	Barry_Cade@test.com	test
65	Phil Anthropist 	Phil_Anthropist_@test.com	test
66	Marvin Gardens	Marvin_Gardens@test.com	test
67	Phil Harmonic 	Phil_Harmonic_@test.com	test
68	Arty Ficial	Arty_Ficial@test.com	test
69	Will Power	Will_Power@test.com	test
70	Donatella Nobatti	Donatella_Nobatti@test.com	test
71	Juan Annatoo	Juan_Annatoo@test.com	test
72	Stew Gots	Stew_Gots@test.com	test
73	Anna Rexia	Anna_Rexia@test.com	test
74	Bill Emia	Bill_Emia@test.com	test
75	Curt N. Call	Curt_N._Call@test.com	test
76	Max Emum	Max_Emum@test.com	test
77	Minnie Mum	Minnie_Mum@test.com	test
78	Bill Yerds	Bill_Yerds@test.com	test
79	Hap E. Birthday	Hap_E._Birthday@test.com	test
80	Matt Innae	Matt_Innae@test.com	test
81	Polly Science	Polly_Science@test.com	test
82	Tara Misu	Tara_Misu@test.com	test
83	Ed U. Cation	Ed_U._Cation@test.com	test
84	Gerry Atric	Gerry_Atric@test.com	test
85	Kerry Oaky	Kerry_Oaky@test.com	test
86	Midge Itz	Midge_Itz@test.com	test
87	Gabe Lackmen	Gabe_Lackmen@test.com	test
88	Mary Christmas	Mary_Christmas@test.com	test
89	Dan Druff	Dan_Druff@test.com	test
90	Jim Nasium	Jim_Nasium@test.com	test
91	Angie O. Plasty	Angie_O._Plasty@test.com	test
92	Ella Vator	Ella_Vator@test.com	test
93	Sal Vidge	Sal_Vidge@test.com	test
94	Bart Ender	Bart_Ender@test.com	test
95	Artie Choke	Artie_Choke@test.com	test
96	Hans Olo	Hans_Olo@test.com	test
97	Hugh Briss	Hugh_Briss@test.com	test
98	Gene Poole	Gene_Poole@test.com	test
99	Ty Tanic	Ty_Tanic@test.com	test
100	Manuel Labor	Manuel_Labor@test.com	test
101	Lynn Guini	Lynn_Guini@test.com	test
102	Claire Voyant	Claire_Voyant@test.com	test
103	Peg Leg	Peg_Leg@test.com	test
104	Jack E. Sack	Jack_E._Sack@test.com	test
105	Marty Graw	Marty_Graw@test.com	test
106	Ash Wednesday	Ash_Wednesday@test.com	test
107	Olive Yu	Olive_Yu@test.com	test
108	Gene Jacket	Gene_Jacket@test.com	test
109	Tom Atoe	Tom_Atoe@test.com	test
110	Doug Out	Doug_Out@test.com	test
111	Sharon Needles	Sharon_Needles@test.com	test
112	Beau Tie	Beau_Tie@test.com	test
113	Serj Protector	Serj_Protector@test.com	test
\.


--
-- Name: bg_tags_tagged_bg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.bg_tags_tagged_bg_id_seq', 948, true);


--
-- Name: boardgames_bg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.boardgames_bg_id_seq', 1, false);


--
-- Name: favorites_fav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.favorites_fav_id_seq', 8, true);


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.tags_tag_id_seq', 12, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 113, true);


--
-- Name: bg_tags bg_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags
    ADD CONSTRAINT bg_tags_pkey PRIMARY KEY (tagged_bg_id);


--
-- Name: bg_tags bg_tags_user_id_bg_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags
    ADD CONSTRAINT bg_tags_user_id_bg_id_tag_id_key UNIQUE (user_id, bg_id, tag_id);


--
-- Name: boardgames boardgames_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.boardgames
    ADD CONSTRAINT boardgames_pkey PRIMARY KEY (bg_id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (fav_id);


--
-- Name: favorites favorites_user_id_bg_id_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_bg_id_key UNIQUE (user_id, bg_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: bg_tags bg_tags_bg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags
    ADD CONSTRAINT bg_tags_bg_id_fkey FOREIGN KEY (bg_id) REFERENCES public.boardgames(bg_id);


--
-- Name: bg_tags bg_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags
    ADD CONSTRAINT bg_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id);


--
-- Name: bg_tags bg_tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bg_tags
    ADD CONSTRAINT bg_tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: favorites favorites_bg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_bg_id_fkey FOREIGN KEY (bg_id) REFERENCES public.boardgames(bg_id);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

