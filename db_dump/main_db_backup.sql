--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

-- Started on 2022-04-04 16:52:17 MSK

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
-- TOC entry 207 (class 1259 OID 33875)
-- Name: barons; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.barons (
    id integer NOT NULL,
    townsman_id integer NOT NULL
);


ALTER TABLE public.barons OWNER TO nick;

--
-- TOC entry 206 (class 1259 OID 33873)
-- Name: barons_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.barons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barons_id_seq OWNER TO nick;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 206
-- Name: barons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.barons_id_seq OWNED BY public.barons.id;


--
-- TOC entry 213 (class 1259 OID 33919)
-- Name: barons_knights; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.barons_knights (
    id integer NOT NULL,
    baron_id integer NOT NULL,
    knight_id integer NOT NULL
);


ALTER TABLE public.barons_knights OWNER TO nick;

--
-- TOC entry 212 (class 1259 OID 33917)
-- Name: barons_knights_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.barons_knights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barons_knights_id_seq OWNER TO nick;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 212
-- Name: barons_knights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.barons_knights_id_seq OWNED BY public.barons_knights.id;


--
-- TOC entry 205 (class 1259 OID 33862)
-- Name: dukes; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.dukes (
    id integer NOT NULL,
    townsman_id integer NOT NULL
);


ALTER TABLE public.dukes OWNER TO nick;

--
-- TOC entry 211 (class 1259 OID 33901)
-- Name: dukes_barons; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.dukes_barons (
    id integer NOT NULL,
    duke_id integer NOT NULL,
    baron_id integer NOT NULL
);


ALTER TABLE public.dukes_barons OWNER TO nick;

--
-- TOC entry 210 (class 1259 OID 33899)
-- Name: dukes_barons_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.dukes_barons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dukes_barons_id_seq OWNER TO nick;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 210
-- Name: dukes_barons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.dukes_barons_id_seq OWNED BY public.dukes_barons.id;


--
-- TOC entry 204 (class 1259 OID 33860)
-- Name: dukes_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.dukes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dukes_id_seq OWNER TO nick;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 204
-- Name: dukes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.dukes_id_seq OWNED BY public.dukes.id;


--
-- TOC entry 209 (class 1259 OID 33888)
-- Name: knights; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.knights (
    id integer NOT NULL,
    townsman_id integer NOT NULL
);


ALTER TABLE public.knights OWNER TO nick;

--
-- TOC entry 208 (class 1259 OID 33886)
-- Name: knights_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.knights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knights_id_seq OWNER TO nick;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 208
-- Name: knights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.knights_id_seq OWNED BY public.knights.id;


--
-- TOC entry 203 (class 1259 OID 33851)
-- Name: townsmen; Type: TABLE; Schema: public; Owner: nick
--

CREATE TABLE public.townsmen (
    id integer NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    age integer NOT NULL,
    income double precision,
    townsman_type character varying(200) NOT NULL
);


ALTER TABLE public.townsmen OWNER TO nick;

--
-- TOC entry 202 (class 1259 OID 33849)
-- Name: townsmen_id_seq; Type: SEQUENCE; Schema: public; Owner: nick
--

CREATE SEQUENCE public.townsmen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.townsmen_id_seq OWNER TO nick;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 202
-- Name: townsmen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nick
--

ALTER SEQUENCE public.townsmen_id_seq OWNED BY public.townsmen.id;


