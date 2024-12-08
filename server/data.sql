--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

-- Started on 2024-12-06 11:13:30

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
-- TOC entry 4905 (class 0 OID 16636)
-- Dependencies: 222
-- Data for Name: nutrient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nutrient (nutrient_id, name, unit_name) FROM stdin;
8	fat	g
9	fiber	g
10	water	g
11	protein	g
12	carbs	g
13	calory	kcal
14	sugar	g
\.


--
-- TOC entry 4910 (class 0 OID 16649)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, user_name, gender, hashed_pw, current_weight, target_weight, timeframe) FROM stdin;
1	john_doe	M	$2b$12$6u5n9Rul2uHJkShTxU9TxeZyX5vRQpV85BOwDZ8zvcfxWoWgI4SuS	75	70	12
2	jane_smith	F	$2b$10$2tKSNzjMm3/q13lqehu2zOk7aWm/WSdRpqjDCQuIdvUpiXTE2H0nO	60	55	10
3	alice_w	F	$2b$10$lsp7QkmE8tG0j0KrU/GXDuBv9MhAzLPQv7BMfeJ.V6cjH6KX6Qriu	68.5	65	8
\.


--
-- TOC entry 4898 (class 0 OID 16619)
-- Dependencies: 215
-- Data for Name: goal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goal (user_id, nutrient_id, amount) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 16622)
-- Dependencies: 216
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
-- TOC entry 4900 (class 0 OID 16625)
-- Dependencies: 217
-- Data for Name: ingredient_contains_nutrient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ingredient_contains_nutrient (ingredient_id, nutrient_id, amount) FROM stdin;
12	14	0.0000
12	8	0.5020
12	9	0.0927
12	10	0.0432
12	11	0.2620
12	12	0.1620
12	13	6.0000
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
-- TOC entry 4902 (class 0 OID 16629)
-- Dependencies: 219
-- Data for Name: meal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meal (meal_id, type, datetime, user_id) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 16632)
-- Dependencies: 220
-- Data for Name: meal_includes_ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meal_includes_ingredient (meal_id, ingredient_id, amount) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 16640)
-- Dependencies: 224
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipe (recipe_id, title, total_time, instructions) FROM stdin;
1	Chef John’s Chicken Florentine	45 mins	1 pound fresh baby spinach\n2 skinless, boneless chicken breasts\n2 teaspoons kosher salt\n1/2 teaspoon ground black pepper\n1 pinch cayenne pepper\n1/4 cup all-purpose flour\n4 tablespoons olive oil\n1 tablespoon butter\n4 cloves garlic\n1/4 cup shallots or onions\n3 tablespoons white wine\n1 tablespoon lemon zest\n1/2 cup red bell peppers\n1 cup heavy cream\n##linh##\nWilt spinach in a large pot over medium-high heat. As soon as the spinach turns green, quickly transfer to a strainer and squeeze out most of the water. Transfer to a cutting board and roughly chop. Reserve until needed.\nSeason chicken on both sides with salt, black pepper, and cayenne pepper, and coat evenly all over with the flour.\nAdd 2 tablespoons olive oil to a nonstick pan, and heat over medium-high heat. Place chicken in, and once breasts are sizzling in the oil, reduce heat to medium. Cook breasts until just cooked through and a golden brown crust has formed, 4 to 5 minutes per side. Turn off heat and reserve.\nAdd remaining 2 tablespoons of olive oil and butter to the pan you plan to serve chicken in (see Chef’s Note). Turn heat to medium-high, and once butter melts, add garlic, shallots, and a pinch of salt. Cook, stirring, for about 1 minute. Add wine, and cook, stirring, until the wine reduces by half, a few minutes more.\nAdd lemon zest and red peppers, and cook, stirring for another few minutes. Stir in cream, and bring mixture up to a simmer. Season to taste with salt, black pepper, and cayenne.\nOnce cream simmers for a few minutes, and begins to reduce and thicken slightly, reduce heat to medium and stir in wilted spinach until evenly combined with cream sauce.\nPlace chicken back into the pan, and simmer on medium, until chicken is heated through, 3 to 4 minutes.\nServe with a drizzle of olive oil and another light grating of lemon zest.\nJOHN MITZEWICH "Chefs Note:"\nA nonstick pan is better for searing skinless chicken breasts, and can be used for the whole dish, as long as chicken is removed to a plate before proceeding with the sauce. I made the sauce in a separate pan, because I wanted a nicer looking pan for service.
2	Rustic Chicken and Dumplin's	2 hrs 15 mins	1 teaspoon whole chicken\n1 tablespoons Morton Nature’s Seasons seasoning blend\n3 (32 ounce) carton butter\n1 cups low-sodium chicken broth\n2 water\n1/2 teaspoon onion\n1 teaspoon poultry seasoning\n1 teaspoons minced garlic\n1 1/2 teaspoon salt\n1 medium black pepper\n3 medium carrots\n3 cups celery\n1 1/4 teaspoon flour\n1 baking powder\n1 cup egg\n1/2 cup whole buttermilk\n##linh##\nSeason chicken pieces all over with the Morton’s seasoning blend.\nMelt 3 tablespoons butter in a large Dutch oven over medium-high heat. Add chicken pieces, skin sides down, and cook until golden brown, 6 to 8 minutes. Turn chicken pieces and brown again, 6 to 8 minutes more.\nAdd broth and water; bring to a boil over high heat. Add onion, poultry seasoning, garlic, 1 teaspoon salt, and pepper. Reduce heat and simmer, covered, 20 minutes. Add carrots and celery. Leaving pot partially covered, continue simmering over low heat until vegetables are almost tender, about 20 minutes.\nMeanwhile, sift flour, baking powder, and remaining 1/2 teaspoon salt together in a large bowl. In a separate medium bowl, whisk together egg and buttermilk.\nCut chilled butter into dry mixture using a pastry cutter or two forks. Blend well to a crumbly consistency. Add buttermilk mixture and gently stir with a wooden spoon until combined. Cover with plastic wrap and refrigerate 30 minutes.\nTurn out dough onto a floured surface. Using your hands, pat dough to approximately 1-inch thickness and gently fold outer edges into center. Continue to gently fold—do not knead—until it comes together. Pat dough out again to approximately 1-inch thickness.\nRemove cooked chicken from Dutch oven (an instant-read thermometer inserted into thickest part of chicken should register 170 degrees F /76 degrees C) and put it on a plate. Cover with foil to keep warm. Skim fat from broth. Bring broth to a gentle boil over medium-high heat.\nUsing a knife, cut dough into 9 (2x2-inch) squares. Gently drop each square, one at a time, into boiling broth. Lower heat to medium and simmer, uncovered, until all dumplings rise to top and a toothpick inserted in center comes out clean, about 10 minutes. Return chicken to pot and simmer an additional 5 minutes.\nSpoon chicken and dumplin’s into bowls. Garnish with parsley.\nGrab your copy of Dolly & Rachel\\s "Good Lookin\\ Cookin\\"
3	Smoked Pork Chops with Sauerkraut	40 mins	1 tablespoon unsalted butter\n4 cooked pork chops\n1/3 cup onion\n1 (16 ounce) jar sauerkraut\n1 apple\n1/2 cup beef broth\n1 teaspoon bacon grease\n##linh##\nMelt butter in a large skillet over medium-high heat. Quickly sear meat for 2 minutes on each side, and remove from pan. Reduce heat to medium, add onions, and saute for 3 minutes.\nStir in sauerkraut, apple, beef broth, bacon grease, garlic, juniper berries, and bay leaf. Bring to a boil, reduce heat to low, cover, and simmer for 20 minutes.\nRemove bay leaf, add chops back to skillet, and nestle in the kraut. Simmer just until chops are warmed up, 3 to 5 minutes. Cooking further will dry them out.
4	Baked Burger Dogs	40 mins	2 tablespoons melted butter or oil\n1 1/2 pounds ground beef\n1 teaspoon kosher salt\n1/4 teaspoon ground black pepper\n1/8 teaspoon garlic powder\n1/3 cup red onion\n1/3 cup diced dill or sweet pickles, well drained\n6 ounces Cheddar cheese, shredded, divided\n##linh##\nPreheat the oven to 450 degrees F (230 degrees C). Grease a large 15x10-inch casserole dish with 1 tablespoon melted butter or oil.\nAdd beef, salt, black pepper, garlic powder, red onion, pickles, and 4 ounces shredded cheese to a bowl, and use a fork to mix until all ingredients are evenly combined.\nDivide beef mixture into 8 equal portions. Using damp fingers, shape 1 portion into a log and gently press onto the bottom of a hot dog bun. Lightly press bun together, trapping the meat, and place stuffed bun in the baking dish with meat facing straight up. Repeat until all 8 buns are stuffed.\nBrush all exposed areas of buns with remaining 1 tablespoon melted butter or oil, and sprinkle over remaining 2 ounces of cheese.\nBake in the preheated oven until meat is no longer pink at the center, and buns are golden brown and crispy on the edges, about 25 minutes. An instant-read thermometer inserted near the center should read 160 degrees F (70 degrees C).\nServe immediately with classic burger and hot dog toppings and condiments.\nJOHN MITZEWICH
5	Ground Beef Stuffed Zucchini	50 mins	3 large zucchini\n1 pound ground beef\n1 1/2 teaspoons kosher salt\n1 teaspoon pepper\n1/2 teaspoon onion powder\n4 ounces goat cheese with herbs\n1 large egg\n1/4 cup Italian breadcrumbs\n8 ounces tomato sauce\n1 1/4 cups water\n1/4 teaspoon allspice\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C). Scoop the inside of each zucchini half out to form a well for the filling. Chop reserved flesh and set aside.\nHeat a large nonstick skillet over medium-high heat. Add ground beef and cook, crumbling with a wooden spoon and stirring occasionally until browned, 5 to 7 minutes. Add 1 teaspoon salt, 3/4 teaspoon of pepper, and onion powder and stir to combine. Remove from heat and stir in goat cheese until melted. Stir in reserved zucchini flesh, egg, and breadcrumbs. Divide meat mixture into prepared zucchini halves.\nStir tomato sauce, water, allspice, and remaining salt and pepper together in a bowl. Pour mixture into a 9x13-inch baking dish and arrange zucchini side-by-side in the dish. Cover with foil.\nBake in the preheated oven until zucchini are tender, uncovering during last 10 minutes of baking, 30 to 40 minutes. Sprinkle with Parmesan cheese and parsley if desired.\nDOTDASH MEREDITH FOOD STUDIOS
6	Broccoli Crunch Salad	15 mins	1 cup mayonnaise\n1/4 cup apple cider vinegar\n3 tablespoons sugar\n1 teaspoon onion powder\n1/2 teaspoon black pepper\nNone salt to taste\n4 cups broccoli florets\n1 (12 ounce) bag broccoli slaw mix\n1/2 cup sunflower seeds\n1/2 cup dried cranberries\n1/2 cup red onion\n1 cup bacon\n##linh##\nCombine mayonnaise, apple cider vinegar, sugar, onion powder, pepper, and salt in a bowl. Whisk together until smooth and creamy. Set aside.\nIn a large bowl combine broccoli slaw, broccoli florets, red onion, sunflower seeds, dried cranberries, and bacon. Pour dressing mix on top of broccoli mix and toss until well coated.\nChill until ready to serve. From the Editor:\n"Need tips for cooking a small amount of bacon? Heres a quick way to cook bacon in the microwave."
7	The Best Teriyaki Ribs	8 hrs	2 racks baby back ribs\n2/3 cup soy sauce\n2/3 cup sake\n1/2 cup mirin\n1/3 cup rice vinegar\n1/3 cup brown sugar\n1/2 teaspoon ground black pepper\n1/2 teaspoon garlic powder\n1/8 teaspoon cayenne pepper\nNone marinade\n1 (1 inch) piece fresh ginger,\n3 cloves garlic\n2 tablespoons green onions,\n1/2 teaspoon sesame oil\n1/2 teaspoon sesame seeds\n##linh##\nUnwrap ribs, and use a sharp knife to make slashes through the membrane attached to the bone side of the racks. The membrane can also be peeled off using a paper towel. Cut racks in half for easier marinating.\nFor marinade, add soy sauce, sake, mirin, rice vinegar, brown sugar, black pepper, garlic powder, and cayenne to a bowl and whisk to combine.\nTransfer ribs into a container or resealable plastic bag, and pour over marinade. Ideally ribs should be just covered with marinade. Cover container or reseal the bag, and marinate in the refrigerator for 4 to 12 hours.\nPreheat the oven to 250 degrees F (120 degrees C). Place a large sheet of foil on a rimmed baking sheet, and arrange ribs on pan, bone side down. Reserve all leftover marinade in the refrigerator until needed.\nPlace another piece of foil on top, and fold edges of bottom foil up over top piece to seal. Be sure everything is folded and crimped upward to keep all meat juices in.\nBake in the preheated oven for 2 hours. Let rest 10 minutes before unwrapping. Transfer ribs to a plate and reserve.\nFor teriyaki glaze, pour leftover marinade into a saucepan, and add any cooking liquids from the rib pan. Add ginger, garlic, green onions, and sesame oil, and bring to a boil over medium-high heat. Cook until liquids reduce by about half and thicken slightly, about 10 minutes. Remove from heat.\nTurn oven up to 350 degrees F (175 degrees C). Place ribs back on the foil lined pan, and brush with teriyaki glaze. Bake for 10 minutes.\nRemove ribs from oven and brush generously with teriyaki glaze. Place back in oven for another 10 minutes. Repeat this process 3 or 4 more times, or until ribs are tender. Test with the tip of a knife, which should slide in with almost no effort.\nRemove and let rest for 10 minutes, then slice between rib bones and serve. Garnish with a sprinkling of toasted sesame seeds and sliced green onions, and serve extra teriyaki glaze alongside. Thin glaze with a little splash of water if it is too thick.\nJOHN MITZEWICH From the Editor:\nNutrition data for this recipe includes the full amount of marinade ingredients. The actual amount of marinade consumed will vary.
8	Slow Cooker Creamy Lemon Herb Chicken	2 hrs 15 mins	1/2 cup reduced sodium chicken broth\n2 cloves garlic\n3/4 cup heavy cream\n1/2 teaspoon Italian seasoning\n3/4 teaspoon salt\n3 (10 to 12 ounces) chicken breasts,\n1/2 tespoon freshly ground black pepper\n2 tablespoons olive oil,\n1 teaspoon lemon zest\n2 tablespoons lemon juice\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nStir together chicken broth, garlic, heavy cream, Italian seasoning, and 1/4 teaspoon salt in a 4- to 5-quart slow cooker.\nDOTDASH MEREDITH FOOD STUDIOS\nSeason chicken on both sides with remaining 1/2 teaspoon salt and pepper. Heat 1 tablespoon olive oil in a large skillet over medium. Working in batches, sear half of the chicken until browned, 3 minutes each side.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove chicken from skillet and place in slow cooker. Repeat with remaining oil and chicken. Cover and cook on low for 2 to 3 hours or until the chicken registers 165 degress F (74 degrees C) on an instant read thermometer.\nDOTDASH MEREDITH FOOD STUDIOS\nUsing tongs, transfer chicken and garlic cloves to a serving platter.\nDOTDASH MEREDITH FOOD STUDIOS\nWhisk together lemon juice and cornstarch in a medium microwave-safe bowl. Add cooking liquid to the bowl; microwave for 1 1/2 to 2 minutes or until thickened, stirring every 30 seconds. Stir lemon zest into sauce.\nDOTDASH MEREDITH FOOD STUDIOS\nServe chicken with lemon sauce and lemon wedges, if desired. Enjoy!\nDOTDASH MEREDITH FOOD STUDIOS
9	Classic Spicy Southern Fried Chicken	50 mins	1 cups whole chicken\n2 large buttermilk\n3 dashes eggs\n7 tablespoons hot sauce\n2 tablespoons kosher salt\n2 cups ground black pepper, divided\n2 tablespoon all-purpose flour\n1 teaspoon onion powder\n1 teaspoon garlic powder\n1 teaspoon paprika\n1 teaspoon dried oregano\n1 quart cayenne pepper\n##linh##\nCombine chicken, buttermilk, eggs, hot sauce, 1 tablespoon salt, and 1 tablespoon black pepper in a large bowl. Stir until coated. Cover and refrigerate for at least 20 minutes or up to overnight,\nCombine flour, remaining 1 teaspoons salt, remaining 1 tablespoon black pepper, onion powder, garlic powder, paprika, oregano, and cayenne in a large bowl; whisk until well combined. Set a wire rack over a rimmed baking sheet.\nRemove chicken from the refrigerator. Working with one piece at a time, remove from the marinade and allow excess to drip off into flour dredge. Drop chicken into flour dredge. Coat evenly in the flour mixture, pressing dredge onto chicken. Set pieces on the prepared wire rack. When all pieces are coated, dredge and press each piece a second time; return chicken to the wire rack.\nPour oil into a large Dutch oven to a depth of 1 inch. Heat over medium-high heat until it reaches 350 degrees F (175 degrees C). Place a clean wire rack over a paper towel-lined baking sheet.\nAdd a few chicken pieces to the hot oil and cook, turning once or twice, until golden brown on the outside, no longer pink at the bone, and the juices run clear, 10 to 15 minutes. An instant read thermometer inserted near the bone should read 165 degrees F (74 degrees C). Maintain the oil temperature around 320 degrees F (160 degrees C) during cooking. Remove chicken to the prepared clean wire rack. Return oil to 350 degrees F (175 degrees C) and repeat to fry remaining chicken. Serve immediately.\nFrom the Editor\nNutrition data for this recipe includes the full amount of marinade ingredients. The actual amount consumed will vary. We have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. The exact amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nDOTDASH MEREDITH FOOD STUDIOS
10	Twice Baked Chicken Pot Pie Potatoes	1 hr 35 mins	4 tablespoon usset potatoes\n1 teaspoons extra-virgin olive oil\n1 3/4 teaspoon kosher salt\n1/2 cup black pepper\n2/3 tablespoons heavy whipping cream\n6 teaspoons unsalted butter\n2 cups chicken stock base\n1 1/2 cups rotisserie chicken\n1 1/2 tablespoons carrots and peas\n2 teaspoons fresh parsley\n2 teaspoon fresh thyme\n1 cup shredded garlic\n##linh##\nGather all ingredients. Preheat oven to 400 degrees F (200 degrees C) with a rack positioned in the center.\nDOTDASH MEREDITH FOOD STUDIOS\nPierce potatoes all over with a fork and place on a large rimmed baking sheet lined with aluminum foil . Rub potatoes all over with olive and sprinkle evenly with 1 teaspoon of the salt and 1/4 teaspoon of the pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in preheated oven until skin is crispy, and a fork can easily be inserted into centers of potatoes, about 1 hour. Let cooked potatoes sit at room temperature until cool enough to handle, about 10 minutes; reserve baking sheet with foil.\nDOTDASH MEREDITH FOOD STUDIOS Microwave Method\nPlace potatoes on a microwave-safe plate; microwave potatoes on HIGH, until a fork can easily be inserted into centers of potatoes, 10 to 12 minutes.\nCut cooled potatoes in half lengthwise and scoop flesh into a large bowl, leaving about 1/8-inch border around the edges; place potato skins, cut side up on reserved baking sheet; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd heavy cream and butter to potatoes, mash until fully combined. Stir in chicken, carrots and peas, parsley, bouillon base, garlic, thyme, 1/4 cup of the Cheddar cheese, remaining 3/4 teaspoon salt, and 1/4 teaspoon pepper until evenly combined.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide chicken mixture evenly between reserved potato skins (about 1/2 cup each) and sprinkle evenly with remaining 3/4 cup cheese.\nDOTDASH MEREDITH FOOD STUDIOS\nBake at 400 degrees F (200 degrees C) until cheese is melted, about 10 minutes. Increase oven temperature to broil (do not remove baking from oven), and broil until cheese is browned, 3 to 5 minutes; garnish with additional parsley.\nDOTDASH MEREDITH FOOD STUDIOS DOTDASH MEREDITH FOOD STUDIOS
11	Easy Pot Roast	3 hrs 15 mins	4 pounds chuck roast\n4 teaspoons kosher salt\n2 1/2 teaspoons pepper\n2 teaspoons garlic powder\n2 tablespoons oil\n1 onion\n2 stalks celery, chopped\n4 carrots\n2 tablespoons butter\n2 1/2 tablespoons flour\n2 cups water\n2 teaspoons beef bouillon paste\n1 1/2 tablespoons tomato paste\n1 tablespoon Worcestershire sauce\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C). Season roast on both sides with 1 tablespoon salt, 2 teaspoons pepper, and garlic powder.\nHeat oil in a large Dutch oven over high heat. When oil begins to shimmer, place roast in pot and let cook, undisturbed, until browned, about 4 minutes. Flip and repeat on the other side until browned.  Brown on all sides, remove roast from pot, and set aside.\nAdd onion, celery, and carrots to drippings in the pan. Season with remaining salt and pepper and cook, stirring often, until onion begins to soften. Add butter to pot and allow it to melt. Add flour and cook, stirring constantly, about 1 minute. Add remaining ingredients and stir, using a spoon to scrape browned bits from bottom of pot.\nReturn roast to pan, along with any accumulated juices. Bring to a simmer, cover, and remove from heat.\nBake pot roast in the preheated oven and cook until roast is tender, about 2 1/2 hours.  Allow to rest 10 minutes before shredding and serving with vegetables and gravy.
12	Chicken Cordon Bleu Meatballs	50 mins	1/4 cup minced shallot\n1/4 cup half-and-half cream\n1 tablespoon finely chopped fresh parsley, plus more for garnish\n1 large egg, beaten\n2/3 cup Italian breadcrumbs, divided\n1/2 cup finely chopped deli ham (about 3 ounces)\n1 pound ground chicken\n1 teaspoon kosher salt\n1/2 teaspoon pepper\n1/2 teaspoon garlic powder\n1/2 teaspoon paprika\n2/3 cup panko breadcrumbs\n2 ounces Swiss cheese, cut into 12 cubes\n1/4 cup olive oil\n2 tablespoons butter\n1 1/2 tablespoons all-purpose flour\n1 cup chicken broth\n1 cup half-and-half cream or milk\n1 tablespoon whole grain Dijon mustard\n1/2 teaspoon kosher salt\n1/4 teaspoon freshly ground black pepper\n2 teaspoons lemon juice\n##linh##\nCombine shallot, half and half, parsley, egg, and 1/3 cup Italian breadcrumbs in a mixing bowl and stir together.\nAdd ham and chicken; season with salt, pepper, garlic powder, and paprika. Mix all ingredients together just until uniform.\nAdd remaining Italian bread crumbs and panko to a shallow dish and stir to combine. Roll meat mixture into 12 balls and stuff a Swiss cheese cube into the center. Roll each ball in breadcrumbs until evenly coated; place on a plate or baking sheet. Freeze meatballs for 10 minutes.\nMeanwhile, preheat the oven to 400 degrees F (200 degrees C) and set a wire rack inside a rimmed baking sheet.\nHeat oil in a large skillet over medium-high heat. Add meatballs and cook until browned on all sides, 5 to 10 minutes. Transfer meatballs to the prepared wire rack.\nBake meatballs in the preheated oven until an instant read thermometer, inserted near the center, reads 165 degrees F (74 degrees C), about 10 minutes.\nMeanwhile, make sauce. Wipe skillet clean and melt butter over medium heat. Whisk in flour and cook 1 minute. Whisk in broth and half-and-half. Stir in mustard, salt, and pepper and bring to a simmer. Reduce heat and simmer until sauce is rich and creamy, about 5 minutes. Remove from heat and stir in lemon juice.\nServe meatballs with Dijon cream sauce. DOTDASH MEREDITH FOOD STUDIOS
13	Boursin Chicken Baked Ziti	55 mins	1/2 cup pecorino Romano cheese\n2 tablespoons breadcrumbs\n1/2 pound ziti pasta\n1 tablespoon unsalted butter\n1/2 cup onion\n1 clove garlic\n1 teaspoon dried Italian herb seasoning\n1/2 teaspoon red pepper flakes\n1 cup cooked chicken\n1 cup fresh spinach\n1 1/2 cups heavy cream\n1 (5.2 ounce) package soft French cheese, such as Boursin® Garlic and Fine Herbs\n1/2 cup shredded mozzarella cheese\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C) and grease an 8x8-inch baking dish.\nCombine grated pecorino and breadcrumbs in a small bowl; set aside.\nBring a large pot of salted water to a boil. Add ziti, and cook until tender with a bite, about 11 minutes. Drain; reserve about 2 tablespoons pasta water.\nMeanwhile, melt butter in a large nonstick skillet over medium heat. Add chopped onion; cook and stir until onion begins to soften, 2 to 3 minutes. Stir in garlic, herb seasoning, and red pepper flakes, and cook about 30 seconds.\nTurn off heat. Stir in chicken, spinach, cream, Boursin, and mozzarella, stirring until cheeses are melted and ingredients are well combined.\nStir drained ziti into chicken mixture. Loosen the sauce with reserved pasta water, if needed. Pour chicken and sauce mixture into the prepared baking dish. Sprinkle pecorino and bread crumb mixture over the top.\nBake in the center of the preheated oven until bubbly and lightly browned, 20 to 30 minutes. Serve warm.
14	Spicy Dill Pickle Tuna Salad	10 mins	2 1/2 tablespoons mayonnaise\n1 tablespoon riracha\n2 12 ounce) cans hunk white Albacore tuna in water\n1 celery rib, chopped\n1 small carrot\n1 whole dill pickle\n##linh##\nWhisk mayonnaise and Sriracha together in a bowl. Add tuna, celery, carrot, pickle, and green onions, and stir until evenly combined.
15	Best Ever Cuban Sandwich	8 hrs 40 mins	1/2 cloves white onion\n15  garlic\n3 tablespoon oranges\n3 teaspoons limes\n1 teaspoons ground cumin\n2 teaspoons dried oregano\n2 (5 pound) ground black pepper\n2 cup kosher salt\n1 loaf pork shoulder roast\n1/4 tablespoons butter, softened, divided\n1 tablespoons Cuban bread,\n2 1/2 slices yellow mustard\n1 1/2 cups mayonnaise\n8 ounces Swiss cheese\n##linh##\nPrepare pork shoulder: Add onion, garlic, orange juice, lime juice, cumin, oregano, black pepper, and salt into a food processor or blender and process until smooth.\nPlace pork in the bottom of a heavy-bottomed Dutch oven or large baking dish and cut 3 or 4 large deep slits in the meat.  Pour marinade over pork, cover, and marinate in the refrigerator 4 hours or overnight.\nPlace Dutch oven with prepared pork, covered, in the oven and set the temperature to 325 degrees F (165 degrees C). Bake until pork is very tender, 3 to 4 hours. Remove from the oven; rest 15 minutes. Remove pork to a cutting board. Skim any fat from the cooking liquid, and set cooking liquid aside.\nShred pork with two forks, and discard any remaining fat and bone. Return pork to the pot, and add cooking liquid back into meat as needed to moisten.\nPreheat the oven to 375 degrees F (190 degrees C).  Heat a large skillet over medium heat.\nSpread about 2 tablespoons softened butter over cut sides of bread and place bread, buttered sides down, in skillet. Cook until buttered side is lightly browned and toasted, about 3 minutes.\nStir mustard and mayonnaise together in a small bowl. Spread about 2 teaspoons mustard mixture over bottom halves of bread and top with 1 slice of cheese, tearing as needed to fit the bread without hanging over the edges. Using tongs or a slotted spoon, add about 1/2 cup shredded pork to each sandwich, draining off any excess liquid. Top each evenly with ham, 3 pickle slices, and 1 cheese slice. Spread remaining mustard mixture evenly over top pieces of bread and place on top.\nReheat the skillet over medium heat. Spread about 1 tablespoon butter lightly on the outsides of the 4 bottom buns. Working 2 sandwiches at a time, place sandwiches, buttered side down, in skillet. Place 1 or 2 heavy-bottomed skillets on top of sandwiches to weigh them down. Cook until toasted and lightly golden brown, 2 to 3 minutes. Remove weighted skillets.\nSpread remaining 1 tablespoon butter over the 4 top halves of sandwiches, flip and press with weighted skillets again until toasted. Remove the first 2 sandwiches from skillet; repeat the toasting process with remaining sandwiches. Cut sandwiches in halves and serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS Cook’s Note\nYou will have leftover pork. Reserve for additional sandwiches or for another use.\nDOTDASH MEREDITH FOOD STUDIOS
16	Calico Beans	1 hr 25 mins	1 pound lean ground beef\n1/2 cup bacon, chopped\n1 (15 ounce) can pork and beans\n1 (15 ounce) can kidney beans, drained\n1 (15 ounce) can butter beans\n1 (15 ounce) can lima beans, drained\n1 cup packed brown sugar, or to taste\n1 cup chopped onion\n1/2 cup chopped celery\n1/2 cup ketchup\n3 tablespoons white wine vinegar\n1 teaspoon mustard powder\n##linh##\nGather all ingredients. Preheat the oven to 350 degrees F (175 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nCook ground beef and bacon in a large, deep skillet over medium-high heat until evenly brown. Drain and transfer meat to a 4-quart casserole dish.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd pork and beans, kidney beans, butter beans, lima beans, brown sugar, onion, celery, ketchup, vinegar, and dry mustard to the casserole dish; mix well.\nDOTDASH MEREDITH FOOD STUDIOS\nBake, covered, in the preheated oven until bubbly and heated through, about 1 hour.\nDOTDASH MEREDITH FOOD STUDIOS
17	Pumpkin Oreo Cupcakes	1 hr 55 mins	2 cups cream-filled chocolate sandwich cookies (such as Oreo\n5 tablespoons unsalted butter,\n2 tablespoons brown sugar\n1 pinch salt\n1/4 cup unsalted butter\n2 tablespoons vegetable oil\n1/2 cup white sugar\n1/2 cup light brown sugar\n1 large egg\n2 teaspoons vanilla extract\n1 cup canned pumpkin puree\n1/2 cup sour cream\n1 1/4 cups cake flour\n1 1/2 teaspoons ground cinnamon\n1/2 teaspoon salt\n1/2 teaspoon baking powder\n1/4 teaspoon ground nutmeg\n1/4 teaspoon baking soda\n1/4 teaspoon ground cloves\n1/4 teaspoon ground allspice\n1/2 cup unsalted butter\n4 ounces cream cheese\n1 3/4 cups confectioners sugar\n1 teaspoon vanilla extract\n1/8 teaspoon salt\n1/2 cup cream-filled chocolate sandwich cookies (such as Oreo\n3 tablespoons cocoa powder (such as The Cocoa Trader Black Dutched Cocoa Powder\n2 tablespoons heavy cream\n16 cookie cream-filled chocolate sandwich cookies (such as Oreo\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Line 2 cupcake pans with liners.\nPrepare crusts: Mix Oreo crumbs, melted butter, brown sugar, and salt together in a small bowl until combined. Place 1 packed tablespoon of crumb mixture into the bottom of about 16 cupcake liners and press into an even layer.\nBake crusts in the preheated oven for 10 minutes. Remove from oven; allow to cool. Do not turn oven off.\nMeanwhile, prepare cupcakes: Beat butter, vegetable oil, white sugar, and brown sugar with an electric mixer until light and fluffy. Add egg and vanilla and beat for 3 minutes on medium-high speed. Add pumpkin and sour cream and mix until combined. Add cake flour, cinnamon, salt, baking powder, nutmeg, baking soda, cloves, and allspice and mix until just combined.\nSpoon about 2 tablespoons of the pumpkin batter over each Oreo crust (see Note).\nBake cupcakes until tops spring back when lightly touched, 22 to 28 minutes. Allow cupcakes to cool in the pans for 10 minutes before removing to a wire rack to cool completely.\nFor frosting, beat butter with an electric mixer until smooth. Beat in cream cheese until thoroughly smooth and combined. Beat in 1 cup powdered sugar, vanilla, and salt until thoroughly combined, then beat in finely ground Oreos and black cocoa. Add in remaining 3/4 cup powdered sugar; beat until smooth and combined.\nPour in heavy cream, and mix on low speed. Gradually turn mixer speed up to medium-high and beat until frosting is light and fluffy, 3 to 4 minutes. Frost cooled cupcakes as desired and top with an additional Oreo cookie, if desired.\nCook’s Note\nSubstitutions: Dutch-processed cocoa can be substituted for the black cocoa. All-purpose flour can be substituted for the cake flour. Pumpkin pie spice can be substituted for the spices called for.\nYou will have enough extra batter to make several regular pumpkin cupcakes without the Oreo crust. Simply divide the extra batter between cupcake liners, filling no more than 2/3 full, and bake for 20 to 25 minutes.
18	One-Pot Cheeseburger Pasta	45 mins	1 pound yellow onion, finely chopped\n1 garlic\n6 cloves kosher salt\n1 teaspoon black pepper\n1/2 teaspoon tomato paste\n1 tablespoon onion powder\n2 teaspoons smoked paprika\n1 1/2 teaspoons garlic powder\n1 teaspoon beef broth\n4 cups canned crushed tomatoes\n1 15-ounce) drained hamburger dill pickle chips,\n1/4 cup yellow mustard\n3 tablespoons ketchup\n3 tablespoons cavatappi pasta\n8 ounces sharp Cheddar cheese\nNone (8-ounce) cream cheese, cut into pieces\n2 ounces toasted sesame seeds\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nHeat a large nonstick skillet over medium-high heat. Add beef, onion, garlic, salt, and black pepper, and cook, stirring occasionally, until\nbeef is no longer pink and onions are translucent, 6 to 8 minutes. Add tomato paste, onion powder, paprika, and garlic powder, and cook, stirring constantly, until tomato paste coats beef mixture, about 1 minute.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in broth, crushed tomatoes, pickles, mustard, and ketchup; bring to a boil over medium-high heat.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in pasta, making sure it is fully submerged in liquid. Cook over medium-high, stirring occasionally, until pasta is al dente, 8 to 10 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from heat and add Cheddar cheese and cream cheese, stirring constantly, until melted, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide pasta among bowls and garnish with pickle chips, sesame seeds, and scallions.\nDOTDASH MEREDITH FOOD STUDIOS
19	Summer Street Corn Pasta Salad	40 mins	8 ounces shell pasta\n2 tablespoons kosher salt\n5 large corn\n1 cup grape tomatoes\n4 green onions\n1/4 cup chopped cilantro\n2 jalapenos\n1 cup cotija cheese\n1/2 cup sour cream\n1/2 cup mayonnaise\n1/4 cup lime juice\n2 teaspoons chili powder\n2 teaspoons hot sauce\n##linh##\nBring a large pot of water to a boil. Add 2 tablespoons salt and pasta to water and cook, stirring often, until pasta is tender with a bite, 9 to 10 minutes. Drain and rinse with cold water just enough to bring the pasta to lukewarm or room temperature. Drain well. Add pasta to a large bowl and set aside.\nPreheat a grill or grill pan to high heat. Place corn on grill and cook, turning occasionally, until half of each cob has charred grill marks, yet retains a crisp texture, about 2 minutes on each side. Set corn aside until cool enough to handle.\nCut corn off of each cob and add corn to the pasta bowl. Reserve 1 tablespoon onions, and cilantro for garnish and add remaining onions and cilantro with tomatoes, jalapeno and cheese to the bowl.\nIn a separate bowl, whisk together remaining 2 teaspoons salt with remaining ingredients until well combined. Pour sour cream mixture over pasta mixture and toss well. Transfer pasta salad to a serving bowl and top with reserved onions and cilantro. Sprinkle with additional cheese and chili powder if desired. Serve immediately or refrigerate until ready to serve.
20	Sheet Pan Tomato Soup	50 mins	3 pounds plum tomatoes\n1 small sweet onion\n8 large garlic cloves\n2 tablespoons olive oil\n1 1/2 teaspoons kosher salt\n1/2 teaspoon black pepper\n1/8 teaspoon crushed red pepper\n1/4 cup heavy whipping cream\n1/4 cup basil leaves\n2 teaspoons light brown sugar\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPreheat oven to 450 degrees F (230 degrees C). On a large rimmed baking sheet, toss tomatoes with onion, garlic, olive oil, salt, black pepper, and crushed red pepper, if using, until vegetables are evenly coated.\nDOTDASH MEREDITH FOOD STUDIOS\nRoast in a preheated oven until juices are released and vegetables are very soft and charred in spots, 35 to 40 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer roasted vegetable mixture to a blender along with cream, basil, and brown sugar. Secure lid on blender, and remove center piece to allow steam to escape. Place a clean towel over the opening. Process until smooth, about 1 minute. Season with salt to taste.\nDOTDASH MEREDITH FOOD STUDIOS\nPour soup into bowls and garnish with a drizzle of olive oil, cracked black pepper, and thinly sliced basil leaves.\nDOTDASH MEREDITH FOOD STUDIOS DOTDASH MEREDITH FOOD STUDIOS
21	Mussels with Chorizo	20 mins	1 pound mussels\n1 tablespoon vegetable oil\n1  shallot, finely chopped\n1 cloves poblano pepper, chopped\n2 pound garlic\n1//2 tablespoon fresh ground chorizo\n1 (14.5 ounce) can pepper paste\n1 cup tomatoes\n##linh##\nSoak, clean, and debeard mussels (see Note).\nHeat oil in a Dutch oven or cast iron skillet. Add shallots, poblano peppers, and garlic. Stir until fragrant, 2 to 3 minutes.\nAdd chorizo; cook and stir until browned and crumbly. 5 to 7 minutes. Stir in panca pepper paste. Add roasted tomatoes and stock. Bring to a boil.\nReduce heat and bring broth to a simmer. Add mussels; cover and cook until shells open, about 5 minutes.\nFrom the Editor:\n"Some farm-raised mussels may come already prepared, but usually, you will have to soak, scrub, and debeard them. Heres everything you need to know about How to Clean Mussels."
22	Air Fryer Chicken Parmesan	40 mins	2 2 (8-ounce) boneless skinless chicken breasts, patted dry\n3/4 teaspoon kosher salt, divided\n1/2 teaspoon black pepper, divided\n1/3 cup all purpose flour\n2 large eggs, lightly beaten\n1 1/2 cups seasoned panko (Japanese-style breadcrumbs)\n1/4 cup armesan cheese, plus more for garnish\n2 tablespoons olive oil\n1/4 teaspoon crushed red pepper\n1/4 teaspoon garlic powder\n1 cup marinara sauce, plus more for serving\n1 cup mozzarella cheese\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nOn a cutting board, butterfly chicken by cutting each breast in half widthwise to create 4 thin pieces of chicken; season both sides with 1/2\nteaspoon of the salt and 1/4 teaspoon of the black pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nPlace flour, egg, and panko in 3 separate shallow dishes. Add Parmesan, oil, crushed red pepper, and garlic powder to panko; stir to coat. Add remaining 1/4 teaspoon salt and remaining 1/4 teaspoon black pepper to flour; stir to combine. Working with 1 chicken piece at a time, dredge chicken in flour; shake off excess. Dip in egg; let excess drip off. Dredge in panko mixture to coat; place on a plate.\nDOTDASH MEREDITH FOOD STUDIOS\nPreheat a 6-quart air fryer to 400 degrees F (200 degrees C) for 2 minutes. Working in two batches, add 2 chicken cutlets to the air fryer basket in a single layer. Cook until chicken is golden brown on both sides, about 5 minutes per side.\nDOTDASH MEREDITH FOOD STUDIOS\nTop each chicken piece with 1/4 cup marinara and 1/4 cup mozzarella cheese.\nDOTDASH MEREDITH FOOD STUDIOS\nSnugly fit all 4 breasts in a single layer in air fryer basket; cook at 400 degrees F (200 degrees C) until cheese is melted and browned and a thermometer inserted into the thickest portion of chicken registers 165 degrees F (73 degrees C), 2 to 3 minutes.\nDOTDASH MEREDITH FOOD STUDIOS
136	Creamy Sun-Dried Tomato and Basil Pasta	30 mins	8 ounces fettuccine\n1 pound boneless chicken breast,\n1 teaspoon salt\n3/4 teaspoon ground black pepper\n2 tablespoons extra-virgin olive oil\n1/4 cup sun dried tomatoes\n2 large cloves garlic\n1 cup heavy cream\n1 cup mozzarella cheese\n1/4 cup grated Parmesan cheese\n1/4 cup fresh basil,\n1/4 teaspoon red pepper flakes\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil. Cook fettuccine at a boil until tender yet firm to the bite, about 8 minutes; drain and keep warm.\nMeanwhile, season chicken with 1/2 teaspoon salt and 1/2 teaspoon pepper.\nHeat oil in a large skillet. Add chicken to skillet, cook and stir for 3 minutes. Add sun-dried tomatoes and garlic, and cook until fragrant, about 1 more minute. Add cream, mozzarella cheese, Parmesan cheese, and 2 tablespoons basil. Cook on low, stirring constantly, until cheese is melted.\nStir red pepper flakes and fettuccine into sauce. Season with remaining salt and pepper. Top with remaining basil.
23	Skillet Pork Chops with Mushroom Gravy	30 mins	4 tablespoons pork chops, about 3/4-inch thick\nNone tablespoons salt and freshly ground black pepper to taste\n2 olive oil, divided\n2 cups unsalted butter, divided\n1 teaspoon onion, sliced\n2 teaspoons mushrooms\n1/2 cup salt, or to taste\n2 cup minced garlic\n1 teaspoon chicken stock\n1/2 tablespoons white wine\n##linh##\nBlot chops dry with paper towels and season both sides with salt and pepper.\nHeat 1 tablespoon olive oil and 1 tablespoon butter in a large nonstick skillet over medium-high heat. When butter sizzles, add chops and brown on both sides, 4 to 5 minutes per side. Remove chops from the skillet and keep warm.\nTo the same skillet, add remaining olive oil and butter. When butter is melted, add onions, mushrooms, and 1/2 teaspoon salt, and cook, stirring, until onions begin to turn translucent and mushrooms are softened, 4 to 5 minutes.\nStir in minced garlic and cook until fragrant, about 30 seconds. Add chicken stock, wine, and dried thyme, and bring to a boil.\nReturn chops and any accumulated juices to the skillet, nestling chops down into vegetables and broth. Remove about 1/4 cup of broth for later use. Cover, reduce heat to low, and cook until an instant-read thermometer inserted near the center reads 145 degrees F (63 degrees C), 4 to 5 minutes. See note.\nStir cornstarch into the reserved cooking liquid, and stir until there are no lumps. While stirring the skillet sauce, add cornstarch mixture, and continue stirring 3 to 4 minutes, or until the sauce thickens.\nServe chops with mushrooms and sauce on top, and garnish with fresh thyme sprigs, if desired.\nCook’s Note\nInternal temperature is very important when cooking chops, and an instant-read thermometer is really handy. 145 degrees F (63 degrees C) internal temperature is the key for tender chops. When chops are returned to the skillet, if they are less than 3/4-inch thick, it’s very possible they would need only reheating time. If chops are thicker than 3/4-inch, they may need more simmering time.
24	Carrot Halwa	1 hr 45 mins	8 cups carrots\n8 cups whole milk\n1 cup sugar\n24 24\n6 tablespoons vegetable oil\n1/4 cup slivered almonds, toasted\n1/4 cup roasted pistachio nuts\n##linh##\nCombine carrots, milk, and sugar in a 6- to 8-qt. Dutch oven; bring to a boil over high heat, stirring occasionally.\n\nReduce heat to medium; cook, stirring occasionally, until liquid has evaporated, about 1 hour.\nMeanwhile, use a mortar and pestle or a rolling pin to break open cardamom pods. Coarsely crush seeds, discarding the shells. (If using ground cardamom, skip this step.)\nHeat oil in a very large skillet over medium-high heat. Cook half of cardamom until fragrant, about 30 seconds. Add carrot mixture and cook, stirring constantly, until thick and jammy, about 15 minutes. Remove from heat.\nStir in remaining cardamom. Sprinkle with almonds and pistachios just before serving. (Chill in an airtight container up to 5 days; freeze up to 3 months.)
25	Creamy Crockpot Macaroni and Cheese	2 hrs 10 mins	1 pound elbow macaroni\n2 tablespoons kosher salt, divided\nNone cooking spray\n1 1/2 cups whole milk\n1 (12 ounce) can evaporated milk\n1 large egg\n1 large egg yolk\n1/2 cup butter\n3 ounces cream cheese\n1/4 teaspoon pepper\n16 ounces sharp Cheddar cheese\n##linh##\nBring a large pot of water to a boil over high heat; add macaroni and 4 1/2 teaspoons salt. Cook pasta until just barely tender, about 5 minutes. Drain and rinse with cold water to stop the cooking process.\nSpray the inside of a slow cooker with cooking spray. Add pasta to the slow cooker and stir in milk, evaporated milk, butter, cream cheese and pepper. Whisk together egg and egg yolk in a small bowl until well combined; stir into pasta mixture. Set aside 3/4 cup shredded cheese. Stir remaining cheese into pasta mixture, cover, and cook on Low until bubbly and lightly browned around the edges, about 1 1/2 hours.\nSprinkle with reserved cheese, cover, and cook until cheese is melted, about 15 minutes more. Serve immediately. Alternatively, turn crockpot to Warm or Off until ready to serve.\nDOTDASH MEREDITH FOOD STUDIOS
26	Chicken à la King Pot Pies	50 mins	1/3 cup butter\n1 (8-ounce) package cremini mushrooms\n1 green bell pepper, chopped\n1 1/4 pounds boneless, skinless chicken thighs, cut into bite-size pieces\n1/3 cup flour\n1/2 teaspoon salt\n1 teaspoon garlic powder\n3/4 teaspoon paprika\n1/2 teaspoon mustard powder\n1/2 teaspoon black pepper\n1 1/2 cups whole milk\n1/3 cup water\n1 1/2 teaspoons chicken bouillon granules\n1/4 cup roasted red peppers\n1/2 (17.3-ounce) package puff pastry sheets (1 sheet), thawed\n1 large egg\n1 tablespoon whole milk\n##linh##\nMelt butter in a very large skillet over medium heat. Cook mushrooms and green bell pepper, stirring frequently, about 3 minutes. Add chicken and cook, stirring frequently, until vegetables are tender and chicken is almost cooked through, about 7 minutes more.\nStir in flour, salt, garlic powder, paprika, mustard powder, and black pepper. Cook, stirring constantly, for 1 minute.\nStir in 1 1/2 cups milk, hot water, and bouillon. Increase heat to medium-high and bring to a boil. Cook, stirring frequently, until thickened and bubbly, about 3 minutes. Stir in red peppers. Divide mixture evenly among 6 (8-ounce) ramekins or baking dishes.\nPreheat the oven to 400 degrees F (200 degrees C).\nRoll out puff pastry sheet to a 10x15-inch rectangle on a lightly floured surface. Cut pastry into 6 (5-inch) squares. Top each ramekin with a pastry square. Whisk together egg and 1 tablespoon milk in a small bowl. Brush pastry with egg mixture.\nArrange dishes on a foil-lined baking sheet. Bake until pastry is golden brown and filling is bubbly, about 15 minutes. Let cool 10 minutes before serving. Garnish with parsley.
27	Spicy Sausage Pasta Bake	1 hr 5 mins	1 pound rigatoni pasta\n1 tablespoon olive oil\n2 teaspoons butter\n1 small onion\n1 cup sliced mushrooms\n1/2 pound 93% lean ground beef\n1/2 pound hot Italian sausage\n4 cloves garlic, minced\n1 1/2 teaspoons Calabrian chili paste, or to taste\n1 (10 ounce) can diced tomatoes with green chiles\n22 ounces marinara sauce\n1 ounce creme fraiche\n1 cup fat-free half-and-half\n1 cup heavy cream\n8 ounces mozzarella, broken into pieces\n1 tablespoon parsley, or as needed\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in rigatoni and return to a boil. Cook pasta uncovered for 7 minutes, stirring occasionally. Drain.\nMeanwhile, add olive oil and butter to a heavy cast iron or other ovenproof skillet. When butter is melted, add onion to the skillet, and sauté until translucent, 3 to 4 minutes. Add mushrooms, and sauté until softened, about 3 minutes.\nAdd beef and sausage. Cook, breaking up meat with a spatula, until browned and crumbly, 5 to 7 minutes.\nAdd garlic, Calabrian chile paste, and RoTel. Sauté for about 1 minute. Stir in marinara sauce. Stir in crème fraîche, half-and-half, and whipping cream. Fold in rigatoni until combined; fold in half of mozzarella. Scatter remaining mozzarella on top of skillet.\nBake in the preheated oven until bubbly, about 30 minutes. Scatter parsley over top. Serve immediately.\nCook’s Note\nCalabrian chili paste is rather spicy. Use it sparingly unless you can tolerate spicy heat.
68	Ground Pork Tacos with Pineapple Salsa	30 mins	1 pound ground pork\n1 tablespoon soy-based liquid seasoning (such as Maggi® Jugo)\n½ teaspoon chipotle powder\n1 clove garlic, minced\n1 cup diced fresh pineapple\n¼ cup minced red onion\n1 small jalapeño pepper, seeded and minced\n2 tablespoons minced fresh cilantro\n½ (6 inch) lime, juiced\n##linh##\nCombine ground pork, liquid seasoning, ground chipotle powder, and garlic in a bowl. Set aside briefly for flavors to meld.\nMeanwhile, make the salsa: Combine pineapple, red onion, jalapeño, cilantro, lime juice, and salt in a bowl. Set aside.\nPreheat a large skillet over high heat. Crumble ground pork into the hot skillet. Cook and stir until pork is completely browned and edges begin to crisp, 7 to 10 minutes. Drain any excess grease. Place pork in a bowl and keep warm. Wipe out skillet.\nWarm tortillas in skillet over medium-low heat, about 20 seconds per side. Divide meat mixture between tortillas and top with pineapple salsa.\nCook’s Note\nJugo Maggi seasoning is the Mexican version of regular Maggi seasoning, and can be found in the International aisle of your supermarket. It will add a deep umami flavor to ground pork. If you cannot find either, you can combine equal parts soy sauce and Worcestershire sauce.
28	Copycat Panda Express Orange Chicken	40 mins	2 cups flour\n1/2 cup cornstarch\n2 teaspoons salt\n1/2 teaspoon white pepper\n1 large egg\n1 cup water\n2 tablespoons peanut or canola oil\n2 pounds boneless skinless chicken thighs, cut into 1-inch pieces\n2 cups peanut oil, or as needed, for frying\n1 tablespoon sesame oil, divided\n1/4 teaspoon crushed red pepper\n2 teaspoons ginger\n2 teaspoons minced garlic\n1/4 cup brown sugar\n1/4 cup orange juice\n1/4 cup white vinegar\n2 tablespoons soy sauce\n2 tablespoons cornstarch\n3 cups cooked rice, or as needed\nNone None  green onions for garnish\n1 teaspoon sesame seeds for garnish (optional)\n##linh##\nWhisk together flour, cornstarch, salt, and white pepper in a large bowl.  Add egg, water, and 1 1/2 tablespoons oil and stir to combine (mixture will be like a sticky batter). Add chicken pieces to batter and toss well to coat. Let chicken stand in refrigerator while oil heats.\nPour oil into a deep saucepan filled about 2 inches deep. Heat oil to 375 degrees C (190 degrees F).\nMeanwhile, for the sauce heat remaining oil and 2 teaspoons sesame oil in a large skillet over medium-high heat. Add crushed red pepper, ginger, and garlic and cook, stirring constantly, until fragrant, about 30 seconds. Stir in brown sugar, orange juice, vinegar, and soy sauce and bring mixture to a boil, stirring often.\nCombine 3 tablespoons cold water with cornstarch in a small bowl and stir until cornstarch is dissolved. Pour mixture into saucepan and stir to combine. Bring mixture to a boil and reduce to simmer, stirring constantly until sauce thickens. Turn heat off and keep warm while chicken is cooking.\nWorking in batches, add coated chicken pieces carefully to the hot oil. Oil temperature will reduce when food is added. Cook chicken at 350 degrees F (175 degrees C), stirring occasionally, until golden brown and crispy, 5 to 6 minutes. Remove chicken with a slotted spoon and drain on a wire rack set over paper towels. Bring oil temperature back up to 365 to 375 degrees F (185 to 190 degrees C) and repeat process with remaining chicken.\nReturn sauce mixture to medium heat, add more water if necessary if sauce thickens too much. Once hot, add in cooked chicken pieces and toss well to coat. Stir in remaining sesame oil and orange zest and serve over hot cooked rice. Garnish with green onions and sesame seeds if desired.\nDOTDASH MEREDITH VIDEO STUDIOS "Editors Note"\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. Amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nDOTDASH MEREDITH VIDEO STUDIOS
29	Sausage Stuffed Mini Peppers	20 mins	1/2 pound hot Italian sausage\n2/3 cup mushrooms\n1 pinch red pepper flakes\n3 green onions\n1 5.3-ounce) package herb flavored Gournay cheese (Such as Boursin\n##linh##\nCrumble sausage into a nonstick skillet over medium heat; cook and stir for 2 to 3 minutes.\nAdd mushrooms, red pepper flakes, and green onions, reserving about 3 tablespoons of green onion tops. Stir until sausage is browned, 3 to 4 more minutes. Drain any excess fat.\nRemove skillet from heat and stir in Boursin until melted and well blended with the other ingredients.\nFill each pepper half with about 1 1/2 tablespoons sausage mixture; place filled peppers on a baking sheet.\nPreheat the oven’s broiler.\nBroil until filling is lightly browned, about 3 minutes. Place on a serving tray and sprinkle with reserved green onion tops. Garnish with sprigs of fresh parsley or fresh basil. Serve warm or at room temperature.
30	Creamy Sausage Tortellini Soup	30 mins	1/2 pound hot Italian sausage\n3/4 cups celery\n3/4 cup carrots\n1/2 cup onion\n2 cloves garlic, pressed\n1 tablespoon flour\n14 1/2 ounces chicken broth\n1 (14.5 ounce) can diced tomatoes\n1/2 teaspoon Italian seasoning\n1 (8.8 ounce) package cheese tortellini\n1 cup heavy cream\n2 cups fresh spinach\n1/2 cup mozzarella cheese\n##linh##\nPlace sausage, celery, carrots and onions in a Dutch oven over medium heat. Cook and stir until sausage is browned and veggies are tender, 7 to 9 minutes. Add garlic and cook until fragrant, about 1 minute.\nStir in flour and until well incorporated. Pour in chicken broth, scraping bottom of pot to release all browned bits. Cook for 1 minute. Add diced tomatoes and Italian seasoning; bring to a boil.\nReduce heat, add tortellini, and simmer for 5 minutes. Add cream; cook and stir for 5 more minutes. Add mozzarella cheese and stir until melted; stir in spinach. Season with salt and pepper.
31	Creamy Lemon Shrimp Pasta	30 mins	¾ (16 ounce) package spaghetti\n1 pound uncooked medium shrimp, peeled and deveined\n2 tablespoons salt and ground black pepper to taste\n1 tablespoon finely chopped shallots\n¼ cup crushed garlic\n1 medium chicken broth\n½ cup lemon, zested and juiced\n5 large heavy cream\n1 pinch basil leaves, chopped\n##linh##\nBring a large pot of lightly salted water to a boil. Cook spaghetti in the boiling water, stirring occasionally, until tender yet firm to the bite, about 10 to 12 minutes.\nWhile the pasta is cooking, heat oil in a large skillet over medium heat. Season shrimp with salt and pepper; add to the pan and cook 30 seconds per side. Remove to a plate.\nAdd shallots to the skillet and cook for 2 minutes. Add garlic and cook until fragrant, about 1 minute. Stir in chicken broth, lemon zest, and 1/2 of the lemon juice; heat for 2 minutes. Reserve remaining lemon juice for another use.\nAdd cream and bring to a simmer. Return shrimp to the skillet and cook until heated through and pink, 2 to 3 minutes. Add basil.\nDrain spaghetti, reserving 1/4 to 1/2 cup pasta water.\nAdd spaghetti to the skillet. Add pasta water as needed and pepper flakes; toss to coat. Season with pepper if desired.\nCook’s Note\nYou can use linguine pasta instead of spaghetti and onions instead of shallots.
32	Sheet Pan Summer Gnocchi	45 mins	12 ounces gnocchi\n1  zucchini\n1 small summer squash\n1 pint onion,\n1 pound cherry tomatoes\n1 tablespoons tomato basil chicken sausage\n2 olive oil\n3 teaspoon garlic cloves\n1/2 tablespoons Italian seasoning\n##linh##\nHeat oven to 425 degrees F (220 degrees C).\nPlace gnocchi, zucchini, summer squash, onion, tomatoes, and sausage on a rimmed sheet pan. Drizzle olive oil evenly over mixture. Add garlic and Italian seasoning; toss to coat.\nBake in the preheated oven until vegetables are tender, about 35 minutes. Dollop pesto over the mixture, toss to combine, and serve immediately.\nFrom the Editor: "Never made pesto? Heres how."
33	Tex-Mex Pork Chops and Rice Skillet	45 mins	2 tablespoons olive oil\n4 boneless pork chops, about 3/4-inch thick\n2 teaspoons taco seasoning spice blend\n1 teaspoon ground cumin\n1 teaspoon smoked paprika\n1/4 teaspoon salt\n1 cup onion\n1 cup green bell pepper\n2 cloves garlic, minced\n2 (10-ounce) diced tomatoes and green chilies\n1 teaspoon chili powder\nNone freshly ground black pepper to taste\n1 1/4 cups chicken broth\n2 cups corn kernels, thawed\n2 cups zucchini\n1 cup uncooked rice\n##linh##\nHeat olive oil over medium heat in a 12-inch skillet. Season both sides of pork chops with taco seasoning, cumin, smoked paprika, and salt.\nPlace chops in the hot skillet and cook, turning once, until browned on both sides, about 2 minutes per side. Remove to a plate, and keep warm.\nIn the same skillet, cook and stir onion and bell pepper, until the vegetables just begin to pick up a little color, about 2 minutes. Add garlic and cook until fragrant, about 30 seconds.\nPour in diced tomatoes and green chilies, with their juices, and stir, being sure to scrape up any browned bits on the bottom of the skillet.\nAdd chili powder and black pepper to the chicken broth, and stir in.\nAdd thawed corn kernels, sliced zucchini, and uncooked rice. Stir until vegetables are evenly distributed, and make sure all the rice is submerged in the cooking liquid. Bring to a boil.\nNestle pork chops into the skillet contents, and add any accumulated juices from the chops. Cover, reduce heat to low, and simmer about 20 minutes.\nRemove cover, and continue to simmer until rice is tender and all the liquid is absorbed, about 5 minutes more. An instant-read thermometer inserted into the center of pork chops should read 145 degrees F (63 degrees C).\nGarnish with flat-leaf parsley or cilantro and lime slices. Serve warm.
34	Smoked Salmon Dip	15 mins	1 8 ounce) package cream cheese,\n6 ounces smoked salmon, diced\n2 tablespoons fresh dill\n1 lemon, zested\n1 tablespoon lemon juice\n1/2 tablespoon capers\n1 tablespoon red onion\n##linh##\nStir cream cheese, salmon, dill, lemon zest, lemon juice, capers, and red onion together in a large bowl until well blended. Cover and refrigerate until ready to serve. Garnish with additional dill, if desired.
35	Leftover Roast Chicken Coconut Soup	1 hr 40 mins	1 cups roast chicken carcass\n8 large water\n1/2 stalks onion\n2  celery\nNone tablespoon parsley stems (optional)\n1 tablespoons chicken bouillon cube or 2 teaspoons chicken bouillon paste\n1 bunch coconut oil\n2 teaspoon ginger\n1 ounces green onions\n1 cup kosher salt\n8 teaspoon portobello mushrooms\n1/2 teaspoon grated carrots\n1/2 can pepper\n1/2 garlic powder\n1 tablespoon unsweetened coconut milk\n1 cups lime, juiced\n##linh##\nPlace chicken in a large stock pot and add cold water, onions, celery, and parsley stems. Bring to a boil over high heat. Reduce heat to medium and simmer for 1 hour. Strain and reserve liquid. Separate any remaining chicken meat from the carcass and reserve. Discard remaining ingredients in the strainer. Stir bouillon into hot broth until dissolved.\nHeat oil in a large pot over medium-high heat. Add white and light green parts of onion, along with the ginger, and cook until fragrant, about 1 minute. Sprinkle with 1/2 teaspoon salt and stir. Add mushrooms and cook until lightly browned, about 3 minutes. Add carrots and remaining salt and cook 3 minutes, stirring often. Add pepper, garlic powder and 6 cups of reserved broth. Stir, scraping up any browned bits from the bottom of the pot. Add in coconut milk and reserved chicken pieces and bring to a simmer. Cook for 10 minutes. Add remaining green onions, lime juice, and Sriracha. Serve topped with 1/4 cup of rice per serving.
36	Creamy No-Bake Peach Tart	6 hrs 50 mins	9 teaspoon graham crackers\n1/4 teaspoon ground cinnamon\n1/8 pinch ground nutmeg\n1 cup salt\n1/2 tablespoons sliced almonds\n8 tablespoons unsalted butter\n2 0.25 ounce) packet honey\n1 tablespoons gelatin powder\n6 water\n3 tablespoons ripe peache\n6 tablespoon white sugar\n1 teaspoon lemon juice\n1/2 cup vanilla extract\n1/2 cup plain Greek yogurt\n##linh##\nLine a 9-inch tart pan with a removable bottom with a round of parchment paper. Lightly grease pan and paper.\nPrepare the crust: place graham crackers, cinnamon, nutmeg, and salt into the bowl of a food processor and process until fine crumbs form.\nPlace almonds in a skillet over medium-low heat. Cook, stirring constantly, until almonds are toasted, about 5 minutes. Remove from heat and pour almonds into the food processor bowl with the graham crumbs. Pulse until combined.\nMelt butter in the skillet using the residual heat of the pan, or if needed, place pan over low heat just until butter is melted. Add butter and honey to the food processor bowl, and pulse until mixture is thoroughly combined.\nPour crust mixture into prepared tart pan. Press crust firmly and evenly into the bottom and up sides of the pan. Place tart pan on a small baking sheet or cutting board, then freeze until crust is firm, at least 15 minutes.\nFor filling, place gelatin and cold water in a saucepan; let stand for 5 minutes to allow gelatin to bloom.\nMeanwhile, add peaches, sugar, lemon juice, vanilla, Greek yogurt, and heavy cream to the jar of a high-powered blender. Blend mixture until very smooth, 1 to 2 minutes. Taste, and add more sugar or lemon juice, if needed; then blend again to combine.\nPlace saucepan with gelatin over low heat; cook, stirring constantly, until gelatin dissolves, 1 to 3 minutes. With the blender running on low speed, carefully pour gelatin mixture into peach mixture. Gradually turn blender speed up to High and blend for 30 seconds.\nRemove tart crust from the freezer. Carefully pour peach mixture into the tart crust, only filling to the lip of the crust. You will have extra peach filling. Place extra filling into a ramekin or small dessert bowl and refrigerate until set; and enjoy as a separate dessert once fully chilled.\nRefrigerate tart, uncovered, for at least 6 hours to overnight to set.\nWhen ready to serve, remove tart from pan and remove parchment paper. If desired, top tart with sliced peaches and blueberries just before serving.
37	Baked Sweet And Sour Chicken	50 mins	1/4 cup olive oil, divided\n4 4 (6-ounce) boneless skinless chicken thighs, cut into 1 inch cubes\n1/4 teaspoon black pepper\n1 3/4 teaspoons kosher salt\n2 large eggs\n1 cup all purpose flour\n2 large multicolored bell peppers\n1/2 cup ketchup\n1/4 cup pineapple juice\n1/4 cup honey\n3 tablespoons soy sauce\n1 tablespoon rice vinegar\n3 cups cooked white rice\n##linh##\nGather all ingredients. Preheat oven to 475 degrees F (245 degrees C) with racks in upper and lower third positions. Grease each of 2 baking sheets with 1 tablespoon of the oil along 1 of the short sides; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nSprinkle chicken evenly with pepper and 1 1/2 teaspoons of the salt, and place in a bowl. Add eggs, and stir to coat. Place flour in a shallow bowl or baking dish. Working in batches, dredge chicken in flour, and shake off excess. Divide chicken between the prepared baking sheets, spreading in an even layer along short edges.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide bell peppers among baking sheets, spreading evenly along other short edges. Drizzle bell peppers evenly with remaining 2 tablespoons oil, and toss gently to coat.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven, rotating baking sheets halfway through, until chicken is browned in spots, about 15 minutes. Remove chicken and bell peppers from the oven; use a spatula to carefully flip chicken only . Return to the oven, and continue baking at 475 degrees F (245 degrees C) until chicken is crispy and a thermometer inserted into thickest portion of chicken registers 165 degrees F (73 degrees C), about 5 minutes.\nWhile chicken is baking, whisk together ketchup, pineapple juice, honey, soy sauce, rice vinegar, and remaining 1/4 teaspoon salt in a small saucepan. Bring to a boil over medium, whisking occasionally. Reduce to a simmer over medium-low, and cook, stirring often, until mixture is reduced to 3/4 cup and coats back of spoon, about 5 minutes. Remove from heat.\nDOTDASH MEREDITH FOOD STUDIOS\nPour 1/4 cup of the prepared sauce over chicken on the baking sheets; toss to coat evenly. Divide rice, chicken, and bell peppers evenly among bowls. Drizzle evenly with remaining 1/2 cup sauce. Serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS
38	Southern Butter Beans	2 hrs 50 mins	3 slices bacon, chopped\n1 yellow onion, chopped\n3 cloves garlic, sliced\n1 teaspoon black pepper\n6 cups chicken stock, plus more as needed\n1 pound lima beans\n1 (14 ounce) smoked ham hock\n2  bay leaves\n2 teaspoon thyme sprigs\n1/2 teaspoon kosher salt\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPlace bacon in a large Dutch oven or large pot, and cook over medium heat, stirring occasionally, until crispy, about 8 minutes. Add onion, garlic, and pepper; cook, stirring often, until onion is soft and translucent, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd chicken stock, beans, ham hock, bay leaves, thyme sprigs, and salt; bring to a boil over medium-high. Reduce heat to medium-low; cover and simmer, stirring occasionally, until beans are tender, 2 1/2 to 3 hours, adding stock or water as needed to keep beans covered by about 1/4 inch. Stop adding liquid during last 30 minutes of cooking so beans aren’t too brothy.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove ham hock; pick meat, discard hock, and stir meat into beans. Remove and discard bay leaves and thyme sprigs. Stir in sherry vinegar. Divide beans evenly among bowls. Garnish with thyme leaves and additional pepper.\nDOTDASH MEREDITH FOOD STUDIOS
39	Hash Brown and Bacon Omelet Cups	45 mins	3 cups cooking spray\n3 tablespoons frozen shredded hash brown potatoes, thawed\n1/8 teaspoon butter, melted\n1/8 teaspoon salt\n2 cups black pepper\n6 large shredded Mexican-style four-cheese blend\n1/4 cup eggs, lightly beaten\n1/4 teaspoon red bell pepper\n6 slices crushed red pepper (optional)\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C). Grease 12 (2 1/2-inch) muffin cups with cooking spray.\nWrap hash browns in a clean kitchen towel and squeeze to remove as much moisture as possible. Stir together hash browns, melted butter, salt, and black pepper in a large bowl. Press about 1/4 cup of the hash brown mixture into bottom and up the sides of each prepared muffin cup.\nBake in the preheated oven until lightly browned, 18 to 20 minutes.\nMeanwhile, stir together cheese, eggs, bell pepper, and crushed red pepper (if using) in a bowl.\nRemove muffin tin from the oven. Reduce oven temperature to 400 degrees F (200 degrees C). Top hash browns with half of the bacon. Top with egg mixture and remaining bacon. Bake until a knife inserted into centers comes out clean, 13 to 15 minutes. Garnish with chives.
150	Sloppy Joe Smash Burgers	15 mins	1 1/2 teaspoons olive oil\n1/3 cup onion\n1/3 cup green bell pepper\n1/4 teaspoon garlic powder\n1/2 pound ground beef\n1/2 teaspoon kosher salt\n1/2 teaspoon pepper\n1/2 cup Sloppy Joe sauce\n2 slices American cheese\n##linh##\nHeat a griddle or large skillet over medium high heat. Add oil, onion, and bell pepper; season with garlic powder and cook, stirring constantly, until softened and browned around the edges, about 5 minutes.\nArrange onion mixture into 4 mounds. Divide beef into 4 portions and place each portion over a mound of peppers and onions. Using a flat spatula, press down firmly on each section to form thin patties. Season evenly with salt and pepper and cook, undisturbed, until browned on the bottom and around the edges, about 3 minutes.\nFlip burgers and top each with 2 tablespoons of Sloppy Joe sauce. Place cheese slices over two of the burgers and top with remaining 2 burgers.\nToast each bun in pan drippings and add stacked burgers to buns. Serve with more sauce if desired.\nNICOLE MCLAUGHLIN
40	Shrimp and Chicken Stir-Fry	40 mins	1 1/2 cups seafood stock or chicken stock\n2 teaspoons sugar\n1 tablespoon Sriracha\n1/4 cup soy sauce\n1/2 teaspoon ginger\n1/2 teaspoon granulated garlic\n1/2 teaspoon white pepper\nNone salt to taste\n2 tablespoons cornstarch\n2 tablespoons vegetable oil\n1/2 pound boneless chicken breast\n3/4 cup onion\n1 cup celery\n1 cup sliced mushrooms\n1 cup bell peppers\n1 cup snow peas\n1 cup broccoli florets\n1 pound shrimp\n1 teaspoon sesame oil\n2 scallions\n1 teaspoon sesame seeds, or as needed\n##linh##\nStir stock, sugar, Sriracha, soy sauce, ginger, granulated garlic, white pepper, and salt together in a small bowl for the sauce. Whisk in cornstarch until no lumps remain; set aside.\nPat chicken strips dry with paper towels.\nHeat oil over medium-high heat in a large skillet or wok until oil shimmers. Add chicken and cook, stirring continually, until chicken is no longer pink at the center and juices run clear, 2 to 3 minutes. Place chicken on a plate; set aside.\nTo the same pan, add onions, celery, mushrooms, bell peppers, snow peas, and broccoli florets, and cook, stirring frequently, until vegetables are barely tender, 2 to 4 minutes. Return chicken to pan.\nStir sauce well, and slowly pour over chicken and veggies. Add shrimp; fully submerge shrimp in liquid.\nBring to a boil and cook, stirring frequently, until shrimp turns pink, opaque, and curls into a “C” shape, 3 to 5 minutes. Add sesame oil to taste. Give the skillet mixture a final stir, and garnish with sliced scallions and sesame seeds.
41	Sheet Pan Garlic Butter Steak Bites with Veggies	30 mins	1 pound potatoes,\n12 ounces green beans,\n1 small red onion,\n2 tablespoons olive oil,\n3/4 teaspoon kosher salt,\n1/2 teaspoon black pepper,\n1 pound sirloin steak,\n1 tablespoon Worcestershire sauce\n2 tablespoons butter\n1 clove garlic\n2 teaspoons fresh rosemary\n##linh##\nSet an oven rack about 6 inches from the heat source. Preheat the oven to 450 degrees F (230 degrees C). Lightly coat a 10x15-inch baking sheet with cooking spray.\nToss together potatoes, green beans, onion, 1 tablespoon oil, and 1/4 teaspoon each salt and pepper in a medium bowl. Spread vegetable mixture in an even layer on the prepared pan.\nRoast vegetables in the center of the preheated oven, stirring halfway through, 15 minutes.\nMeanwhile, toss together steak; Worcestershire sauce; and remaining 1 tablespoon oil, 1/2 teaspoon salt, and 1/4 teaspoon pepper in same medium bowl.\nPreheat the broiler. Push vegetables to edges of pan. Arrange steak in an even layer in center of pan. Broil, turning steak halfway through, until desired doneness (140 to 145 degrees F (60 to 63 degrees C) for medium), 6 to 8 minutes.\nMelt butter in a small saucepan over low heat. Add garlic and cook until fragrant, about 30 seconds. Drizzle garlic butter over steak and vegetables. Sprinkle with rosemary.
42	Shrimp Cocktail Wraps	20 mins	1 1/2 pounds shrimp\n2 Roma tomatoes\n1 cup English cucumber\n1/4 cup red onion\n1 teaspoon lime juice\n1/2 teaspoon cilantro\n1/4 teaspoon salt\n1/2 cup cocktail sauce\n8 8 inch) tortillas\n1 cup shredded lettuce\n##linh##\nPlace shrimp in a large bowl. Add tomatoes, cucumber, onion, lime juice, cilantro, and salt. Toss until evenly combined.\nStir in cocktail sauce until mixture is evenly coated.\nPlace a tortilla on a clean work surface. Place 1/8 cup shredded lettuce in a line in the center of the tortilla. Top lettuce with a layer of shrimp mixture, leaving the ends and sides of the tortilla uncovered. Fold in the sides over the filling. Starting with the bottom flap nearest you, start rolling, tucking the flap firmly inwards as you roll. Place on a plate seam side down. Repeat with remaining tortillas.
43	Creamy Caramelized Onion Pasta	40 mins	8 ounces pasta\n2 onions,\n2 tablespoons butter\n3 tablespoons oil\n1 teaspoon white sugar\nNone salt and freshly ground black pepper\n1 tablespoon sherry vinegar\n1/4 cup water\n1/2 cup milk\n1 garlic clove,\n3 sprigs thyme, leaves only\n1/4 cup grated Parmesan cheese\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in pasta and return to a boil. Cook pasta uncovered, stirring occasionally, until tender yet firm to the bite, about 10 minutes, or according to package directions.\nMeanwhile, add butter and oil to a deep skillet over high heat. Add onions, and cook and stir until they take on a little color. Add sugar, salt, pepper, vinegar, and water, and continue to cook on high heat, stirring constantly, until onions are very tender and dark brown, about 15 minutes.\nTurn heat down to low;  add milk, garlic, thyme, and grated Parmesan. Blend the sauce until smooth with an immersion blender.\nDrain pasta, reserving a small amount of water to thin sauce if needed. Stir pasta into sauce.\nLUTZFLCAT
44	Beef Miso Ramen	25 mins	1 (8 ounce) beef sirloin steak\n½ cup gluten-free soy sauce (tamari)\n1 teaspoon coconut oil\n4 cups beef broth\n2 teaspoons miso paste\n1 teaspoon minced garlic\n1 teaspoon sesame oil\n2 (3 ounce) packages ramen noodles\n##linh##\nCombine steak and soy sauce in a plastic container with a lid. For best flavor results, marinate in the refrigerator for 2 hours.\nRemove steak from the marinade and shake off excess. Discard the remaining marinade.\nHeat coconut oil in a skillet over medium-high heat. Add steak and cook until firm and reddish-pink and juicy in the center, 3 to 4 minutes per side. An instant-read thermometer inserted into the center should read 130 degrees F (54 degrees C) for medium-rare. Remove from skillet and allow to rest for 10 minutes.\nWhile the steak is resting, combine broth, miso paste, garlic, and sesame oil in a saucepan over medium heat; bring to a boil. Once broth is at a slow boil, add ramen noodles. Cook until noodles are soft, about 3 minutes. Season with salt and pepper.\nTransfer broth and noodles to 2 bowls. Slice steak and place on top.\nFrom the Editor\nNutrition data for this recipe includes the full amount of marinade ingredients. The actual amount of marinade consumed will vary.
45	Grilled Tuna Steaks with Wasabi-Blueberry Sauce	1 hr	1 tablespoon vegetable oil\n1 shallot, minced\n1 (6 ounce) package fresh blueberries\n1 tablespoon honey\n1 tablespoon soy sauce\n1 teaspoon rice vinegar\n1 teaspoon wasabi paste\n1 1/2 pound sushi-grade tuna steaks\n1/4 teaspoon salt\n1/4 teaspoon black pepper\n1 tablespoon furikake seasoning, or more as needed\n##linh##\nFor sauce, heat oil in a small saucepan over medium heat. Add shallot; cook, stirring occasionally, until softened, 3 to 5 minutes. Add blueberries, honey, soy sauce, and vinegar. Bring to a boil; reduce heat and simmer, uncovered, until most of blueberries have burst, about 5 minutes. Transfer to a medium bowl. Set bowl in a larger bowl filled with ice water. Let cool completely, about 20 minutes. Stir in wasabi paste.\nPreheat grill to medium-high heat (375 to 400 degrees F (190 to 200 degrees C)). Pat tuna steaks dry with paper towels. Season with salt and pepper. Spread furikake seasoning on a small plate. Roll edges of tuna steaks in furikake to coat.\nOil grill grates. Grill tuna, covered, turning halfway through, about 4 minutes. (Tuna should be pink in center.) Transfer tuna to a cutting board; tent with foil and let stand 5 minutes. Thinly slice tuna steaks and serve over rice with sauce. Garnish with cilantro.\n"Cooks Notes:"\nLessen Sodium: Omit or reduce soy sauce. Instead of rolling tuna steaks in furikake, reduce amount to 1/2 teaspoon and sprinkle over sliced tuna as a garnish.\nBoost Protein: Round out this meal with protein-packed steamed edamame.\nShrink the Sweet Stuff: Reduce honey by 1 teaspoon to cut added sugars by two-thirds.
46	Pork Chop Stir-Fry	30 mins	3 tablespoons vegetable oil, divided\n3 cups small cauliflower florets\n2 medium carrots, julienned\n1 ½ cups frozen corn, thawed\n½ cup frozen peas, thawed\n1 pound boneless pork chops, cut into stir-fry strips\n2 stalks green onions, thin sliced\n2 cloves garlic, minced\n¾ teaspoon ground ginger\n½ teaspoon chili powder\n1 cup water\n¼ cup soy sauce\n4 teaspoons honey\n2 teaspoons chicken bouillon granules\n2 tablespoons cold water\n4 teaspoons cornstarch\n¼ cup salted peanuts\n3 cups hot cooked rice\n##linh##\nHeat 2 tablespoons oil in a large skillet over medium-high heat. Add cauliflower and stir-fry for 2 to 3 minutes. Add carrots and stir-fry for 2 minutes. Add corn and peas; cook until veggies are crisp-tender, about 2 minutes. Remove all veggies to a bowl and keep warm.\nAdd remaining 1 tablespoon oil to the skillet. Add pork and stir-fry for 2 minutes. Add green onions, garlic, ginger, and chili powder; fry until pork is no longer pink, about 2 to 3 minutes. Remove from the skillet and keep warm.\nAdd 1 cup water, soy sauce, honey, and bouillon to the skillet. Stir 2 tablespoons cold water and cornstarch together in a small bowl, then gradually add to the skillet, stirring constantly; bring to a boil. Cook and stir until thickened, about 2 minutes.\nReturn vegetables and pork to the pan; cook until heated through. Stir in peanuts and serve over hot cooked rice.
47	Seafood Boil in a Bag	1 hr 5 mins	2 teaspoons salt\n2 pounds red potatoes\n3 ears corn\n1 head garlic\n1 pound smoked sausage\n1 small onion, chopped\n1/3 cup white wine\n1/2 cup water\n1 1/2 cups butter\n1/4 cup hot sauce\n2 tablespoons lemon pepper\n2 tablespoons seafood seasoning\n1 1/2 tablespoons Cajun seasoning\n1 tablespoon paprika\n2 teaspoons granulated garlic\n1 teaspoon cayenne pepper\nNone large oven or turkey cooking bags\n8 ounces button mushrooms\n4 large hard-boiled eggs\n4 snow crab clusters\n2 pounds shrimp\n##linh##\nPlace potatoes in a large pot and cover with water by 3 inches.  Add 2 teaspoons salt and bring to a boil; boil 5 minutes, then add corn and garlic. Return to a boil and cook until potatoes are tender, about 10 minutes. Drain and set aside.\nHeat a deep skillet or saucepan over medium heat, add sausage, increase heat to medium-high, and cook until sausage is browned on both sides, about 3 minutes. Remove sausage from pan and set aside.\nPreheat the oven to 400 degrees F (200 degrees C) with an oven rack set in the lower third of the oven.\nAdd onion to skillet with sausage drippings and cook, stirring constantly, until onion begins to soften, about 3 minutes. Stir in wine, and scrape the browned bits from the bottom of the pan; stir in water.\nAdd butter, hot sauce, lemon pepper, Old Bay, Cajun seasoning, paprika, granulated garlic, and cayenne to the skillet; reduce heat to medium and cook, stirring constantly, until butter is melted and everything is well combined. Remove from heat.\nOpen the oven bag in a large bowl or pot and hang the top edge over the top of the bowl to make filling easier. Place corn and potatoes in first. Add mushrooms, eggs, crab legs, shrimp, and sausage, and pour butter mixture over. Squeeze two lemon halves into the bag. Tie bag tightly at the top, allowing room for the bag to fill with steam. (Double bag if necessary to prevent punctures from the seafood.) Very carefully toss contents of bag to coat everything with sauce and place bag in a large baking dish.\nBake in the preheated oven until the bag has filled with steam, shrimp is opaque, and crab is cooked through, about 30 minutes.\nCarefully cut bag open; squeeze remaining lemon over the top and enjoy.\nDOTDASH MEREDITH FOOD STUDIOS
48	Sheet Pan Salmon and Veggies	40 mins	2 tablespoons olive oil\n3  bell peppers,\n2 to 3 cup zucchini,\n2 summer squash,\n1 cloves grape tomatoes, halved\n1 teaspoon red onion, thinly sliced\n6 teaspoon garlic, chopped\n1 pound herbs\n1/2  salt\n1 teaspoons salmon\n1 clove orange, juiced\n1/2 teaspoon lemon, juiced\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C).\nPour olive oil into a resealable plastic bag. Add bell peppers, zucchini, summer squash, tomatoes, red onion, chopped garlic, herbs, and salt. Toss to coat. Spread vegetables out evenly on a baking sheet. Lay salmon, skin side down, on top of vegetables.\n\nStir orange juice, lemon juice, agave syrup, minced garlic, and chile flakes together in a small bowl; spoon glaze over the salmon. Glaze will be thin. Season with salt.\nBake in the preheated oven until fish flakes easily with a fork, about 20 minutes.
49	One Pan Lemon Garlic Parmesan Chicken	1 hr 25 mins	3 tablespoons freshly squeezed lemon juice\n1 teaspoon lemon zest\n1/4 cup extra virgin olive oil\n1/2 teaspoon oregano\n1 teaspoon garlic powder\n2 1/2 teaspoons kosher salt, divided\n1 teaspoon pepper, divided\n2 pounds Yukon gold or red potatoes, cut into 1-inch cubes\n3  boneless skinless chicken breasts\n1 tablespoons green beans\n3 tablespoons butter, divided\n2 cup mayonnaise\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C).\nWhisk together lemon juice, lemon zest, olive oil, oregano, garlic powder, 2 teaspoon salt, and 1/2 teaspoon pepper in a bowl until well combined.\nSlice chicken in half lengthwise and pound slightly to a uniform thickness  (Alternatively, you can use 6 chicken cutlets), and place chicken in a shallow dish or large resealable bag. Pour half of the olive oil mixture over chicken and toss well to coat. Let chicken marinate 30 minutes while potatoes are prepared.\nAdd potatoes to remaining marinade and toss well. Transfer potatoes to a lightly greased 9x13 baking dish and season with remaining salt and pepper.\nBake in the preheated oven until potatoes are just tender, tossing halfway through, 25 to 30 minutes.\nMeanwhile, prepare green beans according to microwave package directions.\nRemove potatoes from the oven and toss green beans with potatoes. Top with dollops of half of the softened butter. Remove chicken from marinade and place on top of potatoes and green beans. Reserve any remaining marinade in the bowl.\nAdd remaining butter, mayonnaise, and Parmesan cheese to the bowl with any remaining marinade and mix well. Spread butter mixture over evenly over chicken and return pan to oven.\nBake in the preheated oven until chicken is cooked through, 20 to 25 minutes. If you like your chicken browned, broil on high the last 2 minutes to brown the tops of the chicken. Sprinkle with parsley if desired.\nDOTDASH MEREDITH VIDEO STUDIOS
50	Caramelized Onion Pasta	45 mins	2 tablespoons olive oil\n2 tablespoons unsalted butter\n3 large onions\n3 cloves garlic, minced\n1/4 cup sun-dried tomatoes\n1 1/2 tablespoons soy sauce\n1 1/2 tablespoons chili onion crunch\nNone salt and freshly ground black pepper\n8 ounces spaghetti\n1 tablespoon fresh parsley\n##linh##\nHeat olive oil and 1 tablespoon butter in a large skillet over medium-low heat. Stir in onions until well coated. Cook, stirring occasionally, until they start to caramelize and turn golden brown, 20 to 25 minutes. You can add water, 1 tablespoon at a time, as onion mixture cooks to speed up caramelization and keep onions moist.\nAdd garlic and cook until fragrant, about 1 minute. Stir in sun-dried tomatoes, soy sauce, chili onion crunch, and season with salt and pepper.\nMeanwhile, bring a large pot of lightly salted water to a boil. Cook spaghetti in the boiling water, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Drain, reserving 1/2 cup pasta water.\nTransfer pasta to the skillet with caramelized onions. Toss everything together until well coated, and stir in remaining tablespoon of butter. Add reserved pasta water, if needed, a tablespoon at a time.\nGarnish with chopped parsley and Parmesan cheese, and serve.
151	Shrimp and Bacon Pasta Salad	1 hr	1 pound pasta\n6 slices bacon\n1 pound cooked shrimp\n1   red bell pepper\n1 cup yellow bell pepper\n1 tablespoons cucumber\n3 cup green onions\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in pasta and return to a boil. Cook, uncovered, stirring occasionally, until tender yet firm to the bite, about 10 minutes, or according to package directions. Drain, rinse with cold water, and let cool to room temperature, about 20 minutes.\nMeanwhile, place bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain bacon slices on paper towels. Crumble when cool enough to handle.\nCombine pasta, shrimp, bacon, red bell pepper, yellow bell pepper, cucumber, green onions, mayonnaise, olive oil, cherry tomatoes, and peach in a large bowl and mix well. Taste and season with Cajun seasoning.\nRefrigerate until ready to serve.
51	Cheesy Bacon Slider Bake	45 mins	1 (18 ounce) package Hawaiian sweet rolls\n2 cups shredded Cheddar cheese, divided\n1 pound ground beef\n1 small onion, chopped\n½ (14 ounce) can diced tomatoes with garlic and onion\n1 ½ teaspoons Dijon mustard\n1 ½ teaspoons Worcestershire sauce\n¼ teaspoon salt\n¼ teaspoon ground black pepper\n12 cup bacon strips, cooked and crumbled\n½ tablespoons butter\n2 tablespoon brown sugar\n1 teaspoons Dijon mustard\n2 tablespoon Worcestershire sauce\n##linh##\nPreheat oven to 350 degrees F (175 degrees C). Grease a 9x13-inch baking pan.\nPlace rolls, without separating them, on a flat work surface. Cut in half horizontally. Arrange bottom half in the prepared pan. Sprinkle 1 cup Cheddar cheese on top.\nBake in the preheated oven until cheese is melted, 3 to 5 minutes.\nCook and stir beef and onion in a skillet until beef is browned, 5 to 8 minutes. Drain grease. Stir in tomatoes, 1 1/2 teaspoons Dijon mustard, 1 1/2 teaspoons Worcestershire sauce, salt, and pepper. Cook until fully combined, 1 to 2 minutes.\nSpoon beef mixture over rolls. Sprinkle remaining 1 cup Cheddar cheese and bacon on top. Cover with top half of rolls.\nCombine butter, brown sugar, 1 tablespoon Dijon mustard, and 2 teaspoons Worcestershire sauce in a microwave-safe bowl. Cover and microwave on high until butter is melted, about 1 minute. Stir until blended and pour over rolls. Sprinkle sesame seeds on top.\nBake in the preheated oven, uncovered, until golden brown, 20 to 25 minutes.
52	Turkey Roulade	1 hr 40 mins	1 tablespoon unsalted butter\n1 onion\n2 cloves garlic\n8 ounces pork sausage\n1 cup fresh bread crumbs\n2 tablespoons dried cranberrie\n1 tablespoon fresh parsley\n1/2 teaspoon dried thyme\n1/2 teaspoon sage\nNone  salt and freshly ground black pepper\n1 (24 ounce) package large egg,\n1 turkey breast tenderloins\nNone tablespoon salt and freshly ground black pepper to taste\n1 teaspoon unsalted butter\n1 cup olive oil\n1/4 cups white wine\n1 1/4 tablespoon chicken stock or broth\n1 teaspoon cornstarch\n##linh##\nPreheat the oven to 350 degrees F (180 degrees C).\nFor stuffing, melt butter in a skillet over medium heat. Add onions and garlic and sauté until softened, 3 to 4 minutes. Add sausage to the skillet, and stir until crumbled and lightly browned, 4 to 5 minutes. Drain sausage, stir in bread crumbs, cranberries, parsley, thyme, sage, egg, salt, and pepper; mix well.\nPlace turkey tenderloins on a cutting board. Butterfly each by cutting lengthwise almost all the way through, but not quite, so they can be opened up like a book to increase the surface area. Cover each tenderloin with 2 sheets of plastic wrap. Using a meat mallet or pounder, flatten to a thickness of about 1/3-inch, and season with salt and pepper.\nLay the 2 tenderloins side by side, slightly overlapping the edges, to form 1 large tenderloin, and give it a tap with the meat pounder to seal the tenderloins together. Spread evenly with stuffing, leaving about a 1/3-inch border around the edges. Carefully roll up tightly, jelly roll style, and tie the tenderloin with 4 to 5 pieces of kitchen string to secure and hold together. The roulade can be covered and moved to the fridge at this point to be cooked later if you prefer.\nHeat butter and oil in an ovenproof roasting pan over medium heat, add tenderloin, and brown on all sides, 8 to 10 minutes. Pour wine and 1 cup chicken stock over the meat; cover the pan.\nBake in the preheated oven, basting occasionally, until a meat thermometer, inserted into the center, reads 160 degrees F (71 degrees C), 35 to 45 minutes. Remove turkey from pan, and loosely tent with a piece of aluminum foil for about 10 to 15 minutes.\nWhisk remaining chicken stock with cornstarch and Dijon, and stir into the pan. Simmer over medium heat, stirring constantly, until thickened, 3 to 4 minutes.\nRemove strings from turkey tenderloin, and slice into 1/2-inch thick slices. Arrange on a serving platter, drizzle with the gravy, and serve.\nCook’s Note\nThis is a little work upfront, but allows you more time to spend with family and friends rather than in the kitchen. The reward comes later when it’s getting close to putting your meal on the table. Little effort at this point on the turkey, allowing you to focus on your side dishes.
53	Giant Lazy Meatballs	2 hrs 20 mins	4 large slices white bread\n1/2 cup milk\n1 pound ground beef\n1 pound ground pork\n2 1/2 teaspoons kosher salt\n1 teaspoon ground black pepper\n1/4 teaspoon dried oregano\n1 teaspoon onion powder\n1 teaspoon garlic powder\n1 pinch cayenne pepper\n1 tablespoon olive oil\n1/4 cup grated Parmigiano-Reggiano cheese\n1/3 cup chopped fresh Italian parsley (optional)\n2 large eggs,\n2 cups tomato sauce\n2 ounces Monterey Jack cheese\n1/4 cup Parmigiano-Reggiano cheese\n1 tablespoon Italian parsley\n##linh##\nCrumble bread into a bowl and mix in milk thoroughly using a fork. Let stand for 10 to 15 minutes.\nCombine beef and pork in a large bowl and mix well using 2 forks. Add salt, black pepper, oregano, onion powder, garlic powder, cayenne, olive oil, Parmesan, parsley, eggs, and the breadcrumb mixture. Mix using 2 forks until everything is evenly combined. Wrap and chill in the refrigerator for 1 hour.\nPreheat the oven to 400 degrees F (200 degrees C). Lightly grease a roasting pan or baking dish. Using damp hands, roll 4 giant meatballs, and place in the prepared pan.\nBake in the preheated oven until an instant read thermometer inserted near the center of meatballs reads 160 to 165 degrees F (71 to 74 degrees C), 40 to 45 minutes.\nRemove meatballs from the oven, and spoon tomato sauce evenly over meatballs. Sprinkle first with Monterey Jack cheese, and then with Parmigiano-Reggiano.\nReturn meatballs to the oven, and bake until sauce is hot and cheese is melted, 5 to 10 minutes more. Top with parsley and serve.\nJOHN MITZEWICH
54	Fall Harvest Orzo Pasta Salad	1 hr 15 mins	8 slices bacon\n1 small butternut squash\n1 small red onion\n1/4 cup plus 2 tablespoons olive oil\n2 teaspoons kosher salt\n1 teaspoon pepper\n1 teaspoon fresh thyme\n1 pound orzo pasta\n3 tablespoons apple cider vinegar\n2 tablespoons maple syrup\n1 tablespoon mustard\n1/4 teaspoon garlic powder\n8 ounces Brussels sprouts\n3/4 cup walnuts\n1/2 cup dried cranberries\n1/2 cup feta cheese (optional)\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line a rimmed baking sheet with foil or parchment; place bacon on the sheet.\nBake bacon in the preheated oven until crisp, about 10 minutes. Remove bacon from tray and drain on paper towels. Reserve drippings in the pan.\nIncrease the oven temperature 425 degrees F (220 degrees C).\nAdd butternut squash, onion, 2 tablespoons oil, 1 teaspoon salt, 1/2  teaspoon pepper, and thyme to the pan with bacon drippings and toss to coat.\nRoast squash in the preheated oven until browned, about 20 minutes. Set aside.\nMeanwhile, bring a large pot of lightly salted water to a boil. Cook orzo in the boiling water, stirring occasionally, until tender yet firm to the bite, about 10 minutes. Drain and set aside to cool.\nFor vinaigrette, add vinegar, maple syrup, mustard, garlic powder, remaining salt, and remaining pepper into a bowl. Whisk in remaining 1/4 cup olive oil until well combined. Set aside.\nAdd pasta, Brussels sprouts, walnuts, cranberries, and vinaigrette to a large bowl and toss to combine. Gently stir in cooked vegetables and bacon. Serve immediately or refrigerate until ready to serve.\nFrom the Editor\n"Heres everything you need to know about how to toast nuts."\nDOTDASH MEREDITH FOOD STUDIOS
55	Roscoe's Chicken Adobo	45 mins	2 tablespoons vegetable oil\n1 whole chicken, chicken\n4  cloves garlic\n1 leaf onion, chunked\n5 cup bay leaves\n1/2 cup light brown sugar\n1 cup soy sauce\n1 cups white vinegar\n##linh##\nHeat vegetable oil in a large pot over medium-high heat. Cook chicken pieces until golden brown, 2 to 3 minutes per side.\nAdd garlic, onion, bay leaves, brown sugar, soy sauce, vinegar, water, and peppercorns. Stir and bring to a nice simmer.\nCover with lid and simmer over medium heat for 15 minutes. Remove the lid and simmer for another 15 minutes.\nServe with rice.
152	Italian Style No Mayo Tuna Salad	10 mins	1 15-ounce) can cannellini beans, drained and rinsed\n1 medium tomato, seeded and diced\n1/4 cup kalamata olives\n1/4 cup red onion\n1/4 cup chopped celery\n2 tablespoons extra virgin olive oil\n1 tablespoon capers\n1 tablespoon chopped parsley\n2 teaspoons red wine vinegar\n1/2 teaspoon kosher salt\n1/4 teaspoon pepper\n1/4 teaspoon garlic powder\n1/8 teaspoon dried oregano\n2 (5-ounce) cans yellowfin tuna\n##linh##\nCombine cannellini beans, tomato, olives, red onion, celery, olive oil, capers, parsley, red wine vinegar, salt, pepper, garlic powder, and oregano in a large bowl; stir until mixed together. Crumble tuna into bowl and toss to combine.
56	Tri-Tip Bulgogi	4 hrs 40 mins	1 thumb-sized piece pear\n1/2 cup onion\n1 cloves fresh ginger\n1/2 pounds soy sauce\n2 tablespoons garlic\n3 tablespoons beef tri-tip\n2 tablespoons grapeseed oil\n3 cup gochujang\n2 tablespoon rice vinegar\n1/2 tablespoon soy sauce\n1 white sugar\n1 cup fresh ginger\n1 garlic clove\n1/2 tablespoon water\nNone tablespoon salt and freshly ground black pepper\n1 sesame oil\n1 (8 ounce) package sesame seeds\n##linh##\nCombine pear, onion, ginger, 1/2 cup soy sauce, and 2 garlic cloves in the jar of a blender or food processor and pulse until marinade is smooth. Place tri-tip into a resealable plastic bag with the marinade. Refrigerate for at least 4 hours or up to overnight.\nSlice tri-tip thinly against the grain.\nAdd grapeseed oil to a skillet over medium-high heat. When skillet is hot, sear meat until nice and charred, about 1 minute on each side. Remove meat from pan.\nAdd gochujang, rice vinegar, soy sauce, white sugar, minced garlic, minced ginger, and 1/2 cup water to the skillet. Stir until blended and smooth. Simmer sauce for 3 minutes and return meat back to the pan; simmer meat in sauce until heated through, 1 to 2 minutes. Season with salt and pepper.\nRemove bulgogi from heat, drizzle with sesame oil, and sprinkle with sesame seeds. Heat rice in the microwave for 90 seconds, or according to package directions.\nPlate bulgogi with rice, kimchi, and steamed veggies. Garnish with sliced scallions.
57	Marinated Fall Vegetable Pasta Salad	1 hr 45 mins	1/2 cup red wine vinegar\n1 1/2 tablespoons brown sugar\n2 1/2 teaspoons Dijon mustard\n1 shallot, finely minced\n1 1/2 teaspoons kosher salt\n1 teaspoon garlic powder\n3/4 teaspoon ground black pepper\n1/2 teaspoon crushed red pepper\n1/8 teaspoon dried oregano\n1 cup olive oil\n16 ounces button mushrooms\n2 large carrots\n1/2 head cauliflower\n1 (7.5 ounce) jar marinated artichoke hearts\n1 pound bowtie pasta\n1 bunch kale\n1 (8.5 ounce) jar sun-dried tomatoes in olive oil\n4 ounces mozzarella cheese\n1/4 cup chopped fresh parsley\n##linh##\nWhisk vinegar, brown sugar, Dijon mustard, shallot, salt, garlic powder, black pepper, red pepper, and oregano together in a large bowl. Drizzle in olive oil and whisk until well combined. Add mushrooms, carrots, cauliflower, and artichoke hearts to the dressing and toss to coat. Cover and refrigerate at least 1 hour and preferably overnight.\nFor salad, bring a large pot of lightly salted water to a boil. Cook bow-tie pasta at a boil, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Drain and set aside to cool.\nMassage kale to soften it slightly and add it to the marinated vegetables. Add in sun-dried tomatoes, smoked mozzarella, and parsley, and toss to coat. Taste; season with salt and pepper.
58	Teriyaki Salmon Bowl	30 mins	1/4 cup low-sodium soy sauce\n3 tablespoons brown sugar\n1 small clove garlic, chopped\n1 tablespoon fresh ginger\n1 ( 6 ounce salmon filet\n1/4 cup grated carrots\n2 radishes, thinly sliced\n1 cup red cabbage\n1 cup cooked rice\n1 teaspoon sesame seeds (optional)\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C) and spray a baking dish with cooking spray.\nCombine soy sauce, brown sugar, garlic, and ginger in a small bowl. Place the salmon in the prepared baking dish, skin side down. Pour teriyaki sauce over.\nBake in the preheated oven until fish flakes easily with a fork, 12 to 15 minutes.\nPlace rice in a bowl, top with salmon, and spoon over teriyaki sauce from the baking dish. Add in the shredded cabbage, grated carrots, and radishes. Sprinkle with sliced green onions and sesame seeds, to garnish.
59	Smoked Mackerel, Beets, Apples, and Bread Crisps	30 mins	2 tablespoon pumpernickel bread, torn into bite- sized pieces\n1 teaspoon olive oil\n1/2 cup black pepper, plus more for garnish\n1/4 tablespoons yogurt\n2 tablespoon lemon juice\n1 (4.2-ounce) cider vinegar\n2 (8-ounce) oil-packed smoked mackerel,\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nToss bread with oil and 1/4 teaspoon pepper on a 10x15-inch rimmed baking sheet. Spread into an even layer. Bake, stirring halfway through, until crisp, about 12 minutes. Let cool for 5 minutes.\nMeanwhile, for sauce, whisk together yogurt, lemon juice, vinegar, and remaining 1/4 teaspoon pepper in a small bowl. Serve bread, smoked mackerel, beets, and apple with sauce. Garnish with dill and additional black pepper. Serve with lemon zest and wedges.\nBoost Vitamin A\nIf earthy beets aren’t your thing, replace them with vitamin A-packed carrots: Toss 8 oz. carrots, cut into 1-inch pieces, with 1 tablespoon olive oil and 1/4 teaspoon black pepper on a separate 10x15-inch rimmed baking sheet. Roast alongside bread in Step 1, adding an additional 15 minutes.\nReduce Sodium\nSwap out the canned smoked mackerel for 2 (4-oz.) fresh skinless salmon fillets. Heat 1 tablespoon vegetable oil in a large skillet over medium heat. Cook salmon, turning halfway through, until it flakes easily with a fork, 4 to 6 minutes per 1/2-inch thickness. Flake into bite-size pieces.\nFill up on Fiber\nUse pumpernickel, rye, or another whole-grain bread with at least 2 grams of fiber per serving.
60	Roast Beef and Cheddar Sliders	22 mins	4 tablespoons butter\n1 (12 roll) package Hawaiian rolls\n12 ounces deli roast beef\n1/2 cup BBQ sauce\n1 cup Cheddar cheese sauce\n1/4 teaspoon garlic powder\n1/4 teaspoon onion powder\n2 teaspoons everything bagel seasoning\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Brush the bottom and sides of a 9x13-inch baking dish with melted butter until lightly coated.\nPlace bottom half of rolls in baking dish and top evenly with roast beef slices. Drizzle BBQ sauce evenly over roast beef and dollop cheese sauce evenly over the top. Place top roll halves on top.\nStir together remaining butter, garlic powder, and onion powder and brush evenly over bun tops.  Sprinkle with bagel seasoning.\nBake in the preheated oven until the center is warm and melted, and bread is toasted and golden brown, 12 to 14 minutes.\nDOTDASH MEREDITH FOOD STUDIOS
61	One Pot Creamy Ground Beef and Orzo	40 mins	1 tablespoon oil\n10 ounces lean ground beef\n1 small onion\n3 cloves garlic, minced, or more to taste\n1/2 teaspoon Italian seasoning\nNone salt and freshly ground black pepper to taste\n3/4 cup orzo\n3 cups marinara sauce\n1/2 cup water\n1 cup half-and-half, divided\n3 tablespoons mascarpone cheese\n3/4 cup fontina cheese\n1/4 cup shredded Parmesan cheese\n##linh##\nHeat oil in a large cast iron skillet over medium heat until hot, about 3 minutes. Add ground beef; cook and stir, breaking up clumps with a spatula, for a few minutes. Stir in onion, garlic, and Italian seasoning. Continue to cook and stir until beef is browned and crumbly, 5 to 8 minutes total.\nSprinkle orzo pasta on top of mixture. Stir in marinara sauce, water, and 1/2 cup half-and-half. Cover; reduce heat to medium-low, and cook at a low simmer for 15 minutes.\nRemove lid, stir in remaining 1/2 cup half-and-half and mascarpone. Spread mixture out in the skillet, and top with shredded fontina and Parmesan.\nPreheat the oven’s broiler, and place a rack about 6 inches from the heat source.\nBroil until cheese is golden and melted, about 3 minutes.
158	Stuffed Mini Peppers	40 mins	1 pound mini peppers,\n8 ounces whipped cream cheese\n1/2 cup shredded Cheddar cheese\n1 tablespoon everything bagel seasoning\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Place peppers on a large baking sheet.\nCombine cream cheese, Cheddar, everything seasoning, and green onion in a bowl. Mix well until evenly combined. Using a butter knife, spread each pepper with an equal amount of cheese mixture.\nBake in the preheated oven for 15 minutes. Turn the oven’s broiler to High and broil until cheese is browned on top, about 2 minutes.
62	Creamy Cowboy Soup	55 mins	3 slices bacon\n2 tablespoons butter\n2 tablespoons flour\n3/4 cup evaporated milk\n1 tablespoon olive oil\n1 onion\n1 pound ground beef\n1 (10 ounce) can diced tomatoes with green chilies\n1 15 ounce) can ranch style beans\n1 (15 ounce) can corn\n2 cups beef broth\n2 potatoes\n3/4 teaspoon granulated garlic\n1/2 teaspoon ground cumin\n##linh##\nPlace bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 8 minutes. Drain bacon slices on paper towels; chop when cool enough to handle.\nMelt butter in a saucepan over medium heat; whisk in flour. Slowly add evaporated milk, whisking until smooth. Cook until thickened slightly, about 2 minutes; remove from heat.\nAdd oil to a large pot or Dutch oven; cook onions over medium heat until nearly translucent. Add ground beef, and cook and stir, breaking up chunks with a spatula as it cooks, 5 to 7 minutes. Drain any excess fat.\nAdd bacon, diced tomatoes with green chiles, beans, and corn. Pour in beef broth and add the diced potatoes. Stir to combine. Add garlic granules, and cumin. Season with salt and pepper.\nBring soup to a boil, then reduce heat to low. Cover; simmer until potatoes are tender;  20 to 30 minutes. Pour evaporated milk mixture into soup; stir to combine. Serve immediately.
63	Slow Cooker Cheeseburger Soup	4 hrs 53 mins	1 pound ground beef\n1/2 cup chopped yellow onion\n2 1/2 cups lower sodium beef broth\n2 russet potatoes, peeled and chopped\n1 (14.5-ounce) can diced tomatoes, undrained\n1 (10.5-ounce) can condensed Cheddar cheese soup\n1 (8-ounce) can tomato sauce\n1/4 cup ketchup, plus more for garnish\n2 tablespoons yellow mustard, plus more for garnish\n1 cup shredded C heddar cheese, plus more for garnish\n1/2 cup dill pickle slices\n1/4 cup red onion\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nCook ground beef and yellow onion in a large skillet over medium heat until browned, stirring to break up with a wooden spoon, about 8 minutes; drain fat.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer beef mixture to a 4- to 5-quart slow cooker. Add beef broth, potatoes, tomatoes, soup,  tomato paste, ketchup, and mustard. Stir to combine.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook on Low 9 to 10 hours or on High 4 1/2 to 5 hours, until potatoes are tender.\nDOTDASH MEREDITH FOOD STUDIOS Stir Cheddar cheese into the soup.\nDOTDASH MEREDITH FOOD STUDIOS\nGarnish servings with pickles, red onion, additional cheese, ketchup and mustard.\nDOTDASH MEREDITH FOOD STUDIOS
64	Lemon Caper Pasta	25 mins	1 pound rotini pasta, or any pasta\n5 tablespoons unsalted butter\n2 cloves garlic,\n1 tablespoon all-purpose flour\n1 teaspoon chicken bouillon paste\n1 lemon, juiced\n2 tablespoons fresh parsley\n3 tablespoons capers\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in pasta and return to a boil. Cook pasta uncovered, stirring occasionally, until tender yet firm to the bite, 8 to 10 minutes. Reserve 1/2 cup pasta water. Drain pasta and set aside.\nMelt 1 tablespoon butter in a skillet over medium heat. Add garlic; fry until fragrant, about 1 minute. Add remaining butter and melt, then sprinkle in flour. Whisk to combine; cook for about 1  minute.\nWhisk chicken soup base into reserved pasta water; pour into skillet. Whisk to make a smooth sauce. Whisk in lemon juice, 1 tablespoon at a time, to taste. Stir in parsley and capers. Season with salt and pepper. Allow to simmer until sauce thickens, about 2 minutes.\nToss sauce with drained pasta.
65	Gazpacho Pasta Salad	5 hrs 30 mins	1 large English cucumber\n1 cup red bell pepper\n1 jalapeno pepper\n2 tablespoons green onions,\n2 clove garlic\n2 1/2 pounds tomatoes\n5 basil leaves, or more to taste\n2 teaspoons kosher salt\n1/2 teaspoon ground black pepper\n1 teaspoon white sugar\n1/2 cup wine vinegar\n1/2 cup olive oil\n1 pound elbow macaroni\n1/4 cup red bell pepper\n2 tablespoons red onion\n##linh##\nPeel just over half the cucumber, and set aside. Finely dice remaining unpeeled cucumber and reserve in the refrigerator.\nFor gazpacho dressing, cut peeled cucumber into large chunks and add to the jar of a large blender; add in red bell pepper, jalapeno, green onion, garlic, tomatoes, basil, salt, black pepper, sugar, wine vinegar, and olive oil. Blend until smooth; strain into a large bowl. You should have 7 to 8 cups dressing.\nFor salad, bring a large pot of salted water to a boil and cook macaroni until not quite tender with a bite, about 6 minutes, or about 15 to 30 seconds less than package directions. Drain very well and let cool slightly, stirring occasionally, about 5 minutes.\nStir macaroni into gazpacho dressing until very well coated. Wrap and refrigerate for at least 5 hours or up to overnight.\nThe next day, stir salad again, and then stir in reserved diced cucumber, red bell pepper, and red onion. Season with salt and freshly ground black pepper and serve.
66	Grilled Balsamic Beef	8 hrs 25 mins	1/2 cup balsamic vinegar\n1/4 cup olive oil\n1 tablespoon Worcestershire sauce\n6 garlic cloves\n1/2 cup green onion\n1 teaspoon ground black pepper\n2 teaspoons kosher salt\n1/8 teaspoon cayenne pepper\n2 teaspoons honey\n1/4 cup fresh rosemary leaves\n2 pounds beef top sirloin\n##linh##\nWhisk balsamic vinegar, olive oil, Worcestershire sauce, garlic, green onion, salt, black pepper, cayenne, and honey together in a bowl. Add rosemary and set aside.\nCut beef into cubes about 1 1/4- to 1 1/2- inch square and add to marinade; stir to coat all cubes well. Wrap and refrigerate overnight, tossing occasionally if possible.\nThread beef on 4 skewers, and pat dry with paper towels before grilling. Save any excess marinade for basting.\nGrill over high heat, basting occasionally with marinade, about 5 minutes per side for medium, or until beef reaches desired doneness. Remove meat from grill and let rest 5 minutes before serving.\nMeanwhile, bring remaining marinade to a boil in a saucepan. Strain and use as a sauce for serving.\nJOHN MITZEWICH
67	Spicy Salmon Roll Shaken Cucumber Salad	10 mins	1 tablespoon nglish cucumber, thinly sliced\n1 teaspoons cream cheese, softened\n2 teaspoons S mayonnaise\n2 S\n1 cup jalapeno pepper, seeded and finely chopped\n1/4 teaspoons red onion\n2 teaspoon everything bagel seasoning\n1/4 teaspoons monosodium glutamate, such as Accent\n2 ounces rice vinegar\n2 avocado, peeled and diced smoked salmon, chopped\n##linh##\nCombine cucumber, cream cheese, mayonnaise, Sriracha, jalapeno, red onion, bagel seasoning, MSG, rice vinegar, smoked salmon, and avocado in a plastic container fitted with a lid or a large jar.  Shake vigorously until everything is evenly coated.  Serve immediately.\nDOTDASH MEREDITH VIDEO STUDIOS
143	Pulled Pork Casserole	50 mins	1 (12-ounce) pulled pork\n2 cups corn, divided\n1 (15- black beans or\n1 (8-ounce) shredded Cheddar cheese\n1 cup barbecue sauce\n1 (8.5 ounce) package corn bread mix\n1/2 cup butter, melted\n1 (8-ounce) carton sour cream\n1 large egg\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nPreheat the oven to 350 degrees F (175 degrees C). Combine pulled pork, 1 cup corn, beans, 1/2 of the Cheddar cheese, and barbecue sauce in a 9x13-inch baking dish; stir until evenly mixed. Gently spread in an even layer.\nDOTDASH MEREDITH FOOD STUDIOS\nStir together cornbread mix, remaining 1 cup corn, remaining Cheddar cheese, melted butter, sour cream, and egg in a bowl until well combined.\nDOTDASH MEREDITH FOOD STUDIOS\nSpoon cornbread mixture over the pulled pork, spreading evenly.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until golden brown and cornbread is set (it will be a little moist), 30 to 35 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nLet cool 5 minutes before serving. Serve with pickled onion or coleslaw, if desired.\nDOTDASH MEREDITH FOOD STUDIOS Pickled Red Onions\nUse this recipe to make your own Pickled Red Onions.
69	Chicken Ricotta Meatballs	1 hr 10 mins	2 teaspoons oil\n1/2 white onion\n6 cloves garlic\n1/2 teaspoon pepper\n3/4 teaspoon salt\n1/2 cup panko\n1/4 cup ricotta cheese\n1 large egg\n1/2 teaspoon Italian seasoning\n1 pound ground chicken\n15  Roma tomatoes\n1 tablespoons onion\n2 cloves olive oil\n8 teaspoon garlic, peeled\n1/2 teaspoon salt\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Line a baking sheet with foil or parchment paper.\nHeat olive oil in a skillet. Add onion and garlic, season with 1/4 teaspoon salt and 1/4 teaspoon pepper, and cook until soft and translucent, 3 to 5 minutes. Let cool to room temperature.\nCombine panko and ricotta in a bowl and mix well. Add egg and season with remaining salt, pepper and Italian seasoning; mix to combine. Add ground chicken, and cooked onion and garlic mixture; mix gently to combine.\nShape into about 24 meatballs and place on the prepared baking sheet.\nBake meatballs in the preheated oven until no longer pink in the center and the juices run clear. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C),  about 20 minutes; remove to cool.\nTo make the sauce, preheat the oven to 425 degrees F (220 degrees C).\nCoat the tomatoes with olive oil, then place cut side down in a single layer on a rimmed baking sheet. Add onion and garlic cloves to the baking sheet and sprinkle everything with salt.\nRoast in the preheated oven until tomato skins begin to shrivel and tomatoes begin to release their juice, about 25 minutes.\nRemove and let cool slightly. Carefully discard the skins.\nPlace tomatoes, onion, and garlic in a blender and blend to your preferred consistency. Stir in Italian seasoning and serve with chicken meatballs. Garnish with basil and shaved Parmesan.\nCook’s Note\nIf you want a thicker sauce, cook the processed sauce down in a saucepan to the desired thickness. This sauce will keep in the refrigerator for up to 3 days or in the freezer for up to a year. Makes about 6 cups.
70	Coconut Curry Salmon with Broccoli	35 mins	4 (6 ounce) salmon filets\n2 tablespoons oil\n1 tablespoon curry powder,\nNone salt and freshly ground black pepper to taste\n1 tablespoon honey\n3 tablespoons unsalted butter\n1/2 cup shallots\n1 tablespoon minced garlic\n1 tablespoon ginger\n1 pinch red pepper flakes,\n1/4 cup Thai red curry paste, or to taste\n1 can coconut milk\n2 tablespoons soy sauce\n1 tablespoon fish sauce\n2 cups broccoli florets\n1/2 lime\n1 tablespoon green onions\n##linh##\nLine a baking sheet with aluminum foil, and brush with 1 tablespoon cooking oil. Preheat the oven’s broiler.\nPat salmon filets dry with paper towels and place on the prepared pan, skin side down. Brush filets with remaining 1 tablespoon oil.\nSeason filets with curry powder, and season lightly with salt and pepper. Drizzle honey over the filets, and place under the broiler. Broil until just crisp on top, 3 to 5 minutes. Watch carefully; honey may burn easily. Remove from oven and keep warm.\nFor coconut curry sauce, melt butter in a large nonstick skillet over medium heat. Add shallots and cook about 1 minute, then add garlic and ginger, and cook until fragrant, about 30 seconds more,\nStir in red pepper flakes and Thai red curry paste and cook about 3 minutes. Stir in coconut milk, soy sauce, and fish sauce; bring to a simmer. Add broccoli florets and cook until crisp-tender, about 3 minutes.\nAdd salmon filets to the skillet and simmer until fish flakes easily with a fork, 3 to 5 minutes.\nSqueeze 1/2 lime over the skillet. Garnish with chopped chives or green onions, and serve.\nCook’s Note\nSoy sauce and fish sauce can be salty, so use salt sparingly.\nThickness of salmon filets will affect cooking time. If filets are thin, reduce cooking time. If filets are greater than 3/4-inch thick, cook until an instant read thermometer inserted near the center reads 145 degrees F (63 degrees C).\nThai curry paste comes in different levels of spiciness - adjust the amount according to your spice preference.
71	Butternut Squash Chili	1 hr 5 mins	2 tablespoons olive oil\n1 cup yellow onion\n2 tablespoons tomato paste\n4 cloves garlic, minced\n2 cups vegetable broth\n1 cup green bell pepper\n2 cups butternut squash, cut into 1/2-inch cubes\n1 (14 1/2 ounce) diced tomatoes\n1 (14 1/2 ounce) can fire roasted diced tomatoes\n1 tablespoon brown sugar\n1 tablespoon chili powder\n2 teaspoons ground cumin\n1/2 teaspoon crushed red pepper (optional)\n1 (15- to 16-o can black beans, rinsed and drained\n1 pound cooked ground turkey or chicken (optional)\n1 teaspoon salt\n1/2 teaspoon ground black pepper\n3/4 cup shredded Cheddar cheese\n1/3 cup sour cream\n6 tablespoons chopped cilantro\n##linh##\nGather ingredients. DOTDASH MEREDITH FOOD STUDIOS\nHeat olive oil in a 4- to 5-quart Dutch oven over medium-high heat. Add onion and tomato paste; cook, stirring until tomato paste begins to darken and onion is tender, 4 to 5 minutes. Add garlic, stirring until fragrant, about 30 seconds.\nDOTDASH MEREDITH FOOD STUDIOS\nPour broth into Dutch oven. Add bell pepper, squash, diced tomatoes, and roasted tomatoes. Stir in brown sugar, chili powder, cumin, and crushed red pepper, if using. Cover, reduce heat to medium-low, and simmer until squash is tender, 20 to 25 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd beans and ground meat (if using) to pot. Cover and simmer until flavors have developed, about 15 minutes. Season with salt and pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nTop with cheese, sour cream, cilantro, jalapenos, and avocado, as desired.\nDOTDASH MEREDITH FOOD STUDIOS
72	Pancetta and Romano Potato Croquettes	45 mins	4 cups mashed potatoes\n1/2 cup omano cheese\n2 large eggs, lightly beaten\n2 ounces sliced pancetta,\n2 tablespoons fresh parsley\n3 cloves garlic, minced\n1 teaspoon onion powder\n3/4 teaspoon salt\n1/4 teaspoon crushed red pepper\n1/2 cup bread crumbs\n3 cups vegetable oil\n1/2 cup ijon mustard\n1/4 cup maple syrup\n1/4 cup lemon juice\n2 tablespoons chopped fresh herbs\n2 tablespoons cider vinegar\n1/4 teaspoon black pepper\n##linh##\nCombine potatoes, cheese, eggs, pancetta, 2 tablespoons parsley, garlic, onion powder, 1/2 teaspoon. salt, and red pepper in a large bowl. Using damp hands, form mixture into 18 patties. Coat patties in bread crumbs.\nPour oil to a depth of 1/2 inch into a large, heavy-bottomed skillet. (You’ll need about 3 cups oil.) Heat over medium-high heat to 350 degrees F to 365 degrees F (175 to 185 degrees C). Preheat the oven to 200 degrees F (93 degrees C).\nWorking in batches, fry potato patties in hot oil, turning halfway through, until browned on both sides, 2 to 4 minutes. Transfer to a paper towel-lined baking sheet and keep warm in the oven.\nFor sauce, whisk together mustard, maple syrup, lemon juice, chopped herbs, vinegar, black pepper, and remaining 1/4 teaspoon salt in a small bowl. Garnish with additional herbs. Serve croquettes with sauce.\nFrom the Editor\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. Amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.
73	Slow Cooker Chicken Apple Butter Meatballs	2 hrs 20 mins	1 small Granny Smith apple (about 6 ounces)\n1 pound ground chicken\n1/2 cup panko\n1 large egg\n1 1/2 teaspoons kosher salt\n1 teaspoon fresh thyme\n3/4 teaspoon poultry seasoning\n1/2 teaspoon black pepper\n1 1/2 cups apple butter\n1 cup chicken stock\n1 teaspoon Worcestershire sauce\n3/4 teaspoon chicken bouillon granules\n2 tablespoons unsalted butter\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPeel apple; discard peels. Grate apple on the largest holes of a box grater to yield 2/3 cup. Place grated apple in a large bowl.\nAdd chicken, panko, egg, salt, thyme, poultry seasoning, and black pepper to bowl with grated apples. Mix until just combined. Shape into 18 balls (about 2 tablespoons each).\nDOTDASH MEREDITH FOOD STUDIOS\nStir together apple butter, chicken stock, Worcestershire, and chicken bouillon in a 6-quart slow cooker bowl. Place meatballs in sauce mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook until meatballs are cooked through and sauce thickens enough to coat the meatballs, about 2 hours on HIGH or 4 hours on LOW, stirring halfway through. Stir in butter until melted and season with additional salt to taste.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer meatballs and sauce to a platter; insert each meatball with a toothpick and garnish with chopped thyme.\nDOTDASH MEREDITH FOOD STUDIOS DOTDASH MEREDITH FOOD STUDIOS
159	Cucumber Feta Quinoa Salad	55 mins	1 1/3 cups water\n2/3 cups quinoa\n1  English cucumber\n1 (2.25 ounce) can red pepper,\n1 cup black olives,\n1/4 ounces red onion\n6 tablespoons feta crumbles\n2 cup olive oil\n1/4 red wine vinegar\n1 tablespoons garlic clove,\n2 tablespoons Dijon mustard\n2 tablespoons fresh parsley\n##linh##\nBring water and quinoa to a boil in a saucepan. Reduce heat to medium-low, cover, and simmer until quinoa is tender, 15 to 20 minutes. Drain, and cool to room temperature, about 20 minutes.\nCombine quinoa, cucumber, red peppers, olives, and red onion in a large bowl; sprinkle with feta cheese.\nWhisk olive oil, vinegar, garlic, mustard, parsley, and oregano together in a small bowl. Pour dressing over salad, toss well to combine, and serve.
74	Shrimp Ramen Stir Fry	25 mins	3 tablespoons soy sauce\n1 teaspoon oyster sauce\n1 teaspoon sesame oil\n1 teaspoon rice vinegar\n1 teaspoon chili crisp,\n2 cloves garlic\n2 teaspoons grapeseed oil\n1 teaspoon sesame oil\n1/2 cup broccoli florets\n1/2 cup carrots\n1/4 cup red bell pepper\n1/4 cup onion\n2 cloves garlic, minced\n1/4 pound shrimp\n1 (3 ounce) package ramen noodles\n1 pinch sesame seeds\n##linh##\nFor sauce, add soy sauce, oyster sauce, sesame oil, rice vinegar, chili crisp, and garlic to a small bowl. Heat grapeseed oil in a small saucepan. Carefully pour heated oil into the bowl; set sauce aside.\nHeat remaining 1 teaspoon sesame oil in a wok or heavy skillet. Add broccoli, carrots, bell pepper, and onion. Sauté until vegetables are crisp-tender, about 3 minutes. Add garlic and stir until fragrant, about 35 seconds. Pour in sauce, and add shrimp. Cook for approximately 2 minutes.\nMeanwhile, open ramen package; discard seasoning packet. Bring 2½ cups water to a boil in a small saucepan. Add noodles and cook for 2 minutes. Drain; stir noodles into the wok; toss to coat. Garnish with black and white sesame seeds, and chopped green onion.\nCook’s Note\nThis is meant to serve 1, but the portion is substantial and it could serve 2 with lighter appetites.
75	Chicken Pot Pie Skillet Pasta	35 mins	2 tablespoons unsalted butter\n1 small onion, diced\n3 cloves garlic, minced\n12 ounces frozen mixed vegetables\n2 tablespoons flour\n2 cups chicken stock\n3/4 cup evaporated milk\n1/4 teaspoon dried thyme\n1/4 teaspoon sage\n1/4 teaspoon dried parsley\n1/4 teaspoon black pepper\n1 teaspoon salt\n1 skinless, boneless chicken breast\n2 cups shell pasta\n1 tablespoon sherry\n##linh##\nMelt butter in a large deep skillet over medium heat. Add onion; cook and stir for 4 minutes. Add garlic; cook and stir until fragrant, about 45 seconds. Stir in mixed vegetables. Sprinkle flour over the mixture.\nPour in chicken broth and evaporated milk. Add in thyme, sage, parsley, black pepper, and salt. Stir to combine.\nAdd chicken and shell pasta into the skillet. Cover and cook until pasta is tender with a bite, about 12 minutes. Stir in sherry; taste and season with salt and pepper. Serve immediately.\nTHEDAILYGOURMET
76	Apple Sausage Gravy Dumplings	55 mins	1 tablespoon vegetable oil\n1 pound pork sausage\n1/2 large yellow onion,\n1 pinch salt\n2 tablespoons unsalted butter\n1/4 cup all-purpose flour\n1 large apple\n4 cups chicken broth\n1/2 cup milk\nNone None  ground black pepper\n1/4 cup cayenne pepper\n1 tablespoon green onions\n1 large apple cider vinegar\n1/4 cup egg\n1/4 cup apple cider\n1 teaspoon creme fraiche\n2 tablespoons fresh thyme leaves\n1 teaspoon green onions\n1 1/2 teaspoons kosher salt\n1 cup baking powder\n##linh##\nHeat vegetable oil in a skillet over medium-high heat and add sausage. Cook and stir, breaking up chunks with a spatula, until browned and crumbly, about 5 minutes.\nReduce heat to medium, add onions and a pinch of salt, and cook, stirring, until onions start to turn soft and translucent, about 5 minutes.\nStir in butter, and once melted, add flour. Cook, stirring, for about 2 minutes. Add diced apple, and cook, stirring for another minute or so.\nPour in chicken broth, raise heat to high, and stir with a spoon, scraping up all the browned bits (fond) from the bottom. Add milk and bring mixture to a simmer. Reduce heat to between medium and medium-low, and simmer for about 15 minutes. For thicker gravy, mixture can be reduced further. Reduce heat to medium-low and prepare dumpling batter.\nCombine egg, cider, creme fraiche, thyme, 2 tablespoons green onions, 1 teaspoon salt, and baking powder in a bowl and whisk thoroughly. Add 1 cup flour and whisk just until flour disappears. Clean off whisk with a spatula, and scrape down the sides of the bowl, mixing in any visible flour. Set batter aside until needed.\nStir gravy and taste for seasoning—add more salt if needed, plus freshly ground black pepper, cayenne, 1/4 cup green onions, and 1 tablespoon apple cider vinegar.\nRaise heat to medium, and transfer generous, rounded teaspoons of dumpling batter on top of the simmering gravy.\nCover, and let cook, untouched, until dumplings are puffed up, and floating on top, 5 to 6 minutes. A skewer inserted into the center of a dumpling should come out clean. Serve immediately topped with additional green onions if desired.
77	Air Fryer Firecracker Salmon Bites	45 mins	1/4 cup balsamic vinegar\n1/4 cup brown sugar\n3 tablespoons vegetable oil,\n3 tablespoons soy sauce\n1 tablespoon minced garlic\n1 tablespoon ginger\n2 teaspoons crushed red pepper flakes, or more to taste\n1/2 teaspoon kosher salt\n1 1/4 pounds salmon filets\n##linh##\nCombine balsamic vinegar, brown sugar, oil, soy sauce, garlic, ginger, red pepper, and salt in a bowl and whisk well. Set aside half of marinade for serving.\nAdd salmon to remaining marinade in the bowl and toss lightly to coat. Cover with plastic wrap and marinate in the refrigerator for at least 30 minutes, and up to 4 hours.\nPreheat the air fryer to 400 degrees F (200 degrees C) for 2 to 3 minutes, or according to manufacturer’s instructions. Spray air fryer basket with nonstick cooking spray.\nAdd salmon in a single layer, cooking in batches if necessary, and cook until salmon flakes easily with a fork and is lightly browned and crisp around the edges, 6 to 8 minutes. Serve drizzled with reserved sauce.\nDOTDASH MEREDITH FOOD STUDIOS
78	Smoked Salmon Breakfast Casserole	1 hr 15 mins	6 cups rye bagels\n2 (8 ounce) package Swiss or provolone cheese\n1 ounces cream cheese\n8 large smoked salmon\n8 cups eggs\n2 cup whole milk\n1/2 cup sour cream\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C). Coat a 9x13-inch baking dish with cooking spray.\nSpread half of the toasted bagel pieces in prepared dish. Top with 1 1/2 cups Swiss cheese, the cream cheese, and smoked salmon. Top with remaining bagel pieces.\nWhisk together eggs, milk, sour cream, and dill in a bowl. Pour over mixture in baking dish. Press bagel pieces with the back of a spoon to coat in egg mixture.\nBake in the preheated oven for 45 minutes. Sprinkle with remaining 1/2 cup cheese. Bake 5 to 10 minutes more, until set and an instant-read thermometer inserted into center of casserole registers 160 degrees F (71 degrees C). Let stand about 10 minutes before serving. Garnish with additional dill and serve with capers, lemon wedges, and/or additional sour cream.\nCook’s Note\nMake Ahead: Prepare as directed through Step 3. Chill, covered, at least 2 hours and up to 24 hours. Preheat oven to 350 degrees F (175 degrees C). Prepare as directed in Step 4, except increase initial baking time to 55 minutes.
79	Beef Enchilada Bake	55 mins	2 teaspoons olive oil\n1 onion, chopped\n4 cloves garlic, minced\n1 large bell pepper, any color, diced\n1 pound ground beef\n1 (15 ounce) can chili beans\nNone salt and pepper to taste\n1 teaspoon cumin\n1 (15 ounce) can enchilada sauce, divided\n12 corn tortillas\n12 ounces exican blend shredded cheese\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nHeat a large skillet over medium heat. Add olive oil, then add onions. Sauté until onions just start to soften, 2 to 3 minutes. Add bell pepper; sauté 1 to 2 minutes. Add garlic and sauté until fragrant, about 1 minute.\nAdd ground beef; cook, breaking up beef with a spatula, until browned and crumbly, about 10 minutes. Drain any grease. Stir in chili beans. Season with salt, black pepper, and cumin. Stir in 1 cup enchilada sauce, reduce heat to medium-low, and simmer, uncovered, for 5 minutes.\nMeanwhile, spread remaining enchilada sauce evenly in the bottom of a 10x8-inch baking dish.\nUsing a sharp knife, carefully cut a straight edge off one side of the tortillas. Place 4 tortillas with the cut edge facing the sides of the dish.\nSpread half of the beef mixture over tortillas and top with 3 ounces cheese. Add another layer of tortillas, then beef mixture and 3 ounces cheese to create the second layer. Repeat layers ending with remaining cheese. Cover with foil.\nBake in the preheated oven for 15 minutes. Remove foil; bake until cheese is lightly browned, 5 to 10 minutes more. Remove from the oven; allow to rest for 5 to 10 minutes before serving. Garnish with sour cream and chopped cilantro if desired.
80	Low Country Shrimp and Potato Salad	40 mins	2 stalks celery\n1 cup mayonnaise\n1/2 cup yellow mustard\n1/2 cup white vinegar\n1/4 cup pickle relish\n2 tablespoons seafood boil seasoning (such as Old Bay®)\n2 tablespoons smoked paprika\n1 bunch green onions,\nNone salt and freshly ground black pepper to taste\n2 quarts water\n2  lemons,\n5 cup garlic cloves\n1/2 pounds new potatoes\n2 large eggs\n6 pound raw shrimp,\n##linh##\nFor dressing, combine dd celery, green onions, garlic, mayonnaise, yellow mustard, white vinegar, pickle relish, 2 tablespoons Old Bay, smoked paprika, and onion powder in a large bowl, and whisk until smooth. Stir in sliced scallions. Season with salt and pepper. Refrigerate until ready to assemble salad.\nFor salad, fill a large pot with 2 quarts water, lemons, garlic cloves, and 1/2 cup Old Bay seasoning and bring to a boil on medium heat.\nAdd potatoes, and boil potatoes in broth for 10 minutes. Add eggs and shrimp. Turn off heat, cover the pot, and let sit for 10 minutes.\nRemove shrimp, potatoes, and eggs to a baking sheet using a slotted spoon to cool. Peel eggs when cool enough to handle, and set aside until ready to use.\nStir potatoes into the dressing. Now break peeled eggs into the potato mixture and stir together until fully mixed. Stir in shrimp. Wrap bowl and refrigerate until ready to serve.\nFrom the Editor\nNutrition data for this recipe includes the full amount of seafood boil seasoning. The actual amount of seasoning consumed will vary.
81	Slow Cooker Italian Sausage Soup	3 hrs 20 mins	1 pound bulk I talian sausage or turkey Italian sausage\n1/2 cup onion\n6 cups reduced-sodium chicken broth\n2 (8-ounce) cans tomato sauce\n1 (14.5-ounce) can diced tomatoes\n1/2 cup green bell pepper\n2 teaspoons talian seasoning\n3 clove garlic, minced\n1/2 teaspoon crushed red pepper\n8 ounces ziti or penne pasta\n1 cup ricotta cheese\n1/2 cup shredded Parmesan cheese\n1/2 cup chopped fresh basil\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nCook sausage and onion in a large skillet over medium, breaking up clumps with a wooden spoon until browned; drain fat.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd sausage mixture to a 4- to 5-quarts slow cooker. Add broth, tomato sauce, diced tomatoes, green pepper, Italian seasoning, garlic, and crushed red pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook on Low for 6 to 8 hours or on High 3 to 4 hours. If using Low, turn to High. Add pasta; cover and cook for 30 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir together ricotta, Parmesan cheese, and basil in a small bowl.\nDOTDASH MEREDITH FOOD STUDIOS\nTop servings with ricotta mixture. Serve hot and enjoy!\nDOTDASH MEREDITH FOOD STUDIOS
82	One Pan Pasta with Bacon and Peas	40 mins	8 ounces bacon\n1/2 cup onion\n2 cloves garlic\n2 2/3 cups chicken broth\n2/3 cup milk\n8 ounces rotini pasta\n1 cup frozen peas\n3/4 cup plain Greek yogurt\nNone salt and freshly ground black pepper to taste\n1/2 cup grated Parmesan cheese\n##linh##\nCook bacon in a large skillet over medium heat until crispy, about 3 minutes. Transfer bacon to a plate lined with a paper towel. Remove all but about 2 tablespoons bacon grease from the skillet.\nAdd onion to the skillet, and cook until translucent and tender, 3 to 4 minutes. Add garlic and cook until fragrant, about 30 seconds.\nPour in chicken broth and milk, and bring to a boil. Stir in pasta, reduce heat to medium low, cover the skillet, and cook, stirring occasionally, until pasta is al dente, 13 to 15 minutes.\nStir in peas, and cook just until thawed. Add Greek yogurt and bacon, stir to combine, and season with salt and pepper. Sprinkle with Parmesan and serve.
83	Ramen Grilled Cheese	15 hrs 25 mins	1 (3 ounce) package ramen noodles\n1 large egg\n2 tablespoons grated Parmesan cheese\n2 slices sharp Cheddar cheese\n1 tablespoon butter\n##linh##\nBring 2½ cups water to a boil in a small saucepan. Add noodles and cook for 2 minutes. Add flavor packet, stir, and continue to cook for another 30 seconds, or prepare ramen according to package directions.  Drain off liquid; allow noodles to cool slightly.\nWhip egg in a mixing bowl until yellow and frothy. Stir in Parmesan cheese. Stir in cooked noodles until completely coated.\nLine a sealable sandwich container with plastic wrap, and press half of ramen noodles into the lined container. Place another layer of plastic wrap into the container. Press remaining noodles evenly into the container. Cover and refrigerate until firm, at least 15 hours.\nPlace a skillet over medium-high heat and add a layer of parchment paper. Add the butter. Remove one piece of ramen “bread” from the container and place into the skillet.\nTop ramen with 2 slices cheese. Place remaining ramen in skillet; allow to heat through and become golden. Carefully flip onto the layer that has cheese. The ramen sandwich is ready when both sides are golden.
84	Couscous Chicken Soup	45 mins	2 tablespoons unsalted butter\n1  onion\n2 stalks carrots\n3 pounds celery\n1 1/4 cups chicken breast\n8 tablespoon chicken broth\n1/2 teaspoon parsley flakes or dried dill\n1/2 teaspoon salt\n1/4 (5.4 ounce) boxes ground black pepper\n##linh##\nMelt butter in a large stock pot over medium-high heat. Add onion, carrot, and celery, and cook  and stir for 5 minutes.\nAdd chicken, broth, parsley, salt, and pepper. Bring to a boil, reduce heat, and simmer 20 minutes.\nAdd couscous and cook 7 minutes more. Ladle into bowls and serve.
85	Ronto Wrap	40 mins	1 pound pork tenderloin,\n1 tablespoon olive oil\n1 garlic clove\n1/4 teaspoon red pepper flakes\nNone None None pinch cayenne\n4 pinch of cumin\n1  kosher salt\n2 12 ounce) pork sausages\n2 tablespoons coleslaw mix\n1 tablespoons fresh cilantro\n1 tablespoon apple cider vinegar\n1/2 jalapeno pepper\n1/2 teaspoon lime, juiced\n1/2 teaspoon black pepper\n1/4 cup osher salt\n1 cup mayonnaise\n1 reek yogurt\n1 teaspoon lemon, juiced\n2 teaspoon prepared horseradish\nNone teaspoons orcestershire sauce\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C).\nPlace the trimmed pork tenderloin on a plate or work surface. Combine olive oil, grated garlic, red pepper flakes, cayenne, and cumin in a small bowl. Rub the oil and spice mixture all over the pork, coating the entire surface, then season generously with Kosher salt.\nPreheat a coated cast-iron skillet over medium-high heat, about 2 minutes. Add pork tenderloin and cook until deeply golden brown, about 5 minutes. Flip tenderloin over and cook for an additional 3 minutes. Transfer skillet to the preheated oven and roast for 5 minutes. Remove from the oven, push tenderloin to one side of the skillet and add the sausages. Roast for an additional 10 minutes, flipping sausages halfway through, until the pork reaches an internal temperature of 145 degrees F (62 degrees C). Remove skillet from the oven and tent with foil to rest for at least 10 minutes.\nMeanwhile, combine coleslaw mix, cilantro, apple cider vinegar, jalapeño, lime juice, freshly ground black pepper, and salt in a bowl. Use tongs to toss the slaw so everything is evenly mixed.\nCombine mayonnaise, Greek yogurt, lemon juice, horseradish, Worcestershire sauce, pepper, and kosher salt in a small bowl for the peppercorn sauce. Taste and adjust the seasoning according to your tastes.\nWhen ready to assemble, wrap the pita or naan in foil and place in the oven while you carve the pork to warm slightly. The oven does not need to be on, the residual heat from roasting the pork will be enough to warm the bread.\nSplit the sausages down the center lengthwise. Carve the pork tenderloin into 1/4-inch thick slices.\nTo assemble, place a warm piece of pita or naan on a large plate. Set down 4 to 5 slices of pork tenderloin, and add a sausage on top. place about 1 loosely packed cup of the prepared slaw on top, then drizzle without about 2 tablespoons of peppercorn sauce. Roll the wrap up and enjoy.
216	Slow Cooker Stuffed Pepper Soup	3 hrs 45 mins	1 pound ground beef\n3 (14.5 ounce) cans low-sodium chicken broth\n2 (8 ounce) cans tomato sauce\n1 (14.5 ounce) can fire roasted diced tomatoes\n2 cloves garlic\n1  green bell pepper\n1 cup red bell pepper\n1/2 tablespoon onion\n1 teaspoon chicken bouillon\n1 teaspoon dried oregano\n1 teaspoon salt\n1/2 cup pepper\n1 cup instant white rice\n##linh##\nHeat a large skillet over medium-high heat. Cook and stir ground beef in the hot skillet until browned and crumbly, 5 to 7 minutes. Drain and discard any excess grease.\nPlace beef, chicken broth, tomato sauce, diced tomatoes, garlic, green pepper, red pepper, onion, bouillon, oregano, salt, and pepper in a slow cooker. Stir to combine and cook on High until vegetables are soft, 3 to 4 hours.\nAdd rice and cook until rice is tender, 20 to 25 minutes more. Serve topped with mozzarella cheese.
86	Breakfast Nachos	55 mins	3/4 cup cilantro leaves and tender stems\n1/2 cup parsley leaves and tender stems\n1 clove garlic, coarsely chopped\n1 1/2 tablespoons red wine vinegar\n1/4 teaspoon crushed red pepper\n1/4 teaspoon kosher salt\n1/4 cup extra-virgin olive oil\n1 (8 ounce) flat iron steak, patted dry\n3/4 teaspoon kosher salt,\n1/2 teaspoon black pepper,\n1/2 teaspoon ground cumin\n2 tablespoons olive oil\n8 large eggs\n1 (11 ounce) package tortilla chips\n2 (8 ounce) packages shredded Mexican cheese blend (such as Tilamook\n1 (15 ounce) can black beans\n1 cup plum tomatoes\n1 avocado, chopped\n1/2 cup pickled jalapeno slices\n1/2 cup sour cream, or as needed\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nFor chimichurri: Place cilantro, parsley, garlic, vinegar, crushed red pepper, and salt in a small food processor; pulse until finely chopped, about 10 pulses. With processor running, pour oil through food chute, and process until fully incorporated, about 20 seconds; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nFor steak: Sprinkle steak evenly with 1/2 teaspoon of the salt, 1/4 teaspoon of the black pepper, and cumin, as desired. Heat a medium cast-iron skillet over medium-high for 5 minutes. Add steak and 1 tablespoon of the oil, swirling to distribute oil evenly. Cook, undisturbed, until nicely browned and a thermometer inserted into thickest portion of steak registers 120 degreed F (49 degrees ) for rare, about 3 minutes per side. Transfer to a cutting board, and let rest 10 minutes. Do not wipe skillet clean.\nDOTDASH MEREDITH FOOD STUDIOS\nMeanwhile, whisk together eggs and remaining 1/4 teaspoon each salt and black pepper in a medium bowl until thoroughly blended. Heat cast-iron skillet over medium. Add remaining 1 tablespoon oil and eggs; cook, stirring occasionally, until just set, about 2 minutes. Transfer to a bowl; cover, and set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nPreheat the oven’s broiler and place a rack about 12 inches from the heat source. Line a large rimmed baking sheet with aluminum foil.\nTo assemble nachos, arrange half of tortilla chips in an even layer on prepared baking sheet. Thinly slice steak across the grain, and cut into 3/4-inch pieces. Sprinkle tortilla chips evenly with half of steak, half of beans, half of eggs, and half of Mexican blend cheese. Repeat with remaining chips, steak, beans, eggs, and cheese.\nDOTDASH MEREDITH FOOD STUDIOS\nBroil until cheese is melted and bubbly, about 2 minutes. Top with tomatoes, avocado, and pickled jalapeños. Drizzle evenly with chimichurri, and serve with sour cream.\nDOTDASH MEREDITH FOOD STUDIOS
87	Easy Slow Cooker Lasagna Soup	5 hrs	1 pound ground beef\n1 green bell pepper\n1 medium onion\n1 (14.5 ounce) can diced tomatoes\n1 (28 ounce) can crushed tomatoes\n1 (32 ounce) carton beef broth\n1 (4 ounce) can sliced mushrooms\n2 teaspoons Italian seasoning, or more to taste\n5 lasagna noodles\n1/2 cup shredded mozzarella cheese\n4 dollops ricotta cheese\n1/4 tsp salt and freshly ground black pepper\n##linh##\nCrumble ground beef in a large skillet over medium heat. Cook and stir for 5 minutes. Drain.\nPlace beef in the bottom of a slow cooker. Add bell pepper, onion, diced tomatoes, crushed tomatoes, beef broth, mushrooms, and Italian seasoning. Cook on low 4 hours.\nAdd broken lasagna noodles. Cook on Low until noodles are tender, about 45 minutes more. Season with salt and pepper to taste.\nLadle soup into serving bowls. Divide mozzarella cheese between the bowls. Top each bowl with a dollop of ricotta cheese.\nNICOLE RUSSELL DOTDASH MEREDITH VIDEO STUDIOS
88	Spiced Harissa Beef-and-Lamb Koftas	30 mins	1 pound 85% lean ground beef chuck\n8 ounces ground lamb\n1 large egg\n1/3 cup fresh cilantro\n1/4 cup onion\n2 tablespoons harissa paste (see Note)\n2 cloves garlic\n2 teaspoons ground coriander\n1 teaspoon salt\n1 teaspoon cumin\n1 teaspoon ground turmeric\n1/2 teaspoon ground ginger\n1/4 teaspoon ground cinnamon\n1/2 cup plain yogurt\n1 1/2 tablespoons tahini\n1 tablespoon lemon juice\n1 1/2 teaspoons fresh parsley\n1/8 teaspoon salt\n##linh##\nPreheat an outdoor grill for medium heat (350 to 375 degrees F (175 to 190 degrees C)).\nCombine beef, lamb, egg, cilantro, onion, harissa, garlic, coriander, 1 teaspoon salt, the cumin, turmeric, ginger, and cinnamon in a large bowl. Be careful not to overmix, or meat will be tough. Shape mixture around 6 (10-inch) skewers, making the meat mixture 1-inch thick around the skewers.\nOil grill grates. Grill koftas, covered, turning occasionally, until an instant-read thermometer inserted into centers registers 160 degrees F (71 degrees C), about 15 minutes.\nMeanwhile, stir yogurt, tahini, lemon juice, parsley, and 1/8 teaspoon salt together in a small bowl. Serve yogurt sauce with koftas.\nCook’s Note\nHarissa is available as a sauce or as a paste, which have distinct consistencies. Brands also differ by ingredients and heat level, so start with a small amount and taste before adding more.\nIf using wooden skewers, soak 30 minutes before using to prevent burning.
89	Easy Spoon Bread	1 hr	2 1/2 cups whole milk\n1 cup yellow cornmeal\n2 tablespoons unsalted butter\n3/4 teaspoon salt\n3/4 teaspoon black pepper\n1 cup corn\n1/2 cup green onions, plus more for garnish\n2 teaspoons baking powder\n2 large eggs, lightly beaten\n##linh##\nPreheat oven to 350 degrees F (175 degrees C). Lightly coat a 2-quart baking dish with cooking spray.\nStir together milk, cornmeal, butter, salt, and pepper in a saucepan over medium-high heat. Bring to a boil, stirring constantly, until mixture reaches the consistency of mashed potatoes, about 5 minutes. Remove from heat. Stir in corn, green onions, and baking powder. Stir in eggs. Transfer batter to the prepared dish.\nBake in the preheated oven until risen and set, about 35 minutes. Serve with sour cream and additional green onions.\nALLRECIPES MAGAZINE
90	Loaded Waffle Fries	55 mins	1 tablespoon ketchup\n1 tablespoon mayonnaise\n1 teaspoon yellow mustard\n1 teaspoon dill pickle relish\n12 ounces waffle fries\n2 slices thick cut bacon\n8 ounces lean ground beef\n1/2 teaspoon Seasoning)\n1 cup shredded Cheddar cheese\n1 cup shredded lettuce\n1 Roma tomato, chopped\n2 tablespoons red onion\n##linh##\nWhisk ketchup, mayonnaise, mustard, and dill pickle relish in a small bowl. Set sauce aside.\nPreheat the oven to 425 degrees F (220 degrees C). Line a baking sheet with foil, and arrange waffle fries on the sheet in a single layer.\nBake fries in the preheated oven until golden, about 20 minutes, or according to package directions.\nMeanwhile, place bacon in a skillet over medium-high heat and cook until crisp, about 5 minutes. Transfer bacon to a paper towel-lined plate. Crumble when cool enough to handle.\nHeat the same skillet over medium-high heat. Crumble beef into the skillet, sprinkle with Worcestershire pub burger seasoning, and cook and stir until browned, about 8 minutes. Drain in a colander.\nDivide beef among the cooked fries and top with cheese. Return baking sheet to the oven and bake until cheese is melted, about 5 minutes.\nTop fries with lettuce, tomato, onion, and bacon. Drizzle reserved sauce over the top and serve immediately.
91	Southwestern Sweet Potato and Black Bean Pasta Salad	55 mins	1 pound pasta, such as penne or bow-tie\n5 chipotles\n1 clove garlic\n1 teaspoon dried oregano\n1/4 teaspoon ground cumin\n2 tablespoons honey\n6 tablespoons red wine vinegar\n2/3 cup olive oil\n2 large sweet potatoes\n2 tablespoons olive oil\n2 1/2 tablespoons kosher salt\n1/2 teaspoon freshly ground black pepper\n1 (15 ounce) can black beans, drained and rinsed\n2/3 cup minced red onion\n1/2 cup chopped cilantro\n1 cup cotija cheese\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C).\nBring a large pot of lightly salted water to a boil. Cook pasta at a boil, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Drain and set aside to cool.\nFor vinaigrette, place 2 chipotle peppers, plus 1 tablespoon sauce into a blender. Add garlic, oregano, honey, and red wine vinegar, and blend on high until well combined. Drizzle in the 2/3 cup olive oil with blender running until smooth, and set aside. Chop remaining peppers finely and stir into vinaigrette. Refrigerate until ready to use.\nToss potatoes in 2 tablespoons olive oil, black pepper, and remaining salt. Coat a baking sheet with nonstick spray or line with parchment, and spread potatoes in an even layer on the sheet.\nRoast in the preheated oven until browned, about 20 minutes, stirring halfway through. Remove from oven and set aside.\nIn a large bowl combine cooked pasta with black beans, onion, cilantro, and toss.  Add in potatoes and 3/4 cup vinaigrette, or more as needed, and toss gently (reserve any remaining vinaigrette for another use). Season with salt and pepper, and stir in cotija cheese. Serve immediately or refrigerate until ready to serve.
92	Easy Stuffed Taco Sweet Potatoes	1 hr 10 mins	2 tablespoons chili powder\n2 tablespoons garlic powder\n2 tablespoons onion powder\n2 tablespoons cumin\n2 tablespoons smoked paprika\n1 tablespoon dried oregano\n1 tablespoon "seasoning salt, (such as Lawry\n1 pinch s"\n2 large cayenne pepper\n3 tablespoons sweet potatoes,\n1 small olive oil\n1 pound yellow onion, cut into small dice\n1 (15 ounce) can ground beef\n1 tablespoon black beans\n1/4 cup cornstarch\n##linh##\nFor taco seasoning, add chili powder, garlic powder, onion powder, cumin, smoked paprika, dried oregano, seasoned salt, and cayenne to a small bowl; stir to combine. Set aside.\nPreheat the oven to 425 degrees F (220 degrees C).\nRub each sweet potato with 1/2 tablespoon olive oil and 1/2 tablespoon taco seasoning. Wrap each sweet potato in foil and place on a baking sheet.\nBake in the preheated oven until fork tender, about 40 minutes.\nHeat remaining 2 tablespoons olive oil In a skillet over medium heat; add diced onion, and cook until softened, about 5 minutes. Add ground beef and 1/4 cup taco seasoning; cook and stir beef until browned and crumbly, breaking up clumps with a spatula, and mixing in seasoning as beef cooks, 5 to 7 minutes.\nStir in black beans; cook until heated through, about 2 minutes. In a small bowl stir together cornstarch and water until smooth. Stir into the meat mixture and simmer until slightly thickened,  2 to 3 minutes. Season with salt and pepper.\nTo serve, slice potatoes open, and add a pinch of taco seasoning to the inside of each potato. Spoon in meat; top with cheese, pico de gallo, jalapeno, sour cream, cilantro, and more taco seasoning. Serve immediately.
93	Spicy Vegetable Beef Udon Noodles	35 mins	1 1/2 tablespoons soy sauce\n1 tablespoon dark soy sauce\n1 teaspoon chili oil\n1 1/2 tablespoons oyster sauce\n1 1/2 tablespoons honey\n1 1/2 tablespoons sesame oil\n1 1/2 tablespoons water\n1 1/2 teaspoons sesame seeds\n1 pound udon noodles\n1 tablespoon grapeseed oil\n4 cloves garlic\n2 cups stir-fry vegetables\n1/2 pound rib eye steak,\n##linh##\nStir soy sauce, dark soy sauce, chili oil, oyster sauce, honey, sesame oil, water, and sesame seeds together in a small bowl; set aside.\nBring a large pot of salted water to a boil over high heat. Cook udon until tender with a bite, 8 to 10 minutes. Drain, rinse with cold water, and drain again. Set aside.\nHeat grapeseed oil in the pot over medium-low heat. Add garlic and stir-fry vegetables; cook and stir for 2 minutes. Stir in beef and cook until completely browned, about 3 minutes. Add noodles back to the pan, stir in sauce, and toss until everything is evenly coated.\nSeason with salt and pepper. Garnish with green onions and serve.
94	French Onion Burgers	20 mins	6 cup hamburger buns\n1/4 ounces butter\n8  sliced mushrooms\n2 pounds onions\nNone (1 ounce) packet salt and freshly ground black pepper\n2 slices ground beef\n1 tablespoons onion soup mix\n##linh##\nPreheat a large skillet over medium heat. Place hamburger bun halves, cut-sides down, in the hot skillet until lightly toasted, 2 to 3 minutes. Remove toasted buns to a plate.\nPreheat an outdoor grill for medium heat. Heat butter in a large saucepan over medium heat on the grill. Add mushrooms and onions; season with salt and black pepper and cook and stir until mushrooms are lightly browned, about 20 minutes.\nMeanwhile, mix ground beef and onion soup mix in a bowl using your hands. Form mixture into 6 hamburger patties.\nLightly oil grill grates. Grill burgers for about 5 minutes, then flip and grill to your desired doneness. A meat thermometer inserted near the center of patties should read 180 degrees F (82 degrees C).\nRemove burgers from heat to rest for 5 minutes. Spread each bun with 1 tablespoon mayonnaise, and add burgers; divide mushrooms and onions between burgers to serve.
95	One Pot Turmeric Chicken and Rice	1 hr	1 1/2 pounds skinless, boneless chicken breast,\nNone salt and freshly ground black pepper\n1 tablespoon unsalted butter\n1 teaspoon ground turmeric\n1 cup onion\n2 teaspoons fresh ginger\n2 cloves garlic\n1 cup tomato\n2 cups green beans\n1 teaspoon curry powder\n1 pinch ground cinnamon\n1/4 teaspoon ground cumin\n1 cup jasmine rice\n2 bay leaves\n2 teaspoons fish sauce\n1 1/2 cups chicken stock\n##linh##\nPat chicken pieces dry; season with salt and pepper.\nMelt butter in a large casserole or Dutch oven, and sprinkle with turmeric. Add chicken pieces in a single layer and cook over medium-high heat until lightly browned, 2 to 3 minutes. Turn and brown the other side, 2 to 3 minutes. Transfer chicken to a plate and keep warm.\nTo the same pot, add onion, ginger, and garlic and cook, stirring occasionally, until starting to brown, about 2 minutes. Add tomatoes, green beans, curry powder, cinnamon, cumin, and rice. Stir constantly, until fragrant, about 1 minute. Return chicken and any accumulated juices to the pot, and add bay leaves, fish sauce, and chicken stock. Be sure to stir up all the browned bits from the bottom of the pot into the sauce.\nBring to a boil, cover, and reduce heat to low; simmer for 10 minutes. Meanwhile, make raita, if using (See Cook’s Note).\nAdjust the lid to partially cover and vent, and continue to simmer until rice is tender, 10 to 15 minutes longer.\nRemove from heat, uncover, and let stand for 5 minutes. Serve warm, with raita as a garnish, if desired.\nCook’s Note\nFor Raita: Stir 1/2 cup plain Greek yogurt, 1/3 cup grated, drained cucumber, 1 tablespoon minced fresh mint, 1 1/2 teaspoons lime juice, 1/8 teaspoon garam masala, and 1/8 teaspoon granulated garlic together in a bowl. Season with salt to taste.
96	Roasted Pork Chops with Zucchini	35 mins	1 1/2 cups panko bread crumbs\n1/4 cup rated Parmesan cheese\n2 teaspoon Italian herb seasoning blend\n1/4 teaspoon red pepper flakes, or to taste\n1 teaspoon granulated garlic\n1 teaspoon smoked paprika\nNone salt and freshly ground black pepper to taste\n1 large egg\n4  zucchini, quartered lengthwise, then halved crosswise\n4 tablespoons boneless pork chops\n2 tablespoons olive oil\n2 cherry unsalted butter\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C), and line a 12x18-inch sheet pan with foil. Place a baking rack on top of the foil.\nIn a small bowl, combine panko bread crumbs, Parmesan cheese, Italian herb seasoning, red pepper flakes, granulated garlic, smoked paprika, and salt and pepper to taste. Place 2/3 of the mixture on a plate, and set aside.\nBreak egg into a shallow bowl and beat until the white and yolk are incorporated.\nLightly brush each zucchini piece with egg, and toss with 1/3 of the panko crumb mixture. Place breaded zucchini on the prepared rack.\nDip chops into beaten egg and hold over the bowl to allow excess to drip back into the bowl. Place each chop on the reserved panko mixture, then turn and coat the other side with panko mixture, gently patting mixture onto each chop.\nHeat olive oil and butter together in a large skillet over medium heat until butter is melted and no longer sizzling. Carefully place each chop into the skillet and brown each side, turning once, 3 to 5 minutes per side, turning once. Nestle browned chops on the prepared rack with zucchini pieces.\nRoast in the preheated oven until chops are no longer pink at the center and zucchini is tender, 12 to 15 minutes. An instant-read thermometer inserted into the center of chops should read 145 degrees F (63 degrees C).\nRemove chops from the oven and place on a serving plate. If desired, broil zucchini pieces until lightly browned, 2 to 3 minutes. See Cook’s Note.\nGarnish with cherry tomatoes and fresh parsley, and serve warm.\nCook’s Note\nThese cooking times yield chops cooked to a juicy medium, and zucchini with a little firmness. For softer zucchini, add about 5 minutes additional roasting time, and after the chops come up to temperature, decide whether or not to broil the zucchini for a more golden crust.\nIf you broil to finish the zucchini, watch carefully. These can go from just right to burned in a flash.
97	Doritos Locos Taco Pie	1 hr	2 teaspoons olive oil\n1/2 cup onion\n1 1/2 teaspoons kosher salt, divided\n1 pound ground sirloin\n1 teaspoon chili powder\n1 teaspoon cumin\n1/8 teaspoon cayenne pepper\n1 teaspoon garlic powder\n1 teaspoon onion powder\n1/2 teaspoon pepper\n1/2 cup water\n1 pie crust deep dish\n2 cups sharp Cheddar cheese or Mexican cheese blend, divided\n1 cup refried beans\n1 (4 ounce) can diced green chiles\n2 tablespoons hot sauce or taco sauce\n2 cups doritos nacho cheese tortilla chips\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nHeat oil in a large skillet over medium heat. Add onion and 1/2 teaspoon salt and cook, stirring constantly, for 2 minutes. Add ground beef in one layer, crumbling slightly with a wooden spoon to spread it into the skillet. Cook, undisturbed, until browned, about 5 minutes.\nStir and continue cooking until beef is no longer pink. Season with remaining salt, chili powder, cumin, cayenne, garlic powder, onion powder, and pepper and cook for 1 minute. Add water and cook for 2 minutes, scraping pan to release any browned bits. Remove from heat and set aside.\nSpread beans over the bottom of the pie crust.  Sprinkle 1/2 cup cheese evenly over the beans. Top with ground beef mixture, green chiles, hot sauce, and 3/4 cup cheese.\nCover with foil and bake in the preheated oven until bubbly and crust is golden brown, about 30 minutes.\nUncover, top with remaining cheese and crushed chips and return to the oven, Bake until bubbly and cheese has melted and chips have very lightly browned, about 5 more minutes. Let stand for 5 to 10 minutes before serving with toppings of choice and more hot sauce if desired.\nDOTDASH MEREDITH VIDEO STUDIOS
98	Chicken Chalupas	45 mins	3 cups all-purpose flour\n4 teaspoons baking powder\n1 teaspoon kosher salt\n1 1/4 cups whole milk\n2 tablespoons butter\n2 cups iceberg lettuce\n1 cup tomatoes\n1 cup shredded Cheddar cheese\nNone pico de gallo\n1 cup refried beans\n1 1/2 cups cooked chicken\n2 tablespoons taco seasoning\n##linh##\nTo make the chalupa shells, combine flour, baking powder, and salt in a medium mixing bowl. Stir well to combine the dry ingredients.\nGradually pour in milk, while stirring, until you need to use your hand to knead. Add in the melted butter, and knead well.\nShape dough into 6 equal balls. Sprinkle flour over a work surface and flour the rolling pin. Roll each dough ball into about a 7-inch circle, moving the dough a quarter turn after a couple of passes with the rolling pin. Add more flour to the work surface and rolling pin if dough sticks.\nKeep rolled dough circles under a clean, damp kitchen towel until ready to fry.\nSet up stations of chopped lettuce, chopped tomatoes, shredded cheese, and any optional toppings you plan to use, and place in a convenient array for assembling the chalupas.\nMicrowave refried beans on medium setting until soft and spreadable, about 1 minute, and add as the first station to your other ingredients.\nWarm shredded chicken briefly in the microwave or in a skillet, and toss with taco seasoning mix, and add as the second station to the other ingredients.\nTo fry chalupa shells, add cooking oil to a depth of about 1/4-inch to a large, nonstick skillet. Heat oil over medium heat, and when the oil is hot, fry one side of one dough circle until lightly brown, about 1 minute.\nUsing tongs, lift the partially cooked shell from the skillet and place only half of the uncooked side into the oil. Carefully hold half of the shell away from the oil, until the first half is browned, about 1 minute, then brown the other half. Repeat until all the shells are done.\nTo keep the bent shape, place fried chalupa shells into a taco holder until ready to fill.\nTo serve, spread each chalupa shell with about 2 tablespoons refried beans, and fill with 2 or 3 tablespoons seasoned shredded chicken. Fill with lettuce, tomatoes, and cheese.\nGarnish with optional toppings, such as pico de gallo, sour cream, and sliced avocados, if desired. Serve immediately.\nFrom the Editor:\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. Amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.
99	Mississippi Mud Potatoes	1 hr 50 mins	2 1/2 cups diced potatoes\n3/4 cup shredded Cheddar cheese\n1/2 cup bacon\n1/2 cup onion\n1/3 cup mayonnaise\n2  garlic cloves\nNone cup salt and freshly ground black pepper to taste\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C). Spray an 8x8-inch baking dish with nonstick cooking spray. Set aside.\nCombine potatoes, cheese, bacon, onion, mayonnaise, garlic, salt, and pepper in a large bowl. Transfer to the prepared dish.\nBake until potatoes are fork tender, about 1 1/2 hours. Top with green onions.\nFrom the Editor\nThe easiest way to cook a small amount of bacon is in the microwave.
100	Cowboy Soup	55 mins	1 pound ground beef\n1 onion\n1 large green bell pepper\n4 cups beef broth\n1 (14.5 ounce) can Mexican-flavored diced tomatoes, undrained\n1 (15.5 ounce) can pinto beans, undrained\n1 15.25 ounce) can corn\n1 large baking potato\n1 tablespoon chili powder\n1 tablespoon Worcestershire sauce\n1 teaspoon paprika\n1/2 teaspoon ground cumin\n##linh##\nHeat a large stock pot over medium-high heat. Add ground beef and onions. Cook, breaking up beef with a spatula, until onions have softened and beef is no longer pink, about 5 minutes. Drain excess grease.\nAdd green pepper, beef broth, tomatoes, beans, corn, potato, chili powder, Worcestershire sauce, paprika, and cumin. Bring to a boil; reduce heat and simmer for 40 minutes. Season with salt and pepper. Ladle into bowls and serve.
101	Copycat McChicken Sandwich	1 hr	1 pound boneless skinless chicken breast, cut into 1-inch pieces\n3/4 pound boneless skinless chicken thighs, cut into 1-inch pieces\n1/2 teaspoon garlic powder\n1/4 teaspoon white pepper\n1 teaspoon paprika, divided\n2 teaspoons salt, divided\n1 cup flour\n2/3 cup cornstarch\n3/4 teaspoon pepper\n6 hamburger buns,\n1 1/4 cups club soda\nNone None oil for frying, or as needed\n3 shredded iceberg lettuce, to taste\n##linh##\nCombine chicken, garlic powder, white pepper, 1/2 teaspoon paprika, and 1 teaspoon salt in a food processor. Pulse until finely chopped and it forms a uniform mixture.\nShape chicken mixture into 6 patties and freeze on a parchment or wax paper-lined baking sheet for 20 to 30 minutes.\nHeat oil to 375 degrees F (190 degrees C). Whisk together flour, cornstarch, remaining salt, remaining paprika, and pepper in a bowl. Lightly coat partially frozen patties in flour mixture and shake off any excess mixture and set patties aside.\nAdd club soda to remaining flour mixture in bowl and whisk to combine.\nWorking 2 to 3 at a time, dip patties into batter, allow excess to drip off and carefully place into the hot oil. Fry, while maintaining a temperature of 330 to 350 degrees F (165 to 175 degrees C), until golden brown, crispy, and cooked through, 5 to 6 minutes per batch. Drain on a wire rack set inside a paper towel lined rimmed baking sheet.  Repeat with remaining patties.\nServe patties on buns with shredded lettuce and mayonnaise.\nDOTDASH MEREDITH VIDEO STUDIOS From the Editor\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. Amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nNutrition data for this recipe includes the full amount of flour. The actual amount of flour consumed will vary.
130	Beetlejuice-Inspired Shrimp Cocktail	30 mins	1 pound shrimp\n1/2 cup plus 2 tablespoons olive oil\nNone salt and freshly ground black pepper to taste\n1 large egg\n1  garlic clove\n1 cup poblano pepper, seeded\n1/2 tablespoon grapeseed or canola oil\n##linh##\nPlace shrimp, shells on, in a large bowl. Add 1 tablespoon olive oil, salt, and pepper and toss.\nHeat a cast iron skillet over medium heat until hot; add 1 tablespoon olive oil to the skillet.\nCook shrimp in the skillet, without crowding, for 3 to 4 minutes on each side. You may have to work in batches. Remove shrimp from skillet and allow to cool.\nCombine egg, poblano pepper, garlic clove, lime juice, and basil in a food processor and blend until smooth. With processor running, slowly add 1/2 cup grapeseed oil and process until mixture is smooth and thick.\nTransfer mixture to a bowl and very slowly, a drop or two at a time, whisk in remaining 1/2 cup olive oil by hand. Season with salt and pepper.\nFrom the Editor:\nThis recipe contains raw egg. We recommend that pregnant women, young children, older adults, and the immunocompromised do not consume raw egg. Learn more about egg safety from our article, How to Make Your Eggs Safe.
102	Instant Pot Chicago Beef	1 hr 5 mins	1 1/2 pounds beef chuck\n1 1/2 teaspoons salt\n1 teaspoon ground black pepper\n1 tablespoon dried oregano\n1 teaspoon garlic powder\n1 tablespoon onion powder\n1/4 teaspoon red pepper flakes\n1 tablespoon paprika\n1 tablespoon vegetable oil\n1 onion, thickly sliced\n6 cloves garlic\n1 chile pepper\n3 cups beef stock\n2 tablespoons sport pepper juice\n1 bay leaf\n1 teaspoon dried thyme\n4 to 6 Italian hoagie rolls\n1/2 cup (pickled Italian vegetables)\n##linh##\nSeason beef with salt, black pepper, dried oregano, garlic powder, onion powder, red pepper, paprika.\nTurn the Instant oPt setting to High Saute setting; add oil. Add seasoned beef and sear on both sides for 3 to 5 minutes.\nRemove beef, and add onion, garlic, and Fresno chili. Deglaze the pot with 2 cups beef stock, and add sport pepper juice, bay leaf, and thyme. Return the meat to the Instant Pot.\nPlace the lid on the pot and cook on High Pressure for 4 minutes, then set the pot to the Keep Warm setting, and leave it for 40 minutes.\nTake the meat out and slice thin. Strain the braising liquid, and place braising liquid and sliced meat back into the pot. Add remaining 1 cup broth to the pot.\nIf desired, dip the inner face of split hoagie rolls in the braising liquid. Add meat to hoagie rolls. Garnish with chopped giardiniera and serve immediately.\nFrom the Editor:\n"Sport peppers are small hot pickled peppers, sometimes called Chicagos favorite pepper."
103	One-Pot Beef Ramen Noodles	30 mins	1 pound ground beef\n3 cups cabbage\n1 1/2 cups red bell pepper\n3 garlic, minced\n2 cups chicken stock\n3 tablespoons soy sauce\n3 tablespoons hoisin sauce\n2 packages instant ramen noodles\n1 cup carrots\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nHeat a medium Dutch oven over medium-high heat. Add the beef; cook, stirring occasionally to break the meat into crumbles, until browned and no longer pink, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in cabbage, bell peppers, and garlic. Cook, stirring often, until vegetables begin to wilt and cabbage is translucent, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in chicken broth, soy sauce, hoisin sauce; bring it to a boil over medium high heat. Once at a boil, nestle in ramen, spooning the beef mixture over the ramen as needed to make sure the ramen is fully submerged. Reduce the heat to medium. Cover and cook, undisturbed, until the ramen is tender, 5 to 7 minutes. Stir in carrots. Cover and remove from heat. Let sit until carrots are tender, 1 to 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nGarnish with scallions and sesame seeds. Serve.\nDOTDASH MEREDITH FOOD STUDIOS DOTDASH MEREDITH FOOD STUDIOS
104	Ground Beef and Broccoli Stir Fry	25 mins	1 cup beef broth\n1/4 cup soy sauce\n3 tablespoons light brown sugar\n1 tablespoon cornstarch\n1 tablespoon fresh ginger\n2 teaspoons garlic\n2 teaspoons rice vinegar\n3 tablespoons canola oil\n2 cups yellow onion\n2 (8 ounce) packages broccoli florets\n1 pound ground beef\n3/4 teaspoon kosher salt\n2 cups cooked jasmine or sticky rice,\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nWhisk together beef broth, soy sauce, brown sugar, cornstarch, ginger, garlic, and rice vinegar in a bowl until combined and sugar and cornstarch are dissolved; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat 2 tablespoons of the oil in a large skillet over medium-high heat until shimmering. Add onion, and cook, stirring occasionally, until softened, about 2 minutes. Add broccoli, and cook, stirring occasionally, until bright green, tender-crisp, and onion is browned, 6 to 7 minutes. Transfer to a plate. Do not wipe skillet clean.\nDOTDASH MEREDITH FOOD STUDIOS\nReduce the heat to medium, and add remaining 1 tablespoon oil to skillet. Add ground beef and salt, and cook, stirring often to break meat into even crumbles, until browned and cooked through, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nWhisk broth mixture again, and pour into skillet. Cook over medium heat, stirring constantly, until sauce thickens slightly, 3 to 5 minutes. Return broccoli mixture to skillet, and cook, stirring occasionally, until sauce evenly coats meat and vegetables, 3 to 4 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nServe over rice, and garnish with scallions and toasted sesame seeds.\nDOTDASH MEREDITH FOOD STUDIOS
105	Chicken Koftas	35 mins	1 cup chopped sweet onion\n1 cup cilantro leaves and tender stems\n1/2 cup mint leaves\n4 cloves garlic\n2 tablespoons fresh ginger\n1 jalapeño chile\n1 pound ground chicken\n1/4 cup dry breadcrumbs or cornmeal\n2 tablespoons olive oil\n1 large egg\n2 teaspoons garlic powder\n1 1/4 teaspoons kosher salt\n1 teaspoon ground cumin\n1 teaspoon ground coriander\n1 teaspoon ground black pepper\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nAdd onion, cilantro, mint, garlic, ginger, and jalapeño to a food processor; pulse until very finely chopped, about 10 (1-second) pulses. Transfer mixture to a kitchen towel, and squeeze out as much liquid as possible.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd squeezed onion mixture, ground chicken, breadcrumbs, oil, egg, garlic powder, salt, cumin, coriander, and black pepper to a large bowl; mix gently until thoroughly incorporated.\nDOTDASH MEREDITH FOOD STUDIOS\nWith moistened gloved hands, shape chicken mixture into 12 (3x1-1/2-inch) cylinders and place on a baking sheet. (If grilling, shape mixture onto skewers).\nDOTDASH MEREDITH FOOD STUDIOS\nTo Broil: Preheat the oven’s broiler and set a rack about 7 inches from the heat source. Line a large rimmed baking sheet with aluminum foil, and coat with cooking spray. Arrange koftas in a single layer about 2 inches apart, and spray with cooking spray. Broil, flipping koftas halfway through cook time, until browned and a thermometer inserted into center reads 165 degrees F (74 degrees C), about 8 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTo Grill: Preheat grill to medium, 350 to 400 degrees F (175 to 200 degrees C). Place skewers on oiled grates; grill, covered, flipping every 2 minutes, until charred and a thermometer inserted into center reads 165 degrees F (74 degrees C), about 8 minutes. Alternative Method: Heat a large oiled grill pan over medium-high, about 2 minutes. Add koftas to pan; grill, uncovered, flipping every 2 minutes, until charred and a thermometer inserted into center reads 165 degrees F (74 degrees C), about 10 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTo Air-fry: Preheat an air fryer to 380 degrees F (193 degrees C) for 2 minutes. Spray koftas with cooking spray. Working in batches if needed, add koftas to air fryer basket in a single layer, and cook, flipping after 4 minutes, until browned and a thermometer inserted into center reads  165 degrees F (74 degrees C), about 8 minutes.\nDOTDASH MEREDITH FOOD STUDIOS
106	Crockpot Buffalo Chicken Chili	3 hrs 45 mins	2 (15-ounce) cans cans\n2 (14.5-ounce) fire-roasted diced tomatoes with garlic\n1 cup yellow onion\n1 red bell pepper, chopped\n1/4 cup B B\n2 tablespoons chili powder\n2 teaspoons garlic powder\n1 1/2 pounds boneless, skinless chicken thighs\n1 cup plain whole-milk strained (Greek-style) yogurt\n1 1/2 tablespoons ranch dressing mix\n6 ounces cream cheese, cubed and softened\n1/2 cup scallions\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nIn a 6-quart slow cooker, stir together beans, diced tomatoes with garlic, onion, bell pepper, hot sauce, chili powder, and garlic powder; nestle chicken in bean mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook until chicken is tender, about 3 hours on HIGH and 5 hours on LOW.\nDOTDASH MEREDITH FOOD STUDIOS\nMeanwhile, stir together yogurt and ranch dressing mix in a small bowl until smooth. Cover and refrigerate until ready to serve.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove chicken from slow cooker and shred it using two forks.\nDOTDASH MEREDITH FOOD STUDIOS\nReturn shredded chicken to slow cooker. Stir in cream cheese until smooth and well combined. Cover and cook on HIGH until warmed through, about 30 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nServe with a dollop of yogurt mixture. Garnish with scallions and serve with tortilla chips, if desired.\nDOTDASH MEREDITH FOOD STUDIOS
107	Summer Meat Slaw	30 mins	1 head green cabbage\n1/2 cup green onions\n1 red bell pepper\n1 large carrot\n2 cloves garlic\n4 cups pulled pork\n1/4 cup avocado oil\n1 teaspoon kosher salt\n1/2 teaspoon ground black pepper\n2 teaspoons riracha\n1/3 cup seasoned rice vinegar\n1/3 cup chopped cilantro\n##linh##\nHalve and core cabbage; cut each half into 2 pieces, and slice cabbage into 1/4-inch thick strips; set aside.\nAdd green onions, bell pepper, and garlic to a large mixing bowl. With a vegetable peeler, peel thin strips of carrot over the top.\nPlace a nonstick skillet over high heat and add pork. Cook until pork is very hot and a brown crust is forming on the meat, about 5 minutes. If meat is lean, 1 to 2 tablespoons of oil can be added to the pan as needed. Pour hot pork over veggies and mix with tongs to combine.\nAdd 2 tablespoons oil to the same pan and place over high heat. Transfer in cabbage and salt. Cook, stirring, until cabbage softens and starts to brown in spots, but still retains a bit of crunch.\nAdd cabbage, black pepper, Sriracha, and rice vinegar to the bowl; mix slaw thoroughly. Add cilantro, and mix thoroughly.  Taste for seasoning, and adjust salt and pepper, heat, and vinegar as needed.\nServe hot, warm, or at room temperature, garnished with thinly sliced green onion. If making ahead, warm slaw before serving.\nJOHN MITZEWICH
108	Loaded Chicken and Hash Brown Casserole	1 hr 20 mins	1 (10.5 ounce) cup condensed cream of chicken soup\n1/2 (1.25-ounce) envelope whole milk\n1 teaspoons ranch dressing dip mix\n2 teaspoon kosher salt\n1 teaspoon freshly ground buffalo-style hot sauce\n1 teaspoon freshly ground\n1 teaspoon paprika\n1/2 cups garlic powder\n1 1/4 (30-ounce) package sour cream, divided\n1 cups frozen shredded hash browns, thawed\n1 1/2 slices chopped rotisserie chicken\n6 cups bacon, plus more for garnish\n##linh##\nGather all ingredients. Preheat oven to 350 degrees F (175 degrees C). Coat a 9- x 13-inch baking dish with cooking spray.\nDOTDASH MEREDITH FOOD STUDIOS\nIn a large bowl, stir together cream of chicken soup, milk, ranch dip mix, salt, hot sauce, pepper, paprika, garlic powder, and 1 cup of the sour cream until combined. Add hashbrowns, chicken, bacon, and 1 cup of the cheese; mix until fully combined.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer mixture to prepared baking dish. Sprinkle evenly with remaining 1 cup cheese. Cover with aluminum foil.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until potatoes are tender, about 45 minutes. Uncover; bake until cheese is melted, about 10 minutes. Let stand 10 minutes before serving\nDOTDASH MEREDITH FOOD STUDIOS\nDollop evenly with remaining 1/4 cup sour cream; garnish with bacon and scallions.\nDOTDASH MEREDITH FOOD STUDIOS
109	Roscoe's Chicken 65	25 mins	2 pounds skinless boneless chicken thighs\n1/4 cup fresh curry leaves\n1 cup plain yogurt\n1 tablespoon garlic\n1 tablespoons ginger\n2 tablespoons Kashmiri hot chili powder\n1 tablespoon salt\n1 tablespoon turmeric\n1 tablespoon garam masala\n1 tablespoon ground coriander\n1 teaspoon cardamom\n1 teaspoon freshly ground black pepper\n1 cup cornstarch\n1 cup rice flour\n1 cup chili peppers\n2 cups vegetable oil\n##linh##\nMix chicken, curry leaves, yogurt, garlic, ginger, chili powder, turmeric, garam masala, salt, coriander, cardamom, and black pepper together. Cover and let marinate in a refrigerator for 2 hours or up to overnight.\nStir cornstarch and rice flour into chicken and yogurt mixture just before preparing to fry chicken.\nHeat oil in a deep pan over medium heat. Add chicken pieces and chili peppers carefully into the hot oil, working in batches, and fry, stirring frequently, until browned and crispy, about 5 minutes.\nTransfer to a plate lined with paper towels to drain. Repeat with remaining chicken pieces.\nCook’s Note\nCurry leaves are a wonderful addition but this dish will still be good if you can’t find them at your local international grocery store.\nFrom the Editor\nNutrition data for this recipe includes the full amount of marinade ingredients. The actual amount of marinade consumed will vary. We have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. The exact amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nDOTDASH MEREDITH FOOD STUDIOS
110	I Made Trisha Yearwood's Charleston Cheese Dip and It's Dip Heaven	27 mins	2 tablespoons salted butter, melted\n1/4 cup panko breadcrumbs\n4 ounces cream cheese, softened\n1/4 cup "mayonnaise (such as Duke\n1/2 cup s)"\n1/4 cup sharp Cheddar cheese\n6 slices onterey Jack cheese\n2 bacon, cooked and crumbled, divided\n1/8 teaspoon green onions, finely chopped, divided\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C)\nCombine melted butter and panko in a small bowl. Toss to coat panko thoroughly and set aside\nSet aside 1/2 tablespoon green onions. Mix cream cheese, mayonnaise, Cheddar cheese, Monterey Jack cheese, remaining green onion, 1/2 of the bacon, and cayenne pepper in a bowl. Transfer mixture to a small 8x6-inch baking dish and smooth out the top. Evenly sprinkle buttered panko crumbs over the top.\nBake in the preheated oven until cheese is starting to bubble and panko has slightly darkened, about 10 minutes. Turn on the broiler and broil until the top is the darkness you prefer, 1 to 2 minutes.\nRemove from the oven and sprinkle with remaining bacon and green onion. Serve with tortilla chips for dipping.\nLADONNA LANGWELL
111	Texas Toast “Maid Rites”	30 mins	1 pound ground round\n1 cup yellow onion\n2 teaspoons garlic\n1/4 cup beef broth\n1 tablespoon apple cider vinegar\n1 tablespoon light brown sugar\n1 tablespoon Worcestershire sauce\n1 teaspoon kosher salt\n1 teaspoon soy sauce\n1 teaspoon yellow mustard\n1/4 teaspoon black pepper\n1 slices Texas Toast garlic bread\n8 ounces triple Cheddar blend\n##linh##\nGather ingredients. Preheat oven to 425 degrees F (220 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nHeat a large skillet over medium-high. Add ground beef and onion; cook, stirring often to crumble, until meat is browned in spots and no longer pink, and onion is softened, about 8 minutes. Add garlic and cook, stirring constantly, until fragrant, about 1 minute.\nDOTDASH MEREDITH FOOD STUDIOS\nWhile meat cooks, whisk together broth, vinegar, brown sugar, worcestershire, salt, soy sauce, yellow mustard, and pepper in a small bowl.\nDOTDASH MEREDITH FOOD STUDIOS\nStir broth mixture into skillet and cook, stirring often, until sauce has reduced slightly, about 2 minutes. Remove from heat.\nDOTDASH MEREDITH FOOD STUDIOS\nArrange toasts in an even layer on a large rimmed baking sheet. Bake in the preheated oven until crisp and lightly browned on the bottoms, but still soft in the center, 8 to 9 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nUse the round side of a large spoon to press into the center of each toast to create a well, leaving about a 1/4-inch border around the edge of each bread. Spoon about a heaping 1/4 cup of meat mixture into each well. Sprinkle meat and toasts with cheese (about 1/4 cup per toast).\nDOTDASH MEREDITH FOOD STUDIOS\nReturn baking sheet to oven and bake at 425 degrees F (220 degrees C) until cheese is just melted and toasts are crisp, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS Serve immediately with pickle chips.\nDOTDASH MEREDITH FOOD STUDIOS How to Store, Freeze, or Make Ahead\nStore leftovers in an airtight container in the fridge for up to 3 days.\nThe meat mixture can be frozen for up to 3 months in freezer-safe containers. When you’re ready, thaw in the fridge and warm it up on the stove or microwave.\nThe Texas Toast should be baked right before serving. It does not save well.\nTips, Tricks, Shortcuts\nDon’t worry about the bits of cheese that fall off the meat and onto the baking sheet – it makes delicious crispy cheese bits\nCook’s Note\nInstead of the Texas Toast, you can serve this loose beef mixture on a toasted burger bun, as they do at the Maid Rite restaurant.\nUse a different flavor of Texas Toast – Pepperidge Farm has 5-Cheese and Monterey Jack flavors.\nThe sandwich is typically served with pickles (either dill or bread and butter), ketchup, and mustard (like a burger!)
112	Tuscan Chicken Casserole	40 mins	1 pound boneless chicken breasts\n1 teaspoon talian seasoning\n1/2 teaspoon paprika\n1/2 teaspoon onion powder\n1/2 teaspoon red pepper flakes\n1/2 teaspoon garlic powder\nNone salt and freshly ground black pepper to taste\n2 cups fresh spinach\n4 (4 ounce) can sliced mushrooms\n1/2 cup sun-dried tomatoes\n3/4 cup shredded mozzarella cheese\n1/4 cup grated Parmesan cheese\n3/4 cup heavy cream\n1/3 cup grated Parmesan cheese\n1 clove garlic, pressed\n2 ounces cream cheese, softened\n1 1/2 teaspoons chicken bouillon granules,\n2 tablespoons chicken broth\n2 tablespoons oil\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C). Spray an 8x8-inch baking dish with nonstick cooking spray.\nSeason both sides of chicken with Italian seasoning, paprika, onion powder, pepper flakes, garlic powder, salt and pepper. Place in the prepared pan. Place spinach over chicken, mushrooms over spinach, and sun-dried tomatoes over mushrooms. Top with mozzarella and Parmesan cheese.\nFor sauce, beat cream, Parmesan cheese, garlic, cream cheese, chicken bouillon, chicken broth, and oil together in a bowl until just combined. Season with salt and pepper. Pour mixture over chicken.\nBake casserole in the preheated oven until bubbly, chicken is no longer pink, and juices run clear, 20 to 25 minutes.  An instant-read thermometer inserted in the center of chicken should read 165 degrees F (74 degrees C).
113	Air Fryer Po' Boy	35 mins	¼ cup lemon juice\n3 tablespoons olive oil\n2 cloves garlic, minced\n1 tablespoon chopped fresh tarragon\n2 teaspoons Dijon mustard\n½ teaspoon kosher salt, divided\n1 (14 ounce) package shredded coleslaw mix\n¾ cup buttermilk\n2 teaspoons hot pepper sauce\n1 teaspoon cayenne pepper\n1 teaspoon ground dried chipotle pepper\n½ teaspoon ground black pepper\n1 ½ pounds large shrimp - peeled, deveined, and tails removed\n2 cups whole wheat panko bread crumbs\n6 (6 inch) whole-wheat hoagie rolls, split and toasted\n##linh##\nTo make the coleslaw: Whisk lemon juice, oil, garlic, tarragon, mustard, and 1/4 teaspoon kosher salt together in a bowl. Add coleslaw mix and toss to coat. Set aside.\nWhisk buttermilk, hot sauce, cayenne, chipotle pepper, black pepper, and remaining salt together in another bowl. Add shrimp to buttermilk mixture, tossing to coat; let marinate for a few minutes.\n"Meanwhile, preheat an air fryer to 400 degrees F (200 degrees C) according to manufacturers instructions."\nAdd 2/3 cup panko to a shallow dish. Remove shrimp from buttermilk mixture, letting excess drip off. Working in 3 batches, dredge 1/3 of the shrimp in 2/3 cup panko, turning evenly to coat. Transfer to a baking sheet and repeat with remaining shrimp and panko.\nWorking in batches if necessary, arrange shrimp in a single layer in the fryer basket. Cook, turning once, until shrimp are golden brown and cooked through, about 8 minutes.\nTo serve, put coleslaw in rolls and top with shrimp.
114	Slow Cooker Pozole	6 hrs 55 mins	1 tablespoon canola oil\n1 (2 pound) boneless pork loin roast, cut into 1-inch cubes\n2 (14.5 ounce) cans enchilada sauce\n2 (15.5 ounce) cans white hominy, drained\n1 cup onion, sliced\n½ cloves green chilies, diced\n4 teaspoon garlic, minced\n½ teaspoons cayenne pepper, or to taste\n2 cup dried oregano\n¼ teaspoon cilantro, chopped\n##linh##\nHeat oil in a skillet over high heat. Add pork; cook and stir just until meat is browned on all sides, about 5 minutes.\nPlace meat in a 4-quart slow cooker. Pour enchilada sauce over the meat. Top with hominy, onion, chilies, garlic, cayenne pepper, and oregano. Pour in enough water to fill the slow cooker.\nCover and cook on High for 6 to 7 hours. Stir in cilantro and salt. Cook on Low for 30 minutes more.
115	Crockpot Lasagna Soup	2 hrs 50 mins	1 1/2 pounds 93/7 lean ground beef\n1 1/2 cups yellow onion\n6 cloves garlic\n1 1/2 teaspoons salt, divided\n3/4 teaspoon black pepper, divided\n6 cups beef broth\n1 1 (24-ounce) jar "marinara sauce (such as Rao\n1 15-ounce) can s)"\n1 (6-ounce) can diced tomatoes, drained\n1/4 teaspoon basil, garlic, and oregano tomato paste\n8 ounces crushed red pepper, plus more for garnish\n2 cups lasagna noodles, broken into 1 3/4-inch pieces (About 8 to 9 sheets)\n1 (15-ounce) container baby spinach, chopped\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nCombine ground beef, onion, garlic, 1/2 teaspoon salt, and 1/2 teaspoon black pepper in a large nonstick skillet over medium-high. Cook, stirring occasionally, until beef is no longer pink and onions are softened, about 8 minutes. Transfer to a 6-quart slow cooker.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in broth, marinara sauce, diced tomatoes, tomato paste, crushed red pepper, remaining 1 teaspoon salt, and remaining 1/4 teaspoon black pepper until combined.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook on LOW until soup is just slightly thickened, 3 1/2 to 4 hours, or on HIGH for 2 hours.\nDOTDASH MEREDITH FOOD STUDIOS\nStir lasagna noodles into crockpot until sheets are submerged in liquid. Cover and cook on HIGH until pasta is al dente, about 30 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStirring in spinach the last 5 minutes of cooking.\nDOTDASH MEREDITH FOOD STUDIOS\nServe with a dollop of ricotta and Parmesan cheese. Garnish with crushed red pepper.\nDOTDASH MEREDITH FOOD STUDIOS
116	Parmesan-Crusted Baked Fish	30 mins	1 tablespoon lemon, divided\n1 clove olive oil, divided\n1 cup garlic\n1/4 cup panko breadcrumbs\n1/4 teaspoons Catanzaro grated Parmesan cheese\n1 1/2 pound Catanzaro\n1 white fish fillets\nNone tablespoon salt and freshly ground black pepper to taste\n##linh##\nPreheat the oven to 450 degrees F (230 degrees C). Line a baking sheet with foil.\nCut lemon in half, and then into wedges. Squeeze juice from two lemon wedges into a small bowl. Add 2 teaspoons olive oil. Using a microphone grater, grate garlic clove into a paste; add to the bowl. Stir in panko, Parmesan cheese, and Catanzaro herbs.\nDrizzle remaining 1 teaspoon oil onto the prepared baking sheet. Season both sides of cod with salt and pepper; place on the baking sheet. Brush cod with Dijon mustard, and press panko mixture evenly onto cod.\nBake in the preheated oven until fish flakes easily with a fork, about 15 minutes. Serve with remaining lemon wedges.\nCook’s Note\nI used a microplane grater for the Parmesan; 1/4 cup finely grated cheese weighed about 20 grams.
129	Lazy Wonton Soup	40 mins	2 quarts chicken stock or broth\n1 bunch green onions, divided\n1 garlic clove, thinly sliced\n1 3-inch fresh ginger,\n2 tablespoons soy sauce, plus more to taste\n1 1/2 teaspoons rice vinegar\n1 tablespoon brown sugar\n1 teaspoon kosher salt, divided\n1 pound ground pork\n2 teaspoons toasted sesame oil\n2 teaspoons cornstarch\n3 heads baby bok choy\n##linh##\nDOTDASH MEREDITH FOOD STUDIOS\nPlace chicken stock in a large saucepan or Dutch oven over medium-high heat. Cut white parts of green onions into 1-inch pieces and add to broth. Add garlic clove. Thinly slice 1 inch ginger (or 1 teaspoon ground)  and add to stock. Add 1 tablespoon soy sauce, vinegar, brown sugar and 1/2 teaspoon salt. Bring mixture to a boil, stirring occasionally.\nPlace pork in a bowl. Finely slice remaining green parts of green onions. Set aside 3 tablespoons for garnish. Add remaining onions to the bowl; grate in remaining 2-inch piece of ginger. Add remaining soy sauce, remaining salt, sesame oil, and cornstarch to the bowl; mix until well combined.\nForm mixture into 1-inch balls and add to broth. Alternatively, use a small spoon to drop heaping teaspoons full of meat into broth. Reduce heat to a simmer; cook 5 minutes. Add wonton wrappers, bok choy, and additional soy sauce to taste. Cook 8 minutes, stirring occasionally.\nServe with reserved green onions and hot sauce or chili crisp if desired.
117	Fettuccine with Shrimp, Tomatoes, and Spinach Cream Sauce	40 mins	8 ounces fettuccine\n1 tablespoon unsalted butter\n1 tablespoon olive oil\n4 cloves garlic,\n1 pound shrimp\nNone salt and freshly ground black pepper, as needed\n1/2 cup shallot\n1/2 teaspoon red pepper flakes\n2 cups cherry tomatoes\n1/4 cup parsley\n1/2 cup white wine\n2 cups fresh spinach\n1 cup heavy cream\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil. Cook fettuccine at a boil until tender yet firm to the bite, about 8 minutes. Drain; reserving about 1/2 cup pasta water.\nMeanwhile, heat butter and olive oil in a large skillet over medium heat until butter is melted. Slice 2 garlic cloves, add to the skillet, and cook until lightly browned, about 2 minutes. Remove garlic from the skillet and discard.\nCarefully add shrimp to the skillet with a pinch of salt and pepper. Cook until shrimp is pink, opaque, and curled into a “C” shape, 2 to 3 minutes per side. Remove from the skillet and keep warm.\nAdd shallot to the skillet and cook, stirring, until softened, 2 to 3 minutes; stir in red pepper flakes. Mince remaining 2 garlic cloves; add to skillet and cook, stirring, until fragrant, about 30 seconds.\nAdd sliced tomatoes, minced parsley, and white wine. Bring to a boil, and cook for 2 to 3 minutes. Stir in chopped spinach; cook until just wilted and bright green. Return cooked shrimp to the skillet; stir in cream. Season to taste with salt and pepper.\nRemove from heat. If sauce is too thick, stir in 1 tablespoon pasta water at a time, until desired consistency is achieved. Stir in pasta, and ladle into serving bowls. Garnish with additional flat leaf parsley sprigs.
118	Cheeseburger Garbage Bread	1 hr 45 mins	6 slices bacon, cut into 1-inch pieces\n1 cup red onion\n1 pound ground beef\n1/2 teaspoon kosher salt, or to taste\n1/2 teaspoon ground black pepper\n1 pinch cayenne pepper\n1 teaspoon Worcestershire sauce\n2 tablespoons ketchup\n1 tablespoon Dijon mustard\n8 ounces Cheddar cheese, shredded, divided\n1 pound "pizza dough (see Chef\n1/2 cup s Notes)"\n1/3 cup dill pickle or relish\n1 tablespoon green onions\n1 tablespoon "butter (see Chef\n1/3 cup s Notes)"\n3 tablespoons sesame seeds\n2 tablespoons mayonnaise\n2 tablespoons ketchup\n1 tablespoon mustard\n##linh##\nCook bacon over medium heat in a nonstick skillet until crisp, about 5 minutes. Drain bacon on a paper towel-lined plate; set aside. Do not wipe out the pan.\nAdd onions and pinch of salt to the pan with the bacon grease, and turn heat to medium-high. Sauté until onions soften up and start to take on golden-brown color, 3 to 4 minutes. Add beef; cook, breaking up the meat with a spatula up into small crumbles, until browned, 5 to 7 minutes.\nStir salt, freshly ground black pepper, cayenne, and Worcestershire sauce into the beef; continue to cook until beef is browned and any liquid in the pan has evaporated.\nTurn off the heat. Stir in reserved bacon, 2 tablespoons ketchup, 1 tablespoon mustard, and 1/2 the shredded Cheddar cheese. Let mixture cool to room temperature before using, about 15 minutes.\nPreheat the oven to 375 degrees F (190 degrees C). Line a baking sheet with parchment paper.\nUsing only as much flour as needed, press, roll and stretch pizza dough out into a 10x15-inch rectangle.\nTransfer meat mixture onto dough, leaving 1 1/2 inches of dough uncovered on both short sides, as well as the long edge closest to you. Leave about 2 1/2 inches uncovered on the opposite edge.\nScatter dill pickle and green onions over beef, and then top evenly with remaining cheese. Brush a little water along the long edge of dough, where the roll will finish.\nFold the dough from each side over the filling, and then begin rolling up from the bottom. As you roll, make sure the dough on each end stays sealed and holds in filling. When the roll is almost complete, stretch the edge of the dough and complete rolling with the seam on the bottom.\nTransfer roll to the prepared sheet pan. Brush with melted butter or a beaten egg, and sprinkle with sesame seeds.\nBake in the preheated oven until well browned, and fat from the beef has started to leak out from the bottom or ends of the roll, about 35 minutes.\nMeanwhile for "Secret Sauce", whisk mayonnaise, 3 tablespoons ketchup, 2 tablespoons mustard, 2 tablespoons dill pickle, and 1 tablespoon sliced green onions together in a small bowl.\nTransfer to a cooling rack, and let rest 20 to 30 minutes before serving. Serve with “Secret Sauce.”\nJOHN MITZEWICH "Chefs Notes:"\nTry one of these favorite pizza crust recipes:\nChef John’s Easy Homemade Pizza Dough\nWolfgang Puck’s Famous California Pizza Dough\nDetroit-Style Pizza Crust New York Italian Pizza Dough\nTo finish the roll, melted butter tastes great, but doesn’t do a great job of making the sesame seeds stick. If you want the seeds to stay on when you cut, use a beaten egg instead.
119	Baked Pumpkin Polenta	4 hrs 10 mins	2 tablespoons olive oil\n2 tablespoons butter\n8 to 10 sage leaves\n1 (15 ounce) can pumpkin puree\n5 1/2 cups water\n1 1/2 teaspoons kosher salt\n1/2 teaspoon ground black pepper\n1 1/2 cups yellow cornmeal\n1 pinch cayenne pepper (optional)\n1/4 cup milk\n1 1/2 cups Parmigiano Reggiano or pecorino cheese\n2/3 cup Monterey Jack\n##linh##\nAdd olive oil to a saucepan set over medium-high heat; add butter, and heat until melted. Toss in sage leaves and fry until they are dark green and have stopped bubbling, 20 to 30 seconds. Turn off the heat; remove sage leaves to a paper towel-lined plate and set aside. Fried sage leaves can be stored in the refrigerator and used to garnish the tops later.\nAdd pumpkin to the pan, pour in water, and turn heat to high. Whisk and bring to a boil. Season with salt and pepper.\nWith mixture boiling, slowly sprinkle in cornmeal, whisking constantly. Reduce heat to medium-low, and cook, stirring occasionally, until cornmeal is creamy, soft, and no longer gritty, about 25 minutes.\nTurn off heat; add cayenne, milk, and Parmigiano Reggiano cheese. Whisk thoroughly until evenly combined.\nGenerously grease a 9x9-inch cake pan with olive oil; spread polenta evenly into the pan. Let cool to room temperature. Wrap and chill in the refrigerator for at least 3 hours.\nPreheat the oven to 425 degrees F (220 degrees C). Invert cold, firm polenta onto a cutting board and cut into 8 equal portions.\nTransfer to a lined baking sheet, and top each piece with grated Monterey Jack cheese. Sprinkle tops with paprika or cayenne, if desired.\nBake in the preheated oven until polenta is heated through, and the edges are turning golden-brown, about 30 minutes. Garnish tops with fried sage and serve.\nJOHN MITZEWICH
120	Salmon Croquettes	45 mins	1 pound boneless, skinless salmon fillets\n½ cup baking mix (such as Bisquick)\n½ cup diced onion\n¼ cup diced red bell pepper\n¼ cup freshly chopped parsley\n1 large egg\n3 cloves garlic, minced\n½ teaspoon Worcestershire sauce\n¼ teaspoon seasoned salt\n¼ teaspoon seafood seasoning (such as Old Bay)\n⅓ cup cornmeal\n2 tablespoons vegetable oil\n##linh##\nFinely chop the salmon using a food processor.\nTransfer salmon to a bowl. Add baking mix, onion, bell pepper, parsley, egg, garlic, Worcestershire, seasoned salt, and seafood seasoning; mix well until well combined.\nForm the mixture into 8 small patties, and place onto a plate lined with waxed paper. Refrigerate the patties for 15 minutes.\nHeat vegetable oil in a skillet over medium heat. Place cornmeal into a shallow dish and dredge each patty in cornmeal, pressing lightly so that the cornmeal adheres to both sides of the patties.\nCook patties in the oil until golden and cooked through, working in batches, about 3 to 4 minutes per side.\nCook’s Note\nIf you are struggling to form the patties due to the mixture being sticky, rinse your hands after forming every few patties, as the mixture is easier to work with while your hands are clean.
121	Cucumber Feta Couscous Salad	45 mins	2 tablespoons white balsamic vinegar\n1 1/2 teaspoons lemon juice\n1/2 teaspoon Dijon mustard\n1/2 teaspoon lemon zest\n1/4 cup olive oil\nNone salt and freshly ground black pepper to taste\n1 tablespoon olive oil\n1 cup Israeli couscous\n1 3/4 cups low-sodium chicken broth\n1/4 cup dried cranberries (such as Craisins®)\n1/2 cup chopped cucumber\n1/2 cup feta cheese\n3 tablespoons red onion\n1 tablespoon fresh mint\n##linh##\nIn a small bowl, combine vinegar, lemon juice, Dijon, and lemon zest. Add olive oil and whisk until well blended. Season with salt and pepper, and set aside.\nHeat olive oil in saucepan over medium heat. Add couscous, stirring occasionally, until toasted and starting to turn light golden brown, 4 to 5 minutes.\nPour chicken broth over couscous, stir in cranberries, and bring to a boil. Reduce heat to medium-low, cover, and simmer until most of the liquid has been absorbed, 8 to 9 minutes. Remove lid from saucepan, and allow couscous to cool for about 15 minutes.\nFluff cooled couscous with a fork, add cucumber, feta cheese, and red onion. Drizzle dressing over couscous, and toss lightly.\nTaste and season with salt and pepper, if desired, and garnish with fresh mint. May be served immediately or chilled in the fridge.\nCook’s Note\nYou can substitute white wine vinegar for white balsamic vinegar.
128	Lemon Garlic Butter Chicken Spiedini	30 mins	1/2 cup extra-virgin olive oil\n1/4 cup white wine, such as Pinot Grigio\n3 tablespoons lemon juice\n1 teaspoon lemon zest\n4 cloves garlic\n1/4 teaspoon crushed red pepper flakes\n1/4 teaspoon oregano\n2 teaspoons kosher salt\n1 teaspoon pepper\n2 pounds skinless boneless chicken thighs\n2/3 cup Italian breadcrumbs\n2/3 cup panko\n1/2 cup grated Parmesan cheese\n1/2 teaspoon garlic powder\nNone None  skewers\n4 tablespoons cooking spray\n2 teaspoons butter\n##linh##\nWhisk together olive oil, wine, 2 tablespoons lemon juice, lemon zest, 1/2 of the garlic, crushed red pepper, oregano, 1 teaspoon salt, and 1/2 teaspoon pepper in a bowl. Add chicken and toss to coat. Cover and refrigerate 30 minutes to 1 hour.\nStir together remaining salt and pepper with bread crumbs, panko, Parmesan cheese, and garlic powder in a shallow dish. Remove chicken from marinade and toss to coat in breadcrumb mixture, pressing to adhere as necessary. Thread chicken onto skewers and coat with olive oil cooking spray.\nPreheat an air fryer to 390 degrees F (198 degrees C).  Air fry until chicken is no longer pink at the center and juices run clear, and is until lightly golden brown and crisp, about 12 minutes. An instant read thermometer, inserted near the center, should read 165 degrees F (74 degrees C).\nMeanwhile, melt butter with remaining garlic in a microwave-safe dish on High in the microwave, about 10 seconds.  Stir in remaining lemon juice and parsley. Drizzle butter mixture over chicken just before serving.\nDOTDASH MEREDITH FOOD STUDIOS From the Editor\nNutrition data for this recipe includes the full amount of breading and marinade ingredients. The actual amount of breading and marinade consumed will vary.
122	Red Wine Braised Beef Tips	2 hrs 20 mins	3 pounds beef tips (see Note:)\n1 1/2 teaspoons salt\n1 teaspoon black pepper\n2 tablespoons vegetable oil\n1 large onion\n12 ounces mushrooms\n4 cloves garlic\n1 teaspoon dried thyme\n1 cup red wine\n1 cup beef broth\n1 tablespoon Worcestershire sauce\n1/4 cup all-purpose flour\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C). Season beef tips with salt and black pepper.\nHeat a Dutch oven over medium-high heat, then add oil. Add seasoned beef tips and brown on all sides, 3 to 5 minutes. Remove beef tips to a plate and keep warm.\nReduce heat to medium; add onions and mushrooms. Cook, stirring continuously, until vegetables are softened, 2 to 3 minutes. Stir in garlic and thyme.\nPour in wine, and stir, scraping up any browned bits from the bottom of the pan. Bring to a boil and add beef broth and Worcestershire sauce. Adjust seasoning, if necessary, and add meat and any accumulated juices to the pot.\nBake, covered, in the preheated oven until meat is fork tender, 1 1/2 to 2 hours. Using a slotted spoon, remove meat and mushrooms from braising liquid.\nPlace flour in a small bowl and add about 1/2 cup of water. Whisk briskly until there are no lumps. Whisk about 1/2 cup of braising liquid into the flour mixture.\nWhisk flour mixture into the braising liquid in the pan. Place pot over medium heat, stirring briskly, until mixture comes to a boil. Continue to whisk until bubbles collapse and look like bullseyes, about 3 minutes. Add beef and mushrooms back to the liquid and serve.\nCook’s Note\nAsk your butcher which cut of meat is used for the tips. Some parts of the country use chuck, some use part of the round, and some use tri tip or sirloin cuts. Check tri-tip or sirloin beef tips for tenderness after 1 hour, or at the 90-minute mark. Beef tips from the chuck or arm will need a longer braise time. Small pieces of meat will cook more quickly, so consider cutting pieces larger than 1 1/2-inch into smaller pieces.
123	Crispy Slow Cooker Carnitas	6 hrs 20 mins	4 pounds pork shoulder\n1 tablespoon kosher salt\n1 teaspoon pepper\n2 teaspoons garlic powder\n2 teaspoons chili powder\n1 teaspoon cumin\n2 teaspoons olive oil\n1 orange, cut in half, juiced and peel reserved\n1 lime, juiced lime\n##linh##\nCut pork into 5 to 6 large chunks. Season each piece evenly with salt, pepper, garlic powder, chili powder, and cumin.\nHeat oil in a large skillet over high heat. Add pork in a single layer to the hot skillet. If meat does not fit, do this step in 2 batches. Cook pork, untouched until well browned on the first side, 4 to 5 minutes. Flip and cook another 3 to 4 minutes. Remove meat and place into the bottom of a slow cooker.\nTo the hot skillet, add onion and cook 1 minute. Deglaze pan with orange juice, lime juice, and 1 1/4 cups water and scrape up any browned bits from the bottom of the skillet. Pour water mixture over pork in the slow cooker, add bay leaves, and cover.\nCook on High for 4 to 5 hours or on Low 6 to 7 hours or until pork is very tender.\nPreheat the oven to broil. Remove pork from the slow cooker and shred into approximately 2 to 3 inch pieces and place on a rimmed baking sheet. Spoon some of the juices evenly over the pork, and reserve about 1 cup of juices for serving. Broil pork for 3 to 5 minutes, or until slightly crispy and browned, tossing halfway through if necessary.\nServe in toasted tortillas with japaleno slices, chopped onion, cilantro, and lime wedges, or as desired\nDOTDASH MEREDITH FOOD STUDIOS
124	Lacinato Kale Salad with Warm Bacon Vinaigrette	30 mins	2 bunches lacinato kale\n1/3 cup red onion (see Note)\n1/2 cup dried apricots\n1/2 cup slivered almonds\n1/2 red bell pepper\n3 slices bacon\n1 clove garlic\n2 tablespoons olive oil (see Note)\n1/4 cup balsamic vinegar\n1/2 teaspoon Dijon mustard\n1 pinch salt\n1 pinch ground black pepper\n1/8 teaspoon red pepper flakes\n##linh##\nWash kale in cold water and pat dry with paper towels. Using a sharp knife, remove stems and coarse veins, and chop kale into bite-sized pieces. Place chopped kale and red onion slices in a large salad bowl, and set aside.\nFor dressing, cook bacon in a skillet over medium heat until browned and crispy, 5 to 7 minutes. Remove bacon from the skillet, chop, and reserve.\nTo the bacon drippings in the same skillet, add only enough olive oil to equal 1/4 cup. Heat the combined drippings and the olive over medium heat until hot. Stir in the minced garlic and cook about 30 seconds.\nRemove the skillet from the heat and stir in balsamic vinegar, Dijon mustard, salt and pepper to taste, and red pepper flakes, to taste.\nPour mixture over torn kale and onion slices, and stir until well coated with the hot dressing. Add chopped apricots, blanched slivered almonds, and red bell pepper strips.\nGive the salad a final toss, and garnish with reserved chopped bacon.
125	Cowboy Spaghetti	55 mins	6 strips bacon\n1 onion\n2 cloves garlic\n1/2 teaspoon salt\n1/4 teaspoon pepper\n1 pound ground beef\n1 1/2 cups beef broth\n2 teaspoons Worcestershire sauce\n2 teaspoons hot sauce\n8 ounces spaghetti noodles\n1 (10 ounce) can diced tomatoes with green chiles\n1 (14.5 ounce) can fire roasted tomatoes\n1 (4 ounce) can tomato sauce\n1/2 cup sharp Cheddar cheese\n##linh##\nPlace bacon in a large cast iron skillet and cook over medium-high heat, turning occasionally, until slightly crisp, about 7 minutes. Remove bacon slices to a paper towel-lined plate. When bacon is cool enough to handle, crumble roughly and set aside.\nAdd onion to the same skillet with bacon grease and sauté until softened, about 3 minutes. Add garlic, salt, and pepper. Stir until garlic is fragrant, about 30 seconds.\nAdd ground beef. Cook and stir until beef is crumbly and no longer pink, about 5 minutes. Lower heat to medium-low, and stir in beef broth, Worcestershire sauce, and hot sauce. Stir in 1/2 of the crumbled bacon.\nBreak spaghetti noodles in half. Scatter over ground beef, making sure noodles are separated. Pour tomatoes with green chiles, fire-roasted tomatoes, and tomato sauce over noodles. Cover and cook for 20 minutes.\nRemove the lid and stir to combine the pasta and sauce. Smooth out mixture and scatter shredded cheese evenly over top. Sprinkle with remaining bacon. Cover and let cheese melt, about 5 minutes. Garnish with green onions; serve immediately.\nTHEDAILYGOURMET
126	Pumpkin Tiramisu Bundt Cake	1 hr 35 mins	2 1/4 cups cake flour\n1 1/2 teaspoons ground cinnamon\n1 1/2 teaspoons baking powder\n3/4 teaspoon salt\n1/2 teaspoon baking soda\n1/2 teaspoon ground ginger\n1/2 teaspoon ground nutmeg\n1/4 teaspoon ground cloves\n1/4 teaspoon ground allspice\n1/2 cup unsalted butter\n1 cup white sugar\n1/4 cup light brown sugar\n3 large eggs\n1 tablespoon vanilla extract\n1 (15 ounce) can pumpkin puree\n3/4 cup mascarpone cheese\n1/4 cup whole milk\n1 cup water\n3 tablespoons espresso powder\n3 tablespoons white sugar\n1/4 cup coffee liqueur\n1/4 cup mascarpone\n1 cup "confectioner\n2 tablespoons s sugar"\n1/4 teaspoon whole milk\n1/4 teaspoon vanilla extract\n1/2 teaspoon salt\n##linh##\nPreheat oven to 350 degrees F (175 degrees C). Grease a 10-cup Bundt pan with a baking spray containing flour.\nSift together cake flour, baking powder, cinnamon, salt, baking soda, ginger, nutmeg, cloves, and allspice.\nBeat butter, white sugar, and brown sugar together in a large bowl until light and fluffy, about 3 minutes. Add in eggs 1 at a time, beating well after each addition, then turn mixer to medium-high and beat batter for an additional 3 minutes. Add in pumpkin, mascarpone, whole milk, and vanilla, and beat until completely incorporated. Add in half the dry ingredients and mix until just combined. Add in remaining dry ingredients and mix until just combined.\nPour batter evenly into the prepared pan. Tap pan sharply on the counter several times to remove any larger air bubbles.\nBake in the preheated oven until a bamboo skewer inserted into the center of the cake comes out clean, 65 to 75 minutes. Cool cake in pan for 5 minutes.\nMeanwhile, for espresso syrup, stir hot water, espresso powder, sugar, and coffee liqueur together until completely combined and dissolved.\nUse a bamboo skewer to poke several holes all over the bottom of the cake, only going about 3/4 of the way into the cake. Gradually drizzle espresso syrup over cake, letting it soak in slightly before adding more. It will seem like a lot of liquid, but it will all soak in. Continue to cool cake in the pan for 20 minutes more, then carefully invert onto a serving platter to cool completely.\nFor icing, whisk together mascarpone, confectioner’s sugar, whole milk, vanilla, and salt until smooth and combined. Drizzle icing over cooled cake. Sift cocoa powder over icing before it sets. Serve cake at room temp for best flavor and texture, but store any extra in the refrigerator.
127	Ultimate Lowcountry Shrimp and Grits	1 hr 40 mins	4 cups water\n1 cup milk\n3 tablespoons butter\n1 1/2 teaspoons kosher salt\n1 1/4 cups grits\n2 ears white sweet corn\n1/4 teaspoon pepper\n1 1/2 teaspoons olive oil\n6 slices bacon\n1   onion\n4 ounces green onions, divided\n1/2 teaspoon green bell pepper, diced\n1/2 teaspoon red bell pepper, diced\n4 teaspoon okra, thinly sliced\n1 teaspoon kosher salt\n1/2 cloves ground black pepper\n1/2 garlic powder\n1/4 tablespoons cayenne pepper\n2 tablespoons garlic\n2 (10 ounce) can tomatoes\n1 1/2 cups butter\n2 teaspoon all-purpose flour\n1 teaspoons diced tomatoes with green chiles\n2 teaspoon chicken stock\n1/2 cups white sugar\n2 large Worcestershire sauce\n1/2 pounds hot sauce, or to taste (optional)\n2 cups peanut oil or other vegetable oil for frying\n3 teaspoons eggs\n1 1/2 teaspoons shrimp,\n2 teaspoon flour\n2 teaspoon kosher salt\n##linh##\nCombine water, milk, butter, and salt in a large saucepan and bring just to a boil. Whisk in grits until incorporated. Reduce heat to simmer, cover, and cook until thick, 25 to 30 minutes, stirring often. If mixture gets too thick, add a little more milk or water.\nCut kernels off corn cobs, and using the back of the knife, carefully scrape the cob to release the creamy corn milk. Stir corn kernels and corn milk into grits and continue cooking until grits are creamy and tender, 15 to 20 minutes longer, stirring often. Stir in pepper and adjust seasonings if necessary.\nMeanwhile, heat a large deep skillet or Dutch oven over medium heat. Add olive oil and bacon slices in a single layer, and cook until bacon is crisp, stirring occasionally, about 7 minutes.  Remove bacon from the skillet, drain on paper towels, and set aside. Crumble bacon once cool enough to handle. Reserve drippings in the skillet and return skillet to medium-high heat.\nFinely slice green onions and reserve green ends for garnish. Add white parts of green onion, onion, green and red bell peppers, and okra to the skillet and cook until softened and lightly browned, stirring often, about 5 minutes. Add in salt, pepper, garlic powder, and cayenne and cook for 1 minute. Add fresh tomatoes and garlic, and cook for 2 minutes.\nAdd butter to mixture and allow it to melt. Sprinkle flour over skillet and cook, stirring constantly, about 1 minute. Add in tomatoes, with juices, and stock while stirring constantly until smooth. Stir in sugar, Worcestershire, and hot sauce, and return mixture to a simmer. Cook gravy for 10 minutes, stirring occasionally.\nHeat peanut oil to 350 degrees F (175 degrees C) in a large, deep skillet over medium-high heat. Whisk eggs in a bowl; add shrimp and stir to coat. In a shallow dish, whisk flour, salt, paprika, black pepper, and cayenne pepper.\nWorking a few at a time, remove shrimp from egg, allowing excess to drip off, and lightly coat in flour mixture. Transfer shrimp to a wire rack set inside a rimmed baking sheet. Repeat with remaining shrimp.\nWorking in batches, add shrimp to hot oil and cook, turning occasionally, until lightly browned and crisp, 1 to 2 minutes. Drain on a wire rack set over a paper towel-lined baking sheet.\nTo serve, place grits in the bottom of a shallow bowl. Top with about 1/2 cup of gravy and 6 to 8 shrimp. Top with crumbled bacon, and sprinkle with green onions and parsley if desired.\nDOTDASH MEREDITH FOOD STUDIOS From the Editor:\nNutrition data for this recipe includes the full amount of breading ingredients. The actual amount of breading consumed will vary. We have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. The exact amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.
131	Italian Steak Pizzaiola	25 mins	4 teaspoons ribeye steaks\n1 1/2 teaspoon freshly ground black kosher salt, divided\n1 tablespoons freshly ground black\n3 cup extra virgin olive oil, divied\n1/2 cloves onion\n2 teaspoon garlic, minced\n1/4 cup crushed red pepper\n1/2 white or red wine\n8 teaspoon roma tomatoes, chopped\n1/2 tablespoons oregano\n2 cup tomato paste\n1/4 tablespoons olives\n##linh##\nSeason steaks with 1 teaspoon salt and 1/2 teaspoon pepper.  Heat 1 tablespoon oil in a large deep skillet over high heat. Add steaks to skillet and cook, undisturbed, until browned about 2 minutes.  Flip and cook 1 more minute. Remove steaks from skillet and set aside.\nAdd remaining oil to skillet and turn heat to medium.  Add onions, remaining salt and pepper, and cook, stirring occasionally until softened.  Add garlic and cook for 1 minute. Add wine and scrape bottom of skillet to loosen any browned bits. Add tomatoes  and oregano and bring mixture to a simmer.  Simmer until tomatoes soften, about 5 minutes, stirring occasionally.\nUse a potato masher or the back of a spoon to crush the tomatoes.  Add in tomato paste and olives and stir to combine.  Simmer for 2 minutes.\nReturn steaks and any juices accumulated to the skillet and cover the steaks in the tomato mixture.  Cook until the steak is heated through, 2 to 3 minutes.  Remove from heat and add parsley. Serve with crusty bread or over pasta or rice.\nDOTDASH MEREDITH VIDEO STUDIOS
132	Tuscan Salmon	25 mins	4 (5 ounce) salmon filets\nNone salt and freshly ground black pepper to taste\n1 tablespoon olive oil\n1 tablespoon unsalted butter\n2 or 3 short rosemary sprigs, plus more for garnish\n1/3 cup prosciutto\n1  green onion, finely chopped\n1 to 2 pinch garlic cloves, minced\n1 red pepper flakes, or to taste\n1/2 cup lemon, zested\n1/2 cup white wine\n1 (10 ounce) package cherry tomato halves\n1 cup fresh spinach, torn\n##linh##\nPat salmon filets dry with paper towels and season both sides with salt and pepper.\nMelt butter in a large skillet over medium heat; add olive oil. When butter stops sizzling, swirl the skillet to combine. Add 2 or 3 rosemary sprigs to the skillet, to flavor the oil.\nAdd salmon and cook until salmon is lightly browned and flakes when a fork is gently inserted, about 3 minutes per side. (If salmon filets are thinner than 1 1/2 inches, this may take less time.) An instant read thermometer, inserted near the center, should read 145 degrees F (63 degrees C). Remove from the skillet, and keep warm.\nTo the same skillet with rosemary, add chopped prosciutto, green onion, garlic, red pepper flakes, and lemon zest, and cook for 1 minute or until fragrant.\nAdd white wine and cook until the liquid evaporates. Add tomatoes and cook, stirring, 2 to 3 minutes. Add spinach and toss in the skillet until bright green and barely wilted, 2 to 3 minutes.\nStir in cream, and season with salt and pepper. Cook until sauce bubbles, about 2 minutes, and remove cooked rosemary sprigs.\nServe salmon on a bed of vegetables and sauce, and drizzle with a little olive oil. Garnish with lemon slices, fresh rosemary sprigs, and toasted pine nuts, if desired.\nCook’s Note\nRemove any bones from the filets. Remove the skin, or not, as you prefer.\nFrom the Editor\nTo toast pine nuts: Preheat the oven to 350 degrees F (175 degrees C). Spread pine nuts onto a baking sheet; toast in the preheated oven until beginning to turn golden brown and becoming fragrant, about 7 minutes.
133	Homemade Hamburger Helper	35 mins	1 pound lean ground beef\n1/2 cup yellow onion\n2 tablespoons tomato paste\n1 tablespoon ketchup\n1/2 teaspoon garlic powder\n1/2 teaspoon chili powder\n1/2 teaspoon kosher salt\n1/4 teaspoon paprika\n1/4 teaspoon ground black pepper\n3 1/2 cups beef broth\n1 cup elbow macaroni\n6 ounces Cheddar cheese,\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nHeat a large, heavy-bottomed pot over medium-high heat. Add beef and onion, and cook, stirring occasionally, until beef is crumbled, browned, and no longer pink, about 7 minutes. Spoon off and discard any fat.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in tomato paste, ketchup, garlic powder, chili powder, salt, paprika, and pepper; cook, stirring constantly, until fragrant, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd beef broth, and bring to a boil over high heat. Stir in macaroni; reduce heat to medium, and gently boil, uncovered, stirring occasionally, until pasta is tender and most of the liquid is absorbed, 13 to 15 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from heat, and stir in Cheddar, ensuring cheese is fully melted and incorporated, 30 to 45 seconds. Let stand until thickened before serving, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS
134	Chicken and Sausage Jambalaya	1 hr 10 mins	2 tablespoons canola oil\nNone salt and freshly ground black pepper to taste\n3 skin-on, bone-in chicken thighs\n1 (14.5 ounce can) tomatoes\n4 cups chicken stock, or as needed\n2 ribs celery,\n1 large yellow onion, diced\n1 bell pepper\n2 teaspoons cayenne pepper\n2  bay leaves\n4 cups garlic cloves\n2 pound tasso or ham steak\n1 cups andouille sausage\n2 bunch long grain rice\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C).\nAdd canola oil to a large Dutch oven set over medium heat. Salt and pepper chicken liberally and sear on both sides until golden brown, about 5 minutes per side. Remove from Dutch oven.\nOpen canned tomatoes and strain liquid into a 4-cup measuring cup. Pour in enough chicken stock to total 4 cups; set aside. Roughly chop tomatoes.\nAdd celery, onion, bell pepper (the trinity), chopped tomatoes, cayenne, bay leaves, and garlic to the Dutch oven and stir until combined on medium heat. Mix in stock with tomato juice, seared chicken, tasso, andouille, and rice. Bring this to a nice simmer. Cover the pot.\nBake in the preheated oven for 30 minutes. Remove the pot from the oven and continue to let jambalaya steam for an additional 5 minutes.\nGarnish with scallions and a few dashes of hot sauce when ready to serve.\nDOTDASH MEREDITH FOOD STUDIOS
135	Salted Caramel Pumpkin Muffins	35 mins	2 1/4 cups flour\n2 teaspoons baking powder\n1/2 teaspoon baking soda\n2 teaspoons cinnamon\n2 teaspoons caramel spice (such as Savory Spice)\n1/2 teaspoon nutmeg\n1 pinch salt\n1 stick unsalted butter\n1/2 cup packed light brown sugar\n1/4 cup sugar\n1 teaspoon vanilla bean paste\n2 large eggs\n1 (15 ounce) can pumpkin puree\n1/4 cup honey vanilla Greek yogurt\n1 cup chopped walnuts\n3/4 cup all-purpose flour\n1/3 cup brown sugar\n1 tablespoon caramel spice (such as Savory Spice)\n1/4 teaspoon cinnamon\n5 tablespoons butter,\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Grease a standard 12-cup muffin pan or line with paper liners.\nWhisk flour, baking powder, baking soda, salted caramel spice, cinnamon, nutmeg, and salt together in a bowl; set aside.\nBeat butter, brown sugar, and white sugar together in a large bowl until creamy. Add vanilla bean paste and eggs, one at a time, beating between additions. Add pumpkin and yogurt, beat well.\nAdd flour mixture a little at a time, beating between each addition. Fold in walnuts.\nFor streusel topping, combine flour, brown sugar, salted caramel spice, and cinnamon in a bowl and mix together with a fork. Cut in butter with a pastry blender or a fork until mixture resembles coarse meal.\nFill muffin cups 3/4 full with batter. Sprinkle each with streusel topping.\nBake in the preheated oven until a toothpick inserted near the center comes out clean, about 20 minutes. Remove from the oven to cool; serve warm or at room temperature.\nCook’s Note\nI purchased my salted caramel spice from the Savory Spice shop. The McCormick company has something called salted caramel, but it may be a different flavor profile.
137	Baked Lemon Boursin Pasta	50 mins	5.2 ounce Boursin Garlic & Fine Herbs Cheese\n1 head garlic\n1  lemon\n1 teaspoon shallot\n1 teaspoon ground black pepper\n1 tablespoons dried oregano\n2 pound olive oil\n##linh##\nGather all ingredients. Preheat oven to 400 degrees F (200 degrees C).\nALLRECIPES/DIANA CHISTRUGA\nUnwrap the Boursin cheese and place it in the center of an 8x8-inch baking dish.\nALLRECIPES/DIANA CHISTRUGA\nCut the top off the garlic to expose the cloves and place in the dish, clove-side-up. Add the lemon halves, face down, and shallot to the dish. Sprinkle with black pepper and oregano and drizzle with olive oil. Bake for 30 minutes.\nALLRECIPES/DIANA CHISTRUGA\nRemove from the oven and allow to cool for a few minutes. Using your hands or a handheld lemon press, squeeze the juice from the roasted lemon halves into the dish, taking care not to get any seeds in the dish. Squeeze the roasted garlic head to release the cloves into the dish.\nALLRECIPES/DIANA CHISTRUGA\nMix all of the contents of the baking dish together until a smooth, creamy sauce forms.\nALLRECIPES/DIANA CHISTRUGA\nAdd the cooked pasta to the baking dish and stir to coat.\nALLRECIPES/DIANA CHISTRUGA\nServe topped with fresh lemon zest and crushed red pepper flakes, if desired.\nALLRECIPES/DIANA CHISTRUGA
138	Lazy Hot Crab Dip	20 mins	1 (6 ounce) can) lump crabmeat\n1 green onion\n1 teaspoon freshly-squeezed lemon juice\n1/4 teaspoon Old Bay®\n1/4 teaspoon Tabasco®\n1/2 teaspoon Worcestershire sauce\n1 tablespoon mayonnaise\n2 tablespoons shredded Monterey Jack cheese\n2 teaspoons grated Parmesan cheese\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C). Drain crabmeat well and return crabmeat to the empty can.\nReserve 2 teaspoons onion for garnish. Stir remaining onion, lemon juice, seafood seasoning, hot sauce, Worcestershire, mayonnaise and 11/2 tablespoons Monterey Jack cheese until combined into can with crabmeat. Top with remaining Monterey Jack and Parmesan cheese. Place can on a rimmed baking sheet.\nBake in the preheated oven until bubbly and browned around the edges, about 15 minutes. Let stand 5 minutes before serving. Sprinkle with reserved green onion.\nNICOLE MCLAUGHLIN
139	Smashed Sambal Broccoli	30 mins	1 bunch broccoli, cut into florets\n2 tablespoons vegetable oil\n1/2 teaspoon salt\n1/4 teaspoon black pepper\n2 tablespoons Asian-style chili paste\n3 clove garlic, minced\n2 teaspoons maple syrup\n1 teaspoon toasted sesame oil\n1 teaspoon toasted sesame seeds\n##linh##\nSet oven rack about 6 inches from heat source and preheat broiler. Put a steamer basket in a large saucepan. Add water to just below steamer basket. Bring to a boil. Add broccoli to steamer basket; reduce heat to medium-low. Steam, covered, until crisp-tender, 4 minutes.\nWhen cool enough to handle, spread broccoli on a 10x15-inch rimmed baking sheet. Using the bottom of a sturdy glass, flatten broccoli florets to 1/2 inch thick. Drizzle with vegetable oil and sprinkle with salt and pepper; toss to coat.\nBroil until charred around edges, 5 to 7 minutes.\nMeanwhile, stir together chili paste, garlic, maple syrup, and sesame oil in a small bowl. Spoon over broccoli. Sprinkle with sesame seeds.
140	Dill Pickle Pasta Salad	40 mins	1 pound bowtie pasta\n10 slices bacon\n1 1/2 teaspoons kosher salt\n2 cups chopped refrigerated dill pickles\n2 tablespoons dill\n1 cup sharp Cheddar cheese\n2/3 cup mayonnaise\n2/3 cup sour cream\n1 teaspoon ground black pepper\n1 teaspoon onion powder\n##linh##\nBring a large pot of water to a boil. Add 2 tablespoons salt and pasta to water and cook, stirring often, until pasta is al dente, 9 to 10 minutes. Drain and rinse with cold water just enough to bring the pasta to lukewarm or room temperature. Drain well.\nMeanwhile, place bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain bacon slices on paper towels.\nAdd pasta to a large bowl. Reserve 1 tablespoon chopped pickles, 1 teaspoon dill, and 1 tablespoon bacon for garnish. Add cheese and remaining pickles, dill, and bacon to the pasta bowl.\nIn a separate bowl, whisk together remaining 2 teaspoons salt with pickle brine, mayonnaise, sour cream, black pepper, and onion powder until well combined. Pour mixture over pasta mixture and toss well to coat. Transfer mixture to a serving bowl and top with reserved pickles, dill and bacon. Serve immediately or refrigerate until ready to serve.
141	Copycat Trader Joe’s Butternut Squash Mac and Cheese	45 mins	16 ounces rigatoni pasta\n1 tablespoon unsalted butter\n3 cups butternut squash\n6 sage leaves\n1 teaspoon fresh thyme\n1 teaspoon kosher salt\n1/2 teaspoon black pepper\n3 cups whole milk\n2 teaspoons onion powder\n1 teaspoon garlic powder\n1/8 teaspoon cayenne pepper\n1/8 teaspoon ground nutmeg\n1/8 teaspoon turmeric\n2 teaspoons Dijon mustard\n1 cup Cheddar cheese\n1 cup shredded Gouda cheese\n2 tablespoons Parmesan cheese\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nBring a large pot of salted water to a boil over high. Add pasta and cook according to package directions for al dente. Drain, reserving 1 cup of pasta cooking water; set pasta aside.\nDOTDASH MEREDITH FOOD STUDIOS\nWhile pasta cooks, melt butter in a large Dutch oven over medium. Add butternut squash, sage, thyme, salt, and pepper, and cook, stirring occasionally, until browned on all sides, about 6 to 8 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in milk, onion powder, garlic powder, cayenne, nutmeg, and turmeric and bring to a boil over high, stirring occasionally. Reduce heat to medium, cover, and cook, stirring occasionally, until squash is tender, about 6 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer squash mixture into a blender and add Dijon mustard. Secure lid on blender, and remove center piece to allow steam to escape. Place a clean towel over opening. Process until very smooth, about 30 seconds. (Alternatively, puree soup with an immersion blender until smooth, about 3 minutes).\nDOTDASH MEREDITH FOOD STUDIOS\nAdd pasta and pureed squash mixture to Dutch oven; gently heat over medium until pasta is warmed through, about 2 minutes. Stir in Cheddar, Gouda and Parmesan and cook over low, stirring constantly, until smooth, about 1 minute. Stir in 1/4 cup of the reserved pasta cooking water. Cook, stirring often, and add remaining cooking water, 1/4 cup at a time, as needed, until sauce is creamy and clings to pasta, 2 to 3 minutes. Season with additional salt to taste.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide among bowls and garnish with thyme, black pepper, and Parmesan.\nDOTDASH MEREDITH FOOD STUDIOS
142	Fresh Tomato Curry Sauce	45 mins	4 thin-cut pork chops\nNone salt and freshly ground black pepper to taste\n1 pinch cayenne\n1 tablespoon avocado oil\n3/4 cup diced yellow onion\n2 tablespoons jalapeno pepper\n1 tablespoon ginger\n3 cloves garlic\n1/2 teaspoon salt\n1 teaspoon garam masala\n1/2 teaspoon cumin\n1/4 teaspoon turmeric\n2 cups fresh tomatoes\n1 teaspoon tamarind paste\n1/3 cup water\n2 tablespoons plain yogurt\n1/4 cup red onion\n1/4 cup salted cashews\n1/4 cup cilantro leaves\n##linh##\nUse scissors to snip 4 or 5 small cuts around the edge of each chop to prevent curling. Season chops on both sides with salt, pepper, and cayenne. Add oil to a nonstick skillet over high heat, and sear pork chops on both sides until lightly browned, about 1 1/2 minutes per side. Remove meat to a plate, and reduce heat to medium.\nAdd onions, jalapeno, ginger, garlic, and the 1/2 teaspoon salt to the pan. Cook, stirring, until onions start to turn translucent, 3 to 5 minutes. Add garam masala, cumin, and turmeric and cook, stirring, until spices are fragrant, about 1 minute.\nAdd tomatoes and tamarind, and stir everything together. Add water; simmer until tomatoes completely soften and collapse, about 10 minutes.\nPlace a mesh strainer over a bowl, and pour in the tomato mixture. Press and scrape with the back of a spoon or ladle until only the tomato seeds and skins remain in the strainer.\nTransfer the strained sauce back into the pan, and add the meat, and any accumulated juices back in. Bring to a gentle simmer over medium heat; then reduce heat to maintain a low simmer, and cook until meat is tender, about 5 minutes.\nTaste sauce for seasoning, and if desired, serve topped with yogurt, red onion, cashews, and cilantro leaves.\nJOHN MITZEWICH "Chefs Note:"\nThis recipe is all about the sauce, and can be done with any pan-fried meat or vegetable, or even pasta. The only change would be how long to simmer the dish to finish, which will depend on the type and cut of meat. For long simmering times, you may need to add additional water or some broth.
144	Harissa Baked Salmon	30 mins	1 teaspoon vegetable oil\n1 pound wild salmon fillet\nNone salt and pepper to taste\n4 thin slices lemon\n2 thin slices sweet onion, separated into rings\n⅓ cup mayonnaise\n1 teaspoon lemon juice\n1 teaspoon harissa\n¼ teaspoon smoked paprika\n1 tablespoon orange juice\n1 tablespoon white wine\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C). Coat the inside of a 9x12-inch baking dish with vegetable oil.\nPlace salmon fillet into the baking dish; sprinkle with salt and pepper. Arrange lemon slices and onion rings on the salmon.\nMix mayonnaise, lemon juice, harissa, and smoked paprika together in a bowl until well combined; spread on top of salmon, lemon, and onion slices. Drizzle orange juice and wine around salmon.\nBake in the preheated oven until salmon is hot and has begun to turn opaque, 10 to 12 minutes. Remove the baking dish from the oven, set a broiler rack about 5 inches from the broiler, and turn the broiler on. Broil the fish until nicely browned, about 3 minutes.\nFRANCE CEVALLOS Cook’s Note\nYou can place the onions and lemon slices on the salmon after spreading the sauce, but I find they can burn easily under the broiler.
145	One Pan Spicy Soy Noodles with Chicken	30 mins	1 1/4 pounds tenders, cut into 1-inch pieces\n1/2 teaspoon garlic powder\n1/2 teaspoon paprika\n1 1/2 teaspoons kosher salt\n1/2 teaspoon ground black pepper\n1 1/2 cups water, plus more as needed\n1/4 cup soy sauce\n2 tablespoons apple cider vinegar\n2 tablespoons oil, divided\n2 teaspoons sesame oil\n2 cloves garlic, minced\n1 tablespoon ginger\n1/4 teaspoon crushed red pepper, plus more for garnish to taste\n8 ounces linguine pasta\n2 tablespoons brown sugar\n2 teaspoons sesame seeds\n##linh##\nSeason chicken with garlic powder, paprika, salt, and pepper. Whisk together 1 1/2 cups water with soy sauce and vinegar in a 2 cup measuring cup or bowl. Set aside.\nHeat 1 tablespoon oil in a large deep skillet over medium-high heat. Add chicken and cook, stirring occasionally, until browned on all sides (Chicken will not be cooked through at this point).  Remove chicken from skillet and set aside.\nAdd remaining neutral oil and sesame oil to skillet. Add garlic and ginger and cook until fragrant, about 1 minute, stirring constantly. Stir in crushed red pepper. Add pasta and stir to coat in garlic mixture. Add reserved soy sauce mixture and stir until everything is well incorporated, scraping any browned bits from bottom of skillet. Bring mixture to a boil and reduce to simmer.\nAdd chicken and any accumulated juices into skillet along with brown sugar. Stir and cook, stirring occasionally, until pasta is cooked and sauce is thickened, 10 to 12 minutes. Add additional water as needed to keep mixture saucy until pasta is cooked. Stir in green onions, sesame seeds and more crushed red pepper if desired.
146	Ramen Omelet with Spinach, Mushrooms, and Cheese	25 mins	1 (3 ounce) package ramen, seasoning packets discarded\n2 tablespoons butter, divided\n2 cups fresh spinach\n1 cup sliced mushrooms\n2 large eggs\n1 splash milk\n1/2 cup cheese\n##linh##\nBring 2 cups of water to a boil in a saucepan; add ramen and cook until tender, about 3 minutes. Drain and set aside.\nMelt 1 tablespoon butter in a skillet. Add mushrooms; cook and stir until tender, about 5 minutes. Add spinach and cook until wilted, stirring constantly, about 2 minutes. Remove from skillet and set aside.\nMix eggs with splash of milk in a bowl. Melt remaining 1 tablespoon butter in the same skillet. Add eggs, top with half of the ramen, 1/2 of the mushroom-spinach mixture, and 1/4 cup cheese. Season with salt and pepper. Once eggs are set, fold omelet in half and top with remaining mushroom mixture and remaining cheese.
147	Perfect Cast Iron Skillet Chicken Breasts	30 mins	4 (6-ounce) skinless boneless chicken breasts\n1 tablespoon dried Italian seasoning\n1 1/2 teaspoons kosher salt\n1/2 teaspoon smoked paprika\n1/2 teaspoon ground black pepper\n2 tablespoons canola oil\n1/4 cup unsalted butter\n3 cloves garlic, peeled and smashed\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nSeason chicken all over with Italian seasoning, salt, smoked paprika, and black pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat oil in a large cast-iron skillet over medium until shimmering. Add chicken, rounded side down, and cook, undisturbed, until the bottom\nside is browned, 4 to 5 minutes. Flip and continue to cook, undisturbed, until the other bottom side is browned, 4 to 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd butter, garlic, thyme, and rosemary, and cook until butter is melted, about 1 minute. Carefully tilt pan toward you so butter pools and spoon herb butter over the top of each breast, until a thermometer inserted into the thickest portion of breast registers 165 degrees F (74 degrees C), 3 to 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer chicken to a serving platter and let rest for 5 minutes. Serve with pan drippings and lemon wedges, if desired.\nDOTDASH MEREDITH FOOD STUDIOS Cook’s Note\nA good rule of thumb for seasoning chicken breast is 1 teaspoon seasoning per pound of chicken.
148	Broccoli Alfredo Pasta	30 mins	4 ounces farfalle pasta\n2 cups broccoli florets\n2 tablespoons unsalted butter\n1/2 cup heavy cream\n3/4 cup grated Parmesan cheese (see Note)\n1/2 teaspoon minced garlic\n1 pinch ground nutmeg, or to taste\n##linh##\nBring a large pot of lightly salted water to a boil. Cook farfalle pasta at a boil, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Remove to a colander; reserve the pasta water for later use.\nAdd broccoli to a microwave-safe container along with 1/4 cup water. Cover and cook on High until bright green and tender with a bite, about 4 minutes. Drain; season with salt. Keep warm.\nMeanwhile, melt butter in a skillet or saucepan over low heat. Stir in cream and allow to simmer, stirring often, 3 to 4 minutes.\nAdd cheese and garlic, stirring continuously, until cheese is melted. Stir in nutmeg and remove from heat. sauce is too thick, stir in a bit of reserved pasta water. Season to taste with salt and pepper.\nTo serve, combine cooked pasta, cooked broccoli, and sauce. Garnish with fresh parsley sprigs, if desired.\nCook’s Note\n4 minutes is plenty of time for bright green broccoli with a tender bite. If you prefer more tender broccoli, cook an additional 1 to 2 minutes.\nFreshly-grated Parmesan works best in this recipe. Purchased grated Parmesan often has an anti-caking ingredient that may prevent a smooth sauce.
149	Beef and Pineapple Stir Fry	30 mins	1 pound beef top round or top sirloin\n1/4 cup cornstarch\n1 ( 14-ounce) can pineapple chunks in juice,\n1/2 cup beef broth\n1/2 cup soy sauce\n2 tablespoons rice vinegar\n2 tablespoons sambal oelek\n2 tablespoons vegetable oil\n1 cup red onion\n1 cup carrots\n7 ounces snow peas\n1/2 large red bell pepper\n2 cloves garlic, minced\n2 tablespoons ginger\n##linh##\nCombine beef strips and 2 tablespoons cornstarch in a bowl; toss until beef strips are evenly coated. Set aside.\nTo make sauce, stir 1/4 cup reserved pineapple juice, beef broth, soy sauce, rice vinegar, and sambal oelek or Sriracha together in a bowl; set aside.\nHeat oil in a large skillet or wok over medium-high heat. Add beef and onion to the hot oil, and cook, stirring quickly and constantly, until beef is browned, about 5 minutes.\nStir in carrots, snow peas, and bell pepper; cook and stir about 1 minute. Add garlic and ginger and cook about 30 seconds. Stir in reserved sauce and pineapple chunks.\nStir remaining cornstarch with 2 tablespoons water and add to the skillet. Cook, stirring constantly, until sauce is thickened, 1 to 2 minutes more.\nServe immediately with hot cooked rice, garnished with fresh chives, if desired.
153	Salmon Caesar Salad	2 hrs 40 mins	1 (8 ounce) salmon filet\n2 teaspoons oil\n2 teaspoons honey\nNone salt and freshly ground black pepper to taste\n1 large egg\n2 tablespoons lemon juice\n2 teaspoons Worcestershire sauce\n1 1/2 teaspoons Dijon mustard\n2 cloves garlic\n3 anchovies\n1/4 cup grated Parmesan cheese\nNone freshly ground black pepper to taste\n1/2 cup olive oil\n1 tablespoon butter\n2 slices bread\n1/2 teaspoon italian seasoning\n1/4 teaspoon granulated garlic\n1 head Romaine lettuce\n##linh##\nSet a nonstick skillet over medium high heat. Heat 2 teaspoons oil until it shimmers. Add salmon, skin side down. Brush with honey; sprinkle with salt and pepper. Cover and cook for 4 minutes.\nCarefully flip salmon and reduce the heat to medium. Continue cooking until fish flakes easily with a fork, about 5 minutes more. Remove salmon to a plate or container; cover and refrigerate until very cold, at least 2 hours.\nFor dressing, crack an egg into a food processor. Add lemon juice, Worcestershire, Dijon, garlic, anchovies, grated Parmesan and black pepper; pulse to combine. With food processor running, drizzle in oil until mixture emulsifies. Refrigerate dressing until needed.\nFor croutons, melt butter in a heavy skillet over medium-high heat. Add bread cubes; sprinkle with Italian seasoning and granulated garlic.\nToast until croutons are browned, about 5 minutes. Remove from heat; set aside.\nFor salad, add lettuce to a large bowl. Flake salmon with a fork into bite-sized pieces and add to the bowl. Drizzle with Caesar dressing; top with croutons and shaved Parmesan.
154	The Labor Day Burger	1 hr	6 slices bacon\n1 tablespoon bacon drippings\n1 pound ground beef\n1 cup dry bread crumbs\n1 tablespoon red pepper flakes\n1 pinch freshly ground black pepper\n½ cup shredded Colby-Jack cheese, or more to taste (Optional)\n2 slices cooking spray\n2 slices Colby-Jack cheese (Optional)\n##linh##\nPlace bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned but not totally crisp, about 8 minutes. Drain on paper towels. Retain 1 tablespoon bacon drippings.\nMix ground beef, bread crumbs, red pepper flakes, black pepper, and retained bacon drippings in a bowl until thoroughly combined; divide meat mixture into 4 equal portions. Form each portion into a large patty, making them as thin as possible. Sprinkle shredded Colby-Jack cheese onto 2 of the patties, leaving an edge about 3/4 inch wide uncovered. Place second patty onto the cheese and press the edges of the patties together to create 2 cheese-stuffed burgers. Place stuffed patties into freezer to chill slightly, about 10 minutes.\nPreheat an outdoor grill for high heat.\nSpray the grill grate with cooking spray and place burgers onto grill; turn heat to low, place lid over grill, and cook until outsides of burgers are lightly charred and cheese has melted, about 10 minutes per side. Maintain grill temperature at about 300 degrees F (150 degrees C). Use a spray bottle of water to control flames; flames should just lightly contact the bottoms of the burgers to create a slight char. After the first flip, place 3 partially-cooked bacon slices onto each burger.\nAbout 2 minutes before burgers are done, place a Colby-Jack cheese slice onto each burger; top with tomato and avocado slices and transfer burgers to plate to rest for 1 or 2 minutes. Serve burgers on hamburger buns.
155	Chicken Bacon Ranch Tacos	40 mins	6 slices bacon\n2 tablespoons smoked paprika\n1 tablespoon onion powder\n1 tablespoon dried oregano\n1 teaspoon garlic salt\n1 pound skinless, boneless chicken breast\n6 (6 inch) flour tortillas\n3 tablespoons red onion\n1 cup shredded lettuce\n1/2 cup pepper Jack cheese\n2 plum tomatoes, seeded and chopped\n1/4 cup ranch dressing, or to taste\n##linh##\nPreheat an outdoor grill for medium-high heat and lightly oil the grate.\nPlace bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain bacon slices on paper towels.\nWhisk smoked paprika, onion powder, oregano, and garlic salt together in a shallow bowl. Coat chicken with seasoning, and cook on the prepared grill until no longer pink at the center and juices run clear, about 10 minutes per side. An instant-read thermometer inserted into the center should read 165 degrees F (74 degrees C).\nPlace tortillas on the hot grill and heat until lightly grilled, 20 to 30 seconds per side.\nSlice chicken and place in warm tortillas. Top with shredded lettuce, red onions, shredded cheese, and chopped tomatoes. Drizzle with ranch dressing. Crumble bacon over top. Serve immediately.
156	Sloppy Joe Shepherd’s Pie	50 mins	1 teaspoon olive oil\n3 large garlic cloves, finely chopped\n1 pound ground chuck\n1 cup chopped yellow onion\n1 (3/8 ounce) beef bouillon cube\n1 1/2 teaspoons light brown sugar\n1 teaspoon dry mustard\n1/2 teaspoon black pepper\n1 (14-ounce) can crushed tomatoes\n1/2 cup ketchup\n1/3 cup beef broth\n1 tablespoon tomato paste\n1 tablespoon W orcestershire Sauce\nNone (32-ounce) package mashed potatoes\n1/2 cup heddar cheese\n1/2 cup onterey Jack cheese\n##linh##\nGather all ingredients. Preheat the oven to 375 degrees F (190 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nHeat oil in a 12-inch cast-iron skillet over medium-high. Add garlic; cook, stirring constantly, until fragrant, about 1 minute. Add ground chuck; cook, stirring to crumble beef into small pieces, until browned, about 6 minutes. Remove from heat, spoon drippings into a small bowl. Let drippings cool, then discard.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd onion to skillet; cook over medium, stirring often, until onions have softened, about 3 minutes. Stir in bouillon, sugar, mustard, and pepper until well combined. Stir in crushed tomatoes, ketchup, broth, tomato paste, and Worcestershire sauce until well combined. Bring to a simmer over medium-high; cook, stirring occasionally, until sauce is slightly thickened and glossy, 2 to 3 minutes. Remove from heat.\nDOTDASH MEREDITH FOOD STUDIOS\nSpoon mashed potatoes over beef mixture in skillet and gently spread into an even layer to cover beef completely.\nDOTDASH MEREDITH FOOD STUDIOS Sprinkle evenly with cheeses.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until potatoes are heated through and cheese is melted, about 10 minutes. Increase oven temperature to broil; do not remove skillet. Broil until cheese is lightly browned, 4 to 5 minutes. Let stand 5 minutes; garnish with chives, and serve.\nDOTDASH MEREDITH FOOD STUDIOS
157	Trout Tacos	30 mins	16 pound white corn tortillas\n1/2 purple cabbage\n2 pound green onions\n1/2 tablespoons coleslaw mix\n3 teaspoon Mexican crema\n1 lime zest\nNone tablespoons lime wedges as needed, divided\n2 cilantro leaves\nNone filets salt and freshly ground black pepper\n4 tablespoons plus 1 teaspoon trout\n3 tablespoon tapioca starch\n1 teaspoons ground cumin\n2 teaspoon chipotle powder\n1 tablespoons Mexican oregano\n3 cup vegetable oil\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Wrap tortillas in foil.\nBake tortillas in the preheated oven until warm, 8 to 10 minutes.\nMeanwhile, place cabbage, white parts of green onion, coleslaw mix, 3 tablespoons Mexican crema, lime zest, juice of 2 lime wedges, and cilantro in a large bowl. Toss to coat; season with salt and pepper. Set aside..\nCarefully remove skin from trout. Cut each trout filet into 2- to 3-inch pieces. Stir tapioca starch, cumin, chipotle powder, and Mexican oregano together in a shallow bowl.\nDip fish pieces into seasoning mixture to coat.\nHeat oil in a large skillet over medium-high heat until hot. Add coated fish pieces; cook until golden brown and fish flakes easily with a fork, 2 to 3 minutes per side. Transfer to a drip tray, and season with salt.\nUsing 2 corn tortillas for each taco, divide fish, slaw, and guacamole between the tacos. Garnish each with green tops of scallions. Serve with remaining lime wedges and crema on the side. Enjoy!
160	Grilled Shrimp Skewers with Citrus and Charred Thyme	55 mins	1 pound shrimp\n1/4 cup olive oil\n1 teaspoon orange zest\n2 tablespoons orange juice\n1/2 teaspoon lime zest\n2 tablespoons lime juice\n2 cloves garlic, minced\n1/4 teaspoon salt\n1/4 teaspoon freshly ground black pepper\n1  orange, cut into wedges\n4 cup fresh thyme\n##linh##\nPut shrimp in a zip-top bag set in a shallow dish. Add oil, 1/2 teaspoon orange zest, the orange juice, lime zest, lime juice, and garlic. Seal bag; turn to coat. Chill at least 30 minutes or up to 1 hour.\nPreheat an outdoor grill to medium heat (350 degrees F to 375 degrees F/175 degrees C to 190 degrees C). Remove shrimp from marinade, discarding marinade. Thread 6 to 7 shrimp onto each of 4 skewers. Sprinkle with salt and pepper.\nOil grill grates. Arrange skewers; orange wedges, cut sides down; and thyme on grill. Grill thyme just until lightly charred, about 15 seconds. Cover grill. Grill skewers and orange wedges, turning halfway through, until shrimp are opaque and orange wedges are lightly charred, 6 to 8 minutes.\nStrip thyme leaves from sprigs; coarsely chop. Stir 1 teaspoon chopped thyme and remaining 1/2 teaspoon orange zest into butter.\nSpread citrus-thyme butter over shrimp and serve with orange wedges. Garnish with remaining thyme.
161	White Chicken Chili Pot Pie	1 hr 15 mins	1/3 cup salted butter\n1 small yellow onion, chopped\n1 small green bell pepper, chopped\n2 garlic cloves, minced\n1/3 cup all-purpose flour\n2 teaspoons ground cumin\n1 1/2 teaspoons dried oregano\n1/2 teaspoon kosher salt\n1/4 teaspoon black pepper\n2 cups chicken broth\n2 cups rotisserie chicken\n1 (15-ounce) can can\n4 ounces 1/3-less-fat cream cheese, softened\n1/2 cup salsa verde\n1 (4-ounce) can green chilis, undrained\n1 (9-inch) pie crust (such as Pillsbury\n##linh##\nGather all ingredients. Preheat the oven to 425 degrees F (220 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nMelt butter in a 10-inch cast-iron skillet over medium. Add onion, bell pepper, and garlic, and cook, stirring often, until slightly softened and fragrant, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd flour and cook, stirring constantly, until mixture smells nutty, about 1 minute. Stir cumin, dried oregano, salt, and black pepper until well combined.\nDOTDASH MEREDITH FOOD STUDIOS\nGradually stir in broth and continue to cook over medium, stirring occasionally, until thickened and smooth, about 3 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd chicken, beans, cream cheese, salsa verde, and chiles. Cook, stirring constantly, until cream cheese is melted, about 2 minutes. Remove from heat and spread chicken mixture in an even layer. Allow to cool for 10 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nWhile filling cools, unfurl pie crust on a sheet of parchment paper and roll into an 11-inch circle. Fold dough edges under to create a 10-inch circle; crimp edges, if desired. Gently place pie crust over filling in skillet. Use a paring knife, cut four 1-inch-long slits into top of pie crust to allow steam to escape.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until golden brown and bubbly, 30 to 35 minutes. Allow pie to cool for 5 minutes before serving.\nDOTDASH MEREDITH FOOD STUDIOS Enjoy! DOTDASH MEREDITH FOOD STUDIOS
162	Crushed Pineapple Upside Down Cake	1 hr 20 mins	1 (20-ounce) can baking spray with flour\n1/4 cup crushed pineapple in syrup\n1 cup packed water\n6 tablespoons light brown sugar\n1/2 teaspoon unsalted butter\n1/4 teaspoon ground cinnamon\n1 (15.25 ounce) box vanilla extract\n3 large yellow cake mix (such as Pillsbury\n1/2 cup vegetable eggs\n##linh##\nGather all ingredients. Preheat the oven to 350 degrees F (175 degrees C). Spray a 13- x 9-inch baking pan with baking spray. Line bottom with parchment paper; lightly spray parchment. Set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nDrain pineapple into a fine-mesh sieve set over a medium bowl; set aside. Reserve 3/4 cup pineapple juice in a 1-cup measuring cup with a spout; whisk in water. Set aside. (Discard or reserve any extra pineapple juice for another use.)\nDOTDASH MEREDITH FOOD STUDIOS\nAdd brown sugar and butter to a small saucepan; cook over medium heat, stirring often, until butter melts and sugar mixture is well combined, about 3 minutes. Remove from heat; stir in cinnamon and vanilla.\nDOTDASH MEREDITH FOOD STUDIOS\nSpread brown sugar mixture evenly in prepared pan using a small offset spatula. Spoon and spread drained pineapple in an even layer over brown sugar mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nPrepare cake mix as directed in a large bowl, substituting pineapple juice mixture for the water. Spread batter evenly over pineapple layer.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until a wooden pick inserted in center comes out clean, about 30 minutes. Run a butter knife or small offset spatula around the edge of pan. Carefully place a heatproof platter over pan; invert cake onto platter; remove and discard parchment paper.  If needed, use any pineapple or brown sugar mixture left in the pan to patch any bald spots on the cake. Let cool 30 minutes before slicing and serving.\nDOTDASH MEREDITH FOOD STUDIOS\nServe warm or at room temperature with whipped cream. Garnish with cherries and pecans (if using).\nDOTDASH MEREDITH FOOD STUDIOS
163	Oysters Casino	1 hr	3 slices thick-cut bacon, cut crosswise into 1/2-inch pieces\n1 shallot shallot\n1 small green bell pepper,\n2 tablespoons seeded and finely chopped red Fresno chile\n1/2 cup unsalted butter, softened\n2 tablespoons finely chopped fresh flat-leaf parsley\n1 teaspoon grated lemon zest\n1/4 teaspoon kosher salt\n2 dozen oysters on the half shell\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPreheat oven to 450 degrees F (230 degrees C), and line 2 rimmed baking sheets with aluminum foil. Crumble another layer of foil on each baking sheet, forming a total of 24 small cups to place the oysters on to prevent them from tipping over.\nDOTDASH MEREDITH FOOD STUDIOS\nPlace bacon in a large nonstick skillet, and cook over medium, stirring occasionally, until bacon is starting to brown but not quite crisp, about 5 minutes. Transfer bacon to a paper towel-lined plate, reserving 1 tablespoon drippings in skillet.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat drippings in skillet over medium. Add shallot, bell pepper, and chile; cook, stirring often, until slightly softened, about 1 minute. Transfer to a small bowl, and refrigerate, uncovered, until slightly cooled, about 5 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir together butter, cooled shallot mixture, parsley, lemon zest, and salt in a medium bowl until blended; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nArrange oysters, cupped sides down, in a single layer in the prepared foil cups. Spoon about 1 teaspoon of the butter mixture on top of each oyster, and top evenly with bacon pieces.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until bacon is crisp and butter is bubbling, about 10 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nUsing tongs, carefully transfer oysters to an oyster serving platter or onto a serving platter covered with rock salt to prevent oysters from tipping over. Squeeze lemon wedges over oysters. Serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS
169	Slow Cooker Buffalo White Chicken Chili	2 hrs 25 mins	1 pound skinless, boneless chicken breasts\n1 pound skinless, boneless chicken thighs\n1 cup onion\n1 cup buffalo wing sauce\n1 (14.5 ounce can) fire roasted diced tomatoes\n2 (4 ounce) cans green chiles\n1 (1 ounce) packet ranch seasoning mix\n1 tablespoon chili powder\n1 teaspoon smoked paprika\n1 teaspoon ground cumin\n2 1/2 cups chicken broth\n2 (15.5 ounce) cans white beans, drained and rinsed\n8 ounces cream cheese, softened\n##linh##\nAdd chicken breasts, chicken thighs, onion, wing sauce, tomatoes, green chiles, ranch seasoning, chili powder, paprika, cumin, and chicken broth to a slow cooker. Cook on High for 2 hours or Low for 3 to 4 hours.\nRemove chicken from slow cooker and shred into bite-sized pieces. Return chicken to slow cooker and stir in beans and cream cheese. Cover and cook until cream cheese is melted, about 15 minutes. Add additional stock if desired for a thinner chili.\nServe topped with sour cream, shredded Cheddar cheese, and green onions. Drizzle with more hot sauce to taste.\nDOTDASH MEREDITH FOOD STUDIOS
164	Grilled Halibut Foil Packs	30 mins	2 (12x18 inch) pieces heavy duty aluminum foil\nNone cooking spray\n4 slices red onion\n1 small zucchini\n10 cherry tomatoes\n1/2 cup corn kernels\n4 to 6 thin slices garlic\nNone sea salt and freshly ground black pepper to taste\n2 (7 ounce) halibut filets\n2 tablespoons mayonnaise\n1 teaspoon Italian herb seasoning blend\n2 tablespoons white wine\n4 thin s lemon\n4 to 6 sprigs fresh thyme\n##linh##\nPreheat an outdoor grill to 400 degrees F (200 degrees C).\nSpray each foil sheet with olive oil cooking spray. Layer 2 onion slices, 1/2 of the zucchini, 1/2 of the cherry tomatoes, and 1/2 of the corn in the center of each of the foil squares. Scatter 1/2 the garlic over each pack, and season lightly with sea salt and freshly ground black pepper.\nPat halibut filets dry with paper towels, and add a filet to each packet. Brush each filet with a thin layer of mayonnaise, season lightly with sea salt and pepper, and sprinkle with Italian seasoning.\nDrizzle 1 tablespoon dry white wine over each packet. Place two slices of lemon on top of each filet, and scatter thyme sprigs over the contents of each packet.\nBring edges of foil together, fold edges over twice, and press tightly along the folds to seal. Leave a bit of space inside the packet, to allow for steam.\nPlace packets directly on the preheated grill grates, close the lid, and grill about 10 minutes per inch of the filet thickness. Remove packs from the grill and allow to rest about 5 minutes. An instant read thermometer inserted into the thickest part of fish should read 145 degrees F (63 degrees C).\nWhen ready to serve, place packs on serving plates, and open carefully, because of the steam.\nCook’s Note\nThis recipe makes 2 servings, but it’s easy to increase the ingredients if you are feeding more people. Make the packs while the grill preheats, or prepare and seal packets and refrigerate for up to 24 hours. Start your grill about 20 minutes before you want to cook, and fire away!
165	BBQ Spatchcock Chicken	1 hr 10 mins	2 teaspoons salt\n2 teaspoons ground cumin\n2 teaspoons smoked paprika\n1 teaspoon ground black pepper\n1 teaspoon cayenne pepper\n1 teaspoon garlic powder\n1 teaspoon onion powder\n1 teaspoon ground mustard\n1 (3 1/2 pound) whole chicken\n3 tablespoons olive oil\n1 cup vinegar-based BBQ sauce\n##linh##\nPreheat the oven to 425 degrees F (230 degrees C).\nMix salt, cumin, paprika, black pepper, cayenne, garlic powder, onion powder, and ground mustard together in a bowl.\nPat chicken dry with paper towels. Using shears, cut along each side of the chicken backbone and remove the bone. Turn chicken breast side up and press the breastbone to flatten the chicken.\nRub chicken all over with olive oil and spice blend. Transfer chicken to a large cast iron skillet.\nRoast in the preheated oven until skin is browned and crispy, about 30 minutes. Check temperature, and baste with 1/2 cup of BBQ sauce.\nReturn chicken to the oven and let cook until an instant-read thermometer reaches 165 degrees F (74 degrees C), about 15 more minutes.\nTransfer chicken to a cutting board and let rest for 10 minutes. Serve with remaining BBQ sauce.
166	Chicharrones de Pollo	4 hrs 25 mins	1 pound skinless, boneless chicken thighs\n1  lemon\n1 cup orange\n1 tablespoons lime,\n1/2 teaspoon minced garlic\n2 teaspoon freshly adobo seasoning\n1 teaspoon onion powder\n1 (.81 ounce) packets ground black pepper\n1 quart ground coriander\n2 cups Sazon seasoning with coriander and achiote\n1 cup oil for frying\n3 pinch all-purpose flour\n1 pinch cornstarch\n##linh##\nCombine chicken, lemon juice and zest, orange juice and zest, lime juice and zest, minced garlic, adobo seasoning, onion powder, black pepper, coriander, and Sazon seasoning in a large bowl; stir. Cover and marinate in the refrigerator for 4 hours.\nHeat oil in a large pot over medium heat to about 300 degrees F (150 degrees C). Place flour, cornstarch, pinch salt, and pinch pepper in a large bowl. Remove chicken from marinade and add to flour in the bowl. Toss chicken pieces with flour until evenly coated.\nFry coated chicken pieces in hot oil in small batches until golden brown and crunchy, 5 to 10 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).\nFrom the Editor\nNutrition data for this recipe includes the full amount of flour. The actual amount of flour consumed will vary.\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. The exact amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nDOTDASH MEREDITH FOOD STUDIOS
167	Peach Jalapeño Chicken	30 mins	2 tablespoons olive oil\n3 skinless boneless chicken breasts\n1 teaspoon sea salt\n1 teaspoon ground black pepper\n1 teaspoon smoked paprika\n1 teaspoon onion powder\n1 teaspoon garlic powder\n1 tablespoon chili powder\n1  jalapeno\n2 cup peaches\n1/2 tablespoons peach preserves\n2 tablespoon soy sauce\n1 tablespoon apple cider vinegar\n##linh##\nHeat olive oil in a large skillet over medium heat until hot, about 2 minutes.\nSeason chicken with salt, pepper, smoked paprika, onion powder, garlic powder, and chili powder. Add chicken breast to the hot skillet; cook chicken until no longer pink at the center and juices run clear, about 5 minutes. Remove chicken to a bowl; set aside.\nAdd peaches and jalapeño to the same skillet; cook until peaches soften, 5 to 6 minutes.\nIn a small bowl, whisk together peach preserves, soy sauce, apple cider vinegar, and cornstarch until well combined. Set aside.\nReturn cooked chicken to the skillet and stir in peach preserves mixture, making sure to coat chicken and peaches well. Continue to cook, stirring, until sauce thickens, about 2 minutes.\nGarnish with fresh or dried cilantro when serving.
168	Harvest Salmon Bowls	50 mins	4 (6 ounce) salmon filets\n3 tablespoons spicy brown mustard\n1 1/2 tablespoons honey\n1/2 tablespoon lemon juice\n1/2 cup olive oil\n1/4 cup maple syrup\n1 tablespoon apple cider vinegar\n6 cloves garlic,\n1/4 teaspoon salt\n1/2 teaspoon ground black pepper\n1 head broccoli\n16 ounces Brussels sprouts\n4 cups cooked quinoa\n4 ounces feta cheese, crumbled\n1/2 cup dried cranberries\n1/3 cup chopped pistachios\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line a baking sheet with parchment paper.\nIn a small bowl combine mustard, honey, and lemon juice; set aside.\nCombine olive oil, maple syrup, apple cider vinegar, garlic, salt, and pepper in a large bowl. Add in broccoli and Brussels sprouts; toss until coated. Spread evenly onto the prepared sheet pan.\nRoast in the preheated oven for 20 minutes. Remove pan from oven, toss vegetables, and spread out again. Place salmon filets onto sheet pan with vegetables, skin side down. Brush salmon with mustard mixture\nReturn to the oven; roast until fish flakes easily with a fork, 12 to 15 minutes.\nPlace 1 cup quinoa and a salmon filet in each serving bowl. Evenly divide vegetables into bowls and top with feta cheese, cranberries, and pistachios.
170	Short Ribs Pizzaiola	4 hrs	1 (28 ounce) can plum tomatoes\n6 beef short ribs\n3 teaspoons kosher salt\n2 tablespoons olive oil\n10 large mushrooms\n1 yellow onion\n1 tablespoon dried oregano\n1 teaspoon ground black pepper\n1/4 teaspoon red chili flakes\n8 cloves garlic\n1/2 cup white wine\n1 cup chicken or beef broth\n1 large red bell pepper\n1/2 cup basil leaves\n##linh##\nTransfer San Marzano tomatoes into a mixing bowl, and use your hand to crush into a fine purée. Set aside until needed.\nSeason short ribs with salt on all sides.\nHeat olive oil in a Dutch oven over high heat, and brown short ribs very well on all sides, about 8 minutes. Turn off heat, remove short ribs to a plate, and set aside.\nAdd mushrooms, along with a pinch of salt, and turn heat to medium-high. Use tongs to turn each mushroom onto a flat side down, and cook until golden brown, about 5 minutes.\nAdd onion and cook, stirring, until they begin to turn translucent, 3 to 5 minutes. Add oregano, black pepper, and chili flakes, and cook, stirring, for about 1 minute. Add garlic; cook for 1 minute more.\nPour in white wine, and stir to deglaze the bottom of the pot. Add tomatoes and broth. Turn heat up to high and bring to simmer. Stir in the diced bell pepper, and transfer short ribs back in.\nReduce heat to low, cover, and simmer gently until meat is very tender when pierced with a fork, 3 to 4 hours. About 2 hours into the cooking time, turn short ribs over.\nWhen short ribs are tender, remove to a plate; set aside. Turn heat up to medium-high, and boil  sauce for about 10 minutes, or until it reduces to your desired thickness. While reducing, excess fact can be skimmed off the top. Taste; season with salt and pepper if needed.\nTransfer short ribs back into sauce. reduce heat to low, and simmer, basting occasionally with sauce, until heated through, about 10 minutes. Serve with fresh basil.\nJOHN MITZEWICH "Chefs Note"\nCooking time will depend on size and shape of the meat, so start checking for doneness early, and don’t stop simmering until a fork goes into the beef very easily.\nThis recipe can be done with beef chuck instead of short ribs.
171	Sloppy Joe Cornbread Casserole	55 mins	2 pounds cooking spray\n2 cups ground chuck\n1 cup finely chopped yellow onion\n3 tablespoons finely chopped green bell pepper\n2 cups tomato paste\n1 ½ cups beef broth\n3 tablespoons ketchup\n2 tablespoons yellow mustard\n2 tablespoons Worcestershire sauce\n1 teaspoon packed light brown sugar\n½ teaspoon garlic powder\n2 (8.5 ounce) packages freshly ground black pepper\n⅔ cup corn muffin mix (such as Jiffy)\n1 ½ teaspoons whole milk\n2 large baking powder\n##linh##\nGather all ingredients. Preheat the oven to 350 degrees F (175 degrees C). Lightly spray a 9x13-inch baking dish with cooking spray.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat a large skillet over medium-high heat. Add ground beef; cook, stirring occasionally and breaking up meat into smaller pieces with a wooden spoon, until almost fully browned, about 4 minutes. Add onion and bell pepper, and cook over medium-high, stirring occasionally, until softened and tender, 6 to 8 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in tomato paste; cook, stirring constantly, until tomato paste has slightly darkened in color, about 2 minutes. Stir in beef broth, using a spatula to scrape any browned bits from bottom of pan. Stir in ketchup, mustard, Worcestershire sauce, sugar, garlic powder, and black pepper until fully combined. Bring to a boil over medium-high, and cook, stirring occasionally, until sauce thickens and bubbles appear all over the surface, about 7 minutes. Remove from heat, and transfer to the prepared baking dish.\nDOTDASH MEREDITH FOOD STUDIOS\nWhisk together corn muffin mix, milk, baking powder, and eggs in a medium bowl until fully combined; spoon in an even layer over sloppy Joe filling.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until cornbread is golden brown and a wooden pick inserted in the center comes out clean, 20 to 25 minutes. Serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS
172	Pineapple Shrimp Stir-Fry	25 mins	1 (8 ounce) can pineapple chunks in juice\n½ cup soy sauce\n¼ cup rice vinegar\n2 tablespoons sesame oil\n1 tablespoon minced fresh garlic\n1 tablespoon grated fresh ginger\n1 teaspoon fish sauce (Optional)\n¼ teaspoon dried red pepper flakes\n2 tablespoons avocado oil (or other neutral oil)\n1 medium red onion, cut into 1-inch chunks\n1 medium orange bell pepper, cut into 1-inch chunks\n1 medium red bell pepper, cut into 1-inch chunks\n4 cups broccoli florets\n1 pound large shrimp, peeled and deveined\n2 tablespoons cornstarch\n2 tablespoons chopped cashews, or to taste (Optional)\n##linh##\nMeasure out 1/4 cup pineapple juice from the can and add to a small mixing bowl. Set pineapple chunks aside and reserve any extra juice for another use or discard.\nAdd soy sauce, rice vinegar, sesame oil, garlic, ginger, fish sauce, and pepper flakes to the pineapple juice; stir until well combined. Transfer 1/4 cup of the mixture to a small bowl and leave the rest in the mixing bowl.\nHeat a 12-inch nonstick skillet or wok over medium heat. Add avocado oil to the hot wok and heat until it shimmers, about 30 seconds. Add red onion and bell peppers; cook and stir for 1 to 2 minutes. Add broccoli; cook and stir for 1 minute.\nAdd the sauce from the mixing bowl and bring to a boil. Add shrimp and cook until they turn pink and begin to curl, 2 to 3 minutes.\nMeanwhile, stir cornstarch into the sauce in the small bowl, mixing until there are no lumps. Slowly add to the skillet, stirring constantly. Add reserved pineapple chunks.\nCook until sauce thickens, 1 to 2 minutes. Remove from the heat and sprinkle cashews over top. Serve immediately.\nFrom the Editor\nNutrition data for this recipe includes the full amount of pineapple juice. The actual amount of pineapple juice consumed will vary.
173	Sloppy Joe Skillet Cornbread Casserole	55 mins	2 teaspoons olive oil\n1 green bell pepper,\n1 small onion,\n2 cloves garlic\n1/2 teaspoons kosher salt\n1 1/2 pounds lean ground beef\n1 cup ketchup\n3 tablespoons mustard\n2 1/2 tablespoons brown sugar\n1 1/2 tablespoons Worcestershire sauce\n1/2 teaspoon garlic powder\n1/2 teaspoon ground black pepper\n1 tablespoon hot sauce, such as Tabasco®\n1 tablespoon tomato paste\n1/2 cup water\n3 pickle spears\n2 (8.5 ounce) boxes corn muffin mix,\n1 large egg\n1/3 cup milk\n1/4 cup sour cream\n1 cup shredded Cheddar cheese\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nHeat oil in a 10-inch cast iron skillet over medium-high heat. Add bell pepper, onion, garlic, and salt and cook, stirring often, until onion begins to soften, about 5 minutes. Add in beef and cook, crumbling with a wooden spoon until browned, 5 to 7 minutes.\nAdd in ketchup, mustard, brown sugar, Worcestershire, and black pepper, and cook 1 minute, stirring constantly. Mix in 2 teaspoons of hot sauce, tomato paste, and water, and stir to combine. Bring mixture to a simmer, and cook for 5 minutes, stirring occasionally, until sauce has thickened slightly. Remove from heat; smooth mixture out evenly in skillet. Lay pickle slices evenly over the top.\nStir together cornbread mix, egg, milk, sour cream, Cheddar cheese, and remaining hot sauce in a bowl until combined. Pour batter evenly over meat mixture.\nBake in the preheated oven until golden brown and bubbly around the edges, 23 to 25 minutes.\nDOTDASH MEREDITH FOOD STUDIOS
179	Easy One Pan Ramen Chicken Alfredo	55 mins	6 (3 ounce) package chicken flavored ramen noodles\n2 (15 ounce) jars Alfredo sauce\n3 cups shredded cooked chicken\n1 cup water\n1 cup heavy cream\n2 cups cheese\n1/2 teaspoon pepper\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Arrange uncooked ramen noodles in an even layer in the bottom of a large casserole dish, breaking noodle blocks as necessary to fit. Sprinkle 1 packet of seasoning evenly over noodles; discard remaining seasoning packets.\nPour 1 jar of Alfredo sauce evenly over noodles. Spread chicken evenly over sauce. Pour second jar of Alfredo sauce over chicken. Add water to first Alfredo jar, shake it to rinse sauce from the jar, and pour mixture over noodles. Add cream to second jar, shake, and pour over the casserole.  Top with cheese and pepper.\nBake in the preheated oven until browned and bubbly and noodles are tender, 50 to 60 minutes. Add up to 1/2 cup more water as needed, if too much is absorbed before noodles are cooked.\nDOTDASH MEREDITH FOOD STUDIOS
174	Beef Teriyaki Noodles	30 mins	1 (8 ounce) package vermicelli noodles\n2 tablespoons vegetable oil, divided\n2 medium zucchini, diced\n1 medium yellow onion, thinly sliced\n1 large bell pepper, diced\nNone salt and freshly ground black pepper to taste\n1 tablespoon minced garlic\n1 pound boneless rib-eye steak, fat trimmed, cut crosswise into thin strips\n½ cup soy sauce\n¼ cup water\n¼ cup light brown sugar\n2 tablespoons white vinegar\n1 tablespoon cornstarch\n½ teaspoon ground ginger\n##linh##\nFill a large pot with lightly salted water and bring to a rolling boil; stir in noodles and return to a boil. Cook noodles uncovered, stirring occasionally, until the pasta is tender yet firm to the bite, 4 to 5 minutes. Drain and keep warm.\nMeanwhile, heat 1 tablespoon oil in a large nonstick skillet over medium-high heat; add zucchini, onion, and bell pepper. Season lightly with salt and pepper; cook, stirring occasionally, until vegetables are lightly caramelized and tender, about 8 minutes. Add minced garlic and cook until garlic is fragrant, about 1 minute. Transfer vegetables into a bowl and set aside.\nHeat remaining oil in the skillet until hot. Add steak strips and sear until nicely browned on each side and steak is cooked to medium. Season steak lightly with salt and pepper while it cooks.\nMeanwhile, to make the teriyaki sauce: combine soy sauce, water, brown sugar, vinegar, cornstarch, and ginger in a bowl. Whisk until sauce is well blended.\nAdd vegetables back into the skillet once steak is cooked and pour teriyaki sauce over everything. Bring mixture to a simmer, and cook until the sauce thickens up, about 2 minutes. Add cooked noodles and gently stir to evenly coat noodles with the sauce. Taste, and adjust the seasonings if desired.\nCook’s Note\nFeel free to use any cut of steak you prefer, and you can swap up the vegetables to use what you have on hand, or like best!
175	Air Fryer Parmesan Chicken Skewers	20 mins	1 1/4 pounds chicken breast tenders\n2 teaspoons olive oil\n1 teaspoon garlic powder\n1/2 teaspoon paprika\n1/2 teaspoon dried parsley flakes\n1/2 teaspoon salt\n1/4 teaspoon ground black pepper\n1/2 cup grated Parmesan cheese\n##linh##\nPreheat an air fryer to 400 degrees F (200 degrees C) according to manufacturer’s instructions.\nPlace chicken tenders in a large bowl. Add olive oil, garlic powder, paprika, parsley flakes, salt, and pepper. Toss to coat. Add grated Parmesan cheese. Toss to coat until evenly combined.\nThread a tender on to each skewer and place each skewer in the basket of the air fryer in an even layer. They can touch, but should not overlap.\nCook for 7 minutes. Flip skewers and cook until chicken is no longer pink at the center and juices run clear, about 3 minutes more. An instant-read thermometer inserted near the center of chicken should read 165 degrees F (74 degrees C).
176	Plum Muffins	40 mins	2 cups all-purpose flour\n1 cup white sugar\n2 teaspoons baking powder\n1 teaspoon baking soda\n1/4 teaspoon nutmeg\n1/2 teaspoon ginger\n1/2 teaspoon salt\n2 large eggs\n1/2 cup milk\n1/4 teaspoon almond extract\n1/2 cup unsalted butter\n2 cups plums\n1/3 cup chopped almonds\n3 tablespoons candied ginger (optional)\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Prepare a standard 12-cup muffin tin with paper liners.\nWhisk flour, sugar, baking powder, baking soda, nutmeg, powdered ginger, and salt together in a bowl; set aside.\nWhisk eggs, milk, and almond extract together in a bowl or cup; continue whisking and pour in melted butter until combined.\nAdd egg mixture to flour mixture, and stir just until dry ingredients are moistened. Fold in chopped plums and chopped almonds. Divide evenly among the 12 muffin cups, and sprinkle candied ginger over the muffin tops.\nBake muffins in the preheated oven until muffins spring back when lightly touched, 23 to 25 minutes. Remove to cool on a rack, 5 to 10 minutes.\nServe warm, or at room temperature. Store leftover muffins when cool in an airtight container for 2 to 3 days, or wrap and freeze.
177	Easy Lasagna Cups	1 hr 20 mins	1 pound lean ground beef\n1/2 cup onion\n1 ( 24 ounce marinara sauce\n4 teaspoons kosher salt, divided\n3/4 teaspoon ground black pepper\n1 teaspoon garlic powder\n1 teaspoon Italian seasoning\n1 ( 12 ounce jumbo pasta shells\n1 cup ricotta cheese\n1/2 cup grated Parmesan cheese, divided\n2 cups shredded mozzarella cheese\n2 tablespoons fresh parsley (optional)\n##linh##\nDOTDASH MEREDITH FOOD STUDIOS\nPreheat the oven to 375 degrees F (190 degrees C). Lightly grease a mini muffin pan.\nBring a large pot of water to a boil over high heat.\nHeat a large deep skillet over medium-high heat. Add ground beef and cook, crumbling with a spoon, until browned, 5 to 7 minutes; drain any excess grease. Add onion and cook until softened, 3 to 4 minutes. Stir in marinara, 1 teaspoon salt, pepper, garlic powder, and Italian seasoning. Bring to a simmer, reduce heat, and cook for 20 minutes, stirring often.\nAdd remaining 3 teaspoons salt and pasta to boiling water and cook, stirring occasionally, until tender, 10 to 12 minutes. Drain, rinse with cold water, and drain well.\nTurn pasta shells inside out and place 24 shells into the prepared muffin pan. Save any broken or remaining shells for another use.\nFill each shell with about 2 teaspoons ricotta and sprinkle 1/4 cup Parmesan cheese evenly over the ricotta. Top with about 1 tablespoon meat sauce and top evenly with mozzarella and remaining Parmesan.\nBake in the preheated oven until slightly golden around the edges and bubbly inside, about 15 minutes. Let stand for 10 minutes before serving. Sprinkle with parsley if desired.\nDOTDASH MEREDITH FOOD STUDIOS
178	Bloody Mary Pork Tacos	1 hr 45 mins	1 (12 to 16 ounce) pork tenderloin\n1 tablespoon olive oil\n5 teaspoons prepared horseradish, divided\n1 tablespoon Worcestershire sauce, divided\n4  \n Roma tomatoes\n1 teaspoon lemon, halved\n1/2 teaspoon red onion\n1 cup Fresno or serrano chile pepper\n##linh##\nPut pork in a resealable plastic bag set in a shallow dish. Add oil, 1 teaspoon horseradish, and 1 teaspoon Worcestershire sauce. Seal bag; turn to coat. Chill for 30 minutes or up to 4 hours.\nPrepare an outdoor grill for direct and indirect grilling, lighting burners on just one side or pushing lit coals to one side. Preheat to medium heat (350 to 375 degrees F (175 to 190 degrees C)). Oil grill grates.\nGrill tomatoes and lemon (cut sides down), onion, and chile over direct heat, covered, turning onion and pepper halfway through, until lightly charred, 6 to 8 minutes. Remove from heat. Keep grill lit.\nRemove pork from marinade; discard marinade. Sprinkle pork with 1/2 teaspoon each salt and black pepper. Grill over indirect heat, covered, turning halfway through, 30 to 35 minutes or until an instant-read thermometer inserted into center registers 145 degrees F (63 degrees C). Transfer to a cutting board and tent with foil; let rest 10 minutes.\nMeanwhile, for salsa, finely chop grilled tomatoes and onion, reserving half of onion for serving. Halve, seed (if desired), and finely chop chile. Stir together tomatoes, onion, chile, 2 teaspoons horseradish, 1 teaspoon Worcestershire sauce, the juice from 1 lemon half, and remaining 1/2 teaspoon each salt and black pepper in a bowl.\nFor horseradish crema, whisk together Mexican crema, remaining 2 teaspoons horseradish, and 1 teaspoon Worcestershire sauce in a small bowl.\nThinly slice pork and divide among tortillas (2 tortillas per taco). Top with salsa, horseradish crema, and reserved onion. Serve with celery, olives, and cotija. Serve with remaining lemon, cut into wedges.
180	Slow Cooker Tuscan Chicken Meatballs with Gnocchi	3 hrs 40 mins	1 large egg\n1/4 cup bread crumbs\n1/4 cup onion\n2 tablespoons finely chopped dried tomatoes\n2 tablespoons milk\n1 tablespoon grated Parmesan cheese\n1 clove garlic, minced\n1/2 teaspoon I talian seasoning\n1/4 teaspoon salt\n1/4 teaspoon freshly ground black pepper\n1 pound ground chicken\n2 1/4 cups reduced sodium chicken broth\n1/2 cup heavy cream\n1/4 cup white wine\n1/3 cup chopped dried tomatoes\n1/2 teaspoon I talian seasoning\nNone 1 (16-ounce) package shelf-stable potato gnocchi\n1 (5 ounce) package baby spinach\n1/2 cup grated Parmesan cheese\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nFor meatballs, preheat the oven to 375 degrees F (190 degrees C). Line a 15x10x1-inch baking pan with parchment paper.\nCombine egg, bread crumbs, onion, 2 tablespoons dried tomatoes, milk, 1 tablespoon Parmesan cheese, garlic, 1/2 teaspoon Italian seasoning, salt and pepper in a bowl.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd chicken, mix well. Shape mixture into 20 1 1/2-inch meatballs. Place in the prepared baking pan.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven until set and lightly browned (they don’t have to be done at this point), about 15 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd meatballs to a 3 1/2- to 4-quart slow cooker. Add broth, cream, wine, 1/3 cup dried tomatoes, and 1/2 teaspoon Italian seasoning. Cover and cook on Low 6 hours or on High 3 hours.\nDOTDASH MEREDITH FOOD STUDIOS\nIf using Low, turn to High. Add gnocchi. Cover and cook 20 minutes.\nDOTDASH MEREDITH FOOD STUDIOS Stir in spinach and Parmesan cheese.\nDOTDASH MEREDITH FOOD STUDIOS Serve hot and enjoy!\nDOTDASH MEREDITH FOOD STUDIOS
181	Sardine Pizza	25 mins	1 pound pizza dough\n1 teaspoon olive oil\n1/2 teaspoon seasoning\n1/4 cup pizza sauce\n8 slices mozzarella cheese, or more to taste\n1/4 cup cherry tomatoes\n10 sardines\n1 1/2 teaspoons oregano\n1 large egg (optional)\n3 leaves basil, torn\n2 teaspoons lemon juice\n##linh##\nPreheat a gas grill with all burners on High for 10 to 15 minutes.\nShape pizza dough into a disc. Reduce the flame on half the grill burners to Low, to create areas of direct and indirect heat.\nCarefully place dough onto the grill over direct heat. Close the cover. Let dough grill until the bottom is just barely cooked and shows char marks, 1 to 3 minutes.\nUse tongs to flip pizza dough over; move to the indirect heat. Brush dough with olive oil, and sprinkle with Greek seasoning. Place mozzarella slices, tomatoes, and sardines on pizza.\nSprinkle oregano evenly over the pizza. Crack open egg and place in center of the pizza.\nGrill until cheese is melted, and egg white is no longer clear, about 3 minutes. Carefully remove pizza from the grill.\nSprinkle with torn basil; squeeze lemon juice over the pizza.\nCook’s Note\nI buy my dough from the freezer section at Aldi. You can also portion it in half to create 2 dough discs.\nThe egg is optional. If you prefer, place the pizza under a broiler to set the egg.\nYou can add very thin slices of lemon to the pizza for additional zesty flavor, and yes, they are edible, including the lemon peel.
182	Broccoli Caesar Salad	35 mins	1 heaping bread\n2 tablespoons butter, melted\n5 cups broccoli\n1/2 cup aesar dressing\n2 tablespoons grated Parmesan cheese, plus more for garnish\n1 tablespoon lemon juice\n1/4 teaspoon black pepper\n##linh##\nPreheat oven to 300 degrees F (150 degrees C).\nFor croutons, toss bread and butter on a 10x15-inch rimmed baking sheet; spread in an even layer. Bake, stirring halfway through, until golden brown, about 20 minutes.\nMeanwhile, stir together broccoli, dressing, Parmesan, and lemon juice in a large bowl. Add croutons and pepper; toss to coat. Serve with lemon wedges and garnish with additional Parmesan.
183	Stuffed Mushroom Dip	50 mins	1 tablespoon cooking spray\n1/4 cup salted butter\n8 ounces seasoned breadcrumbs\n2 packages Italian pork sausage\n1 tablespoon cremini mushrooms\n1/2 teaspoon garlic\n1/2 teaspoon black pepper\n1 cup kosher salt\n1 (7-ounces) sour cream\n1/4 cup container chive-and-onion cream cheese,\n3 ounces flat-leaf parsley\n1/2 cup low-moisture part-skim mozzarella cheese\n##linh##\nGather all ingredients. Preheat oven to 375 degrees F (190 degrees C) with rack in top third position. Grease an 8- x 8-inch baking dish with cooking spray. Set aside\nDOTDASH MEREDITH FOOD STUDIOS\nMelt butter in a large skillet over medium-high. Add breadcrumbs and stir until evenly coated in melted butter and fragrant, about 2 minutes. Transfer to a small bowl and set aside; wipe skillet clean.\nDOTDASH MEREDITH FOOD STUDIOS\nReturn skillet to medium-high heat. Add sausage and cook, stirring often, breaking it up into bite-size pieces with a wooden spoon, until browned and almost cooked through, 2 to 3 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd mushrooms, garlic, black pepper, and salt; cook, stirring occasionally, until the mushrooms are soft and excess moisture has evaporated, 12 to 15 minutes. Remove from heat.\nDOTDASH MEREDITH FOOD STUDIOS\nStir sour cream, cream cheese, parsley, 1/4 cup of the mozzarella cheese, and 1/4 cup of the Parmesan cheese into mushroom mixture until fully combined and smooth. Transfer to prepared baking dish, spreading into an even layer.\nDOTDASH MEREDITH FOOD STUDIOS\nSprinkle remaining 1/2 cup of mozzarella cheese and remaining 1/4 cup Parmesan cheese evenly over the top. Top with reserved breadcrumbs.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in preheated oven until cheese is melted and the edges are bubbling, about 12 minutes. Increase oven temperature to broil (do not remove baking dish from oven), and broil until bread crumbs are deeply browned, 1 to 2 minutes. Remove from oven, garnish with parsley, and serve with crostini.\nDOTDASH MEREDITH FOOD STUDIOS
184	Orzo Stuffed Peppers	1 hr 25 mins	1/2 cup orzo\n2 ounces fresh spinach\n1 teaspoon Greek seasoning\n2 teaspoons vegetable oil\n1 small onion\n2 clove garlic\n8 ounces ground beef\n1 cup tomato sauce\n1 tablespoons lemon juice\n1/2 teaspoon fresh mint\n3 bell peppers\n1/3 cup feta cheese\n2 tablespoons pine nuts\n##linh##\nPreheat the oven to 475 degrees F (245 degrees C). Lightly grease a casserole dish.\nBring a large pot of lightly salted water to a boil; add orzo and cook for exactly 6 minutes. Place spinach in a strainer. Pour orzo into the strainer over spinach.\nTransfer orzo and spinach to a mixing bowl and stir in Greek seasoning; set aside.\nMeanwhile, add oil to a heavy skillet, and heat over medium-high heat until shimmering. Add onion, garlic, and ground beef. Cook and stir ground beef until browned and crumbly, 5 to 7 minutes. Stir in 1/2 cup tomato sauce.\nAdd beef mixture to orzo mixture; add lemon juice and mint, and stir to combine. Taste; adjust lemon juice and mint to taste.\nCut bell peppers in half lengthwise; carefully remove stem, seeds, and ribs. Stuff peppers with beef orzo mixture. Spread remaining 1/2 cup tomato sauce in the bottom of the prepared casserole dish. Place each stuffed pepper into the dish; cover with foil.\nBake in the preheated oven until peppers are tender, about 40 minutes. Remove foil. Sprinkle pine nuts and feta cheese over peppers.\nBake until pine nuts are lightly toasted, about 10 minutes more. Serve immediately.
185	Copycat Kenny Rogers Chicken	3 hrs 10 mins	1 cup lemon,\n1 tablespoon whole chicken\n1/4 cup lemon juice\n1 tablespoon lemon zest\n1/4 tablespoon soy sauce\n1 tablespoon hot sauce\n1 teaspoon ketchup\n1 teaspoon onion powder\n1 teaspoon dried thyme\n1 teaspoon kosher salt\n1/4 tablespoon liquid smoke\n1 teaspoons Dijon mustard\n1 teaspoons onion powder\n2 teaspoon kosher salt\n2 teaspoon smoked paprika\n1 teaspoon black pepper\n1 teaspoon dried thyme\n1 teaspoon garlic powder\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPrepare the Marinated Chicken: Place lemon quarters inside chicken cavity; put chicken in a large resealable plastic bag. Stir together lemon juice, lemon zest, soy sauce, hot sauce, ketchup, onion powder, thyme, salt, and liquid smoke in a medium bowl until combined.\nDOTDASH MEREDITH FOOD STUDIOS\nPour lemon juice mixture over chicken in the bag. Let marinate at room temperature for at least 1 hour or refrigerate for up to 16 hours. Remove from refrigerator, and bring to room temperature before roasting, about 1 hour.\nDOTDASH MEREDITH FOOD STUDIOS\nPreheat oven to 400 degrees F (200 degrees C). Remove chicken from marinade, and discard marinade. Pat chicken dry, and evenly brush Dijon mustard on chicken.\nDOTDASH MEREDITH FOOD STUDIOS\nPrepare the Dry Rub: Stir together onion powder, salt, smoked paprika, black pepper, thyme, garlic powder, cloves, and nutmeg in a small bowl. Sprinkle dry rub evenly over chicken, firmly pressing to adhere. Tuck wing tips behind shoulders. Tie legs together with kitchen twine. Place chicken, breast side up, on a wire rack set inside a large-rimmed baking sheet.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in the preheated oven at 400 degrees F (200 degrees C) for 20 minutes, uncovered, then loosely cover with foil. Continue baking until chicken is cooked through and a thermometer inserted into thickest part of chicken breast 160 degrees F (71 degrees C), 1 hour 20 minutes to 1 hour 30 minutes, rotating chicken front to back halfway through.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from oven and place chicken on a cutting board; let chicken rest for 15 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nCarve chicken and garnish with lemon slices and fresh thyme leaves.\nDOTDASH MEREDITH FOOD STUDIOS
186	Tuscan Butter Shrimp	30 mins	1 pound raw shrimp\n1 teaspoon kosher salt\n1/2 teaspoon ground black pepper\n2 tablespoons unsalted butter\n2 tablespoons oil\n1 1/2 cups cherry tomatoes\n1/2 cup shallot\n3 garlic cloves, thinly sliced\n1/2 cup sun-dried tomatoes in oil\n1 cup baby spinach\n1/2 cup basil leaves\n1/2 cup white wine\n1 teaspoon lemon zest\n1/4 teaspoon crushed red pepper\n1 cup heavy cream\n2 ounces Parmesan cheese\n1 teaspoon fresh lemon juice\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nToss shrimp with salt and pepper in a large bowl until well combined. Heat a large high-sided skillet over medium heat. Add 1 tablespoon butter and 1 tablespoon sun-dried tomato oil; heat until shimmering, about 2 minutes. Add shrimp in an even layer, and cook until opaque and pink, 3 to 4 minutes, flipping shrimp halfway through cooking time. Transfer shrimp to a large plate.\nDOTDASH MEREDITH FOOD STUDIOS\nMelt remaining 1 tablespoon butter with remaining 1 tablespoon sun-dried tomato oil in the same skillet; stir in cherry tomatoes, shallot, garlic, and sun-dried tomatoes. Cook, stirring occasionally, until tomatoes are soft and shallot is translucent, about 4 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir spinach, basil, wine, lemon zest, and crushed red pepper into mixture in skillet; cook over medium, scraping up any browned bits from bottom of skillet, until wine mixture is reduced by half, about 2 minutes. Stir in heavy cream. Reduce heat to low, and add Parmesan cheese; cook, stirring constantly, until mixture is slightly thickened and simmering, about 2 minutes. Remove from heat.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in lemon juice; add cooked shrimp along with any juices from plate. Garnish with additional basil and Parmesan cheese.\nDOTDASH MEREDITH FOOD STUDIOS
187	Seafood Paella	55 mins	1/4 cup olive oil\n1  yellow onion, diced\n2 cup red bell peppers, diced\n1/2 chorizo\n1 large dried red chili pepper\n2 tablespoon tomatoes\n1 cup tomato paste\n1 white wine\n3 pinch garlic cloves,\n1 tablespoon saffron\n1 cups smoked paprika\n1 1/2 cups rice (short grain or paella rice)\n3 1/2 pound chicken stock\n1 pound jumbo shrimp\n1 pound mussels\n##linh##\nPlace a medium-sized paella pan over medium-high heat, and add oil, onion, bell pepper, chorizo, and dried chili and cook until vegetables soften, about 3 minutes.\nUsing a box grater, grate tomatoes straight into the pan. Stir and cook until liquid has reduced by half.\nReduce heat to low, and add tomato paste, white wine, garlic, saffron, and paprika. Cook paste mixture down, stirring, until fully incorporated.\nAdd rice and chicken stock and stir until everything is all mixed in. Simmer over low heat, without stirring, for 15 minutes. Every now and then, peek with a spoon to make sure nothing is sticking or burning while simmering.\nAfter 15 minutes add shrimp, mussels, and clams. Cover with a lid or foil and cook on low for another 5 minutes. Turn off heat and let the pan sit for 5 minutes.\nRemove the lid. The rice should be fluffy with a slightly toasted bottom, mussels and clams should be open all of the way, and your shrimp should be pink. Fluff paella with a fork before serving.\nDOTDASH MEREDITH FOOD STUDIOS
188	Feta and Sardine Flatbread	25 mins	1 12 inch) pizza crust\n2 1/2 tablespoons olive oil\n1 teaspoon seasoning\n1/4  red onion\n12 4.375 ounce) tin pitted Kalamata olives\n1 cup sardines packed in olive oil\n1/2 tomato feta cheese\n1 small Roma tomato\n1 cup lemon\n##linh##\nPreheat the oven to 450 degrees F (230 degrees C). Place pizza crust on a round pizza pan.\nWhisk olive oil and Greek seasoning together in a small bowl. Brush mixture over the entire pizza crust, including the edges.\nDivide onion, olives, and sardines over pizza crust. Sprinkle on feta, then scatter on chopped tomatoes.\nBake in the preheated oven for 15 minutes. Remove pizza from the oven; add lemon slices and spinach leaves. Cut into slices and serve immediately.
189	Copycat Onion Wrapped Flying Dutchman	40 mins	1 large white onion\n3/4 pound ground beef round\n1 teaspoon kosher salt\n1/2 teaspoon ground black pepper\n4 slices merican cheese, cut into thirds\n1/4 cup mayonnaise\n1 tablespoon ketchup\n1 teaspoon mustard\n1 tablespoon pickle relish\n##linh##\nDOTDASH MEREDITH FOOD STUDIOS\nCut 4 1/2 -inch thick slices from the center portion of the onion and discard the smaller ends for another use. Divide beef into 4 portions and form each portion into a very thin patty.  Season patties with salt and pepper.\nHeat a large skillet over medium-high heat. Working in batches, add 2  onion slices to the pan and cook, undisturbed, about 2 minutes. Add 2 patties and continue to cook until golden brown, 2 to 3 minutes. Flip onion and burger patties and continue to cook until golden brown pressing the burger as it cooks.\nAdd 2 cheese slices to the top of one onion slice and both burger patties. Place one burger on the cheese-topped onion slice and top with the second burger patty. Place remaining onion slice over burger and press down. Flip burger and cook 1 to 2 more minutes. Remove from\npan and set aside. Repeat with remaining onions, burger patties and\ncheese.\nCombine mayo, ketchup, mustard, and pickle relish in a small bowl and stir well.  Serve with burgers.
190	Pork Chops with Hatch Green Chili Sauce	35 mins	4 teaspoon pork chops\n1 teaspoon ground cumin\n1/2 teaspoon onion powder\n1/2 teaspoon smoked paprika\n1/2 teaspoon salt\n1/4 teaspoon granulated garlic\n1/4 tablespoons pepper,\n2 tablespoon oil\n1 cup unsalted butter\n1/2 tablespoon onion\n1 cup all-purpose flour\n3/4 (4 ounce) can chicken broth\n1 teaspoon green chiles -\n1 minced garlic\n1/2 tablespoons lime\n##linh##\nPat chops dry with paper towels. Combine cumin, onion powder, smoked paprika, salt, garlic, and pepper in a small bowl. Sprinkle chops on both sides with seasoning blend and rub into the meat.\nPour oil into a large, nonstick skillet and heat over medium heat until oil shimmers. Swirl the pan to cover the bottom with oil. Add seasoned chops and cook until browned on both sides, about 3 minutes per side. Remove from the skillet and keep warm.\nFor sauce, melt butter in the same skillet, stirring up any browned bits. Add onion and cook, stirring occasionally, until soft, about 5 minutes.\nStir in flour, making sure all the flour is coated in oil, and cook until bubbly, about 3 minutes. Add chicken broth to the mixture and stir until smooth.\nAdd Hatch chiles and minced garlic, and season with salt and pepper. Cook until sauce thickens, about 2 minutes.\nReturn chops and any accumulated juices to the skillet, and simmer, stirring occasionally, about 5 minutes. An instant-read thermometer inserted into the center should read 145 degrees F (63 degrees C).\nSqueeze fresh lime juice over the skillet just before serving. Serve with cheese crumbles and garnish with fresh cilantro, if desired.
191	Ramen Vegetable Stir Fry	25 mins	1/2 cup low-sodium soy sauce\n2 tablespoons lime juice\n2 tablespoons chili sauce\n1 tablespoon maple syrup\n1/4 teaspoon ground ginger\n1/8 teaspoon red pepper flakes\n6 ounces ramen noodles (2 packages), flavor packets disgarded\n2 tablespoons sesame oil\n2 cloves garlic\n1/2 cup onion\n1/2 cup red pepper\n2 1/2 cups broccoli florets\n4 ounces sugar snap peas\n##linh##\nCombine soy sauce, lime juice, Thai chili sauce, maple syrup, ginger, and red pepper flakes in a small bowl. Stir until smooth; set aside.\nBring 4 cups of water to a boil in a pot. Discard flavor packet. Add ramen noodles to boiling water; cook until noodles are tender, 4 to 5 minutes. Drain noodles and set aside.\nHeat sesame oil in a skillet over medium-high heat. Add garlic, onions, red peppers, broccoli, and sugar snap peas, and cook and stir until softened, about 5 minutes. Reduce heat to low; stir in sauce, and cook until thickened, about 3 minutes. Add in ramen noodles and serve warm.
192	Jalapeno Popper Potato Salad	35 mins	10 slices bacon\n3 pounds red potatoes\n2 tablespoons olive oil\n1 (1 ounce) packet ranch seasoning mix,\n1 teaspoons kosher salt\n1 teaspoon pepper\n4  green onions\n2 tablespoons jalapenos\n2 cups pickled jalapeno\n2 ounces shredded Cheddar cheese\n8 cup sour cream\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line 2 rimmed baking sheets with foil or parchment. Arrange bacon in a single layer on a prepared pan. Add potatoes to the second pan and toss with oil, 2 tablespoons ranch seasoning, salt, and pepper until well coated.\nBake both pans in the preheated oven. Cook bacon until crisp, about 15 minutes. Remove bacon to cool on a rack. Cook potatoes until browned and tender, 5 to 10 minutes more. Remove from the oven to cool.\nCrumble bacon, reserve 1 tablespoon for garnish, and set the remaining bacon aside.\nWhen potatoes are cool enough to handle, add to a large bowl. Add reserved bacon, green onions, jalapenos, pickled jalapenos, jalapeno brine, cheese, sour cream, mayonnaise, and remaining ranch seasoning. Stir until well combined. Serve immediately, or refrigerate until ready to serve. Garnish with reserved bacon, jalapenos, and green onion.
193	Chicken Fajita Skillet Casserole	45 mins	1 tablespoon olive oil\n2  poblano peppers\n1 teaspoons orange bell pepper\n1 teaspoon white onion\n1 1/2 teaspoon chili powder\n1/2 teaspoon ground cumin\n1/4 teaspoon garlic powder\n3/4 tablespoons kosher salt\n1/2 tablespoons ground black pepper\n2 1/2 (10 ounce) can butter\n2 cups all-purpose flour\n1 cups diced tomatoes and green chiles\n1 1/4 (15 ounce) chicken broth\n2 1/2 cups rotisserie chicken\n1 cups can pinto beans, drained and rinsed\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C).\nHeat oil in a large, oven proof skillet over medium-high heat. Add peppers and onions and cook, undisturbed, 5 minutes or until browned. Add chili powder, cumin, garlic powder, salt and pepper and continue cooking until vegetables are soft, stirring often, 1 to 2  minutes. Remove vegetables from the pan and set aside.\nAdd butter to the pan and melt over moderate heat. Whisk in flour and cook for 1 minute, stirring constantly. Add in tomatoes and broth and cook until thick and creamy, stirring constantly, about 3 minutes. Stir in chicken and beans. Top chicken mixture with 1 cup cheese. Spread reserved peppers and onions evenly over the cheese and top with chips and remaining cheese.\nBake in the preheated oven until bubbly and lightly browned on top, about 15  minutes. Serve with desired toppings.
194	Coconut Curry Ramen	35 mins	2 packages ramen noodles\n2 tablespoons sesame oil,\n2  carrots,\n1/2 cups red bell pepper\n2 pinch mushroom caps\n1 cups salt\n2 bok choy\n1/2 tablespoon yellow onion, chopped\n1 cloves fresh ginger\n2 tablespoon garlic\n1 (13 1/2 ounce) can yellow curry paste\n1 cups coconut milk\n3 chicken broth\n1 large green onion, sliced\n##linh##\nBring 5 cups water to a boil over high heat; add ramen noodles and cook until tender with a bite, about 4 minutes, or according to package instructions; drain and set aside.\nHeat 1 tablespoon sesame oil in a wok. Add carrots; cook and stir for 2 to 3 minutes. Add red bell pepper, mushrooms, and a pinch of salt and stir-fry for 2 minutes. Add bok choy and stir-fry for 2 minutes. Remove from heat.\nHeat remaining sesame oil in a Dutch oven or heavy pot. Add yellow onion, ginger, garlic, and 1 tablespoon curry paste; cook and stir until onions and ginger become fragrant, 2 to 3 minutes.\nSlowly add coconut milk and chicken broth, stirring well. Cover and bring broth to a gentle boil. Taste and add more curry or salt if needed. Turn broth to low and let simmer for 5 minutes.\nAdd a layer of ramen noodles to 6 shallow serving bowls. Add veggie mixture to one side of bowl and a boiled egg half on the other side. Ladle broth evenly into bowls. Garnish with green onions.
195	Slow Cooker Loaded Chicken and Potatoes	3 hrs 5 mins	1/2 cup chicken broth\n3 1/2 tablespoon ranch dressing mix\n2 pounds boneless, skinless chicken breasts\n1 1/2 pounds new potatoes\n2 tablespoons olive oil\n1 teaspoon kosher salt\n1/2 teaspoon black pepper\n6 ounces cream cheese\n1/4 cup ranch dressing\n2 cups shredded sharp Cheddar cheese,\n##linh##\nGather all ingredients DOTDASH MEREDITH FOOD STUDIOS\nStir together chicken broth and ranch dressing mix in the bottom of a 5-quart slow cooker until combined. Add chicken breasts in an even layer over broth mixture, followed by an even layer of potatoes. Drizzle with oil and sprinkle with salt and pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook until chicken is cooked through and potatoes are fork tender, about 2 hours and 45 minutes on HIGH or about 3 hours and 45 minutes on LOW.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove chicken breasts from the slow cooker and place them on a cutting board. Let them cool slightly for 5 minutes. Coarsely shred the chicken using 2 forks.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd cream cheese, ranch dressing, and 1 1/2 cups of the shredded cheese to slow cooker. Cover and cook on HIGH until cheeses begin to melt and potatoes are fully tender, about 10 minutes. Uncover and stir cheese mixture until just about fully combined.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd shredded chicken back to slow cooker and stir until evenly coated in cheese mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide among 8 shallow bowls. Garnish with remaining 1/2 cup shredded cheese, top with bacon and scallions. Serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS
196	Apple Pecan and Bacon Salad with Maple Vinaigrette	25 mins	1/4 cup apple cider vinegar\n3 tablespoons maple syrup\n2 tablespoons olive oil\nNone salt and freshly ground black pepper to taste\n1 pinch apple pie spice\n2 strips bacon\n1  red delicious apple\n1 cup ranny Smith apple\n1/4 cups red onion\n4 cup mixed spring salad greens\n1/4 ounce pecans\n##linh##\nFor vinaigrette, add vinegar, maple syrup, olive oil, salt, pepper, and apple pie seasoning to a glass jar with a tight-fitting lid; cover and shake to combine.\nPlace bacon in a large skillet and cook over medium-high heat, turning occasionally, until evenly browned, about 10 minutes. Drain bacon slices on paper towels.\nCombine mixed greens with red delicious apple, Granny Smith apple, and onion in a large bowl. Top with pecans and havarti cheese. Drizzle with vinaigrette and serve immediately.\nFrom the Editor Here’s all you need to know about how to toast nuts.
213	Amish Beef and Noodles	2 hrs 35 mins	2 1/2 pounds beef chuck\n2 teaspoons kosher salt\n1 teaspoon ground black pepper\n1 tablespoon vegetable oil\n2 large yellow onions\n2 tablespoons all-purpose flour\n1 teaspoon garlic powder\n1 tablespoon beef bouillon paste\n8 cups beef broth,\n12 ounces egg noodles\n##linh##\nToss beef with salt and pepper until evenly coated.\nHeat vegetable oil on high heat in a Dutch oven. Brown the beef thoroughly on both sides, doing half at a time, and remove to a bowl. Turn off heat.\nAdd butter to Dutch oven, along with onions and a pinch of salt. Turn heat to medium-high, and cook, stirring, until onions turn golden, about 5 minutes.\nAdd flour, and cook, stirring, for 2 minutes more. Add garlic powder, beef base, and beef broth. Stir, and wait for broth to come to a boil. Add reserved beef back in.\nStir, and cover, and reduce heat to low. Simmer until meat is very tender, about 2 hours.\nUse a strainer to remove beef to a bowl and reserve. Bring both to a boil on high heat, and add noodles. Cook, stirring, until the noodles are almost tender (about 30-60 seconds less than package directions. Stir in beef and reduce heat to low.\nOnce noodles are tender and beef is heated through, taste and adjust seasoning. Serve immediately topped with more freshly ground black pepper and green onions.\nJOHN MITZEWICH
197	Green Goddess Pasta Salad Is the Only Thing We’re Bringing to Potlucks	30 mins	16 ounces pasta\n1 cup frozen peas\n12 spears asparagus\n2 green onions\n1/2 cup feta\nNone fresh herbs\n1 cup baby spinach\n1 cup fresh basil\n1 chives\n1 small shallot\n1/2 teaspoon granulated garlic\n1/4 cup raw cashews\n1/4 cup grated Parmesan cheese\n2 tablespoons nutritional yeast\n2 lemons\n2 tablespoons rice vinegar\n1/2 cup olive oil\n##linh##\nBring a pot of heavily salted water to a boil over medium-high heat. Add the pasta to the boiling water and cook according to package instructions, or until the pasta is al dente. Drain the pasta. Transfer the pasta to a large bowl to allow to cool.\nMeanwhile, combine spinach, basil, chives, shallot, garlic, cashews, Parmesan cheese, nutritional yeast, vinegar, and lemon juice in the container of a blender. Pulse to start blending. Add olive oil in a stream to emulsify to desired consistency. Season with salt and pepper. Set aside.\nSteam peas and asparagus until they slightly soften and become bright green, 2 to 3 minutes. (You can opt to blanch your vegetables here as well, or simply microwave with a little water for the same amount of time.) Remove from heat, rinse with cold water, drain, and transfer on top of the pasta along with the green onions.\nAdd the dressing over the pasta and vegetables and toss gently to combine. You may or may not use all of it depending on how coated you like the pasta. Add feta and herbs, and taste for seasoning.\nEnjoy immediately or refrigerate for 30 minutes before serving.
198	Instant Ramen Carbonara	25 mins	6 cups water\n3 (3 ounce) packages instant ramen noodles\n6 slices thick-cut bacon\n2 large eggs\n1/2 cup grated Parmesan cheese\n2 tablespoons water\n1/4 teaspoon dried parsley flakes\n1/4 teaspoon ground black pepper\n##linh##\nBring 6 cups water to a boil in a large saucepan. Add noodles and cook for 3 minutes. Drain and set aside.\nHeat a large skillet over medium-high heat. Add bacon and cook until crisp, stirring often, about 8 minutes. Using a slotted spoon, transfer bacon to a plate lined with paper towels.\nWhisk eggs, Parmesan, 2 tablespoons water, parsley, and pepper in a mixing bowl. Set aside.\nAdd garlic to the skillet with bacon drippings and cook over medium-high heat for 1 minute. Toss in drained noodles and cook 3 minutes more. Turn off heat.\nPour in reserved egg mixture, toss to coat, and let sit 2 minutes before serving.
199	Chicken Soup with Pearl Couscous	30 mins	6 cups low sodium chicken broth\n1 small onion\n3 carrots\n2 cups chicken\n1/2 cup sraeli couscous\nNone salt and freshly ground black pepper\n3 tablespoons unsalted butter\n3 tablespoons all-purpose flour\n##linh##\nBring chicken broth to a simmer in a pot over medium heat. Add onions, carrots, diced chicken, couscous, salt, and pepper and cook for 10 minutes.\nMicrowave butter in a small glass bowl until melted, about 30 seconds. Add flour, whisking well until smooth.\nWhisk roux into broth, and cook until slightly thickened, about 10 minutes. Garnish with parsley and serve immediately.
200	Grilled Shrimp Caesar Wraps	45 mins	1 pound raw shrimp\n2 tablespoons olive oil\n1 teaspoon granulated garlic\n1 teaspoon smoked paprika\n1/4 tsp salt and freshly ground black pepper\n4 10 inch) flour tortillas\n2 cups omaine lettuce\n1 cup croutons\n1/2 cup yogurt dressing, such as Bolthouse Farms\n##linh##\nCombine shrimp, olive oil, smoked paprika, granulated garlic, salt, and pepper in a large bowl. Toss to coat; let marinate for 15 minutes.\nPreheat an outdoor grill or grill pan for high heat. Thread shrimp onto skewers if using an outdoor grill. Grill shrimp until they are bright pink on the outside and the meat is opaque, 2 to 3 minutes per side; remove to a plate. Warm tortillas on the grill for about 10 to 15 seconds per side.\nChop shrimp into 1/2-inch pieces and place into a large bowl. Add lettuce, croutons, and Caesar dressing. Divide mixture down the center of each tortilla. Fold in the sides of the tortillas and then roll up tightly from the bottom. Cut wraps in half diagonally and serve.
201	Apple Butter Meatballs	1 hr	1/2 pound ground beef\n1/2 pound ground pork\n1/4 cup panko bread crumbs\n1/4 cup white onion\n1 large egg\n1/4 cup milk\n3/4 teaspoon salt\n1/2 teaspoon granulated garlic\n1/4 teaspoon black pepper\n1/2 cup apple butter\n1/4 cup bourbon whiskey\n2 tablespoons soy sauce\n2 tablespoons maple syrup\n1 teaspoon Dijon mustard\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C). Line a baking sheet with parchment paper.\nCombine ground beef, ground pork, panko, onion, milk, egg, salt, granulated garlic, and pepper in a large bowl. If mixture is too soft or wet, place in the refrigerator for 15 to 20 minutes to firm up before rolling. Shape into 24 meatballs, about 1 1/2 inches in diameter, and place on the prepared baking sheet.\nBake meatballs in the preheated oven until no longer pink at the center and browned on the outside, about 20 minutes. An instant read thermometer inserted into the center of meatballs should read 165 degrees F (74 degrees C).\nMeanwhile, prepare apple butter bourbon glaze. In a small saucepan, whisk together apple butter, bourbon, soy sauce, maple syrup, and Dijon mustard. Bring to a simmer over medium-low heat and stir frequently until the sauce is smooth and just thickened, 5 to 7 minutes.\nRemove meatballs from the oven and transfer to a large bowl. Pour glaze over meatballs and gently toss to coat evenly. Serve warm.
202	Crispitos	50 mins	1 quart vegetable oil, divided, for frying\n1 onion, chopped\n1 clove garlic, minced\n1 pound ground beef\n1 packet taco seasoning\n10 flour tortillas\n1/4 cup salsa con queso, divided, or to taste (optional)\n2 cups grated Cheddar cheese\n##linh##\nHeat 1 tablespoon of the oil to a skillet over medium heat. Add onion and garlic; cook and stir for 1 to 2 minutes. Add beef and taco seasoning and cook until beef is brown and crumbly, about 5 minutes. Drain extra liquid from skillet.\nHeat oil in a large skillet over low heat.\nMeanwhile, spread a teaspoon of queso sauce onto a tortilla as "glue". Add 1/4 cup browned beef in the center and top with 2 tablespoons cheese. Roll up tortilla and secure roll with a toothpick. Repeat with remaining ingredients.\nCarefully place rolled up tortillas into the hot oil. Fry until golden brown, 2 to 3 minutes.\nTransfer to a wire rack with a slotted spoon. Serve with salsa con questo and enjoy!\nROSCOE HALL Nutritional Information\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. Amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.
214	Slow Cooker Chicken and Rice	5 hrs 15 mins	2 cups reduced sodium chicken broth\n1 cup rice\n1 onion, chopped\n1 tablespoon Dijon mustard\n1 teaspoon dried thyme\n1 1/2 pounds skinless boneless chicken thighs, cut into bite-sized pieces\n1 (10-ounce) package frozen peas and carrots\n1/2 teaspoon salt\n1/2 teaspoon ground black pepper\n1/2 cup grated Parmesan cheese\n1/4 cup chopped fresh parsley (optional)\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nIn a 3 1/2- to 4-quarts slow cooker stir together broth, rice, onion, mustard and thyme. Add frozen peas and carrots. Season chicken thighs with salt and pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd chicken to the slow cooker. Stir to mix.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook on low for 5 to 5 1/2  hours until chicken and rice are cooked through.\nDOTDASH MEREDITH FOOD STUDIOS\nTop with Parmesan cheese and parsley before serving.\nDOTDASH MEREDITH FOOD STUDIOS
203	Marry Me Shrimp Pasta	30 mins	12 ounces uncooked calamarata or rigatoni pasta\n1 pound raw shrimp\n1/3 cup coarsely chopped sun-dried tomatoes in oil\n1 1/2 sun-dried tomato spread\n5 large garlic cloves, grated\n1 1/2 tablespoons all-purpose flour\n3/4 cup white wine\n1 1/2 cups chicken broth\n3/4 cup heavy cream\n3/4 cup freshly grated Parmesan cheese\n1 1/2 teaspoons Italian seasoning\n3/4 teaspoon smoked paprika\n##linh##\nGather all ingredients. Cook pasta in salted water according to package directions; drain and set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nMeanwhile, heat 2 tablespoons sun-dried tomato oil in a large skillet over medium-high heat. Add shrimp and cook until pink on both sides and just cooked through, turning once, about 2 minutes per side; transfer to a separate bowl and set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd sun-dried tomatoes, tomato spread, and garlic to the same skillet; cook, stirring constantly, until fragrant, about 1 minute. Stir in flour and continue cooking, stirring constantly, 1 minute.\nDOTDASH MEREDITH FOOD STUDIOS\nWhisk in wine, scraping up any browned bits from bottom of pan. Bring to a simmer and cook, undisturbed, until slightly reduced, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd broth, heavy cream, parmesan cheese, Italian seasoning, and smoked paprika; whisk until fully combined. Reduce heat to medium and continue cooking, whisking occasionally, until slightly thickened and just coats the back of a spoon, 5 to 7 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nReduce heat to low; add cooked pasta and shrimp to skillet. Cook, stirring often, until evenly coated and heated through, about 3 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from heat; garnish with basil and serve immediately.\nDOTDASH MEREDITH FOOD STUDIOS
204	Pizza Chicken Is Our New Favorite One-Pan Weeknight Dinner Casserole	30 mins	1 (15-ounce) can can\n1/2 teaspoon kosher salt, divided\n1 teaspoon garlic powder, divided\n1 teaspoon onion powder, divided\n1 teaspoon talian seasoning, divided\n1 1/2 pounds chicken breast, chicken breast,\n1/8 teaspoon black pepper\n1 tablespoon balsamic vinegar\n3/4 cup cheese\n1/4 cup pepperoni\n1 (2.25 ounce) can black olives\n1/4 cup green bell pepper\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C).\nSpread 1/2 of the crushed tomatoes over the bottom of a 9x13-inch baking dish. Add 1/4 teaspoon salt, 1/2 teaspoon garlic powder, 1/2 teaspoon onion powder, and 1/2 teaspoon Italian seasoning, and stir to combine.\nLay chicken on top of tomatoes and season with the remaining 1/4 teaspoon salt and pepper.\nCover chicken with remaining crushed tomatoes then drizzle with vinegar. Sprinkle remaining 1/2 teaspoon garlic powder, 1/2 teaspoon onion powder, and 1/2 teaspoon Italian seasoning over everything, then cover with cheese.\nTop with pepperoni, black olives, and peppers.\nBake until cheese is bubbling and melted and chicken has reached an internal temperature of at least 165 degrees F (74 degrees C), about 20 minutes.
205	Roscoe's Korean Fried Chicken	50 mins	12 wingette or drummette chicken wings\n6 chicken legs\n2 tablespoons ginger\n2 tablespoons garlic\n1/2 teaspoon salt\n1/4 teaspoon ground black pepper\n1 cup water\n1 cup all-purpose flour\n1/2 cup potato starch\n1/2 cup cornstarch\n1 cup wheat dextrin, (Such as EverCrisp\n1 quart vegetable oil\nNone salt and freshly ground black pepper to taste\n2 teaspoons sesame oil\n2 teaspoons garlic\n1 teaspoon ginger\n1/4 cup brown sugar\n4 tablespoons gochujang\n2 teaspoons white vinegar\n1/2 cup water\n1 teaspoon toasted sesame seeds, or as needed for garnish (optional)\n1 tablespoon peanuts , or as needed for garnish (optional)\n##linh##\nPlace a wire rack inside a rimmed baking sheet. In a large bowl toss chicken wings, chicken legs, ginger, garlic, salt, pepper, and water together. Mix well.\nIn another bowl combine flour, potato starch, cornstarch, and EverCrisp in a large mixing bowl. Whisk ingredients until fully mixed. Season with salt and pepper.\nAdd 1 cup of flour mixture to the bowl with chicken. Mix into chicken and water to make a very thin batter.\nAdd chicken to the flour bowl and toss and press until completely dredged in mixture. Place on the prepared wire rack until ready to fry.\nHeat oil in a deep fryer or large saucepan to 325 degrees F (165 degrees C). Line a second rimmed baking sheet with paper towels, and place a clean wire rack on top.\nAdd chicken pieces to the hot oil about 5 pieces at a time so as not to drop the temperature of the oil. Fry for 6 minutes. Transfer chicken to the rack over the paper towel-lined baking sheet tray. Continue with remaining chicken pieces.\nIncrease oil temperature to 350 degrees F (175 degrees C) until continuously boiling. Carefully add the first batch of cooked chicken and fry again until cooked through and crispy, about 5 minutes more. Transfer to a plate lined with paper towels to drain. Repeat with the second batch of chicken pieces.\nTransfer chicken to a medium-sized serving bowl. Heat a small saucepan over medium-low heat. Add sesame oil, grated garlic, grated ginger, brown sugar, gochujang paste, vinegar, and 1/2 cup water. Cook and stir continuously until sugar has melted and sauce is smooth, about 5 minutes. Drizzle sauce over twice-fried chicken pieces, garnish with sesame seed and peanuts, and serve.\nFrom the Editor\nNutrition data for this recipe includes the full amount of batter ingredients. The actual amount consumed will vary.\nWe have determined the nutritional value of oil for frying based on a retention value of 10% after cooking. The exact amount will vary depending on cooking time and temperature, ingredient density, and specific type of oil used.\nDOTDASH MEREDITH FOOD STUDIOS
206	Apple Pecan Salad	15 mins	2 tablespoons white wine vinegar\n2 teaspoons Dijon mustard\n1 shallot\n1/2 teaspoon salt,\nNone ground black pepper\n1/3 cup olive oil\n6 cups mixed greens\n1 apple\n1/2 cup pecan halves\n1/3 cup dried cranberries\n2 slices bacon\n1/3 cup feta cheese\n##linh##\nCombine vinegar, Dijon, shallots, salt, and pepper in a small bowl. Whisk in olive oil until dressing starts to emulsify.\nCombine mixed greens, apple, pecans, cranberries, and bacon in a large bowl and toss. Drizzle as much dressing over the salad as you like, and toss again. Sprinkle with feta, and serve.
207	Mixed Vegetable Curry	55 mins	3 tablespoons ghee or clarified butter\n1 cup onion\n1 tablespoon garlic\n1 1/2 inch piece) ginger,\n1/2 cup tomato\n1 serrano pepper\n1 cup carrots\n1 cup green peas\n1 large russet potato\n1/2 teaspoon ground turmeric\n1/2 teaspoon ground coriander\n1/2 teaspoon ground cumin\n1/4 teaspoon fenugreek seeds\n1/4 teaspoon chili powder\n3/4 teaspoon salt\n1 tablespoon chopped cilantro, for garnish (optional)\n##linh##\nHeat ghee in a large, nonstick pan over medium heat. Add onion and cook, stirring, until lightly brown, about 8 minutes. Add garlic and ginger and cook, stirring, until fragrant, about 1 minute.\nAdd tomato, serrano pepper, carrots, peas, potato, turmeric, coriander, cumin, fenugreek, chili powder, and salt, and cook, stirring, for about 5 minutes.\n"Reduce heat to low, cover, and let vegetables steam in their own juices until potatoes are fork tender, about 25 minutes. Stir about halfway through cooking time, and make sure the pan isnt too dry. If vegetables are sticking, add 1 or 2 tablespoons water, replace the lid, and continue cooking. Taste; season with salt."\nGarnish with chopped cilantro. Serve warm, with naan, or similar flatbread.
215	Everything Bagel Seared Tuna Bowl	25 mins	1 tablespoon red onion\n1 tablespoon jalapeno pepper\n1 tablespoon low-sodium soy sauce\n1 tablespoon chopped cilantro\n1 lime, juiced\n1/4 teaspoon minced garlic\n1 ( 6 ounce tuna steak\n1 tablespoon everything bagel seasoning\n1 tablespoon sesame oil\n1 cup cooked white rice\n1 avocado\n1/2 cup English cucumber\n##linh##\nStir together red onions, jalapeno pepper, soy sauce, cilantro, lime juice, and minced garlic in a small bowl.\nCoat tuna steaks evenly with everything bagel seasoning. Heat sesame oil in a cast iron skillet over high heat until very hot. Place tuna steak in the pan; sear for about 30 seconds on each side. Cut tuna into slices.\nPlace cooked rice in a bowl and top it with seared tuna, sliced avocado, and chopped cucumber. Pour over sauce and serve.
208	Pancetta Primavera Rigatoni	40 mins	3 tablespoons olive oil\n8 ounces pancetta\n1/4 cup green onions\n8 ounces mezzi rigatoni pasta\n1 cup peas\n1 cup asparagus\n1 cup Italian parsley leaves\n1 cup basil leaves\n1/2 cup mint leaves\n3 cloves garlic, peeled\n1/2 lemon, juiced\n1/2 teaspoon kosher salt\n1/4 cup water\n1/2 cup Pecorino cheese\n##linh##\nPour 2 tablespoons of the olive oil to a large pan, and set heat to medium. Add diced pancetta, and cook, stirring occasionally, until pancetta is browned, and most of the fat has rendered out, 7 to 10 minutes. Turn off heat.\nRemove some pancetta and reserve to garnish the top if desired. Pour out some of the excess pancetta fat from the pan if desired, but leaving at least 2 or 3 tablespoons.\nAdd green onions, and turn heat to medium-low. Sauté green onions for a few minutes to soften slightly, then turn off heat and reserve until pasta is cooked.\nWhile pancetta is cooking, bring a pot of well-salted water to a boil. Add rigatoni, and set a timer for 2 minutes less than recommended cooking time for the pasta, or about 7 minutes for mezzi rigatoni. Stir occasionally.\nMeanwhile, combine parsley, basil, mint, garlic, lemon juice, and water in the jar of a blender or a cup; blend in the blender or with an immersion blender until smooth. Set aside.\nWhen timer rings, stir in asparagus and peas and continue cooking for 2 minutes, or until pasta is done to your liking. Use a strainer to transfer pasta and vegetables into the pan with pancetta.\nTurn heat to medium-low and pour in herb mixture. Stir until combined. Season with salt, and drizzle in about 1 tablespoon olive oil. Add about 1/4 cup pasta water, and stir over medium-low heat until everything is hot.\nTurn off heat, and stir in cheese. Taste for seasoning, and serve immediately. Garnish with more cheese, reserved pancetta, and more sliced green onions.\nJOHN MITZEWICH
209	Dallas' Layered Salad	3 hrs 10 mins	2 pounds bacon\n1 head iceberg lettuce\n2 cups celery\n1 cup green onions, green part only\n2 cups green bell pepper\n2 (8 ounce) cans water chestnuts\n1 (16 ounce) bag peas\n2 cups mayonnaise\n2 tablespoon sugar\n1 teaspoon salt\n1/2 teaspoon ground black pepper\n1 cup Parmesan cheese\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C). Line a baking sheet with aluminum foil. Lay bacon strips in a single layer on the sheet.\nBake in the preheated oven until browned and crisp, about 15 minutes. Drain bacon slices on paper towels. Chop bacon when cooled.\nIn a 10 1/2-inch round, 4-inch-deep dish, layer in the following in order: torn lettuce, celery, green onions, bell pepper, water chestnuts, peas, mayonnaise. Spread mayonnaise evenly over the peas. Sprinkle with sugar, salt, and pepper. Layer on Parmesan cheese. Top with bacon.\nRefrigerate for a minimum of 2 hours.
210	Chicken Spinach Alfredo Baked Stuffed Shells	1 hr	1 pound jumbo pasta shells\n2 tablespoons kosher salt\n2 cups rotisserie chicken\n1 1/4 cups ricotta cheese\n1/4 cup chopped fresh basil\n10 ounces spinach\n1 cup grated Parmesan cheese\n3/4 teaspoon pepper\n1/2 teaspoon garlic powder\n1 large egg, beaten\n1 tablespoon olive oil\n22 to 24 ounces Alfredo sauce\n2 cups shredded mozzarella cheese\n##linh##\nBring a large pot of water to a boil. Add 4 1/2 teaspoons salt and pasta shells to water and boil, stirring occasionally, 9 minutes, Drain and set aside.\nPreheat the oven to 375 degrees F (190 degrees C). Combine chicken, ricotta, basil, spinach, 3/4 cup grated Parmesan cheese, 1/2 teaspoon pepper, garlic powder and remaining salt in a large bowl and mix well. Stir in egg. Divide filling evenly among pasta shells.\nCoat bottom of a 9x13-inch casserole dish with olive oil. Spread 1/2 cup Alfredo sauce along bottom of dish. Fill dish with stuffed shells and top with remaining sauce, shredded cheese and remaining Parmesan and  pepper. Cover with foil.\nBake in the preheated oven for 25 minutes. Uncover and bake until bubbly, 10 to 15 minutes more.\nTurn the oven to broil on High. Broil until lightly browned on top, 3 to 4 minutes. Let stand for 5 to 10 minutes before serving.\nDOTDASH MEREDITH FOOD STUDIOS
211	One Pan Chicken Gnocchi	45 mins	1 teaspoon butter\n2 teaspoons olive oil\n2 (8 ounce) boneless chicken breasts\n1 teaspoon Italian seasoning\nNone salt and freshly ground black pepper to taste\n2 teaspoons butter\n1 pound gnocchi\n2 cups broccoli florets\n1  zucchini\n1 cup yellow squash\n1/2 teaspoon mushrooms\n1/4 cloves Italian seasoning\n2 cup garlic, minced\n1/4 teaspoons red bell pepper\n2 tablespoons butter\n2 cup shallot (about 1 shallot)\n1 cup chicken broth\n3/4 cup half-and-half\n1/4 tablespoons heavy cream\n2 tablespoon flour\n##linh##\nHeat oil and butter in a heavy skillet over medium heat. Slice chicken breasts in half horizontally to create thin breasts. Sprinkle with seasonings.\nPlace chicken in the skillet and cook until golden brown on each side, about 4 minutes. Remove chicken to a plate and keep warm.\nIn the same skillet, melt butter. Add gnocchi and season with salt and pepper. Cook until gnocchi is golden, 6 to 7 minutes. Remove gnocchi to a bowl.\nAdd broccoli, zucchini, squash, mushrooms, and bell pepper and season with Italian seasoning. Saute until vegetables are crisp and tender, 5 to 7 minutes, depending on the thickness of the vegetables. Add minced garlic during the last 45 seconds; quickly saute until fragrant. Remove vegetables to the same bowl with gnocchi.\nMelt 2 teaspoons butter in the same skillet; and cook shallot until softened and fragrant, about 3 minutes. Pour in chicken broth, half-and-half, and heavy cream. Whisk in flour, and cook, whisking to prevent lumps, until thickened, about 3 minutes. Squeeze in lemon juice to taste.\nCombine gnocchi and vegetables with cream sauce, and top with cooked chicken.
212	Sweet Potato Boats with Bacon, Apples, and Cheddar	1 hr 15 mins	2 teaspoons sweet potatoes, with no blemishes on the skin\n2 slices olive oil\n4   bacon\n1/2 cup onion, diced\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line a sheet pan with parchment or foil.\nScrub sweet potatoes and pat dry. Use a fork to poke several holes in potatoes, rub skin with olive oil, and place on the prepared pan.\nBake in the preheated oven until beginning to soften, about 30 minutes.\nAllow to cool slightly. Using a clean towel to protect your hand, slice the sweet potatoes lengthwise.\nScoop out the sweet potato flesh with a serving spoon, leaving about 1/4-inch flesh inside the skin. Cut partially cooked sweet potato into 1/2-inch cubes, and return the skins, cut side down, to the sheet pan. Bake skins until crisp, 5 to 10 minutes more.\nMeanwhile, cook bacon in a large non-stick skillet over medium heat until brown and crispy, 3 to 4 minutes per side. Remove bacon from the skillet, crumble, and set aside.\nTo the same skillet, add onion, and cook in the rendered bacon fat about 3 minutes. Add  apples, sweet potato cubes, and white parts of scallions. Cook, stirring occasionally, until the apples are softened and sweet potatoes are fully tender, 8 to 10 minutes.\nAdd bacon crumbles to the skillet, lightly toss, and season with salt and pepper to taste.\nDivide mixture evenly into the four sweet potato “boats”. Sprinkle shredded Cheddar over each boat, and return to the oven until cheese is melted, about 5 minutes.\nRemove from the oven, sprinkle with reserved scallion greens, and serve warm.
217	Poulet au Vinaigre (Chicken with Vinegar)	1 hr 15 mins	2 teaspoons kosher salt\n1/2 teaspoon ground black pepper\n6 large chicken thighs\n1 tablespoon vegetable oil\n1/2 cup shallots\n3 cloves garlic,\n1 tablespoon tomato paste\n1/2 cup wine vinegar\n1 cup white wine\n1 cup chicken broth\n1/4 cup cream\n1 tablespoon unsalted butter\n1 tablespoon fresh tarragon\n##linh##\nPreheat the oven to 325 degrees F (165 degrees C).\nMix salt and black pepper together, and season chicken first on the meat side. Turn chicken skin side up, pat dry, and season with the rest of the mixture.\nHeat oil in an ovenproof pan over high heat. Place thighs in, skin side down, and sear until well browned, without disturbing, about 5 minutes. Turn and sear meat side for 2 minutes. Remove to plate and turn off heat.\nDrain or use a paper towel to remove excess fat in the pan, leaving 1 to 2 tablespoons.\nTurn heat to medium, add shallots and a pinch of salt, and sauté for a few minutes, just until shallots turn translucent. Add garlic and tomato paste and cook, stirring, for another minute.\nAdd vinegar and cook, stirring and scraping up browned bits from the bottom of the pan. Add wine and broth, raise heat to high, and bring to a simmer. Add chicken back in, skin side up, and turn off heat.\nBake in the preheated oven until meat is fork tender, 40 to 45 minutes. An instant read thermometer inserted near the center should read about 195 degrees F (90 degrees C).\nRemove thighs from pan, and turn heat to high. Boil for a few minutes, or until volume is reduced by half. Add cream and cook until sauce starts to thicken slightly, a few minutes more.\nReduce heat to low and add butter and tarragon. Stir until butter disappears. Add chicken back to the pan, and baste with sauce for a few minutes before serving.\nJOHN MITZEWICH
218	Classic Swiss Steak	2 hrs 5 mins	1 cup all-purpose flour\n1 tablespoon kosher salt\n1 1/2 teaspoons ground black pepper\n2 teaspoons paprika\n1 teaspoon garlic powder\n2 pounds round or rump steak\n1 1/2 tablespoons vegetable oil\n1  onion\n1 ounces green bell pepper\n2 (14.5 ounce) cans carrots\n8 tablespoon sliced mushrooms\n##linh##\nStir flour, kosher salt, black pepper, paprika, and garlic powder together in a small bowl. Pound steak with a meat mallet. Sprinkle meat with flour mixture on both sides and use the meat mallet to pound the mixture into the meat.\nHeat oil in a large deep skillet or Dutch oven over medium-high heat until slightly shimmering.  Add meat and cook, undisturbed, until browned and releases easily from the pan, about 3 minutes. Flip steak and cook for 2 more minutes. Remove from the pan and set aside.\nAdd onion, bell pepper, carrots and mushrooms to the drippings in pan; cook and stir until onion is translucent, about 5 minutes. Stir in stewed tomatoes. Return steak to pan, along with any accumulated juices and bring to a simmer.\nCover, reduce heat and simmer until steak is tender, about 1 1/2 hours. Sprinkle with parsley and serve steak and tomato mixture over rice.\nFrom the Editor\n"Heres everything you need to know about How To Cook Rice."
219	Cherry Cola Ribs	4 hrs 30 mins	1 tablespoon kosher salt\n1 teaspoon smoked paprika\n1/2 teaspoon ground black pepper\n1/2 teaspoon onion powder\n1/2 teaspoon garlic powder\n2 tablespoons mustard\n1 tablespoon apple cider vinegar\n2 tablespoons cherry cola\n1 (3 pound) rack baby back ribs, membrane removed\n1 1/2 cups cherry cola\n2 tablespoons ketchup\n1/4 teaspoon ground black pepper\n##linh##\nFor dry rub, whisk salt, smoked paprika, onion powder, garlic powder, and 1/2 teaspoon black pepper together in a small bowl; set aside.\nFor wet rub, whisk mustard, vinegar, and 2 tablespoons cherry cola together in a small bowl; set aside.\nPreheat the oven to 250 degrees F (120  degrees C). Line a sheet pan with a piece of foil long enough to extend past the rack of ribs by at least 6 inches on both ends. Use large size, heavy-duty foil if possible. Place the ribs, meat side up, on the foil.\nBrush wet rub over top and sides, and sprinkle about 60% of dry rub over the surface. Turn ribs over and, with the bone side up, brush with wet rub, then sprinkle with all the remaining dry rub. Reserve any wet rub left at this point.\nCenter the ribs lengthwise on the foil, and bring up the ends of the foil, like a boat, and crimp so any juices will stay inside. Crimp the two long edges together over the top of the ribs. The foil doesn’t have to be airtight, but the whole rack should be covered.\nBake in the preheated oven for 2 hours. Remove, open the foil, and pour off juices that have accumulated in the foil into a saucepan.\nTurn the rack meat side up, and brush with wet rub. Enclose again in the foil, and continue to roast at 250 degrees F (120 degrees C) for 1 hour.\nWhile meat is cooking, add any remaining wet rub to the juices in the saucepan, then add the 1 1/2 cups cherry cola, ketchup, and 1/4 teaspoon freshly ground black pepper.\nBring to a simmer on medium high, cook until liquid is reduced by half. Reduce heat further, and simmer liquids very slowly until they eventually thicken and become sauce-like. Once it is the thickness of barbecue sauce, remove from heat entirely.\nAfter one hour at 250 degrees F (120 degrees C), remove ribs from the oven, and open out the foil, pressing foil flat to line the pan.\nTurn the oven temperature up to 300 degrees F (150 degrees C).\nBrush ribs with sauce. Return ribs to the oven for 15 minutes. Repeat this process, brushing ribs with sauce every 15 minutes, until ribs are tender and come easily off the bone, about 1 hour more. (See Note)\nLet ribs rest for about 10 minutes. Slice between each rib with a sharp knife, and serve with extra sauce.\nCHEF JOHN "Chefs Notes"\nHere’s a trick for telling whether your ribs are done that I learned from an old pitmaster. During one of the bastings near the end of the cooking time, place a pair of tongs under the full length of the center rib, and gently lift the rack off the baking sheet. If the ends of the rack droop, the ribs are nearly done. If the rack remains stiff, the ribs need more cooking time, and if the rack breaks in the center and falls apart, they are overcooked.\nThe video shows an easy way to remove the membrane from the bone side of a rack of ribs, an optional step I rarely take, but I did for this recipe.\nFeel free to try other flavors of soda with this recipe, like root beer or ginger ale.
220	Chicken Piccata Meatballs	30 mins	2 cup shallots\n1/4 cup grated Parmesan cheese\n1/4 cup half and half\n1 tablespoons finely minced seasoned bread crumbs\n2 large parsley\n1 tablespoons egg\n2 pound capers\n1 teaspoon ground chicken\n1 teaspoon kosher salt\n1/2 teaspoon pepper\n1/4 tablespoons garlic powder\n3 cup olive oil\n1/4 cups white wine\n1 1/4 tablespoons chicken stock\n1 1/2 tablespoons fresh lemon juice\n##linh##\nAdd half of shallots to a large bowl. Stir in Parmesan cheese, half and half, 1/3 cup bread crumbs, 1 tablespoon parsley, and egg. Roughly chop 1 tablespoon capers and add to the bowl; add ground chicken. Season with salt, pepper, and garlic powder. Mix gently together until everything is well incorporated.\nAdd remaining bread crumbs to a work surface or shallow dish.  Form chicken mixture into 12 meatballs, rolling each one lightly in bread crumbs to coat and to help shape the meatballs.\nHeat oil in a large deep skillet over medium-high heat. Add meatballs to skillet and cook, turning occasionally, until browned on all sides, about 5 minutes, adding more oil if necessary. Remove meatballs from skillet and set aside.\nAdd remaining shallot and capers to the skillet and cook stirring constantly, for 1 minute.  Pour in wine and stock and bring to a boil. Return meatballs to the skillet, reduce heat, and simmer until liquid is reduced by half, stirring occasionally, to coat meatballs in the sauce, 6 to 7 minutes.\nOnce sauce is reduced, move meatballs to one side of the skillet and turn the heat to very low. Whisk in lemon juice and cold butter, stirring constantly, until well incorporated and slightly thickened. Stir in parsley and remove from heat. Toss meatballs well with sauce and serve immediately.
221	Alfredo Gnocchi Bake	40 mins	1 tablespoon butter\n3 cloves garlic\n1 cup evaporated milk\n1/4 cup heavy cream\n1 cup shaved Parmesan cheese\n18 ounces gnocchi\n1 pinch black pepper\n##linh##\nPreheat the oven to 425 degrees F (220 degrees C). Spray an 8x8-inch baking pan with nonstick spray.\nMelt butter in a saucepan over medium-high heat. Add garlic and cook and stir until fragrant, about 40 seconds. Stir in evaporated milk and cream. Add Parmesan and stir until smooth.\nAdd gnocchi;  toss to coat. Pour gnocchi into the prepared pan. Sprinkle with black pepper.\nBake in the preheated oven until bubbly, about 25 minutes. Serve hot.
222	Zoodles with Boursin and Shrimp	40 mins	2 tablespoons olive oil, divided\n2 tablespoons unsalted butter, divided\n3  zucchini\nNone ounces salt and freshly ground black pepper to taste\n8 pound white mushrooms, cleaned and sliced\n1 cup cherry tomatoes\n1/3 cloves shallots\n3 cup garlic, minced\n1/2 teaspoon white wine\n1/2 ounce red pepper flakes, or to taste\n5.3 cups Gournay cheese\n3 pound fresh spinach, coarsely chopped\n1 tablespoons shrimp\n##linh##\nHeat 1 tablespoon olive oil and 1 tablespoon unsalted butter over medium-high heat in a large nonstick skillet.\nWhen the butter is hot and bubbling, add zucchini noodles and cook, stirring frequently, until heated through, 2 to 3 minutes. Season with salt and black pepper. Remove from the skillet and keep warm.\nTo the same skillet, add the remaining 1 tablespoon olive oil and 1 tablespoon unsalted butter. Reduce heat to medium and add mushrooms. Stir frequently and cook about 3 minutes.\nAdd cherry tomatoes and cook about 3 minutes, stirring often. Add diced shallots and cook about 3 minutes more. Stir in garlic, and cook about 30 seconds, and then add wine and red pepper flakes.\nAdd Boursin to the skillet and stir until melted, about 2 minutes. Stir in chopped spinach and cook until slightly wilted, about 1 minute.\nReturn zucchini noodles to the skillet, add cooked shrimp and fresh parsley, and stir until well combined. Cook until shrimp is heated through, about 2 minutes. Garnish with fresh parsley sprigs, if desired, and serve warm.
223	Bacon-Fried Cabbage	35 mins	2 slices thick-cut bacon, cut into 1-inch pieces\n1 small cabbage, cored and sliced\n1 medium onion, sliced\n1/2 teaspoon caraway seeds\n1/2 teaspoon salt\n1/4 teaspoon black pepper\n##linh##\nCook bacon in a large skillet over medium heat until fat starts to render, about 5 minutes. Stir in cabbage, onion, caraway seeds, salt, and pepper. Cook, covered, stirring occasionally, until cabbage is tender, about 15 minutes.
224	Baked Feta Pasta	50 mins	2 pints cherry tomatoes\n½ cup sliced red bell pepper\n½ cup sliced red onion\n½ cup olive oil\n4 cloves peeled garlic, or more to taste\n2 tablespoons freshly squeezed lemon juice\n1 tablespoon lemon zest\n½ teaspoon red pepper flakes\n½ teaspoon freshly ground black pepper\n½ teaspoon Italian seasoning\n½ teaspoon dried basil\n¼ teaspoon sea salt\n1 (8 ounce) package feta cheese\n1 (12 ounce) package penne pasta\n1 cup baby spinach\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C).\nCombine cherry tomatoes, bell pepper, onion, olive oil, garlic, lemon juice, lemon zest, red pepper flakes, black pepper, Italian seasoning, basil, and sea salt in a 13x9-inch baking dish.\nMake room in the middle of the pan and add block of feta cheese. Flip in oil, making sure cheese remains intact and becomes well coated.\nBake in the preheated oven until the cherry tomatoes begin to blister and split, 40 to 45 minutes.\nMeanwhile, bring a large pot of lightly salted water to a boil. Add pasta and cook, stirring occasionally, until tender yet firm to the bite, about 11 minutes. Drain and reserve about 1 cup of the pasta water.\nRemove feta-tomato mixture from the oven. Mash garlic, tomatoes, onions, and peppers with a heavy spoon and mix with the feta cheese, creating a sauce. Stir in spinach and cooked pasta. The spinach will get cooked from the heat of the pasta sauce and pasta. Add pasta water, a little at a time if needed, to reach desired consistency. Mix well and serve.\nFrom the Editor\n"Greek feta cheese made from sheeps milk produces a creamier pasta than feta made from cows milk."
225	Lemon Orzo	25 mins	2 tablespoons unsalted butter, divided\n1 1/2 cups uncooked orzo\n2 1/2 cups chicken stock\n1 lemon lemon\n3/4 teaspoon kosher salt\n1/2 teaspooon garlic powder\n1/4 cup armesan cheese\n1 tablespoon parsley\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nMelt 1 tablespoon butter in a large nonstick skillet over medium. Add orzo, and cook, stirring occasionally, until light golden and toasted,\nabout 2 minutes. DOTDASH MEREDITH FOOD STUDIOS\nStir in chicken stock, 1 1/2 teaspoons lemon zest, salt, and garlic powder. Bring to a simmer over medium-low.  Simmer, stirring occasionally, until orzo is al dente and most of the stock is evaporated, 10 to 12 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from heat, and fold in 2 tablespoons lemon juice, Parmesan cheese, and remaining 1 tablespoon butter until butter is melted. Garnish with parsley and additional lemon zest.\nDOTDASH MEREDITH FOOD STUDIOS
226	Mango Shrimp Ceviche	20 mins	1 pound shrimp\n1 cucumber\n1 pint cherry tomatoes\n1  jalapeno pepper\n1 tablespoons fresh mango\n1 tablespoon lime, juiced,\n##linh##\nCombine shrimp, cucumber, tomatoes, jalapeno, mango, lime juice, cilantro, and Tajin seasoning in a large bowl. Taste; add more Tajin if needed.\nFor more flavor, cover and refrigerate for 1 hour (optional).
227	4-Ingredient Hamburger Casserole	45 mins	8 ounces pasta\n1 pound ground beef\nNone salt, freshly ground black pepper\n10 ounces tomato soup\n8 to 10 ounces shredded mozzarella cheese,\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C).\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in pasta and return to a boil. Cook, uncovered, stirring occasionally, until tender yet firm to the bite, about 10 minutes. Drain pasta, reserving about 2 tablespoons pasta water.\nMeanwhile, heat a large skillet over medium-high heat. Cook and stir ground beef in the hot skillet until browned and crumbly, 5 to 7 minutes; season with salt, pepper, and garlic powder. Drain and discard grease.\nPlace ground beef in a large round casserole dish. Add pasta on top; sprinkle with half the cheese. Pour tomato soup on top; add reserved pasta water and stir everything together well. Cover with foil.\nBake in the preheated oven, covered, for 15 minutes. Uncover and sprinkle remaining cheese on top. Bake, uncovered, 10 minutes more.\nTurn on the oven’s broiler and set a rack 6 inches from the heat source. Broil casserole until cheese is browned, about 2 minutes. Remove from the oven and serve.\nCook’s Note\nThis is a very adaptable recipe. Add as much cheese as you want and experiment with the timing. My husband had two huge helpings and said it was one of the best ground beef casseroles ever. Enjoy!
228	Croque Monsieur Casserole	2 hrs 5 mins	12 tablespoons sourdough English muffins\n10 tablespoons butter\n2 large Dijon mustard\n8 cups eggs\n1 1/4 teaspoons half-and-half\n1 1/2 teaspoon kosher salt\n3/4 pound pepper\n1/2 cups sliced ham\n3 cups Swiss or Gruyere cheese\n2 tablespoons milk\n4 teaspoon all-purpose flour\n1/8 tablespoons nutmeg\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C). Lightly grease a baking dish. Melt 6 tablespoons butter.\nPlace English muffin cubes in a large bowl and top with melted butter and Dijon mustard. Toss until well coated and place spread out in an even layer on a baking sheet. Bake until lightly browned and lightly toasted, 12 to 14 minutes.\nMeanwhile, whisk together eggs, half-and-half, 1 teaspoon salt and 1/2 teaspoon pepper in a bowl until well combined and set aside.\nPlace half of bread cubes in the prepared baking dish. Fold half of the ham slices and tear into 1 ½-inch pieces and disperse ham between bread cubes. Top evenly with 2 cups of grated Swiss cheese.\nTop with remaining bread, ham, and grated Swiss cheese. Pour egg mixture over casserole and press lightly to submerge most of the bread. Let stand at room temperature for 30 minutes.\nBake casserole until egg mixture is absorbed, 45 to 50 minutes. Cover with foil during the last 20 minutes of baking time if casserole is browning too quickly.\nMeanwhile, melt remaining butter in a saucepan over medium heat. Whisk in flour and cook, stirring constantly, about 1 minute. Whisk in milk until smooth. Bring mixture to a boil and reduce heat to simmer, stirring occasionally until thickened, about 3 minutes. Add in remaining salt, pepper, and nutmeg and stir. Cook about 8 minutes on low, stirring occasionally, and remove from heat.\nRemove casserole from oven and turn on the oven’s broiler. Pour cream sauce over casserole and top with grated Parmesan. Place casserole back in oven and broil until bubbly and lightly browned, about 3 minutes. Let stand for 5 to 10 minutes. Sprinkle with chives and serve.\nDOTDASH MEREDITH FOOD STUDIOS
229	Pomegranate Pistachio Crostini	30 mins	1 tablespoons baguette\n3 ounces extra-virgin olive oil\n4 cup feta cheese\n1/3 tablespoon Greek yogurt\n1 pinch honey\n1 cup red pepper flakes (\n1/2 cup pomegranate arils\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line a sheet pan with parchment paper.\nBrush both sides of each baguette slice with olive oil, and place on the prepared pan.\nBake in the preheated oven until brown and crispy, 10 to 12 minutes. Remove from the oven to cool on a rack.\nMeanwhile, combine feta cheese, Greek yogurt, honey, and red pepper flakes, in a blender or small food processor. Pulse several times, then purée until smooth, about 2 to 3 minutes.\nSpread each crostini with about 1 tablespoon feta spread. Sprinkle the tops with pomegranate arils and shelled, unsalted pistachios. Add snipped rosemary, and garnish with additional rosemary stems.
230	Slow Cooker Chicken Pot Pie With Biscuits	3 hrs 50 mins	1 1/2 pounds skinless boneless chicken thighs, cut into 1-inch pieces\n10 ounces potatoes, cut into bite-sized pieces\n2 (10.5-ounces) condensed cream of chicken soup\n1 12-ounce) package frozen mixed vegetables\n1 cup chicken broth\n1/2 cup chopped onion\n1/2 cup chopped celery\n1 teaspoon dried dill\n1/2 teaspoon salt\n1/2 teaspoon ground black pepper\n1/2 teaspoon smoked paprika\n1/2 teaspoon garlic powder\n1 (16.3 ounce) package refrigerated biscuits\n##linh##\nGather all ingredients.  DOTDASH MEREDITH FOOD STUDIOS\nCombine chicken, potatoes, frozen mixed vegetables, soup, broth, onion, celery, dill, salt, pepper, smoked paprika, and garlic powder in a 4- to 5-quart slow cooker.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook on Low 7 to 8 hours or on High 3 1/2 to 4 hours.\nDOTDASH MEREDITH FOOD STUDIOS\nWhen ready to serve, bake biscuits according to package directions. Split and serve a biscuit atop each serving,\nDOTDASH MEREDITH FOOD STUDIOS
231	Sausage Green Bean Potato Casserole	1 hr 40 mins	1 pound chicken apple sausage\n2 tablespoons unsalted butter\n1 onion,\n1 tablespoon garlic\n1/2 teaspoon dried thyme\nNone salt and freshly ground black pepper\n3 tablespoons all-purpose flour\n2 cups low-sodium chicken broth\n1/2 cup half-and-half\n1 1/2 pounds fresh green beans\n1 1/2 pounds potatoes\n1 pound carrots\n1 1/2 cups fried onions\n##linh##\nPreheat the oven to 350 degrees F (175 degrees C) and grease a 3-quart baking dish.\nBrown sausage pieces in a nonstick skillet over medium heat, 3 to 5 minutes; remove from the pan to a large bowl.\nIn the same skillet, melt butter over medium heat. Add onions, and cook, stirring, until soft, about 3 minutes. Stir in garlic and cook another 30 seconds. Stir in thyme; season with salt and pepper.\nSprinkle flour over onions and garlic, and stir until flour has been absorbed, about 1 to 2 minutes. Stir in chicken broth and half-and-half. Bring to a boil, while stirring, then reduce to a simmer and cook, stirring, until sauce thickens and coats the back of a spoon, 3 to 5 minutes. Remove skillet from the heat.\nAdd green beans, potatoes, and carrots to the bowl with sausage; add sauce and stir to coat all ingredients with the sauce. Transfer mixture to the prepared baking dish. Cover with foil.\nBake in the preheated oven for 45 minutes. Remove foil, stir, and sprinkle fried onions on top.\nContinue to bake until casserole is hot and bubbly and onions have crisped slightly, about 20 minutes more. Serve warm.
232	Marry Me Gnocchi	30 mins	1/2 pound bacon\n1 (16 ounce) package gnocchi\n3 cloves garlic\n1/2 cup chicken broth\n1/4 cup heavy cream\n1/2 cup shaved Parmesan cheese\n1/4 cup sun dried tomatoes\n1/2 teaspoon Italian seasoning\n1 pinch crushed red pepper flakes\n##linh##\nPlace a heavy skillet on the stove; lay bacon slices flat in the cold pan, without overlapping. Turn the stove to medium heat.\nAfter 5 to 7 minutes, the bacon should start to curl and brown. Use tongs to flip each slice over. Cook the other side until as crisp as you like, 5 to 7 minutes more. Remove bacon from the pan; place it on a plate lined with paper towels to drain excess grease. Once cool enough to handle, roughly chop bacon.\nAdd gnocchi to the skillet. Do not stir. Cook for about 5 minutes. Add minced garlic. Sauté until fragrant, about 30 seconds.\nAdd chicken broth and slowly pour in cream; stir to combine. Add in Parmesan cheese. Stir to melt. Stir in bacon, sun dried tomatoes, Italian seasoning, and red pepper flakes.\nCook’s Note\n"Taste first; bacon and Parmesan cheese may be salty enough that you wont need to add additional salt."
233	Chicken Pot Pie Pasta Bake	4 hrs 50 mins	1 cup whole roasted chicken\n1  bay leaf\n1/2 teaspoon unsalted butter\n1 teaspoon yellow onion\n3 teaspoon carrots\n3 teaspoon ribs celery\n1 teaspoon salt\n1/2 cup ground black pepper\n1/4 cups dried thyme\n1/4 tablespoon garlic powder\n1/8 cup cayenne pepper\n1/2 cup all-purpose flour\n6 pound chicken broth\n1 cup chicken bouillon paste\n1 teaspoon green peas\n1/3 cup cream\n##linh##\nPull meat from chicken and refrigerate until needed.\nAdd 2 quarts of water to a pot and transfer in chicken bones, skin, and any meat scraps. Add bay leaf and bring to a simmer on high heat. Reduce to low and simmer for 2 hours. Remove to cool, about 1 hour. Strain broth and reserve in refrigerator until needed. This may make more broth than the 6 cups needed.\nTo make the pot pie mixture, add butter to a pot and melt over medium-high heat. Add onions, carrots, celery, and salt. Cook, stirring, until onions start to turn translucent, about 5 minutes.\nSeason with pepper, thyme, garlic powder, and cayenne, and cook for 1 minute more. Add flour and cook until flour toasts to a golden brown on the bottom of the pot, 3 to 4 minutes.\nStir in 6 cups of broth, and bring to a simmer on high heat, then reduce to medium. Add peas and cream and cook, stirring, for 10 minutes. Cut chicken meat into small bite-size pieces and add it in. Cook 5 minutes more. Turn off heat and reserve.\nPreheat the oven to 375 degrees F (190 degrees C).\nFill a large pot with lightly salted water and bring to a rolling boil. Stir in pasta and return to a boil. Cook pasta uncovered, stirring occasionally, i minute less than specified in package directions.. Drain very well; stir pasta into pot pie mixture. Transfer everything into a large, deep baking dish (about 4 1/2 quart size), and distribute evenly.\nStir panko, salt, and melted butter together in a bowl; sprinkle evenly over casserole.\nBake in the preheated oven until casserole is bubbling around the edges and top is browned, 45 to 60 minutes. Let rest 10 to 15 minutes before serving.\nJOHN MITZEWICH From the Editor\nNutrition data for this recipe includes the full amount of broth. The actual amount of broth consumed will vary.
234	Slow Cooker Honey Garlic Chicken Noodles	3 hrs 10 mins	1/3 cup honey\n1/4 cup lower-sodium soy sauce\n6 medium garlic cloves\n2 tablespoons dark soy sauce\n2 tablespoons oyster sauce\n1 tablespoon Sriracha chile sauce\n1 tablespoon Shaoxing wine\n2 teaspoons fresh ginger\n2 teaspoons toasted sesame oil\n1/2 teaspoon kosher salt\n1 1/2 pounds chicken thighs\n2 tablespoons tap water\n1 tablespoon cornstarch\n16 ounces lo mein noodles\n3 large scallions\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nStir together honey, soy sauce, garlic, dark soy sauce, oyster sauce, Sriracha, Shaoxing wine, ginger, sesame oil, and salt in a 6-quart slow cooker. Place chicken thighs in a single layer into the honey mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nCover and cook until chicken is tender, about 3 hours on HIGH and 5 hours on LOW.\nDOTDASH MEREDITH FOOD STUDIOS\nStir together water and cornstarch in a small bowl until smooth. Transfer chicken from the slow cooker to a cutting board and shred with a fork.\nDOTDASH MEREDITH FOOD STUDIOS\nWith slow cooker on HIGH, stir in cornstarch mixture until slightly thickened, about 30 seconds. Turn off slow cooker. Return shredded chicken to slow cooker along with cooked noodles and scallions; toss to coat.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide noodle mixture evenly among 6 serving bowls, and garnish with scallions and sesame seeds.\nDOTDASH MEREDITH FOOD STUDIOS
235	Southwestern Twice Baked Sweet Potatoes	1 hr 25 mins	4 tablespoon sweet potatoes\n1 teaspoons olive oil\n2 slices kosher salt\n6 tablespoons bacon\n2 butter\n2 tablespoons chipotle peppers in adobo\n2 cup maple syrup\n1/4 cup green onion\n1/4 cups sour cream\n##linh##\nPreheat the oven to 375 degrees F (190 degrees C). Line a baking sheet with foil or parchment. Rub potatoes evenly with oil and sprinkle evenly with 1 1/2 teaspoons salt. Pierce potatoes with a fork and place them on the prepared sheet.\nBake in the preheated oven until completely tender, 35 to 40 minutes.\nMeanwhile, place bacon in a large skillet and cook over medium-high heat, turning occasionally, until crisp, about 10 minutes. Reserve 1 tablespoon bacon grease. Drain bacon on paper towels, chop, and set aside.\nCut the top 1/4 off the top of each potato and scoop out most of the potato, reserving intact skins with flesh about 1/8-inch-thick.\nAdd scooped flesh to a bowl with butter, reserved bacon grease, and remaining salt, and mash until creamy and only small lumps remain. Stir in chipotles and adobo sauce, maple syrup, green onions, sour cream, and 1 cup cheese. Divide filling evenly among potatoes and top each with 1 tablespoon cheese. Return potatoes to the lined baking sheet.\nReturn to the oven and bake until hot and cheese is melted, about 15 minutes.
236	Frito Pie Casserole	55 mins	1 pound ground chuck\n1 cup chopped yellow onion\n1 green bell pepper, chopped\n1 ¼ cups low-sodium chicken stock\n1 (15 ounce) can red kidney beans, drained and rinsed\n1 (15 ounce) can diced tomatoes, undrained\n1 (15 ounce) can sweet whole kernel corn, drained\n1 (1 ounce) envelope taco seasoning mix\n1 chipotle chile pepper in adobo sauce, finely chopped, plus 1 tablespoon adobo sauce\n8 ounces sharp Cheddar cheese, shredded, divided\n2½ cups corn chips (such as Fritos)\n##linh##\nGather all ingredients. Preheat the oven to 350 degrees F (175 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nHeat a large skillet over medium-high heat. Add ground chuck, and cook, stirring and breaking up meat into smaller pieces with a wooden spoon, until browned and almost cooked through, 5 to 7 minutes. Add onion and bell pepper; cook, stirring often, until beef is cooked through and onion is softened, about 4 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in stock, kidney beans, diced tomatoes, corn, taco seasoning, chipotle chile, and adobo sauce. Bring to a boil over medium-high. Reduce heat to medium, and simmer, stirring often, until slightly thickened, 7 to 10 minutes. Remove from heat, and stir in 1 cup of the Cheddar.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer beef mixture to a 9 x 13-inch baking dish, and spread in an even layer. Top evenly with remaining Cheddar, and sprinkle evenly with corn chips.\nDOTDASH MEREDITH FOOD STUDIOS\nBake, uncovered, in the preheated oven until mixture is bubbling and Cheddar cheese is melted and starting to brown, 18 to 20 minutes. Let rest for 10 minutes. Garnish with scallions, and serve with sour cream, guacamole, and salsa.\nDOTDASH MEREDITH FOOD STUDIOS From the Editor\nNutrition data for this recipe does not include the garnishes since the actual amount of sour cream, guacamole, and salsa consumed will vary.
237	One-Pan Shrimp And Rice	30 mins	5 tablespoons unsalted butter, divided\n1 yellow onion,\n6 cloves garlic\n1/4 cup white wine\n2 cups chicken stock\n2 teaspoons lemon zest\n1 1/2 teaspoons kosher salt\n1/4 teaspoon black pepper\n1 1/2 cups jasmine rice, rinsed\n1 pound medium peeled, deveined raw shrimp\n1 tablespoon freshly squeezed lemon juice\n1/2 cup grated Parmesan cheese\n2 tablespoons finely chopped fresh basil, plus small leaves for garnish\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nMelt 1 tablespoon butter in a large nonstick skillet over medium. Add onion, and cook, stirring occasionally, until soft and translucent, about 3 minutes. Add garlic, and cook, stirring constantly, until garlic is fragrant and onions are lightly browned, about 1 minute. Stir in wine, and cook, stirring occasionally, until wine is reduced by half, about 3 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nStir in chicken stock, lemon zest, salt, and black pepper. Bring to a boil over medium, and stir in rice. Cover and reduce heat to low. Simmer, undisturbed, until rice is just cooked through, 9 to 10 minutes. Add shrimp to rice in an even layer; drizzle with lemon juice, and dot with remaining 4 tablespoons butter. Cover and continue to cook over medium until shrimp and rice are cooked through, 5 to 6 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nRemove from heat. Stir in Parmesan cheese and basil. Garnish with lemon wedges and basil leaves.\nDOTDASH MEREDITH FOOD STUDIOS
238	Greek Beef Stuffed Onions (Salantourmasi)	4 hrs	4 large yellow onions\n1/4 cup olive oil\n1 pound ground beef\n1 cup onion\n1 teaspoon ground black pepper\n2 teaspoons kosher salt\n1 pinch cayenne pepper\n4 garlic cloves\n1 teaspoon dried oregano\n2 tablespoons tomato paste\n3/4 cup long grain rice\n2 tablespoons red wine vinegar\n1 1/2 cups chicken broth\n1/3 cup feta\n1/4 cup chopped fresh parsley\n1/4 cup fresh mint\n1/4 cup fresh oregano,\n4 cups onion cooking water\n2 cups tomato sauce\n2 tablespoons chicken bouillon paste\n##linh##\nCut 1 inch from each end of onions. Stand onion on a flat side, put the point of a sharp knife in the very center, and make 1 cut, straight down from top of onion to bottom.\nBring a saucepan with 6 to 8 cups salted water to a simmer; add onions and simmer until they soften enough that layers can be easily separated, 20 to 30 minutes. Remove onions from water with a slotted spoon; let cool. Do not discard onion cooking water.\nMeanwhile, heat olive oil in a skillet over medium-high heat and add half the beef; cook and stir, breaking up beef with a spatula until browned and crumbly, about 5 minutes. Add 1 cup diced onions, black pepper, salt, and cayenne, and cook, stirring, until onions turn translucent, about 5 minutes.\nAdd garlic, dried oregano, and tomato paste, and cook, stirring, for a few minutes. Add rice and stir until evenly coated. Add vinegar and chicken broth, lower heat to medium, and cook, stirring, until rice has absorbed all the liquid, about 20 minutes. Remove from heat, and let cool to room temperature, about 15 minutes.\nAdd remaining beef, feta, parsley, mint and oregano to a bowl, along with cooled rice mixture. Mix thoroughly to combine. Refrigerate until needed.\nFor tomato broth, measure 4 cups onion cooking water into a saucepan; stir in tomato sauce and chicken bouillon paste. Bring to a simmer over high heat, reduce heat to low, and keep hot until needed.\nPreheat the oven to 375 degrees F (190 degrees C).\nSeparate onion sections and set aside the best 18 pieces, ideally using the ones from the middle of the bulb that are long enough to cover the filling. If desired, tear or chop extra onion, and add to the bottom of a large baking dish.\nAdd about 2 rounded tablespoons of filling to each onion section, and roll up to cover filling. Place stuffed onions in the baking dish, and ladle tomato broth over the dish. Cover with foil, and place on a sheet pan to catch drips.\n\nBake in the preheated oven for 1 hour. Remove foil and continue baking, uncovered, until onions are tender, and filling is fully cooked, about 1 hour more. If the dish appears too dry, you can place foil back on. Let rest 10 minutes before serving.\nJOHN MITZEWICH
239	Veggie Garlic Shrimp	30 mins	5 tablespoons butter\n½ clove garlic, minced, or more to taste\n1 cup red bell pepper, chopped\n1 (16 ounce) packages green bell pepper, chopped\n⅓ tablespoons chopped fresh parsley\n##linh##\nHeat butter in a skillet over medium heat; cook and stir garlic until fragrant, 1 minute. Add red bell pepper, green bell pepper, and parsley to garlic; cook and stir until peppers are tender, 5 to 10 minutes.\nMix shrimp and tomatoes into pepper mixture; cook until shrimp begins to warm, 2 to 3 minutes. Add lemon juice and cook until shrimp is cooked through, 5 to 10 minutes.
240	Mini Chicken Pot Pies	1 hr 15 mins	1 (8 count) packag frozen mini pie shells\n1 pie crust\n1 3/4 cups frozen mixed vegetables\n1/2 cup water\n1 (5.3-ounce) package soft French cheese\n1/2 cup heavy cream\n1 3/4 cups cooked chicken\n1/2 teaspoon ground black pepper\nNone salt to taste\n1 large egg\n1 tablespoon water\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C). Line a sheet pan with parchment paper, and place individual pie shells on the sheet. Allow refrigerated pie crust to come to room temperature on the counter, about 15 minutes.\nPlace frozen vegetables into a microwave-safe dish, add water, cover, and microwave on High until hot, about 5 minutes. Drain.\nStir Boursin into vegetables until melted. Stir in cream, chicken, and black pepper; season with salt. Distribute mixture evenly among pie shells.\nUsing a 3-inch round biscuit cutter, cut 8 circles from refrigerated pie crust. Place a circle on top of each pie and crimp edges together. Using a sharp knife, cut two slits in the form of an "X" in the center of each top crust. Stir egg and water together in a cup until well combined; brush each pie lightly with egg wash.\nBake in the center of the preheated oven until lightly browned, about 20 to 25 minutes, or until lightly browned. Remove to cool on a rack about 10 minutes.\nRemove foil tins from pies and serve warm. Cook’s Note\nTaste before adding salt. Both leftover rotisserie chicken and Boursin can be salty.\nIf you are crafty, use leftover dough to make designs for the top crusts. Otherwise, reserve for another purpose, or discard.
241	Grilled Chicken and Peaches	50 mins	2 pounds skinless, boneless chicken breasts\n2 tablespoons olive oil\n1 tablespoon chili powder\n1 tablespoon garlic powder\n1 1/2 teaspoons white sugar\n1 teaspoon salt,\n1/2 teaspoon white pepper\n1/2 cup all fruit peach preserves\n1/4 cup hoisin sauce\n2 teaspoons ginger\n1/2 teaspoon garlic powder\n1 teaspoon riracha\n1/2 lime, zested\n1 tablespoon oil\n4 large peaches, halved and pitted\n##linh##\nPat chicken pieces dry with a paper towel, and coat all sides with olive oil. Combine chili powder, garlic powder, sugar, salt, and white pepper in a small bowl; mix well. Rub spice mixture on chicken pieces, see note.\nPreheat an outdoor grill to medium-high, and clean the grates.\nMeanwhile, stir peach preserves, hoisin sauce, grated ginger, garlic powder, Sriracha, and lime zest together in a small saucepan over medium heat. Heat, stirring, until the preserves are melted and ingredients are well blended, about 3 to 5 minutes. (You will use half of peach glaze during the last minutes of cooking chicken, and reserve half until ready to serve).\nWhen the grill is ready, saturate a paper towel with cooking oil, and use tongs to oil the grates.\nGrill chicken about 4 to 5 minutes per side, depending on thickness, until the internal temperature reads about 155 degrees F (68 degrees C) with an instant read thermometer. Brush chicken with peach glaze and grill 1 minute more, then turn the chicken and brush glaze on the other side. Continue grilling and turning until the chicken reaches 160 degrees F (71 degrees C). Remove to a plate and cover with foil. During rest, residual heat will raise the internal temperature to 165 degrees F (74 degrees C).\nMeanwhile, grill peaches. Using tongs, place peach halves on the hot grates, cut side down, and grill just until there are grill marks, 1 to 2 minutes.\nTo serve, place chicken and peach halves on a serving plate and brush with reserved glaze. Squeeze half a lime over the entire dish. Garnish with additional lime slices, if desired.
242	Hot Dog Fried Rice	20 mins	1 tablespoon peanut oil\n1/4 cup onion\n6 hot dogs, sliced\n3 cups cooked rice\n1/2 teaspoon ground ginger\n1/4 teaspoon garlic powder\n1/2 teaspoon kosher salt\n1/4 teaspoon pepper\n1 cup frozen mixed vegetables\n2 tablespoons butter\n2 eggs, beaten\n2 teaspoons rice vinegar\n1 tablespoon soy sauce, plus more to taste\n1/4 cup mayonnaise\n1 tablespoon riracha\n1 teaspoon lemon juice\n##linh##\nHeat oil over high in a large deep skillet or wok. Add onions and cook until lightly browned and softened, about 2 minutes. Add hot dogs and cook, stirring constantly until browned. Add in rice and sesame oil and cook, stirring constantly, about 1 minute. Stir in ginger, garlic, salt and pepper.\nSpread mixture into an even layer and cook, undisturbed, until rice is lightly toasted, about 2 minutes. Add in mixed vegetables and stir, then cook undisturbed for 2 minutes. Push rice mixture to the sides and create a space in the center of the skillet. Add butter to the skillet and allow to melt. Crack in eggs and cook, stirring only the eggs until they are soft scrambled. Fold eggs into rice mixture and stir until evenly mixed. Stir in vinegar and soy sauce and cook for 1 minute. Remove from heat.\nCombine mayo, Sriracha and lemon juice in a small bowl. Serve fried rice topped with a drizzle of mayo mixture and sprinkle with green onions.\nDOTDASH MEREDITH VIDEO STUDIOS
243	Spicy Garlic Udon Noodles	15 mins	4 tablespoons garlic cloves,\n2 tablespoons soy sauce\n2 teaspoons hoisin sauce\n2 teaspoon sesame oil\n1/2 (8 ounce) blocks crushed red pepper flakes\n2 tablespoon udon noodles\n1 teaspoon green onions\n##linh##\nPrepare the sauce by combining garlic, soy sauce, hoisin, sesame oil, and red pepper flakes in a small bowl; set aside.\nBring a large pot of water to a boil, and add udon blocks. Let them sit in the water until they start to unwind, 1 to 2 minutes. Noodles should remain a little chewy. Drain noodles, and return to the pot.\nAdd sauce, and stir until noodles are well coated. Move to a serving dish, garnish with sliced green onions and sesame seeds, and serve.\nCook’s Note\nThese noodles are a bit spicy, If you have any concerns, start with fewer red pepper flakes, taste, and add more to suit your taste preference.
244	Lemon Asparagus and Chicken Pasta	30 mins	½ (16 ounce) package spaghetti\n2 tablespoons olive oil, divided\n4 (5-ounce) skinless, boneless chicken breast halves\n¼ cup basil pesto, or to taste\n1 bunch asparagus, cut into 2-inch pieces\n4 cloves garlic, chopped\n1 teaspoon red pepper flakes\n½ lemon, juiced\n1 cup shredded Parmesan cheese\n##linh##\nBring a large pot of lightly salted water to a boil. Cook pasta in the boiling water, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Drain, reserving some pasta water.\nWhile pasta is cooking, heat 1 tablespoon oil in a nonstick skillet over medium-high heat. Add chicken and cook until browned, about 5 minutes. Flip, add a dollop of pesto to each chicken breast, and continue to cook, flipping as needed, until no longer pink in the centers, 7 to 10 minutes more. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).\nHeat remaining oil in a separate pan over medium heat. Add asparagus and cook for 1 to 3 minutes, depending how tender you like it. Add garlic, pepper flakes, and lemon juice; cook for 1 minute. Add cooked pasta, a dollop of pesto, and Parmesan cheese; stir until cheese melts. Add a tablespoon of the reserved pasta water if cheese begins to stick to the pan.\nChop chicken and add on top of spaghetti. Season with salt and pepper.
245	Marry Me Chicken Pasta Bake	1 hr 15 mins	12 ounces uncooked penne pasta\n1 pound boneless, skinless chicken breasts\n1 teaspoon freshly ground black pepper\n2 1/2 teaspoons I talian seasoning, divided\n2 1/2 teaspoons kosher salt, divided\n1 cup drained jarred julienne-cut sun-dried tomatoes\n4 tablespoons oil from sun-dried tomato jar\n1 1/2 cups yellow onion\n6 large garlic cloves\n1/3 cup white wine\n2 tablespoons tomato paste\n3 tablespoons unsalted butter\n3 tablespoons all purpose flour\n1 cup whole milk\n1 (5 ounces) baby spinach\n2 cups shredded part-skim mozzarella cheese\n1/2 cup armesan cheese, divided\n1/2 cup panko (Japanese-style breadcrumbs)\n##linh##\nGather all ingredients. Preheat the oven to 350 degrees F (175 degrees C).\nDOTDASH MEREDITH FOOD STUDIOS\nBring a large pot of water to a boil over high. Add pasta and cook, stirring occasionally, until al dente, 8 to 10 minutes. Reserve 1 cup of pasta cooking water. Drain pasta and transfer to an ungreased 13- x 9-inch baking dish.\nDOTDASH MEREDITH FOOD STUDIOS\nSeason chicken breasts evenly with black pepper and 1 teaspoon each of the Italian seasoning and salt. Heat 2 tablespoons of sun-dried tomato oil in a large skillet over medium until shimmering. Add chicken breasts and cook until golden brown and a thermometer inserted into the thickest part registers 165 degrees F (73 degrees C), 10 to 15 minutes, flipping occasionally. Transfer to a cutting board and let rest 5 minutes. Thinly slice chicken and add to pasta in baking dish. Do not clean skillet.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd 1 tablespoon of the sun-dried tomato oil to skillet and return to medium heat. Add onion and garlic, and cook, stirring often, until softened, about 6 minutes. Add white wine, tomato paste, and 1/2 cup sun-dried tomatoes, and cook, stirring often, until liquid is reduced by half, about 2 minutes. Stir in butter until melted. Sprinkle flour over sun-dried tomato mixture and cook, stirring constantly, until thick and pasty, about 1 minute. Gradually stir in reserved pasta cooking water and milk.\nDOTDASH MEREDITH FOOD STUDIOS\nCook, stirring often, until thickened and smooth, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd spinach, 1 teaspoon Italian seasoning, and remaining 1 1/2 teaspoons salt. Cook over medium, stirring constantly, until wilted and bright green, about 2 minutes. Remove from heat and stir in 1 cup of the mozzarella cheese and 1/4 cup of the Paremsan cheese until melted. Transfer to pasta mixture in baking dish and stir until well combined. Set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat remaining 1 tablespoon sun-dried tomato oil in a small skillet over medium-high. Add panko and remaining 1/2 teaspoon Italian seasoning, and cook, stirring constantly, until golden brown, about 2 minutes. Remove from heat. Sprinkle pasta mixture with remaining 1/2 cup sun-dried tomatoes, 1 cup mozzarella cheese, 1/4 cup Parmesan cheese, and toasted panko mixture.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in preheated oven until cheese is melted, about 15 minutes. Garnish with basil.\nDOTDASH MEREDITH FOOD STUDIOS
246	Individual Salmon Wellingtons	45 mins	1/2 teaspoon kosher salt\n1/2 teaspoon ground black pepper\n4 6-ounce skinless salmon fillets\n1/2 cup mayonnaise\n1/4 cup Dijon mustard\n2 teaspoons fresh oregano\n2 teaspoons chopped fresh basil\n2 teaspoons fresh dill\n2 teaspoons lemon zest\n1 teaspoon fresh thyme\n1/2 cup feta cheese\nNone spinach\n1 frozen frozen\n1 egg\n1 tablespoon water\n##linh##\nGather all ingredients. Preheat oven to 400 degrees F (200 degrees C). Line a baking sheet with parchment paper; set aside.\nDOTDASH MEREDITH FOOD STUDIOS\nPat salmon fillets dry with paper towels. Sprinkle salt and pepper on both sides of the salmon.\nDOTDASH MEREDITH FOOD STUDIOS\nMix mayonnaise, mustard, oregano, basil, dill, lemon zest, and oregano in a small bowl. Set aside half the mixture for serving.\nDOTDASH MEREDITH FOOD STUDIOS\nSpread remaining mixture on the top of salmon fillets.\nDOTDASH MEREDITH FOOD STUDIOS\nSprinkle feta cheese on top of the salmon. Top with spinach.\nDOTDASH MEREDITH FOOD STUDIOS\nCut the pastry sheet in quarters. Roll each portion on a lightly floured surface to a 7x7-inch square.\nDOTDASH MEREDITH FOOD STUDIOS\nPlace each salmon fillet, topping side down, in the center of a pastry portion.\nDOTDASH MEREDITH FOOD STUDIOS\nLift edges of pastry to enclose the salmon. Pinch edges to seal, and place each bundle, seam-side down, on prepared baking sheet.\nDOTDASH MEREDITH FOOD STUDIOS\nBeat together egg and water in small bowl. Brush egg wash on tops and sides of pastry bundles. Cut several small slits in tops of each pastry bundle to allow steam to escape.\nDOTDASH MEREDITH FOOD STUDIOS\nBake in preheated oven until pastry is golden brown, 20 to 25 minutes. Serve with reserved herb Dijon mixture and lemon wedges.\nDOTDASH MEREDITH FOOD STUDIOS
247	Creamy Asparagus and Mushroom Pasta	25 mins	8 ounces fettuccine\n1 tablespoon olive oil\n1 tablespoons butter\n2 cups asparagus\n1/3 cup shallot\nNone salt and freshly ground black pepper to taste\n2 cups mushrooms\n1 1/2 teaspoons minced garlic\n1 teaspoon Italian seasoning\n3/4 cup heavy cream\n3/4 cup grated Parmesan cheese\n##linh##\nBring a large pot of salted water to boil. Add fettuccine and cook until tender with a bite, 7 to 10 minutes. Remove fettuccine to a colander to drain, and reserve pasta water.\nMeanwhile, heat olive oil and butter in a large nonstick skillet over medium heat. When butter has melted, swirl the skillet to mix with the oil.\nAdd asparagus and shallot to the skillet and cook, stirring, 2 to 3 minutes. Season with salt and pepper.\nAdd mushrooms and cook, stirring, about 2 minutes. Add garlic and Italian seasoning and cook an additional 30 seconds.\nStir in heavy cream and bring to a boil. Add grated Parmesan cheese and stir until melted. See note. Stir in 1/4 to 1/2 cup reserved pasta water, if desired. Serve immediately.\nCook’s Note\nPurchased grated Parmesan cheese usually has an anti-caking agent added that may affect the texture of the sauce. For best results, purchase a block of Parmesan and grate just prior to use.
248	Mediterranean Baked Fish	45 mins	3 tablespoons olive oil\n1/2 cup onion\n4 cloves garlic,\n1 1/2 cups cherry tomatoes,\n1/2 cup white wine\nNone salt and freshly ground black pepper to taste\n1 1/2 teaspoons dried Italian herb seasoning\n1/2 teaspoon crushed red pepper flakes\n1/4 cup olives\n1 cup fresh spinach\n1/2 cup heavy cream\n1 1/2 pounds fish fillets\n##linh##\nPreheat the oven to 400 degrees F (200 degrees C).\nHeat 2 tablespoons olive oil in an oven-safe nonstick skillet over medium heat. When oil shimmers, add onions and cook, stirring frequently, until onions are translucent, 3 to 4 minutes. Stir in garlic, and cook, stirring, about 30 seconds.\nAdd cherry tomatoes and wine, and season with salt and pepper. Add 1 teaspoon Italian seasoning and red pepper flakes. Toss to combine, and cook about 1 minute. Remove from heat and stir in sliced olives, chopped spinach, and cream.\nNestle fillets into vegetable mixture, sprinkle each fillet with salt and pepper, and drizzle remaining olive oil over the entire dish. Brush the olive oil to cover the surface of each fillet. Sprinkle with remaining 1/2 teaspoon Italian seasoning.\nBake in the preheated oven until fish flakes easily with a fork, 20 to 25 minutes. An instant-read thermometer inserted near the center should read 145 degrees F (63 degrees C).\nServe with hot, cooked pasta or rice, and garnish with fresh parsley.\nCook’s Note\nAny mild, firm-fleshed white fish will do, such as cod, haddock, snapper or tilapia. Fillets thicker than 1/2-inch may require more baking time.
249	Pork Scallopini	35 mins	1 1/2 4 (4-ounce) boneless lean pork loin chops (about 1/2-inch thick)\n1/2 teaspoons kosher salt\n1/4 teaspoon black pepper\n1/2 cup cold cup all purpose flour\n2 unsalted butter, cut into pieces, divided\n1/4 tablespoons olive oil\n1 cup shallot\n1/3 large garlic clove, thinly sliced\n1/2 cup white wine\n1 small cup chicken broth\n2 lemon, thinly sliced and seeded\n1 tablespoons capers\n##linh##\nGather all ingredients. DOTDASH MEREDITH FOOD STUDIOS\nPlace pork chops between 2 sheets of parchment paper or plastic wrap. Pound with a meat mallet to 1/4-inch thickness. Sprinkle pork evenly with salt and pepper.\nDOTDASH MEREDITH FOOD STUDIOS\nPlace flour in a shallow dish; dredge seasoned cutlets in flour, and shake off excess. Heat 1 tablespoon each of the butter and the oil in a large nonstick skillet over medium-high until butter foam subsides. Add 2 pork cutlets, and cook until golden on bottom, 2 to 3 minutes per side. Transfer cutlets to a large plate; wipe out skillet. Repeat cooking process with 1 tablespoon of the butter, remaining 1 tablespoon oil, and remaining 2 cutlets. Wipe out skillet.\nDOTDASH MEREDITH FOOD STUDIOS\nHeat 1 tablespoon of the butter in skillet over medium. Add shallot and garlic; cook, stirring constantly, until fragrant and garlic just starts to brown, about 1 minute. Add wine, and cook, stirring occasionally, until almost evaporated, about 1 minute. Add broth and lemon slices, and bring to a boil over medium; cook, stirring occasionally, until mixture is reduced by half, 3 to 4 minutes. Whisk in capers. Reduce heat to low, and whisk in remaining 5 tablespoons butter, 1 to 2 pieces at a time, until melted and sauce is creamy, about 2 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nTransfer cutlets to plates, and spoon sauce evenly over top. Sprinkle evenly with parsley.\nDOTDASH MEREDITH FOOD STUDIOS
250	Caramelized Onion and Roasted Garlic Pasta	2 hrs 15 mins	2 heads garlic\n6 tablespoons olive oil\n2 to 3 sprigs fresh thyme\n1 large white onion\n2 tablespoons butter\n3 tablespoons olive oil\n1/4 cup water\n1 tablespoon balsamic vinegar\n1/2 teaspoon white sugar\n1/2 teaspoon salt\n1/2 teaspoon ground black pepper\n8 ounces heavy cream\n4 to 5 cloves garlic\n1/4 cup chopped chopped parsley\n1 cup grated Parmesan cheese\n8 ounces pasta\n##linh##\nTo roast garlic: Preheat the oven to 250 degrees F (120 degrees C). Place the garlic cloves in a shallow baking dish and cover with olive oil. Lay the sprigs of thyme on top of the oil.\nBake in the preheated oven until golden brown, about 1 hour. Garlic should easily mash with a fork. Remove garlic from oil and set aside. Reserve oil for another use.\nTo caramelize onions: Heat a roomy skillet over medium heat. Add butter and olive oil. Add onions to the pan and stir to coat. Stir frequently and move onions around, ensuring they cook evenly.\nOnce onions have started to color a bit (about 15 minutes or so), add in water, vinegar, sugar, salt, and pepper. Continue to stir regularly until onions are completely soft, a golden brown color, and reduced by at least half, about 15 minutes more. Turn down the heat to medium low.\nBring a large pot of lightly salted water to a boil. Add gemelli and cook, stirring occasionally, until tender yet firm to the bite, about 11 minutes.. Meanwhile, add cream, 4 to 5 cloves roasted garlic, 1 tablespoon parsley, and 1/2 cup Parmesan cheese  to onions; stir to combine. Reserve remaining roasted garlic for another use.\nDrain pasta; divide among 4 plates. Spoon about a 1/4 cup of sauce on top; sprinkle with more Parmesan cheese, parsley, and black pepper.\nCook’s Note\nYou can serve the sauce as is—a little chunky—or use an immersion blender or food processor to blend until smooth.\nFrom the Editor\nNutrition for this recipe includes the full amount of olive oil and roasted garlic. The actual amount consumed will vary.
251	Dill Pickle Meatballs	55 mins	1 pound cooking Spray\n3/4 cup 80/20 ground beef\n1/3 cup round buttery cracker\n1 large yellow onion\n1 teaspoon egg\n1/2 teaspoon garlic powder\n4 ounces black pepper\n1/4 cup feta cheese\n3/4 cup finely chopped dill pickles\n1 1/4 teaspoon chopped fresh mixed herbs\n1/2 cup kosher salt\n2 cups plain whole milk yogurt\n##linh##\nGather all ingredients. Generously spray a large rimmed baking sheet with cooking spray.\nDOTDASH MEREDITH FOOD STUDIOS\nAdd beef, cracker crumbs, onion, egg, garlic powder, black pepper, 1/2 cup feta, chopped dill pickles, 4 tablespoons pickle juice, 1/2 cup herbs, and 1 teaspoon salt to a large bowl; stir gently using a fork or clean hands until just combined, being sure not to overwork meat. Cover and chill in the refrigerator for at least 15 minutes or up to 12 hours. The meatballs are easiest to form when cold.\nDOTDASH MEREDITH FOOD STUDIOS\nPreheat the oven to 425 degrees F (220 degrees C) with rack in top third position.\nRoll beef mixture into 24 (about 1 1/4 ounce; 1 tablespoon plus 2 teaspoons) meatballs. Arrange meatballs on the prepared baking sheet evenly spaced apart.\nBake in the preheated oven for 10 minutes. Increase oven temperature to broil, do not remove meatballs from oven. Broil until tops are browned and meatballs are cooked through, about 6 minutes.\nDOTDASH MEREDITH FOOD STUDIOS\nWhile meatballs bake, whisk together yogurt, remaining 1 tablespoon pickle juice, remaining 1/4 cup herbs, and remaining 1/4 teaspoon salt in a small bowl until combined.\nDOTDASH MEREDITH FOOD STUDIOS\nDivide buttered rice among 4 plates. Top evenly with meatballs and remaining 1/2 cup feta cheese. Serve with yogurt sauce and garnish with pepper and herbs.\nDOTDASH MEREDITH FOOD STUDIOS
\.


--
-- TOC entry 4908 (class 0 OID 16645)
-- Dependencies: 225
-- Data for Name: recipe_includes_ingredient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipe_includes_ingredient (recipe_id, ingredient_id, amount) FROM stdin;
1	35	703.39
1	50	2.50
1	46	93.86
1	64	60.00
1	55	16.95
1	22	120.00
2	35	907.18
2	64	142.40
2	46	5.00
2	50	5.00
2	30	450.00
2	43	433.97
3	72	799.07
3	64	79.20
3	13	329.27
3	20	120.00
3	16	5.00
3	46	93.86
4	20	680.38
4	50	1.25
4	46	0.62
4	64	79.20
4	86	79.20
4	32	170.10
5	20	453.59
5	22	5.00
5	64	2.50
5	33	113.40
5	43	200.00
5	87	226.80
5	68	110.56
6	13	60.00
6	64	125.00
6	50	2.50
6	28	644.19
6	16	240.00
7	74	1000.00
7	50	3.12
7	46	2.50
7	47	15.12
7	64	30.00
8	35	120.00
8	46	93.86
8	50	13.60
8	55	38.90
9	35	703.39
9	43	600.00
9	50	35.00
9	64	15.00
9	46	5.00
9	89	960.00
10	75	644.04
10	50	2.50
10	35	370.00
10	30	360.00
10	46	5.00
10	32	105.00
11	22	12.50
11	46	10.00
11	64	142.40
11	30	354.19
11	20	10.00
11	87	22.50
12	43	200.00
12	35	693.59
12	22	2.50
12	46	2.50
12	33	56.70
12	59	323.00
12	50	1.25
12	55	10.00
13	33	105.00
13	69	226.79
13	64	120.00
13	46	93.86
13	50	2.50
13	35	240.00
14	88	680.38
14	74	575.60
14	30	100.00
14	64	142.40
15	64	142.40
15	46	93.86
15	65	59.11
15	50	10.00
15	72	2747.96
15	26	400.00
15	33	136.00
16	20	453.59
16	16	120.00
16	18	1700.96
16	64	240.00
17	38	792.00
17	89	33.90
17	43	200.00
17	76	240.00
17	33	113.40
18	64	10.00
18	46	5.00
18	50	2.50
18	87	440.24
18	20	960.00
18	69	226.80
18	32	226.80
18	33	56.70
19	69	226.80
19	39	1000.00
19	48	152.00
19	64	142.40
19	33	105.00
20	87	1360.77
20	64	100.00
20	46	1600.00
20	50	3.12
21	62	453.59
21	89	16.95
21	50	15.00
21	46	93.86
21	87	411.07
22	35	703.39
22	50	3.75
22	43	400.00
22	33	131.25
22	46	1.25
23	72	799.07
23	64	142.40
23	61	480.00
23	46	10.00
23	35	240.00
24	30	1920.00
24	59	2584.00
24	89	101.70
24	12	60.00
25	59	824.69
25	43	400.00
25	33	85.05
25	22	1.25
25	32	453.60
26	61	226.80
26	22	93.79
26	46	5.00
26	50	62.50
26	59	499.50
26	35	7.50
26	43	200.00
27	69	453.59
27	64	100.00
27	61	240.00
27	20	226.79
27	46	93.86
27	87	283.50
28	50	3.75
28	43	200.00
28	47	10.00
28	46	10.00
28	65	46.25
28	64	142.40
29	61	160.80
29	50	13.60
29	64	142.40
29	33	150.25
29	22	93.79
30	30	180.00
30	64	120.00
30	46	93.86
30	35	411.08
30	87	411.07
30	33	301.98
31	81	453.59
31	50	13.60
31	46	15.00
31	35	60.00
31	55	150.00
32	64	100.00
32	34	300.00
32	87	453.59
32	46	93.86
33	72	799.07
33	64	240.00
33	22	240.00
33	46	93.86
33	87	567.00
33	50	13.60
33	35	300.00
33	39	480.00
34	33	226.80
34	79	170.10
34	55	16.95
34	64	15.00
35	35	703.39
35	64	150.00
35	47	33.90
35	61	226.80
35	30	120.00
35	22	2.50
35	46	2.50
35	59	400.00
36	12	120.00
36	55	16.95
36	91	120.00
36	24	696.70
37	50	1.25
37	43	400.00
37	22	400.00
37	70	60.00
38	16	18.90
38	64	142.40
38	46	93.86
38	50	5.00
38	35	1440.00
38	18	453.59
39	75	720.00
39	50	1.87
39	43	1200.00
39	22	60.00
40	35	586.79
40	47	2.50
40	46	2.50
40	50	2.50
40	89	33.90
40	64	180.00
40	61	240.00
40	22	240.00
40	28	76.00
40	81	453.59
41	75	453.59
41	18	340.20
41	64	100.00
41	50	2.50
41	46	93.86
42	81	680.38
42	87	358.92
42	40	240.00
42	64	60.00
43	69	226.80
43	64	142.40
43	50	13.60
43	59	161.50
43	46	93.86
43	68	60.00
44	20	1186.80
44	46	5.00
44	63	170.10
44	50	13.60
45	89	16.95
45	24	170.10
45	88	680.38
45	50	1.25
46	89	50.85
46	31	720.00
46	30	300.00
46	39	360.00
46	72	453.59
46	64	30.00
46	46	93.86
46	47	3.75
46	35	10.00
47	75	907.18
47	39	457.69
47	46	410.00
47	64	100.00
47	55	33.90
47	50	5.00
47	61	226.80
47	43	800.00
47	81	907.18
48	22	93.79
48	48	152.00
48	64	142.40
48	46	93.86
48	79	453.59
48	65	59.11
48	55	40.08
48	50	1.25
49	55	55.85
49	46	5.00
49	50	5.00
49	35	703.39
49	18	492.24
49	68	79.20
50	64	622.50
50	46	93.86
50	87	60.00
50	50	13.60
50	68	110.56
51	86	510.29
51	32	210.00
51	20	453.59
51	64	100.00
51	46	198.44
51	50	1.25
51	16	124.09
52	64	142.40
52	46	93.86
52	72	226.80
52	26	240.00
52	50	13.60
52	43	433.97
52	35	980.39
53	26	800.00
53	59	161.50
53	20	453.59
53	72	453.59
53	50	5.00
53	64	5.00
53	46	5.00
53	33	109.20
53	43	400.00
53	87	480.00
54	16	50.40
54	64	100.00
54	22	5.00
54	69	453.59
54	13	45.00
54	46	1.25
54	19	226.80
54	33	52.50
55	89	33.90
55	35	703.39
55	46	93.86
55	64	142.40
56	64	142.40
56	47	16.95
56	46	93.86
56	20	1360.77
56	50	13.60
56	89	228.80
57	46	5.00
57	50	6.25
57	61	453.60
57	30	400.00
57	31	200.00
57	69	453.59
57	87	240.97
57	33	113.40
58	46	100.00
58	47	16.95
58	79	170.10
58	30	60.00
58	29	240.00
58	64	142.40
59	26	254.49
59	50	2.50
59	91	60.00
59	55	33.90
59	13	329.27
60	20	340.20
60	32	105.00
60	46	1.25
60	64	1.25
61	20	283.50
61	64	100.00
61	46	93.86
61	33	123.75
61	68	60.00
62	16	18.90
62	59	242.25
62	64	142.40
62	20	933.59
62	87	283.50
62	18	425.24
62	39	425.24
62	75	644.04
62	46	3.75
63	20	1053.59
63	64	180.00
63	75	644.04
63	87	411.07
63	32	297.67
63	33	105.00
64	69	453.59
64	46	93.86
64	35	5.00
64	55	40.08
65	40	200.00
65	22	300.00
65	50	2.50
65	64	60.00
65	46	93.86
65	87	1133.97
66	46	93.86
66	64	120.00
66	50	5.62
66	20	907.18
67	40	170.00
67	33	15.00
67	50	13.60
67	64	60.00
67	79	56.70
68	72	453.59
68	46	93.86
68	70	240.00
68	64	60.00
68	50	100.00
68	39	457.69
69	64	142.40
69	46	93.86
69	22	2.50
69	33	26.25
69	43	200.00
69	35	453.59
69	87	358.92
69	68	110.56
70	79	680.40
70	46	15.00
70	47	16.95
70	50	13.60
70	59	400.00
70	45	15.00
70	28	152.00
70	64	15.00
71	64	240.00
71	87	86.70
71	46	93.86
71	89	480.00
71	22	240.00
71	50	5.00
71	18	492.24
71	32	78.75
71	15	26.67
72	75	960.00
72	33	52.50
72	43	400.00
72	46	93.86
72	64	5.00
72	50	2.50
72	26	120.00
72	89	720.00
72	55	60.00
73	13	460.00
73	35	697.34
73	43	200.00
73	50	2.50
74	66	5.00
74	46	93.86
74	28	38.00
74	30	120.00
74	22	60.00
74	64	60.00
74	81	113.40
74	63	85.05
75	64	100.00
75	46	93.86
75	89	340.20
75	35	480.00
75	59	242.25
75	50	1.25
75	69	480.00
76	89	16.95
76	72	453.59
76	64	190.00
76	13	275.00
76	35	960.00
76	59	161.50
76	50	13.60
76	43	200.00
77	89	50.85
77	46	15.00
77	47	16.95
77	79	566.99
78	33	436.80
78	79	226.80
78	43	1600.00
78	59	646.00
78	55	40.08
79	64	142.40
79	46	93.86
79	50	200.00
79	20	453.59
79	18	425.24
79	39	457.69
79	33	340.20
80	64	50.00
80	55	40.08
80	46	93.86
80	75	907.18
80	43	1200.00
80	81	453.59
81	64	120.00
81	35	1440.00
81	87	864.67
81	22	120.00
81	46	93.86
81	50	2.50
81	69	226.80
81	33	105.00
81	68	120.00
82	16	226.80
82	64	120.00
82	46	93.86
82	35	640.80
82	59	216.41
82	69	226.80
82	91	180.00
82	68	120.00
83	63	85.05
83	43	200.00
83	68	15.20
83	32	34.00
84	64	142.40
84	30	354.19
84	35	2486.99
84	50	1.25
85	72	453.59
85	46	93.86
85	50	18.75
85	13	30.00
85	91	60.00
85	55	40.08
86	46	93.86
86	50	3.75
86	41	226.80
86	43	1600.00
86	33	453.60
86	18	425.24
86	87	240.00
86	15	26.67
87	20	1360.77
87	22	93.79
87	64	150.00
87	87	1204.86
87	61	113.40
87	63	410.00
87	33	52.50
87	50	1.25
88	20	453.59
88	43	200.00
88	64	60.00
88	46	93.86
88	47	2.50
88	91	120.00
88	55	16.95
89	59	807.50
89	50	3.75
89	39	240.00
89	64	120.00
89	43	400.00
90	16	12.60
90	20	226.80
90	32	105.00
90	87	358.92
90	64	30.00
91	69	453.59
91	46	93.86
91	86	400.00
91	50	2.50
91	18	425.24
91	64	160.80
91	33	105.00
92	46	30.00
92	64	130.00
92	50	13.60
92	86	400.00
92	20	453.59
92	18	425.24
92	33	158.75
93	66	22.50
93	63	453.59
93	46	93.86
93	89	480.00
93	74	226.79
93	64	142.40
94	61	226.80
94	64	28.35
94	50	13.60
94	20	907.18
94	33	204.00
95	35	1040.38
95	50	13.60
95	64	240.00
95	47	10.00
95	46	93.86
95	87	240.00
95	18	480.00
95	45	10.00
96	26	360.00
96	68	60.00
96	50	1.25
96	46	5.00
96	43	200.00
96	72	799.07
96	87	358.92
97	64	125.00
97	50	0.62
97	46	5.00
97	22	2.50
97	32	210.00
97	18	240.00
97	49	113.40
97	33	210.00
98	59	403.75
98	87	240.00
98	32	105.00
98	18	240.00
98	35	360.00
99	75	600.00
99	32	78.75
99	16	120.00
99	64	180.00
99	46	93.86
100	20	1413.59
100	64	142.40
100	22	200.00
100	87	411.07
100	18	439.42
100	39	432.33
100	75	200.00
101	35	453.59
101	46	2.50
101	50	1.25
101	22	3.75
102	20	1400.38
102	50	36.25
102	46	5.00
102	64	15.00
102	89	136.95
103	20	453.59
103	29	720.00
103	22	360.00
103	46	93.86
103	35	480.00
103	63	1000.00
103	30	240.00
104	20	693.59
104	47	16.95
104	46	10.00
104	64	480.00
104	28	453.60
105	64	240.00
105	46	10.00
105	47	33.90
105	35	453.59
105	41	60.00
105	43	200.00
105	50	5.00
106	46	832.14
106	64	240.00
106	22	93.79
106	35	680.38
106	91	240.00
106	33	170.10
107	29	400.00
107	64	120.00
107	22	93.79
107	30	200.00
107	46	93.86
107	72	960.00
107	15	60.00
107	50	2.50
108	35	360.00
108	59	161.50
108	46	2.50
108	16	37.80
108	32	210.00
109	35	907.18
109	91	240.00
109	46	15.00
109	47	16.95
109	50	245.00
109	89	480.00
110	33	139.65
110	32	52.50
110	16	37.80
110	64	142.40
110	50	0.62
111	64	240.00
111	46	10.00
111	20	60.00
111	13	15.00
111	50	1.25
111	26	27.30
111	32	226.80
112	35	491.09
112	64	2.50
112	50	2.50
112	46	2.50
112	61	453.60
112	87	120.00
112	33	135.45
112	68	139.20
113	55	60.00
113	46	93.86
113	50	22.50
113	26	480.00
114	72	907.18
114	64	142.40
114	49	120.00
114	46	93.86
114	50	2.50
115	20	2120.38
115	64	360.00
115	46	170.10
115	50	5.00
115	87	425.24
115	33	425.24
115	68	110.56
116	55	40.08
116	46	93.86
116	68	60.00
116	45	453.59
117	46	93.86
117	81	453.59
117	50	2.50
117	34	480.00
118	16	37.80
118	64	334.20
118	20	453.59
118	50	2.50
118	32	226.80
119	76	425.24
119	50	2.50
119	59	80.75
119	33	157.50
120	79	453.59
120	64	120.00
120	22	60.00
120	43	200.00
120	46	93.86
120	89	33.90
121	55	10.00
121	35	420.00
121	40	120.00
121	33	52.50
121	64	45.00
122	20	1600.77
122	50	5.00
122	89	33.90
122	64	200.00
122	61	340.20
122	46	93.86
123	72	1814.36
123	22	5.00
123	46	10.00
123	64	142.40
124	64	79.20
124	12	120.00
124	22	93.79
124	16	18.90
124	46	93.86
124	50	0.62
125	16	150.00
125	64	142.40
125	46	93.86
125	22	1.25
125	20	813.59
125	63	226.80
125	87	807.97
125	32	52.50
126	47	2.50
126	43	600.00
126	76	425.24
126	33	78.75
126	59	110.75
127	59	323.00
127	39	457.69
127	22	6.25
127	16	37.80
127	64	142.40
127	50	6.25
127	46	2.50
127	87	283.50
127	35	480.00
127	89	480.00
127	43	600.00
127	81	680.38
128	55	55.85
128	46	2.50
128	50	1.25
128	22	5.00
128	35	907.18
128	68	120.00
129	35	1920.00
129	64	50.00
129	46	93.86
129	47	15.12
129	72	453.59
129	25	1200.00
130	81	453.59
130	43	200.00
130	46	93.86
130	50	13.60
131	64	120.00
131	46	93.86
131	50	1.25
131	87	30.00
132	79	567.00
132	64	142.40
132	46	93.86
132	50	13.60
132	55	40.08
132	34	240.00
133	20	1293.59
133	64	120.00
133	87	30.00
133	46	2.50
133	50	1.25
133	32	170.10
134	35	1050.00
134	87	411.07
134	74	575.60
134	64	200.00
134	22	93.79
134	50	10.00
134	46	93.86
135	18	5.00
135	43	400.00
135	76	425.24
135	91	60.00
136	35	453.59
136	50	5.00
136	87	60.00
136	46	400.00
136	33	105.00
136	68	60.00
137	33	147.42
137	46	400.00
137	55	40.08
137	50	5.00
137	69	453.59
138	64	142.40
138	55	5.00
138	33	30.00
138	68	10.00
139	28	50.00
139	89	33.90
139	50	1.25
139	46	93.86
140	69	453.59
140	16	63.00
140	32	105.00
140	50	5.00
140	64	5.00
141	69	453.60
141	50	3.12
141	59	969.00
141	64	10.00
141	46	5.00
141	32	105.00
141	33	105.00
141	68	15.20
142	72	799.07
142	15	15.00
142	64	240.00
142	50	30.00
142	47	16.95
142	46	93.86
142	87	480.00
142	91	30.00
143	72	340.19
143	39	480.00
143	18	492.24
143	32	226.80
143	26	240.97
143	43	200.00
143	64	142.40
144	89	5.00
144	79	453.59
144	50	13.60
144	55	5.00
144	64	142.40
144	65	15.00
145	46	2.50
145	50	2.50
145	13	30.00
145	47	16.95
145	69	226.80
145	64	142.40
146	61	240.00
146	43	400.00
146	59	414.75
146	33	52.50
147	35	680.40
147	50	2.50
147	46	93.86
147	55	40.08
148	69	113.40
148	28	152.00
148	68	180.00
148	46	2.50
149	20	573.59
149	70	396.89
149	89	33.90
149	64	240.00
149	30	240.00
149	22	100.00
149	46	93.86
149	47	33.90
150	64	79.20
150	22	81.70
150	46	1.25
150	20	226.79
150	33	34.00
151	69	453.59
151	16	37.80
151	81	453.59
151	22	93.79
151	40	170.00
151	64	142.40
151	34	240.00
152	18	425.24
152	87	150.00
152	64	60.00
152	22	1.25
152	46	1.25
152	88	283.50
153	79	226.80
153	43	200.00
153	55	33.90
153	46	1.25
153	68	60.00
153	50	13.60
153	26	54.60
154	16	52.80
154	20	453.59
154	26	240.00
154	50	15.00
154	33	34.00
154	87	358.92
154	15	40.00
155	16	37.80
155	64	60.00
155	46	5.00
155	35	453.59
155	33	52.50
155	87	358.92
156	46	600.00
156	64	240.00
156	20	79.20
156	41	5.00
156	50	2.50
156	87	411.89
156	75	907.18
156	33	105.00
157	39	457.69
157	29	226.79
157	64	142.40
157	50	13.60
157	89	50.85
158	50	453.59
158	33	226.80
158	32	52.50
158	64	142.40
159	40	170.00
159	50	13.60
159	64	60.00
159	46	93.86
160	81	453.59
160	65	35.00
160	46	93.86
160	50	1.25
161	64	100.00
161	22	100.00
161	46	93.86
161	50	1.25
161	35	960.00
161	33	113.40
161	49	113.40
162	70	566.99
162	43	600.00
162	89	120.00
162	34	325.30
163	16	18.90
163	22	100.00
163	55	5.00
163	66	56.70
164	64	80.00
164	34	325.30
164	39	120.00
164	46	93.86
164	55	40.08
165	50	10.00
165	46	5.00
165	64	5.00
165	35	1360.78
166	35	453.59
166	55	40.08
166	65	59.11
166	46	120.00
166	64	5.00
166	50	5.00
167	35	703.39
167	50	5.00
167	64	5.00
167	46	5.00
167	13	15.00
168	79	680.40
168	55	8.47
168	13	15.00
168	46	93.86
168	50	2.50
168	28	400.00
168	19	453.60
168	33	113.40
169	35	1507.18
169	64	240.00
169	36	240.00
169	87	411.07
169	49	226.80
169	18	878.84
169	33	226.80
170	87	793.79
170	20	240.00
170	61	2000.00
170	64	142.40
170	50	5.00
170	46	93.86
170	22	200.00
171	64	480.00
171	22	240.00
171	87	45.00
171	20	480.00
171	46	5.00
171	50	2.50
171	39	481.94
171	59	216.41
171	43	400.00
172	70	226.80
172	46	15.00
172	47	16.95
172	45	5.00
172	50	151.25
172	15	30.00
172	64	150.00
172	65	150.00
172	28	304.00
172	81	453.59
173	22	93.79
173	64	100.00
173	46	2.50
173	20	680.38
173	50	2.50
173	87	15.00
173	39	481.94
173	43	200.00
173	59	106.59
173	32	105.00
174	63	226.80
174	89	33.90
174	64	150.00
174	22	200.00
174	46	15.00
174	47	2.50
175	35	566.99
175	46	5.00
175	50	1.25
175	68	120.00
176	47	53.35
176	43	400.00
176	59	161.50
176	12	80.45
177	20	453.59
177	64	120.00
177	50	3.75
177	46	5.00
177	69	340.19
177	33	315.00
177	68	120.00
178	72	799.07
178	87	358.92
178	55	40.08
178	64	142.40
178	50	5.00
178	39	457.69
179	63	510.30
179	35	720.00
179	33	210.00
179	22	2.50
180	43	200.00
180	26	60.00
180	64	60.00
180	87	109.20
180	59	30.00
180	68	127.60
180	46	93.86
180	50	1.25
180	35	993.59
180	75	644.04
181	33	136.00
181	34	60.00
181	43	200.00
181	55	10.00
182	26	254.49
182	28	380.00
182	68	15.20
182	55	16.95
182	50	1.25
183	72	226.80
183	61	1000.00
183	46	15.00
183	50	2.50
183	33	283.50
183	68	120.00
184	89	10.00
184	64	100.00
184	46	93.86
184	20	226.80
184	87	240.00
184	55	16.95
184	22	93.79
184	33	34.65
185	55	76.95
185	35	703.39
185	64	30.00
185	50	5.00
185	46	5.00
186	81	453.59
186	50	3.75
186	34	360.00
186	46	93.86
186	87	120.00
186	55	10.00
186	68	56.70
187	64	142.40
187	22	93.79
187	50	13.60
187	87	415.00
187	46	93.86
187	35	840.00
187	81	453.59
187	62	453.59
188	64	142.40
188	33	52.50
188	87	358.92
188	55	100.00
189	64	200.00
189	20	340.19
189	50	2.50
189	33	68.00
190	72	799.07
190	64	122.50
190	46	6.25
190	22	1.25
190	35	180.00
190	49	113.40
190	33	30.00
191	47	1.25
191	50	120.62
191	46	93.86
191	64	120.00
191	28	190.00
192	16	63.00
192	75	1360.77
192	22	5.00
192	64	142.40
192	32	210.00
193	50	2.50
193	22	93.79
193	64	142.40
193	46	1.25
193	87	283.50
193	35	900.00
193	18	425.24
193	32	210.00
194	63	1000.00
194	30	354.19
194	22	93.79
194	61	480.00
194	25	480.00
194	64	142.40
194	47	16.95
194	46	93.86
194	59	368.54
194	35	720.00
194	43	600.00
195	35	1027.18
195	75	680.38
195	50	2.50
195	33	170.10
195	32	210.00
195	16	124.09
196	13	60.00
196	16	50.00
196	64	60.00
196	78	960.00
196	33	28.35
197	69	453.60
197	14	144.00
197	64	142.40
197	46	2.50
197	68	60.00
197	55	40.08
198	63	255.15
198	16	37.80
198	43	400.00
198	68	120.00
198	50	1.25
198	46	93.86
199	35	1920.00
199	64	100.00
199	30	354.19
199	50	13.60
200	81	453.59
200	46	5.00
200	50	1.25
200	91	120.00
201	20	226.79
201	72	226.79
201	26	60.00
201	64	60.00
201	43	200.00
201	59	80.75
201	46	2.50
201	50	1.25
201	13	120.00
202	89	960.00
202	64	142.40
202	46	93.86
202	20	453.59
202	32	210.00
203	69	340.20
203	81	453.59
203	87	79.20
203	46	1000.00
203	35	360.00
203	68	180.00
204	46	5.00
204	64	5.00
204	35	680.38
204	50	0.62
204	33	78.75
204	22	60.00
205	36	1080.00
205	35	703.39
205	47	38.90
205	46	40.00
205	50	1.25
205	75	120.00
205	89	960.00
206	50	13.60
206	49	1440.00
206	13	329.27
206	16	12.60
206	33	34.65
207	64	240.00
207	46	15.00
207	47	15.12
207	87	120.00
207	50	13.60
207	30	240.00
207	49	240.00
207	75	200.00
208	64	60.00
208	69	226.80
208	14	240.00
208	46	93.86
208	55	40.08
208	33	52.50
209	16	907.18
209	64	240.00
209	22	480.00
209	50	2.50
209	68	240.00
210	69	453.59
210	35	480.00
210	33	341.25
210	68	240.00
210	22	3.75
210	46	2.50
210	43	200.00
211	35	693.60
211	28	152.00
211	61	120.00
211	46	93.86
211	22	60.00
211	55	16.95
212	86	347.37
212	16	25.20
212	64	142.40
212	13	329.27
212	32	52.50
213	20	3068.97
213	50	5.00
213	89	16.95
213	64	400.00
213	46	5.00
213	43	340.20
214	35	480.00
214	64	142.40
214	30	283.50
214	50	2.50
214	68	120.00
215	64	15.00
215	50	15.00
215	46	1.25
215	88	170.10
215	15	26.67
215	40	120.00
216	20	453.59
216	35	1248.21
216	87	864.67
216	46	93.86
216	22	2.50
216	64	120.00
216	33	105.00
217	50	2.50
217	35	1440.00
217	89	16.95
217	46	93.86
217	87	15.00
218	50	7.50
218	46	5.00
218	89	25.42
218	64	142.40
218	22	93.79
218	30	354.19
218	61	226.80
218	87	822.14
219	50	3.75
219	64	2.50
219	46	2.50
219	13	15.00
219	34	390.00
219	74	500.00
220	68	60.00
220	26	240.00
220	43	200.00
220	35	753.59
220	22	2.50
220	46	1.25
220	55	25.42
221	46	93.86
221	59	323.00
221	68	240.00
221	50	13.60
222	61	226.80
222	34	453.59
222	46	93.86
222	50	2.50
222	33	150.25
222	81	453.59
223	16	12.60
223	29	100.00
223	64	150.00
223	50	1.25
224	34	600.00
224	22	120.00
224	64	120.00
224	46	93.86
224	55	50.85
224	50	5.00
224	33	226.80
224	69	340.19
225	35	600.00
225	55	40.08
225	46	93.86
225	33	26.25
226	81	453.59
226	40	170.00
226	34	300.00
226	50	13.60
226	56	0.00
227	69	226.80
227	20	453.59
227	50	13.60
227	87	283.50
227	33	255.15
228	43	1600.00
228	22	3.75
228	33	315.00
228	59	646.00
228	68	22.80
229	33	113.40
229	91	79.20
229	50	13.60
229	71	120.00
230	75	283.50
230	35	835.34
230	89	340.19
230	64	120.00
230	50	2.50
230	46	2.50
231	13	453.59
231	64	360.00
231	46	15.00
231	50	13.60
231	35	480.00
231	18	680.38
231	75	680.38
231	30	453.59
232	16	226.79
232	46	93.86
232	35	120.00
232	68	120.00
232	87	60.00
232	50	13.60
233	35	1455.00
233	64	142.40
233	30	354.19
233	74	575.60
233	50	3.12
233	46	1.25
233	49	240.00
233	69	453.59
233	26	240.00
234	46	900.00
234	66	30.00
234	47	10.00
234	35	680.38
234	63	453.60
235	86	347.37
235	16	37.80
235	50	13.60
235	64	60.00
235	33	288.75
236	64	240.00
236	22	93.79
236	35	300.00
236	18	425.24
236	87	425.24
236	39	1025.24
236	32	226.80
237	64	142.40
237	46	93.86
237	35	480.00
237	55	26.95
237	50	1.25
237	81	453.59
237	68	120.00
238	64	2000.00
238	20	453.59
238	50	5.00
238	46	93.86
238	87	510.00
238	35	390.00
239	46	93.86
239	22	93.79
239	81	907.18
239	87	358.92
239	55	33.90
240	89	420.00
240	33	150.25
240	35	420.00
240	50	2.50
240	43	200.00
241	35	907.18
241	46	17.50
241	50	2.50
241	47	10.00
242	64	60.00
242	47	2.50
242	46	1.25
242	22	1.25
242	89	240.00
242	43	433.97
242	55	5.00
243	46	93.86
243	50	2.50
243	63	453.60
243	64	15.00
244	35	567.00
244	14	50.00
244	46	93.86
244	50	5.00
244	55	40.08
244	68	240.00
245	69	340.20
245	35	453.59
245	50	5.00
245	87	330.00
245	64	360.00
245	46	1200.00
245	59	323.00
245	33	262.50
246	50	2.50
246	79	680.40
246	55	10.00
246	33	52.50
246	43	433.97
247	14	480.00
247	61	480.00
247	46	7.50
247	68	180.00
248	64	120.00
248	46	93.86
248	34	360.00
248	50	2.50
248	45	680.38
248	69	345.02
249	72	799.07
249	50	2.50
249	46	200.00
249	35	120.00
249	55	40.08
250	46	800.00
250	64	200.00
250	50	2.50
250	68	240.00
250	69	226.80
251	20	453.59
251	64	79.20
251	43	200.00
251	46	5.00
251	50	2.50
251	33	113.40
251	59	161.50
\.


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ingredient_ingredient_id_seq', 91, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 221
-- Name: meal_meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meal_meal_id_seq', 1, false);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 223
-- Name: nutrient_nutrient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nutrient_nutrient_id_seq', 14, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipe_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recipe_recipe_id_seq', 251, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


-- Completed on 2024-12-06 11:13:30

--
-- PostgreSQL database dump complete
--

