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

--
-- Data for Name: nutrient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nutrient (nutrient_id, name, unit_name) FROM stdin;
8	Total lipid (fat)	g
9	Fiber, total dietary	g
10	Water	g
11	Protein	g
12	Carbohydrate, by difference	g
13	average_energy	g
14	Sugars, Total	g
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, user_name, gender, hashed_pw, current_weight, target_weight, timeframe) FROM stdin;
\.


--
-- Data for Name: goal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goal (user_id, nutrient_id, amount) FROM stdin;
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ingredient (ingredient_id, name, unit_name) FROM stdin;
12	almond	g
13	apple	g
14	asparagus	g
15	avocado	g
16	bacon	g
17	banana	g
18	bean	g
19	bean sprout	g
20	beef	g
21	beetroot	g
22	bell pepper	g
23	blackberry	g
24	blueberry	g
25	bok choy	g
26	bread	g
27	brie cheese	g
28	broccoli	g
29	cabbage	g
30	carrot	g
31	cauliflower	g
32	cheddar cheese	g
33	cheese	g
34	cherry	g
35	chicken breast	g
36	chicken wing	g
37	chilli	g
38	chocolate	g
39	corn	g
40	cucumber	g
41	dry grape	g
42	durian	g
43	egg	g
44	eggplant	g
45	fish	g
46	garlic	g
47	ginger	g
48	grape	g
49	green grape	g
50	green pepper	g
51	guava	g
52	jalepeno	g
53	jam	g
54	kiwi	g
55	lemon	g
56	mango	g
57	mangoteen	g
58	meat ball	g
59	milk	g
60	mozarella cheese	g
61	mushroom	g
62	mussel	g
63	noodle	g
64	onion	g
65	orange	g
66	oyster	g
67	papaya	g
68	parmesan cheese	g
69	pasta	g
70	pineapple	g
71	pomegranate	g
72	pork	g
73	pork belly	g
74	pork rib	g
75	potato	g
76	pumpkin	g
77	raspberry	g
78	salad	g
79	salmon	g
80	scallop	g
81	shrimp	g
82	spring onion	g
83	starfruit	g
84	stilton cheese	g
85	strawberry	g
86	sweet potato	g
87	tomato	g
88	tuna	g
89	vegetable	g
90	watermelon	g
91	yogurt	g
\.