--
-- TOC entry 2865 (class 2604 OID 33878)
-- Name: barons id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons ALTER COLUMN id SET DEFAULT nextval('public.barons_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 33922)
-- Name: barons_knights id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons_knights ALTER COLUMN id SET DEFAULT nextval('public.barons_knights_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 33865)
-- Name: dukes id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes ALTER COLUMN id SET DEFAULT nextval('public.dukes_id_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 33904)
-- Name: dukes_barons id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes_barons ALTER COLUMN id SET DEFAULT nextval('public.dukes_barons_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 33891)
-- Name: knights id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.knights ALTER COLUMN id SET DEFAULT nextval('public.knights_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 33854)
-- Name: townsmen id; Type: DEFAULT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.townsmen ALTER COLUMN id SET DEFAULT nextval('public.townsmen_id_seq'::regclass);


--
-- TOC entry 3019 (class 0 OID 33875)
-- Dependencies: 207
-- Data for Name: barons; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.barons (id, townsman_id) FROM stdin;
1	2
2	5
3	8
4	12
5	15
6	18
7	22
8	25
9	28
10	32
11	35
12	38
13	42
14	45
15	48
16	52
17	55
18	58
19	62
20	65
21	68
22	72
23	75
24	78
25	82
26	85
27	88
28	92
29	95
30	98
31	102
32	105
33	108
34	112
35	115
36	118
37	122
38	125
39	128
40	132
41	135
42	138
43	142
44	145
45	148
46	152
47	155
48	158
49	162
50	165
51	168
52	172
53	175
54	178
55	182
56	185
57	188
58	192
59	195
60	198
61	202
62	205
63	208
64	212
65	215
66	218
67	222
68	225
69	228
70	232
71	235
72	238
73	242
74	245
75	248
76	252
77	255
78	258
79	262
80	265
81	268
82	272
83	275
84	278
85	282
86	285
87	288
88	292
89	295
90	298
91	302
92	305
93	308
94	312
95	315
96	318
97	322
98	325
99	328
100	332
101	335
102	338
103	342
104	345
105	348
106	352
107	355
108	358
109	362
110	365
111	368
112	372
113	375
114	378
115	382
116	385
117	388
118	392
119	395
120	398
121	402
122	405
123	408
124	412
125	415
126	418
127	422
128	425
129	428
130	432
131	435
132	438
133	442
134	445
135	448
136	452
137	455
138	458
139	462
140	465
141	468
142	472
143	475
144	478
145	482
146	485
147	488
148	492
149	495
150	498
\.


--
-- TOC entry 3025 (class 0 OID 33919)
-- Dependencies: 213
-- Data for Name: barons_knights; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.barons_knights (id, baron_id, knight_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	3	5
6	3	6
7	4	7
8	4	8
9	5	9
10	5	10
11	6	11
12	6	12
13	7	13
14	7	14
15	8	15
16	8	16
17	9	17
18	9	18
19	10	19
20	10	20
21	11	21
22	11	22
23	12	23
24	12	24
25	13	25
26	13	26
27	14	27
28	14	28
29	15	29
30	15	30
31	16	31
32	16	32
33	17	33
34	17	34
35	18	35
36	18	36
37	19	37
38	19	38
39	20	39
40	20	40
41	21	41
42	21	42
43	22	43
44	22	44
45	23	45
46	23	46
47	24	47
48	24	48
49	25	49
50	25	50
51	26	51
52	26	52
53	27	53
54	27	54
55	28	55
56	28	56
57	29	57
58	29	58
59	30	59
60	30	60
61	31	61
62	31	62
63	32	63
64	32	64
65	33	65
66	33	66
67	34	67
68	34	68
69	35	69
70	35	70
71	36	71
72	36	72
73	37	73
74	37	74
75	38	75
76	38	76
77	39	77
78	39	78
79	40	79
80	40	80
81	41	81
82	41	82
83	42	83
84	42	84
85	43	85
86	43	86
87	44	87
88	44	88
89	45	89
90	45	90
91	46	91
92	46	92
93	47	93
94	47	94
95	48	95
96	48	96
97	49	97
98	49	98
99	50	99
100	50	100
101	51	101
102	51	102
103	52	103
104	52	104
105	53	105
106	53	106
107	54	107
108	54	108
109	55	109
110	55	110
111	56	111
112	56	112
113	57	113
114	57	114
115	58	115
116	58	116
117	59	117
118	59	118
119	60	119
120	60	120
121	61	121
122	61	122
123	62	123
124	62	124
125	63	125
126	63	126
127	64	127
128	64	128
129	65	129
130	65	130
131	66	131
132	66	132
133	67	133
134	67	134
135	68	135
136	68	136
137	69	137
138	69	138
139	70	139
140	70	140
141	71	141
142	71	142
143	72	143
144	72	144
145	73	145
146	73	146
147	74	147
148	74	148
149	75	149
150	75	150
151	76	151
152	76	152
153	77	153
154	77	154
155	78	155
156	78	156
157	79	157
158	79	158
159	80	159
160	80	160
161	81	161
162	81	162
163	82	163
164	82	164
165	83	165
166	83	166
167	84	167
168	84	168
169	85	169
170	85	170
171	86	171
172	86	172
173	87	173
174	87	174
175	88	175
176	88	176
177	89	177
178	89	178
179	90	179
180	90	180
181	91	181
182	91	182
183	92	183
184	92	184
185	93	185
186	93	186
187	94	187
188	94	188
189	95	189
190	95	190
191	96	191
192	96	192
193	97	193
194	97	194
195	98	195
196	98	196
197	99	197
198	99	198
199	100	199
200	100	200
201	101	201
202	101	202
203	102	203
204	102	204
205	103	205
206	103	206
207	104	207
208	104	208
209	105	209
210	105	210
211	106	211
212	106	212
213	107	213
214	107	214
215	108	215
216	108	216
217	109	217
218	109	218
219	110	219
220	110	220
221	111	221
222	111	222
223	112	223
224	112	224
225	113	225
226	113	226
227	114	227
228	114	228
229	115	229
230	115	230
231	116	231
232	116	232
233	117	233
234	117	234
235	118	235
236	118	236
237	119	237
238	119	238
239	120	239
240	120	240
241	121	241
242	121	242
243	122	243
244	122	244
245	123	245
246	123	246
247	124	247
248	124	248
249	125	249
250	125	250
251	126	251
252	126	252
253	127	253
254	127	254
255	128	255
256	128	256
257	129	257
258	129	258
259	130	259
260	130	260
261	131	261
262	131	262
263	132	263
264	132	264
265	133	265
266	133	266
267	134	267
268	134	268
269	135	269
270	135	270
271	136	271
272	136	272
273	137	273
274	137	274
275	138	275
276	138	276
277	139	277
278	139	278
279	140	279
280	140	280
281	141	281
282	141	282
283	142	283
284	142	284
285	143	285
286	143	286
287	144	287
288	144	288
289	145	289
290	145	290
291	146	291
292	146	292
293	147	293
294	147	294
295	148	295
296	148	296
297	149	297
298	149	298
299	150	299
300	150	300
\.


--
-- TOC entry 3017 (class 0 OID 33862)
-- Dependencies: 205
-- Data for Name: dukes; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.dukes (id, townsman_id) FROM stdin;
1	1
2	11
3	21
4	31
5	41
6	51
7	61
8	71
9	81
10	91
11	101
12	111
13	121
14	131
15	141
16	151
17	161
18	171
19	181
20	191
21	201
22	211
23	221
24	231
25	241
26	251
27	261
28	271
29	281
30	291
31	301
32	311
33	321
34	331
35	341
36	351
37	361
38	371
39	381
40	391
41	401
42	411
43	421
44	431
45	441
46	451
47	461
48	471
49	481
50	491
\.


--
-- TOC entry 3023 (class 0 OID 33901)
-- Dependencies: 211
-- Data for Name: dukes_barons; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.dukes_barons (id, duke_id, baron_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	2	5
6	2	6
7	3	7
8	3	8
9	3	9
10	4	10
11	4	11
12	4	12
13	5	13
14	5	14
15	5	15
16	6	16
17	6	17
18	6	18
19	7	19
20	7	20
21	7	21
22	8	22
23	8	23
24	8	24
25	9	25
26	9	26
27	9	27
28	10	28
29	10	29
30	10	30
31	11	31
32	11	32
33	11	33
34	12	34
35	12	35
36	12	36
37	13	37
38	13	38
39	13	39
40	14	40
41	14	41
42	14	42
43	15	43
44	15	44
45	15	45
46	16	46
47	16	47
48	16	48
49	17	49
50	17	50
51	17	51
52	18	52
53	18	53
54	18	54
55	19	55
56	19	56
57	19	57
58	20	58
59	20	59
60	20	60
61	21	61
62	21	62
63	21	63
64	22	64
65	22	65
66	22	66
67	23	67
68	23	68
69	23	69
70	24	70
71	24	71
72	24	72
73	25	73
74	25	74
75	25	75
76	26	76
77	26	77
78	26	78
79	27	79
80	27	80
81	27	81
82	28	82
83	28	83
84	28	84
85	29	85
86	29	86
87	29	87
88	30	88
89	30	89
90	30	90
91	31	91
92	31	92
93	31	93
94	32	94
95	32	95
96	32	96
97	33	97
98	33	98
99	33	99
100	34	100
101	34	101
102	34	102
103	35	103
104	35	104
105	35	105
106	36	106
107	36	107
108	36	108
109	37	109
110	37	110
111	37	111
112	38	112
113	38	113
114	38	114
115	39	115
116	39	116
117	39	117
118	40	118
119	40	119
120	40	120
121	41	121
122	41	122
123	41	123
124	42	124
125	42	125
126	42	126
127	43	127
128	43	128
129	43	129
130	44	130
131	44	131
132	44	132
133	45	133
134	45	134
135	45	135
136	46	136
137	46	137
138	46	138
139	47	139
140	47	140
141	47	141
142	48	142
143	48	143
144	48	144
145	49	145
146	49	146
147	49	147
148	50	148
149	50	149
150	50	150
\.


--
-- TOC entry 3021 (class 0 OID 33888)
-- Dependencies: 209
-- Data for Name: knights; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.knights (id, townsman_id) FROM stdin;
1	3
2	4
3	6
4	7
5	9
6	10
7	13
8	14
9	16
10	17
11	19
12	20
13	23
14	24
15	26
16	27
17	29
18	30
19	33
20	34
21	36
22	37
23	39
24	40
25	43
26	44
27	46
28	47
29	49
30	50
31	53
32	54
33	56
34	57
35	59
36	60
37	63
38	64
39	66
40	67
41	69
42	70
43	73
44	74
45	76
46	77
47	79
48	80
49	83
50	84
51	86
52	87
53	89
54	90
55	93
56	94
57	96
58	97
59	99
60	100
61	103
62	104
63	106
64	107
65	109
66	110
67	113
68	114
69	116
70	117
71	119
72	120
73	123
74	124
75	126
76	127
77	129
78	130
79	133
80	134
81	136
82	137
83	139
84	140
85	143
86	144
87	146
88	147
89	149
90	150
91	153
92	154
93	156
94	157
95	159
96	160
97	163
98	164
99	166
100	167
101	169
102	170
103	173
104	174
105	176
106	177
107	179
108	180
109	183
110	184
111	186
112	187
113	189
114	190
115	193
116	194
117	196
118	197
119	199
120	200
121	203
122	204
123	206
124	207
125	209
126	210
127	213
128	214
129	216
130	217
131	219
132	220
133	223
134	224
135	226
136	227
137	229
138	230
139	233
140	234
141	236
142	237
143	239
144	240
145	243
146	244
147	246
148	247
149	249
150	250
151	253
152	254
153	256
154	257
155	259
156	260
157	263
158	264
159	266
160	267
161	269
162	270
163	273
164	274
165	276
166	277
167	279
168	280
169	283
170	284
171	286
172	287
173	289
174	290
175	293
176	294
177	296
178	297
179	299
180	300
181	303
182	304
183	306
184	307
185	309
186	310
187	313
188	314
189	316
190	317
191	319
192	320
193	323
194	324
195	326
196	327
197	329
198	330
199	333
200	334
201	336
202	337
203	339
204	340
205	343
206	344
207	346
208	347
209	349
210	350
211	353
212	354
213	356
214	357
215	359
216	360
217	363
218	364
219	366
220	367
221	369
222	370
223	373
224	374
225	376
226	377
227	379
228	380
229	383
230	384
231	386
232	387
233	389
234	390
235	393
236	394
237	396
238	397
239	399
240	400
241	403
242	404
243	406
244	407
245	409
246	410
247	413
248	414
249	416
250	417
251	419
252	420
253	423
254	424
255	426
256	427
257	429
258	430
259	433
260	434
261	436
262	437
263	439
264	440
265	443
266	444
267	446
268	447
269	449
270	450
271	453
272	454
273	456
274	457
275	459
276	460
277	463
278	464
279	466
280	467
281	469
282	470
283	473
284	474
285	476
286	477
287	479
288	480
289	483
290	484
291	486
292	487
293	489
294	490
295	493
296	494
297	496
298	497
299	499
300	500
\.


--
-- TOC entry 3015 (class 0 OID 33851)
-- Dependencies: 203
-- Data for Name: townsmen; Type: TABLE DATA; Schema: public; Owner: nick
--

COPY public.townsmen (id, first_name, last_name, age, income, townsman_type) FROM stdin;
1	Christoper	Mooney	36	1000	герцог
2	Terrence	Stone	50	600	барон
3	Roscoe	George	51	200	рыцарь
4	Gail	Cantu	80	200	рыцарь
5	Rene	Burgess	64	600	барон
6	Milton	Berger	35	200	рыцарь
7	Rodrick	Schultz	25	200	рыцарь
8	Buster	Elliott	41	600	барон
9	Kelly	David	34	200	рыцарь
10	Quinn	Albert	61	200	рыцарь
11	Jackie	Riddle	65	1000	герцог
12	Anderson	Salazar	44	600	барон
13	Micheal	O'donnell	60	200	рыцарь
14	Walker	Foreman	56	200	рыцарь
15	Keneth	Williamson	79	600	барон
16	Wilburn	Webb	30	200	рыцарь
17	Patricia	Cantrell	45	200	рыцарь
18	Sid	Davis	56	600	барон
19	Fausto	Dale	40	200	рыцарь
20	Gerry	Guy	58	200	рыцарь
21	Russell	Garrett	34	1000	герцог
22	Fidel	Stewart	76	600	барон
23	Terrell	Aguirre	41	200	рыцарь
24	Timothy	Cain	40	200	рыцарь
25	Giuseppe	Adkins	68	600	барон
26	Brain	Carpenter	54	200	рыцарь
27	Paris	Meyers	48	200	рыцарь
28	Marcos	Carver	52	600	барон
29	Dong	Cook	32	200	рыцарь
30	Luke	Rich	31	200	рыцарь
31	Gerry	Rosa	42	1000	герцог
32	Lowell	Johns	38	600	барон
33	Ricardo	Adkins	69	200	рыцарь
34	Millard	Miranda	20	200	рыцарь
35	Gordon	Valenzuela	33	600	барон
36	Cleo	Boyer	64	200	рыцарь
37	Troy	Zimmerman	31	200	рыцарь
38	Alvaro	Mayer	76	600	барон
39	Tristan	Morrison	26	200	рыцарь
40	Kristofer	Jenkins	26	200	рыцарь
41	Thomas	Patrick	29	1000	герцог
42	Prince	Manning	34	600	барон
43	Porter	Navarro	62	200	рыцарь
44	Frederick	Castaneda	48	200	рыцарь
45	Darnell	Montgomery	27	600	барон
46	Randolph	Warren	26	200	рыцарь
47	Dane	Thomas	61	200	рыцарь
48	Rudolf	Beasley	50	600	барон
49	Josh	Sampson	42	200	рыцарь
50	Pedro	Conley	58	200	рыцарь
51	Salvador	Sparks	34	1000	герцог
52	Chuck	Wolf	55	600	барон
53	Vaughn	English	27	200	рыцарь
54	Jerold	Mendoza	69	200	рыцарь
55	Haywood	Hatfield	67	600	барон
56	Terrell	Glenn	53	200	рыцарь
57	Felton	Carlson	53	200	рыцарь
58	Terence	Farmer	67	600	барон
59	Marquis	Brennan	23	200	рыцарь
60	Alphonso	Melton	75	200	рыцарь
61	Bryon	Owens	35	1000	герцог
62	Jerrell	Franks	80	600	барон
63	Carmen	Curry	73	200	рыцарь
64	Donn	Berger	56	200	рыцарь
65	Octavio	Meyer	80	600	барон
66	Bret	Henson	29	200	рыцарь
67	Hollis	Benson	68	200	рыцарь
68	Bryant	Pennington	62	600	барон
69	Byron	Hines	45	200	рыцарь
70	Roland	Rios	37	200	рыцарь
71	Ramiro	Mayo	56	1000	герцог
72	Max	Huber	70	600	барон
73	Jarvis	Henson	42	200	рыцарь
74	Harris	Figueroa	71	200	рыцарь
75	Wilbert	Cortez	27	600	барон
76	Gil	Poole	33	200	рыцарь
77	Enrique	Velez	64	200	рыцарь
78	Noah	Roberson	46	600	барон
79	Oscar	Garrison	52	200	рыцарь
80	Sonny	Blanchard	44	200	рыцарь
81	Sylvester	Wiggins	73	1000	герцог
82	Allen	Stephens	55	600	барон
83	Mason	Carney	70	200	рыцарь
84	George	Gaines	24	200	рыцарь
85	Josh	Dawson	47	600	барон
86	Alfonzo	Wagner	26	200	рыцарь
87	Omer	Joseph	33	200	рыцарь
88	Chad	Mann	30	600	барон
89	Christian	Stevenson	19	200	рыцарь
90	Silas	Lara	50	200	рыцарь
91	Walton	Hampton	74	1000	герцог
92	Beau	Lancaster	45	600	барон
93	Maria	Pennington	34	200	рыцарь
94	Kyle	Owens	25	200	рыцарь
95	Francisco	Erickson	77	600	барон
96	Lonny	Allen	43	200	рыцарь
97	Chad	Collier	64	200	рыцарь
98	Cortez	Walsh	49	600	барон
99	Elliott	Bryan	42	200	рыцарь
100	Tuan	Ware	67	200	рыцарь
101	Waylon	Velez	33	1000	герцог
102	Jonah	Garrison	57	600	барон
103	Ezekiel	Gallegos	24	200	рыцарь
104	Marty	Allen	48	200	рыцарь
105	Louie	Gibson	53	600	барон
106	Kelley	Cole	31	200	рыцарь
107	Paul	Burns	72	200	рыцарь
108	Davis	Pennington	71	600	барон
109	Felton	Dickson	42	200	рыцарь
110	Clarence	Wall	19	200	рыцарь
111	Cyril	Hunt	19	1000	герцог
112	Jacques	Chambers	51	600	барон
113	Coy	Salinas	47	200	рыцарь
114	Anibal	Valdez	41	200	рыцарь
115	Jarred	Leblanc	74	600	барон
116	Troy	Bright	65	200	рыцарь
117	Jaime	Craft	48	200	рыцарь
118	Lester	Norton	75	600	барон
119	Gustavo	Whitaker	72	200	рыцарь
120	Wiley	Moses	52	200	рыцарь
121	Brett	Mcfadden	69	1000	герцог
122	Forest	Baldwin	31	600	барон
123	Manual	Blair	46	200	рыцарь
124	Eldridge	Christian	29	200	рыцарь
125	Clyde	Weber	43	600	барон
126	Dwayne	Leblanc	25	200	рыцарь
127	Bradley	Osborn	46	200	рыцарь
128	Sam	Glover	32	600	барон
129	Ignacio	Buchanan	21	200	рыцарь
130	Scottie	Gilliam	48	200	рыцарь
131	Allen	Robertson	53	1000	герцог
132	Garth	Baldwin	66	600	барон
133	Trey	Bridges	73	200	рыцарь
134	Chuck	Hanson	33	200	рыцарь
135	Tom	Fletcher	23	600	барон
136	Roderick	Reeves	48	200	рыцарь
137	Travis	Mayo	70	200	рыцарь
138	Reinaldo	Knowles	72	600	барон
139	Joesph	Stein	38	200	рыцарь
140	Dennis	Fletcher	46	200	рыцарь
141	Damian	Sellers	65	1000	герцог
142	Jerome	Evans	75	600	барон
143	Eusebio	Peters	70	200	рыцарь
144	Fritz	Chambers	36	200	рыцарь
145	Ben	Banks	56	600	барон
146	Emmanuel	Gates	21	200	рыцарь
147	Kurt	Hudson	53	200	рыцарь
148	Bernie	Bean	49	600	барон
149	Ferdinand	Griffin	66	200	рыцарь
150	Arthur	Hodges	77	200	рыцарь
151	Emmitt	Mcintyre	78	1000	герцог
152	Alfonso	Curtis	65	600	барон
153	Gustavo	Goff	67	200	рыцарь
154	Juan	Dennis	70	200	рыцарь
155	Jackson	Wolf	37	600	барон
156	Esteban	Blackburn	54	200	рыцарь
157	Efren	Butler	55	200	рыцарь
158	Bruno	Wallace	61	600	барон
159	Tommy	Mclean	27	200	рыцарь
160	Tommie	William	79	200	рыцарь
161	Margarito	Gates	79	1000	герцог
162	Enoch	Shaffer	66	600	барон
163	Benjamin	Townsend	37	200	рыцарь
164	Philip	Larson	29	200	рыцарь
165	Buster	Fischer	53	600	барон
166	Esteban	Sellers	80	200	рыцарь
167	Kyle	Giles	61	200	рыцарь
168	Issac	Merritt	58	600	барон
169	Gavin	Savage	29	200	рыцарь
170	Kelvin	Simpson	56	200	рыцарь
171	Refugio	Bartlett	48	1000	герцог
172	Angelo	Chambers	53	600	барон
173	Shawn	Sanford	75	200	рыцарь
174	Edgar	Olsen	26	200	рыцарь
175	Jermaine	Valdez	37	600	барон
176	Lindsey	Kane	54	200	рыцарь
177	Franklin	Kirby	65	200	рыцарь
178	Toby	Brady	40	600	барон
179	Gail	Rosa	26	200	рыцарь
180	Jose	Potter	71	200	рыцарь
181	Dominic	Hebert	28	1000	герцог
182	Marcos	Rutledge	44	600	барон
183	Raleigh	Reese	73	200	рыцарь
184	Antone	Alvarez	53	200	рыцарь
185	Lanny	Leonard	30	600	барон
186	Heriberto	Dixon	30	200	рыцарь
187	Brian	Ellison	48	200	рыцарь
188	Christian	Herrera	29	600	барон
189	Rick	Atkinson	24	200	рыцарь
190	Leland	Tyson	75	200	рыцарь
191	Marcellus	Rodgers	18	1000	герцог
192	Genaro	Diaz	28	600	барон
193	Ted	Castro	69	200	рыцарь
194	Kristofer	Greene	61	200	рыцарь
195	Marcos	Velazquez	68	600	барон
196	Rico	Atkinson	58	200	рыцарь
197	Odell	Salas	23	200	рыцарь
198	Art	Salazar	54	600	барон
199	Philip	Silva	24	200	рыцарь
200	Freeman	Matthews	27	200	рыцарь
201	Thomas	Clements	42	1000	герцог
202	Cyrus	Spears	77	600	барон
203	Norbert	Jones	30	200	рыцарь
204	Leonel	Wall	60	200	рыцарь
205	Brain	Hays	54	600	барон
206	Elisha	Cash	74	200	рыцарь
207	Lynn	Compton	69	200	рыцарь
208	Mckinley	Osborn	79	600	барон
209	Isreal	Hicks	56	200	рыцарь
210	Maxwell	Weber	30	200	рыцарь
211	Tyson	Odom	54	1000	герцог
212	German	Webb	39	600	барон
213	Mike	Booth	22	200	рыцарь
214	Manual	Brady	49	200	рыцарь
215	Stevie	Schultz	63	600	барон
216	Carol	Mcmahon	27	200	рыцарь
217	Houston	Leach	39	200	рыцарь
218	Odis	Pacheco	80	600	барон
219	Clark	Silva	38	200	рыцарь
220	Jarred	Hamilton	25	200	рыцарь
221	Dusty	Singleton	80	1000	герцог
222	Otis	Byers	73	600	барон
223	Quinn	Wiggins	24	200	рыцарь
224	Silas	Barron	52	200	рыцарь
225	Sidney	Burks	43	600	барон
226	Olin	Keller	45	200	рыцарь
227	Jonas	Daniels	50	200	рыцарь
228	Elliot	Maynard	18	600	барон
229	Lon	Burris	20	200	рыцарь
230	Freeman	Hutchinson	35	200	рыцарь
231	Angelo	Malone	78	1000	герцог
232	Brad	Burch	48	600	барон
233	Pedro	Bruce	58	200	рыцарь
234	Lindsay	Whitaker	26	200	рыцарь
235	Johnathon	Avery	18	600	барон
236	Lamar	Torres	57	200	рыцарь
237	Stanton	Alvarado	37	200	рыцарь
238	Thaddeus	Stafford	70	600	барон
239	Wes	Dillon	43	200	рыцарь
240	Derek	Chaney	43	200	рыцарь
241	Riley	Flowers	65	1000	герцог
242	Chet	Chaney	41	600	барон
243	Lavern	Watkins	50	200	рыцарь
244	Brady	Barber	57	200	рыцарь
245	Alvaro	Lloyd	74	600	барон
246	Kirk	Vaughan	23	200	рыцарь
247	Jeremy	Ayala	60	200	рыцарь
248	Emil	Orr	44	600	барон
249	Virgil	Levine	72	200	рыцарь
250	Willian	Johnson	80	200	рыцарь
251	Omar	Gaines	51	1000	герцог
252	Jamel	Jacobs	71	600	барон
253	Milford	Dean	48	200	рыцарь
254	Matthew	Chaney	65	200	рыцарь
255	Jacinto	Marquez	25	600	барон
256	Kelley	Dean	63	200	рыцарь
257	Elmer	Park	69	200	рыцарь
258	Trent	Howell	34	600	барон
259	Kenny	Nolan	37	200	рыцарь
260	Hosea	Chen	65	200	рыцарь
261	Wilfred	Lambert	67	1000	герцог
262	Jeffry	Underwood	33	600	барон
263	Glen	Warren	57	200	рыцарь
264	Warner	Stokes	70	200	рыцарь
265	Dirk	Berry	60	600	барон
266	Cody	Harrell	48	200	рыцарь
267	Spencer	Paul	47	200	рыцарь
268	Rigoberto	Huffman	58	600	барон
269	Basil	Zamora	57	200	рыцарь
270	Pierre	Larson	60	200	рыцарь
271	Norris	Flores	73	1000	герцог
272	Andrea	Nichols	43	600	барон
273	Terence	Brady	80	200	рыцарь
274	Jaime	Foster	56	200	рыцарь
275	Refugio	Lowe	49	600	барон
276	Alden	Gill	52	200	рыцарь
277	Marcus	Nash	74	200	рыцарь
278	Elden	Cortez	52	600	барон
279	Mason	Lee	71	200	рыцарь
280	Shayne	Noel	77	200	рыцарь
281	Willian	Baldwin	74	1000	герцог
282	Jacinto	Macias	37	600	барон
283	Rod	Woods	79	200	рыцарь
284	Cecil	Steele	79	200	рыцарь
285	Keven	Kirkland	25	600	барон
286	Tracey	Fulton	76	200	рыцарь
287	Rene	Schroeder	70	200	рыцарь
288	Dominique	Miranda	32	600	барон
289	Alonso	Walker	29	200	рыцарь
290	Daniel	Cantrell	29	200	рыцарь
291	Alvin	Warner	60	1000	герцог
292	Nathanial	Shannon	40	600	барон
293	Paris	Macias	21	200	рыцарь
294	Stanley	Schmidt	57	200	рыцарь
295	Vincenzo	Marquez	50	600	барон
296	Reid	Aguirre	80	200	рыцарь
297	Renaldo	Wheeler	28	200	рыцарь
298	Parker	Sims	37	600	барон
299	Eusebio	Bartlett	46	200	рыцарь
300	Dee	Osborne	48	200	рыцарь
301	Teodoro	Dawson	28	1000	герцог
302	Cliff	Mays	56	600	барон
303	Merle	Saunders	27	200	рыцарь
304	Galen	Holder	76	200	рыцарь
305	Bennett	Drake	71	600	барон
306	Edgar	Bartlett	20	200	рыцарь
307	Gerry	Faulkner	74	200	рыцарь
308	Allan	Wade	76	600	барон
309	Armand	Larsen	30	200	рыцарь
310	Clint	Nelson	78	200	рыцарь
311	Lawrence	Harris	26	1000	герцог
312	Dee	Guthrie	33	600	барон
313	Curtis	Burton	79	200	рыцарь
314	Taylor	Gallegos	41	200	рыцарь
315	Byron	Pruitt	65	600	барон
316	Gordon	Browning	24	200	рыцарь
317	Garfield	Booth	40	200	рыцарь
318	Brooks	Mercado	60	600	барон
319	Homer	Jennings	79	200	рыцарь
320	Lanny	Mcmahon	33	200	рыцарь
321	Hubert	Fitzpatrick	38	1000	герцог
322	Stuart	Church	76	600	барон
323	Jonathan	Bates	54	200	рыцарь
324	Randall	Spencer	42	200	рыцарь
325	Gregory	Huber	55	600	барон
326	Harland	Crane	48	200	рыцарь
327	Solomon	Ramsey	25	200	рыцарь
328	Steve	Bean	32	600	барон
329	Diego	Perkins	75	200	рыцарь
330	Rocky	Chapman	74	200	рыцарь
331	Sherwood	Craig	68	1000	герцог
332	Billie	Booker	23	600	барон
333	Roger	Mendez	69	200	рыцарь
334	Waldo	Livingston	58	200	рыцарь
335	Keven	Cobb	76	600	барон
336	Giuseppe	Crawford	32	200	рыцарь
337	Joe	Salinas	26	200	рыцарь
338	Hipolito	Copeland	23	600	барон
339	Brendan	Bright	62	200	рыцарь
340	Brendon	Mcguire	66	200	рыцарь
341	Stephen	Hayes	77	1000	герцог
342	Herb	Phillips	68	600	барон
343	Edmundo	Camacho	42	200	рыцарь
344	Carter	Richmond	36	200	рыцарь
345	Robert	Casey	57	600	барон
346	Duncan	Abbott	79	200	рыцарь
347	Roscoe	Cole	48	200	рыцарь
348	Dan	Walsh	72	600	барон
349	Rolf	Nelson	66	200	рыцарь
350	Jeffrey	Roman	51	200	рыцарь
351	Tommie	Ayers	41	1000	герцог
352	Pete	Brock	52	600	барон
353	Rick	Holmes	33	200	рыцарь
354	Jorge	Lynn	35	200	рыцарь
355	Wilford	Talley	33	600	барон
356	Harland	Vaughan	68	200	рыцарь
357	Noel	Townsend	36	200	рыцарь
358	Stanford	Hunter	47	600	барон
359	Minh	Gillespie	37	200	рыцарь
360	Stephen	Long	53	200	рыцарь
361	Matt	Galloway	52	1000	герцог
362	Claudio	Santiago	23	600	барон
363	Maynard	Hooper	31	200	рыцарь
364	Lee	Alexander	75	200	рыцарь
365	Willy	Mills	62	600	барон
366	Colin	Finley	62	200	рыцарь
367	Darrell	Conway	61	200	рыцарь
368	Earl	Rojas	52	600	барон
369	Luis	Juarez	76	200	рыцарь
370	Art	Morin	19	200	рыцарь
371	Ramiro	Saunders	69	1000	герцог
372	Ivan	Johnson	21	600	барон
373	Kristofer	Bauer	33	200	рыцарь
374	Wilbert	Berry	53	200	рыцарь
375	Derrick	Mccormick	71	600	барон
376	Sang	Head	34	200	рыцарь
377	Mack	Wood	74	200	рыцарь
378	Herman	Morrow	76	600	барон
379	Emery	Castro	53	200	рыцарь
380	Cesar	Fleming	34	200	рыцарь
381	Eli	Sutton	18	1000	герцог
382	Noel	Bates	19	600	барон
383	Carl	Edwards	23	200	рыцарь
384	Luis	Webb	69	200	рыцарь
385	Larry	Christensen	30	600	барон
386	Theron	Garza	45	200	рыцарь
387	Joey	Faulkner	75	200	рыцарь
388	Marcos	Blankenship	37	600	барон
389	Phil	Navarro	70	200	рыцарь
390	Wilton	Velez	33	200	рыцарь
391	Louis	Pitts	63	1000	герцог
392	Jaime	Clemons	69	600	барон
393	Horacio	Gould	48	200	рыцарь
394	Dean	Mathis	77	200	рыцарь
395	Mathew	Greene	53	600	барон
396	Leandro	Villarreal	54	200	рыцарь
397	Leland	Doyle	37	200	рыцарь
398	Salvador	Jones	75	600	барон
399	Rueben	Burris	25	200	рыцарь
400	Leland	Harding	40	200	рыцарь
401	Dwayne	Harrington	56	1000	герцог
402	Michael	Shannon	60	600	барон
403	Gregory	Conrad	25	200	рыцарь
404	Jamar	Schultz	49	200	рыцарь
405	Sid	Christian	22	600	барон
406	Rodolfo	Mathis	57	200	рыцарь
407	Merrill	Vang	18	200	рыцарь
408	Delbert	Kinney	67	600	барон
409	Harvey	Vincent	35	200	рыцарь
410	Percy	Pacheco	52	200	рыцарь
411	Roberto	Byers	67	1000	герцог
412	Antione	Maldonado	63	600	барон
413	Elias	Talley	33	200	рыцарь
414	Jordon	Fitzpatrick	41	200	рыцарь
415	Korey	Nelson	56	600	барон
416	Marvin	Chambers	41	200	рыцарь
417	Stephen	O'connor	51	200	рыцарь
418	Freeman	Carr	21	600	барон
419	Samual	Finley	63	200	рыцарь
420	Orville	Barry	69	200	рыцарь
421	Royal	Scott	73	1000	герцог
422	Eduardo	Wynn	25	600	барон
423	Elisha	Burks	42	200	рыцарь
424	Santos	Wise	24	200	рыцарь
425	Bertram	Warner	49	600	барон
426	Herbert	Diaz	51	200	рыцарь
427	Lenny	Chan	32	200	рыцарь
428	Noe	Mccarty	68	600	барон
429	Anibal	Shepherd	57	200	рыцарь
430	Cedric	Ramos	71	200	рыцарь
431	Donn	Scott	70	1000	герцог
432	Shirley	Guzman	62	600	барон
433	Vicente	Kirkland	36	200	рыцарь
434	Jacob	Stephens	69	200	рыцарь
435	Kelly	Kelley	74	600	барон
436	Angelo	Baker	73	200	рыцарь
437	Mickey	Petersen	49	200	рыцарь
438	Curt	Bond	46	600	барон
439	Fidel	Hutchinson	28	200	рыцарь
440	Brain	Guzman	80	200	рыцарь
441	Thanh	Reeves	54	1000	герцог
442	Booker	Alston	39	600	барон
443	Granville	Leon	70	200	рыцарь
444	Howard	Eaton	35	200	рыцарь
445	Julio	Vazquez	61	600	барон
446	Ryan	Riddle	78	200	рыцарь
447	Rodrigo	Lott	78	200	рыцарь
448	Miquel	Cox	42	600	барон
449	Dee	Crosby	75	200	рыцарь
450	Grant	Hamilton	41	200	рыцарь
451	Kerry	Mcintosh	59	1000	герцог
452	Olin	Jensen	73	600	барон
453	Jarrod	Jimenez	24	200	рыцарь
454	Jeffery	Pate	62	200	рыцарь
455	Maynard	Spencer	63	600	барон
456	Russ	Shepard	31	200	рыцарь
457	Damien	Browning	33	200	рыцарь
458	Hector	Barlow	44	600	барон
459	Carson	Hardy	61	200	рыцарь
460	Martin	Potts	25	200	рыцарь
461	Salvador	Rivers	77	1000	герцог
462	Brendan	Banks	78	600	барон
463	Ezequiel	Nunez	52	200	рыцарь
464	Dylan	Holman	47	200	рыцарь
465	Ernesto	Head	39	600	барон
466	Ward	Blake	52	200	рыцарь
467	Rodrigo	Fletcher	64	200	рыцарь
468	Leopoldo	Barnes	22	600	барон
469	Connie	Head	32	200	рыцарь
470	Stewart	Howard	78	200	рыцарь
471	Wiley	Richards	68	1000	герцог
472	Valentin	Hunter	79	600	барон
473	Orval	Shaw	74	200	рыцарь
474	Gus	Sullivan	77	200	рыцарь
475	Sid	Cortez	67	600	барон
476	Jimmy	Bell	38	200	рыцарь
477	Nathan	Vance	22	200	рыцарь
478	Jon	Marquez	24	600	барон
479	Otis	Campbell	33	200	рыцарь
480	Damien	Garza	36	200	рыцарь
481	Lawrence	Lewis	24	1000	герцог
482	Clemente	Holder	40	600	барон
483	Emil	Mcmillan	78	200	рыцарь
484	Aron	Weeks	63	200	рыцарь
485	Rashad	Jarvis	46	600	барон
486	Omar	Conner	20	200	рыцарь
487	Andre	Riley	66	200	рыцарь
488	Mac	Dyer	26	600	барон
489	Carson	Finley	39	200	рыцарь
490	Ervin	Snider	53	200	рыцарь
491	Alexander	Newman	31	1000	герцог
492	Johnson	Stevenson	32	600	барон
493	Santo	Fleming	44	200	рыцарь
494	Ed	Allison	21	200	рыцарь
495	Bret	Vinson	60	600	барон
496	Elliot	Day	57	200	рыцарь
497	Armando	Miles	79	200	рыцарь
498	Brendon	Stanton	53	600	барон
499	Johnathan	Webb	20	200	рыцарь
500	Clifton	Beach	68	200	рыцарь
\.


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 206
-- Name: barons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.barons_id_seq', 150, true);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 212
-- Name: barons_knights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.barons_knights_id_seq', 300, true);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 210
-- Name: dukes_barons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.dukes_barons_id_seq', 150, true);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 204
-- Name: dukes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.dukes_id_seq', 50, true);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 208
-- Name: knights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.knights_id_seq', 300, true);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 202
-- Name: townsmen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nick
--

SELECT pg_catalog.setval('public.townsmen_id_seq', 500, true);


--
-- TOC entry 2880 (class 2606 OID 33924)
-- Name: barons_knights barons_knights_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons_knights
    ADD CONSTRAINT barons_knights_pk PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 33880)
-- Name: barons barons_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons
    ADD CONSTRAINT barons_pk PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 33906)
-- Name: dukes_barons dukes_barons_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes_barons
    ADD CONSTRAINT dukes_barons_pk PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 33867)
-- Name: dukes dukes_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes
    ADD CONSTRAINT dukes_pk PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 33893)
-- Name: knights knights_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.knights
    ADD CONSTRAINT knights_pk PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 33859)
-- Name: townsmen townsmen_pk; Type: CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.townsmen
    ADD CONSTRAINT townsmen_pk PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 33925)
-- Name: barons_knights barons_knights_baron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons_knights
    ADD CONSTRAINT barons_knights_baron_id_fkey FOREIGN KEY (baron_id) REFERENCES public.barons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 33930)
-- Name: barons_knights barons_knights_knight_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons_knights
    ADD CONSTRAINT barons_knights_knight_id_fkey FOREIGN KEY (knight_id) REFERENCES public.knights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2882 (class 2606 OID 33881)
-- Name: barons barons_townsman_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.barons
    ADD CONSTRAINT barons_townsman_id_fkey FOREIGN KEY (townsman_id) REFERENCES public.townsmen(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2885 (class 2606 OID 33912)
-- Name: dukes_barons dukes_barons_baron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes_barons
    ADD CONSTRAINT dukes_barons_baron_id_fkey FOREIGN KEY (baron_id) REFERENCES public.barons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2884 (class 2606 OID 33907)
-- Name: dukes_barons dukes_barons_duke_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes_barons
    ADD CONSTRAINT dukes_barons_duke_id_fkey FOREIGN KEY (duke_id) REFERENCES public.dukes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2881 (class 2606 OID 33868)
-- Name: dukes dukes_townsman_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.dukes
    ADD CONSTRAINT dukes_townsman_id_fkey FOREIGN KEY (townsman_id) REFERENCES public.townsmen(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2883 (class 2606 OID 33894)
-- Name: knights knights_townsman_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nick
--

ALTER TABLE ONLY public.knights
    ADD CONSTRAINT knights_townsman_id_fkey FOREIGN KEY (townsman_id) REFERENCES public.townsmen(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-04-04 16:52:17 MSK

--
-- PostgreSQL database dump complete
--