--
-- Data for Name: ingredient_contains_nutrient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ingredient_contains_nutrient (ingredient_id, nutrient_id, amount) FROM stdin;
12	8	0.5020
12	9	0.0927
12	10	0.0432
12	11	0.2620
12	12	0.1620
12	13	6.0000
12	14	0.0000
13	13	0.5880
13	12	0.1507
13	10	0.8440
13	8	0.0014
13	14	0.1250
13	11	0.0013
13	9	0.0197
14	8	0.0022
14	9	0.0188
14	10	0.9260
14	11	0.0144
14	12	0.0510
14	13	0.2580
14	14	0.0000
15	8	0.2030
15	10	0.6700
15	11	0.0181
15	12	0.0832
15	13	2.1450
15	14	0.0000
15	9	0.0000
16	8	0.3650
16	10	0.1420
16	14	0.0314
16	11	0.4090
16	12	0.0210
16	13	5.0000
16	9	0.0000
17	8	0.0022
17	10	0.7830
17	9	0.0170
17	11	0.0073
17	12	0.2010
17	14	0.1580
17	13	0.8500
18	8	0.0220
18	10	0.1230
18	11	0.2160
18	12	0.5980
18	13	3.4100
18	14	0.0000
18	9	0.0000
19	13	1.9758
19	12	0.3471
19	10	0.4845
19	8	0.0138
19	14	0.0000
19	11	0.1279
19	9	0.0239
20	8	0.2800
20	12	0.0289
20	10	0.5460
20	11	0.1170
20	14	0.0126
20	13	3.1400
20	9	0.0000
21	11	0.0735
21	9	0.0540
21	8	0.1710
21	12	0.1490
21	10	0.5870
21	14	0.0034
21	13	2.2900
22	13	0.2718
22	12	0.0618
22	10	0.9250
22	8	0.0013
22	14	0.0000
22	11	0.0083
22	9	0.0103
23	11	0.0735
23	9	0.0540
23	8	0.1710
23	12	0.1490
23	10	0.5870
23	14	0.0034
23	13	2.2900
24	8	0.0031
24	10	0.8420
24	11	0.0070
24	12	0.1460
24	14	0.0936
24	13	0.6065
24	9	0.0000
25	8	0.0023
25	9	0.0126
25	10	0.9450
25	11	0.0102
25	12	0.0351
25	13	0.1865
25	14	0.0000
26	9	0.0230
26	8	0.0359
26	12	0.4920
26	10	0.3570
26	11	0.0943
26	14	0.0534
26	13	2.7000
27	13	4.0050
27	12	0.0194
27	10	0.3710
27	8	0.3250
27	14	0.0017
27	11	0.2515
27	9	0.0000
28	12	0.0627
28	8	0.0034
28	10	0.9000
28	11	0.0257
28	9	0.0240
28	14	0.0140
28	13	0.3100
29	13	0.3083
29	12	0.0659
29	10	0.9150
29	8	0.0022
29	14	0.0000
29	11	0.0110
29	9	0.0000
30	13	0.4102
30	12	0.0910
30	10	0.8903
30	8	0.0032
30	14	0.0140
30	11	0.0085
30	9	0.0300
31	8	0.0024
31	9	0.0195
31	10	0.9270
31	11	0.0164
31	12	0.0472
31	13	0.2525
31	14	0.0000
32	10	0.3660
32	12	0.0244
32	11	0.2330
32	8	0.3400
32	14	0.0033
32	13	4.0800
32	9	0.0000
33	13	4.0050
33	12	0.0194
33	10	0.3710
33	8	0.3250
33	14	0.0017
33	11	0.2515
33	9	0.0000
34	10	0.8220
34	8	0.0019
34	11	0.0104
34	12	0.1620
34	14	0.1390
34	13	0.6690
34	9	0.0000
35	8	0.0193
35	10	0.7480
35	11	0.2250
35	12	0.0000
35	13	1.0900
35	14	0.0000
35	9	0.0000
36	13	1.3033
36	12	0.0000
36	10	0.7413
36	8	0.0567
36	14	0.0000
36	11	0.1967
36	9	0.0000
37	11	0.0735
37	9	0.0540
37	8	0.1710
37	12	0.1490
37	10	0.5870
37	14	0.0034
37	13	2.2900
38	11	0.0735
38	9	0.0540
38	8	0.1710
38	12	0.1490
38	10	0.5870
38	14	0.0034
38	13	2.2900
39	8	0.0174
39	10	0.1080
39	9	0.0430
39	14	0.0104
39	11	0.0620
39	12	0.8080
39	13	3.6400
40	8	0.0018
40	10	0.9590
40	11	0.0063
40	12	0.0295
40	13	0.1490
40	14	0.0000
40	9	0.0000
41	8	0.0192
41	10	0.0945
41	11	0.2360
41	12	0.6220
41	13	3.5550
41	14	0.0000
41	9	0.0000
42	11	0.0735
42	9	0.0540
42	8	0.1710
42	12	0.1490
42	10	0.5870
42	14	0.0034
42	13	2.2900
43	13	1.7900
43	12	0.0145
43	10	0.7140
43	8	0.1292
43	14	0.0007
43	11	0.1310
43	9	0.0000
44	8	0.0012
44	9	0.0245
44	10	0.9310
44	14	0.0235
44	11	0.0085
44	12	0.0540
44	13	0.2425
45	13	0.6500
45	12	0.0000
45	10	0.8505
45	8	0.0043
45	14	0.0000
45	11	0.1430
45	9	0.0000
46	9	0.0270
46	10	0.6310
46	8	0.0038
46	11	0.0662
46	12	0.2820
46	13	1.4300
46	14	0.0000
47	11	0.0735
47	9	0.0540
47	8	0.1710
47	12	0.1490
47	10	0.5870
47	14	0.0034
47	13	2.2900
48	10	0.9250
48	8	0.0063
48	9	0.0210
48	11	0.0083
48	12	0.0551
48	13	0.2700
48	14	0.0000
49	8	0.0023
49	10	0.7990
49	11	0.0090
49	12	0.1860
49	14	0.1610
49	13	0.7600
49	9	0.0000
50	8	0.0011
50	9	0.0094
50	10	0.9410
50	11	0.0072
50	12	0.0478
50	13	0.2130
50	14	0.0000
51	11	0.0735
51	9	0.0540
51	8	0.1710
51	12	0.1490
51	10	0.5870
51	14	0.0034
51	13	2.2900
52	11	0.0735
52	9	0.0540
52	8	0.1710
52	12	0.1490
52	10	0.5870
52	14	0.0034
52	13	2.2900
53	11	0.0735
53	9	0.0540
53	8	0.1710
53	12	0.1490
53	10	0.5870
53	14	0.0034
53	13	2.2900
54	8	0.0064
54	9	0.0213
54	10	0.8380
54	14	0.0856
54	11	0.0101
54	12	0.1380
54	13	0.6180
55	11	0.0735
55	9	0.0540
55	8	0.1710
55	12	0.1490
55	10	0.5870
55	14	0.0034
55	13	2.2900
56	8	0.0068
56	9	0.0129
56	10	0.8080
56	14	0.1110
56	11	0.0069
56	12	0.1740
56	13	0.7455
57	11	0.0735
57	9	0.0540
57	8	0.1710
57	12	0.1490
57	10	0.5870
57	14	0.0034
57	13	2.2900
58	8	0.0319
58	12	0.3250
58	10	0.5930
58	11	0.0384
58	14	0.0062
58	13	1.7400
58	9	0.0000
59	13	1.1733
59	12	0.0622
59	10	0.7910
59	8	0.0774
59	14	0.0205
59	11	0.0581
59	9	0.0000
60	13	4.0050
60	12	0.0194
60	10	0.3710
60	8	0.3250
60	14	0.0017
60	11	0.2515
60	9	0.0000
61	13	0.3500
61	12	0.0638
61	10	0.8990
61	8	0.0026
61	14	0.0000
61	11	0.0268
61	9	0.0282
62	11	0.0735
62	9	0.0540
62	8	0.1710
62	12	0.1490
62	10	0.5870
62	14	0.0034
62	13	2.2900
63	11	0.0735
63	9	0.0540
63	8	0.1710
63	12	0.1490
63	10	0.5870
63	14	0.0034
63	13	2.2900
64	13	0.3900
64	12	0.0874
64	10	0.9000
64	8	0.0009
64	14	0.0578
64	11	0.0089
64	9	0.0177
65	9	0.0200
65	11	0.0091
65	8	0.0015
65	10	0.8670
65	12	0.1180
65	14	0.0857
65	13	0.4700
66	10	0.8920
66	8	0.0019
66	11	0.0290
66	12	0.0694
66	9	0.0285
66	13	0.3715
66	14	0.0000
67	11	0.0735
67	9	0.0540
67	8	0.1710
67	12	0.1490
67	10	0.5870
67	14	0.0034
67	13	2.2900
68	8	0.2800
68	12	0.1240
68	10	0.2280
68	11	0.2960
68	14	0.0007
68	13	4.2100
68	9	0.0000
69	9	0.0180
69	10	0.8740
69	8	0.0148
69	12	0.0805
69	11	0.0141
69	14	0.0550
69	13	0.4500
70	10	0.8500
70	8	0.0021
70	9	0.0094
70	12	0.1410
70	11	0.0046
70	14	0.1140
70	13	0.5705
71	11	0.0735
71	9	0.0540
71	8	0.1710
71	12	0.1490
71	10	0.5870
71	14	0.0034
71	13	2.2900
72	8	0.1750
72	10	0.6390
72	11	0.1780
72	12	0.0000
72	13	2.3050
72	14	0.0000
72	9	0.0000
73	8	0.1750
73	10	0.6390
73	11	0.1780
73	12	0.0000
73	13	2.3050
73	14	0.0000
73	9	0.0000
74	8	0.1750
74	10	0.6390
74	11	0.1780
74	12	0.0000
74	13	2.3050
74	14	0.0000
74	9	0.0000
75	10	0.0828
75	8	0.0095
75	9	0.0540
75	12	0.7990
75	11	0.0811
75	13	3.5700
75	14	0.0000
76	8	0.4000
76	9	0.0508
76	10	0.0662
76	11	0.2990
76	12	0.1870
76	13	5.3500
76	14	0.0000
77	10	0.8560
77	8	0.0019
77	12	0.1290
77	11	0.0101
77	14	0.0268
77	13	0.5435
77	9	0.0000
78	11	0.0735
78	9	0.0540
78	8	0.1710
78	12	0.1490
78	10	0.5870
78	14	0.0034
78	13	2.2900
79	13	1.6650
79	12	0.0000
79	10	0.6915
79	8	0.0902
79	14	0.0000
79	11	0.2130
79	9	0.0000
80	11	0.0735
80	9	0.0540
80	8	0.1710
80	12	0.1490
80	10	0.5870
80	14	0.0034
80	13	2.2900
81	8	0.0080
81	10	0.8130
81	11	0.1560
81	12	0.0049
81	13	0.7355
81	14	0.0000
81	9	0.0000
82	13	0.3900
82	12	0.0874
82	10	0.9000
82	8	0.0009
82	14	0.0578
82	11	0.0089
82	9	0.0177
83	11	0.0735
83	9	0.0540
83	8	0.1710
83	12	0.1490
83	10	0.5870
83	14	0.0034
83	13	2.2900
84	13	4.0050
84	12	0.0194
84	10	0.3710
84	8	0.3250
84	14	0.0017
84	11	0.2515
84	9	0.0000
85	10	0.9080
85	8	0.0022
85	12	0.0796
85	11	0.0064
85	14	0.0486
85	13	0.3455
85	9	0.0000
86	10	0.7950
86	8	0.0038
86	12	0.1730
86	11	0.0158
86	14	0.0606
86	13	0.7820
86	9	0.0000
87	10	0.9470
87	8	0.0043
87	9	0.0097
87	11	0.0070
87	12	0.0384
87	13	0.2050
87	14	0.0000
88	8	0.0094
88	10	0.7900
88	11	0.1900
88	12	0.0008
88	14	0.0000
88	13	0.9000
88	9	0.0000
89	11	0.0735
89	9	0.0540
89	8	0.1710
89	12	0.1490
89	10	0.5870
89	14	0.0034
89	13	2.2900
90	11	0.0735
90	9	0.0540
90	8	0.1710
90	12	0.1490
90	10	0.5870
90	14	0.0034
90	13	2.2900
91	8	0.0009
91	10	0.8660
91	11	0.0423
91	12	0.0808
91	13	0.5005
91	14	0.0000
91	9	0.0000
\.


--
-- Data for Name: meal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meal (meal_id, type, datetime, user_id) FROM stdin;
\.


--
-- Data for Name: meal_includes_ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meal_includes_ingredient (meal_id, ingredient_id, amount) FROM stdin;
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipe (recipe_id, title, total_time, instructions) FROM stdin;
1	Apple Salad	10	1. Chop the apple into small pieces.\\n2. Dice the tomato.\\n3. Slice the cucumber.\\n4. Mix all ingredients together in a bowl.
2	Chicken Avocado Salad	15	1. Cook the chicken breast until done.\\n2. Slice the avocado.\\n3. Chop the cucumber.\\n4. Mix all ingredients together in a bowl.
3	Beef Stir Fry	20	1. Slice the beef thinly.\\n2. Chop the carrot into small pieces.\\n3. Cut the broccoli into florets.\\n4. Stir fry all ingredients together in a pan.
4	Banana Smoothie	5	1. Peel the banana.\\n2. Add the banana and milk to a blender.\\n3. Blend until smooth.
5	Tomato Pasta	25	1. Cook the pasta according to package instructions.\\n2. Chop the tomato.\\n3. Dice the onion.\\n4. Mix the cooked pasta with tomato and onion.
\.


--
-- Data for Name: recipe_includes_ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipe_includes_ingredient (recipe_id, ingredient_id, amount) FROM stdin;
1	13	100.00
1	87	50.00
1	40	30.00
2	35	150.00
2	15	100.00
2	40	50.00
3	20	200.00
3	30	50.00
3	28	50.00
4	17	100.00
4	59	200.00
5	69	200.00
5	87	100.00
5	64	50.00
\.


--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ingredient_ingredient_id_seq', 91, true);


--
-- Name: meal_meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meal_meal_id_seq', 1, false);


--
-- Name: nutrient_nutrient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nutrient_nutrient_id_seq', 14, true);


--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recipe_recipe_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

