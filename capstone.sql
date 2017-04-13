--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_user (
    user_name character varying(64) NOT NULL,
    password character varying(128) NOT NULL,
    salt character varying(480) NOT NULL,
    is_admin boolean DEFAULT false NOT NULL
);


--
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE city (
    name character varying(64) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


--
-- Name: seq_itinerary_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_itinerary_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: itinerary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE itinerary (
    itineraryid integer DEFAULT nextval('seq_itinerary_id'::regclass) NOT NULL,
    user_name character varying(64) NOT NULL,
    landmarkid integer NOT NULL,
    name character varying(64) NOT NULL,
    date_started date,
    description character varying(256),
    completed boolean DEFAULT false
);


--
-- Name: seq_landmark_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_landmark_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: landmark; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE landmark (
    landmarkid integer DEFAULT nextval('seq_landmark_id'::regclass) NOT NULL,
    name character varying(128) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    address character varying(256) NOT NULL,
    website character varying(256),
    open_time integer NOT NULL,
    close_time integer NOT NULL,
    phone character varying(32),
    image character varying(256) NOT NULL,
    admission integer NOT NULL,
    handicap_accessible boolean,
    consession boolean,
    kid_friendly boolean,
    water boolean,
    restroom boolean,
    description character varying(500)
);


--
-- Name: seq_review_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_review_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE review (
    id integer DEFAULT nextval('seq_review_id'::regclass) NOT NULL,
    landmarkid integer NOT NULL,
    user_name character varying(64) NOT NULL,
    title character varying(120) NOT NULL,
    review character varying(800) NOT NULL,
    stars integer NOT NULL
);


--
-- Name: seq_app_user_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_app_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seq_suggestion_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_suggestion_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suggestion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suggestion (
    id integer DEFAULT nextval('seq_suggestion_id'::regclass) NOT NULL,
    user_name character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    address character varying(128) NOT NULL,
    description character varying(254) NOT NULL
);


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY app_user (user_name, password, salt, is_admin) FROM stdin;
KevinC	Z+6dbfgKW9yOzFOoTOkL2A==	o7BHFhCTGHVmsaQ/aV/eMtPLAKwjny7PfHNHYxNurH8jNTB98T6GXTKttD2Q/Oqkpp++6kqt0x1wwtk/dhYHslKuROy4z3exR3uKDEHXW+SYNXlGLpW5niA56ej2Jc/yCR5liYjKko8U3cGNuUFp/jp5bpfiLC1qif55iji0qZc=	t
AlexisT	ur6k/xfmGaYHjehKRyHM7w==	VZnfAUcRVK1W+5d62n6EBtmjN5o8VcdaeKSKiyJ/ufiWi4zcWlAP+4OqWjwViZCWUWTVETdz0RCaEXeYBFtVpcAFqCslnPPpETsIvdHl+Vf1pSudvqOl47y++QwQ0KAJa/DILzgqxe1mLoMfYwE0X8BEKgRzHAaBFBwXHE+uUTs=	t
KellyM	abCu2Z/ss3lg15kZHH9a6A==	f1ekHQbXYiuAIvWspr/AkYwqewm/zGAgq7MiyLbI5Ddzw4bt8LZEh/H0eJ9BxbHuxF0UTSbMzivyuxhG0Uyd7ulEDH+DHIw389AD6BhK2A5KnDghFDneLj+hayKeG5ak/BHWBqInOoE2oMZrh/fiO5mve5U8PGhXePuwWDKris8=	t
AdamG	QAHQxJ5fL70bj4KA1XqOEQ==	Kl9CB9BA1QQHdSBpDhafg8rdyWkhlf5s7jxbCKFURNQB26/OROT+K714NBADlkJBj009M+37PlPe+2y50I+yJbD8x0ZlonRHuRYJ9ewnHLaWrUJJLWICqCoTXOLfOuIl8jcXNH2Zov2mF1vKIEsdvBGOqC1txkLHUTjtidOcVCo=	t
Homer	cmcu3KkNgSk514vNbZZYgQ==	vgjcnfDxbIe7/zq4PuX30UVPuPFW6d6Z2EQ3YouCWtwpJ8uAMxcdTmQ2x7dOO53TvPCmn1CIBQwzHiagy/MT2OI3fDtrXpNAS2PvpTok4//13EqIrrp6EB765ke/gQAu8PTjxyJsKRbbUT3M+cTdbr/B4XG+Yz83oXd2wJb/62Y=	f
Steggy	9dXOj9vfIaFgatNyNy+riw==	WjI5+XnN66U8vytiEr0MX+JEegKz4KfrxLKUxanGGbf1+H9VKGYQ+WYNfY84/iKVvnIkHIPAyYYYe6mK9nDKGy4EdY58/qVJpRd1ygdvC+1vfBFA9N1AEZcodUfRXwImNa0jrfYAoepR7XNwABApyv046UF+0yyTCUt/yGn7DmE=	f
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: -
--

COPY city (name, latitude, longitude) FROM stdin;
Cleveland	41.4992999999999981	-81.6944000000000017
\.


--
-- Data for Name: itinerary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY itinerary (itineraryid, user_name, landmarkid, name, date_started, description, completed) FROM stdin;
1	AdamG	3	Test Itinerary	2017-04-09	This is my first itinerary!	f
\.


--
-- Data for Name: landmark; Type: TABLE DATA; Schema: public; Owner: -
--

COPY landmark (landmarkid, name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description) FROM stdin;
1	Tower City	41.4971999999999994	-81.6940000000000026	230 W Huron Rd, Cleveland, OH 44113	www.towercitycenter.com/	10	19	(216) 623-4750	https://devaulphotography.files.wordpress.com/2012/08/tower-city-center.jpg	0	t	t	t	t	t	Tower City Center, originally known as Cleveland Union Terminal, is a large mixed-use facility located on Public Square in downtown Cleveland, Ohio.
2	Jack Casino	41.4986299999999986	-81.6931179999999983	100 Public Square, Cleveland, OH 44113	jackentertainment.com/	0	23	(216) 297-4777	http://media.cleveland.com/plain_dealer_metro/photo/16284146-standard.jpg	0	t	t	f	t	t	Jack Cleveland Casino is located in the former Higbee Building at Tower City Center in downtown Cleveland. The casino has 1,609 slot machines, 119 table games, and 35 electronic table games.
3	Soldiers and Sailors Monument	41.4994820000000004	-81.6927419999999955	3 Public Square, Cleveland, OH 44114	soldiersandsailors.com	10	18	(216) 621-3710	http://cdn.c.photoshelter.com/img-get2/I0000AhZyQyunf70/fit=1000x750/Ohio-Cleveland-The-Advance-Guard-Soldiers-and-Sailors-Monument.jpg	0	t	f	t	f	f	Located in the southeast quadrant of Public Square in downtown Cleveland, it opened July 4, 1894. F.F. Schnitzer was the supervising architect who oversaw the creation of the structure. The monument is regularly open to the public free of charge.
4	Quicken Loans Arena	41.4965589999999978	-81.6881259999999969	1 Center Ct, Cleveland, OH 44115	theqarena.com	88	88	 (216) 420-2000	http://www.nbabasketballarenas.com/images/Quicken-Loans-Arena.jpg	808	t	t	t	t	t	The building is the home of the Cleveland Cavaliers of the National Basketball Association (NBA), the Cleveland Monsters of the American Hockey League, and the Cleveland Gladiators of the Arena Football League.
5	Progressive Field	41.496177000000003	-81.6846489999999932	2401 Ontario St, Cleveland, OH 44115	cleveland.indians.mlb.com	88	88	 (216) 420-4487	http://www.theballparkguide.com/graphics/cleveland-indians/progressive-field-sign.jpg	808	t	t	t	t	t	Progressive Field is a baseball park located in the downtown area of Cleveland, Ohio, United States. It is the home field of the Cleveland Indians of Major League Baseball and, together with Quicken Loans Arena, is part of the Gateway Sports and Entertainment Complex.
6	Cleveland Museum of Art	41.509723000000001	-81.6114850000000018	11150 East Blvd, Cleveland, OH 44106	clevelandart.org	10	17	(216) 421-7350	http://www.destination360.com/north-america/us/ohio/images/s/cleveland-museum-of-art.jpg	0	t	t	t	t	t	The Cleveland Museum of Art (CMA) is an art museum located in the Wade Park District, in the University Circle neighborhood on Clevelands east side. Internationally renowned for its substantial holdings of Asian and Egyptian art, the museum houses a diverse permanent collection of more than 45,000 works of art from around the world.
7	Lakeview Cemetery	41.5134550000000004	-81.5889150000000001	12316 Euclid Ave, Cleveland, OH 44106	lakeviewcemetery.com	10	17	(216) 421-2665	https://s3-us-west-2.amazonaws.com/find-a-grave-prod/photos/2005/25/CEM915_110680411771.jpg	0	t	f	f	f	f	Lake View Cemetery is on the east side of Cleveland, Ohio, along the East Cleveland and Cleveland Heights borders. More than 104,000 people are buried at Lake View, with more than 700 burials each year.
8	Cleveland Metroparks Zoo	41.4465179999999975	-81.7077730000000031	3900 Wildlife Way, Cleveland, OH 44109	clevelandmetroparks.com	10	17	(216) 661-6500	https://www.2016cle.com/RNC2016/media/RNC2016/Things%20to%20Do/Parks%20and%20Recreation/cleveland_metroparks_zoo.jpg	0	t	t	t	t	t	The Cleveland Metroparks Zoo is a 183-acre (74 ha) zoo in Cleveland, Ohio. The Zoo is divided into several areas: Australian Adventure; African Savanna; Northern Trek; The Primate, Cat & Aquatics Building; The RainForest; and Waterfowl Lake.
9	West Side Market	41.4846920000000026	-81.7030620000000027	1975 W 25th St, Cleveland, OH 44113	westsidemarket.org	7	18	(216) 664-3387	https://planning-org-uploaded-media.s3.amazonaws.com/legacy_resources/greatplaces/spaces/2008/img/westsidemarket01.jpg	1425	t	t	t	t	t	The West Side Market is the oldest operating indoor/outdoor market space in Cleveland, Ohio. It is located at the corner of West 25th Street and Lorain Avenue in the Ohio City neighborhood.
10	Willard Park(Free Stamp)	41.5053789999999978	-81.6923239999999993	Cleveland, OH 44114	\N	0	23	(216) 664-2485	https://devaulphotography.files.wordpress.com/2012/08/free-stamp-1a.jpg	0	t	f	t	f	f	Willard Park is a public park in downtown Cleveland, in the U.S. state of Ohio. The park sits at the northwest corner of East 9th Street and Lakeside Avenue, adjacent to Cleveland City Hall, and is within the boundaries of the Cleveland Mall historic district. It is the location of the public sculpture Free Stamp, and is the home of the original Cleveland Fire Fighters Memorial.
11	Playhouse Square	41.5012749999999997	-81.6807230000000004	1501 Euclid Ave, Cleveland, OH 44115	playhousesquare.org	88	88	(216) 241-6000	https://segd.org/sites/default/files/styles/galleryformatter_slide/public/Playhouse_spectacular.jpg?itok=Kt7ZE3lS	0	t	t	t	t	t	Playhouse Square is a theater district in downtown Cleveland, Ohio. It is the largest performing arts center in the United States outside of New York.
12	Cleveland Museum of Natural History	41.5114700000000028	-81.6133580000000052	1 Wade Oval Dr, Cleveland, OH 44106	cmnh.org	10	17	(216) 231-4600	http://media.architecturaldigest.com/photos/55f9dfa600a69f791feb27b2/master/pass/dam-images-daily-2015-04-cleveland-museum-cleveland-museum-of-natural-history-150-million-expansion-01.jpg	1500	t	t	t	t	t	The Cleveland Museum of Natural History is a natural history museum located approximately five miles (8 km) east of downtown Cleveland, Ohio in University Circle, a 550-acre (220 ha) concentration of educational, cultural and medical institutions.
13	The Largest Outdoor Chandelier in The World	41.5009020000000035	-81.6817709999999977	E 14th St, Cleveland, OH 44115	\N	0	23	\N	http://images.midwestliving.mdpcdn.com/sites/midwestliving.com/files/102718406_w.jpg	0	t	f	f	f	f	The historic Playhouse Square Theater district displays a 20 ft. tall chandelier made with 4,200 crystals, hanging 44 ft. above the street.
14	Museum of Contemporary Art Cleveland	41.5089079999999981	-81.6046369999999968	11400 Euclid Ave, Cleveland, OH 44106	mocacleveland.org	11	17	(216) 421-8671	http://planning.city.cleveland.oh.us/projects/assets/projectID44_182.jpg	950	t	f	t	t	t	The Museum of Contemporary Art Cleveland, better known by its acronym, MOCA, is a contemporary art museum located in Cleveland, Ohio. Founded in 1968 by Marjorie Talalay, Agnes Gund, and Nina Castelli Sundell as The New Gallery, the museum was renamed the Cleveland Center for Contemporary Art in 1984.
15	Childrens Museum of Cleveland	41.5042479999999969	-81.6598390000000052	3813 Euclid Ave, Cleveland, OH 44115	clevelandchildrensmuseum.org	88	88	(216) 791-7114	http://community-wealth.org/sites/clone.community-wealth.org/files/styles/large/public/Children%27s%20museum.jpg?itok=FNIz9zaQ	808	t	f	t	t	t	It is dedicated to helping young children develop physically, emotionally, and socially. It also encourages adults to aid children in their development. One permanent exhibit, Splish! Splash!, is designed to teach children, through interactive displays, about water transportation.
31	Garfield Park Reservation	41.4305420000000026	-81.6051769999999976	11350 Broadway Ave, Garfield Heights, OH 44125	clevelandmetroparks.com	0	23	(216) 341-3152	https://c1.staticflickr.com/4/3748/8936947421_fb4ff2f430_b.jpg	0	t	t	t	t	t	Garfield Park Reservation is located in Garfield Heights. The reservation features picnic areas, a wetland, and trails.
16	Rock and Roll Hall of Fame	41.5085460000000026	-81.695368000000002	1100 E 9th St, Cleveland, OH 44114	rockhall.com	10	17	(216) 781-7625	http://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/525/2015/12/01201858/rock-and-roll-hall-of-fame-and-muse.jpg	2350	t	t	t	t	t	The Rock and Roll Hall of Fame and Museum, located on the shore of Lake Erie in downtown Cleveland, Ohio, recognizes and archives the history of the best-known and most influential artists, producers, engineers, and other notable figures who have had some major influence on the development of rock and roll.
17	Great Lakes Science Center	41.5074240000000003	-81.6967240000000032	601 Erieside Ave, Cleveland, OH 44114	greatscience.com	10	17	(216) 694-2000	http://cache.marriott.com/propertyimages/c/clewb/phototour/clewb_phototour32.jpg?Log=1	950	t	t	t	t	t	The Great Lakes Science Center is a museum and educational facility in downtown Cleveland, Ohio, United States. Many of the exhibits document the features of the natural environment in the Great Lakes region of the United States.
18	A Christmas Story House	41.4687300000000008	-81.6873939999999976	3159 W 11th St, Cleveland, OH 44109	achristmasstoryhouse.com	10	17	(216) 298-4919	https://upload.wikimedia.org/wikipedia/commons/a/aa/A_Christmas_Story_house.JPG	1100	f	t	t	t	t	A Christmas Story House is a museum in Cleveland, Ohios Tremont neighborhood. The 19th-century Victorian, which was used in the exterior scenes of Ralphie Parkers house in the 1983 film A Christmas Story, was purchased by a private developer in 2004 and has been restored and renovated to appear as it did both inside and outside in the film.
19	USS Cod Submarine Memorial	41.5100899999999982	-81.6915709999999962	1201 N Marginal Rd, Cleveland, OH 44114	usscod.org	10	17	(216) 566-8770	https://static.spplus.com/pictures/uss-cod-small.jpg	1200	t	t	t	t	t	USS Cod (SS/AGSS/IXSS-224) is a Gato-class submarine, the only vessel of the United States Navy to be named for the cod, named after the worlds most important food fish of the North Atlantic and North Pacific.
20	Aquarium	41.496538000000001	-81.7037930000000046	2000 Sycamore St, Cleveland, OH 44113	greaterclevelandaquarium.com	10	17	(216) 862-8803	http://inacents.com/wp-content/uploads/2013/09/130804-Greater-Cleveland-Aquarium-2.jpg	2000	t	t	t	t	t	The Greater Cleveland Aquarium is an aquarium in Cleveland, Ohio, USA. Occupying the historic FirstEnergy Powerhouse building located on the west bank of the Cuyahoga River in the citys Flats district.
21	Browns Stadium	41.506062	-81.6995699999999943	100 Alfred Lerner Way, Cleveland, OH 44114	firstenergystadium.com	88	88	(440) 891-5001	https://www.theclio.com/web/ul/25060.55019.jpg	808	t	t	t	t	t	First Energy Stadium is the home field of the Cleveland Browns of the National Football League (NFL), and serves as a venue for other events such as college and high school football, soccer, and concerts.
22	Great Northern Mall	41.417031999999999	-81.905928000000003	4954 Great Northern Mall, North Olmsted, OH 44070	shoppinggreatnorthernmall.com	10	21	(440) 734-6304	http://media.syracuse.com/post-standard/photo/2017/01/06/21822245-large.jpg	0	t	t	t	t	t	Great Northern Mall, is a single-level enclosed shopping mall in North Olmsted, Ohio, a suburb of Cleveland. Its anchor stores are Macys, Dillards, Sears, J. C. Penney and Dicks Sporting Goods.
23	Beachwood Mall	41.4984150000000014	-81.4940660000000037	26300 Cedar Rd, Beachwood, OH 44122	beachwoodplace.com	10	21	(216) 464-9460	http://content.wkyc.com/photo/2014/06/05/1401995613000-Beachwood-Place_2924800_ver1.0.jpg	0	t	t	t	t	t	Beachwood Place is an upscale shopping mall located in Beachwood, Ohio, a Greater Cleveland suburb. It opened in 1978 and is anchored by Dillards, Nordstrom,Zara, and Saks Fifth Avenue. More than 140 additional specialty shops and restaurants are located there, including Lacoste, Louis Vuitton within Saks, Swarovski, Chanel within Saks, L'Occitane En Provence, and Coach.
24	Richmond Town Square	41.5417509999999979	-81.4944809999999933	691 Richmond Rd, Richmond Heights, OH 44143	shoprichmondtownsquare.com	10	21	(440) 449-3200	http://www.wkyc.com/img/resize/content.wkyc.com/photo/2017/03/17/Richmond%20Town%20Square_1489791904673_8990596_ver1.0.JPG?preset=534-401	0	t	t	t	t	t	Richmond Town Square is a super regional shopping mall, it's anchor stores include JCPenney and Sears. Richmond  is also home to a 20-screen Regal Cinemas theater.
25	Baseball Heritage Museum	41.5111709999999974	-81.6443040000000053	6601 Lexington Ave, Cleveland, OH 44103	baseballheritagemuseum.org	10	14	(216) 789-1083	https://baseballheritagemuseum.org/wp-content/uploads/2015/11/20140921_123500-300x225-300x225.jpg	0	t	f	t	t	t	League Park was a baseball park located in Cleveland, Ohio, United States. It is situated at the northeast corner of E. 66th Street and Lexington Avenue in the Hough neighborhood. It was built in 1891 as a wood structure and rebuilt using concrete and steel in 1910.
26	Nature Center at Shaker Lakes	41.4850300000000018	-81.5744540000000029	2600 S Park Blvd, Cleveland, OH 44120	shakerlakes.org	10	17	(216) 321-5935	http://media.cleveland.com/shaker-heights/photo/nature-center2jpg-ba90b8fd172f8b0c.jpg	0	t	t	t	t	t	The Nature Center at Shaker Lakes is a nonprofit organization in Shaker Heights, Ohio that works to conserve a natural area, educate visitors about nature, and promote better environmental stewardship.
27	Wolstein Center	41.499330999999998	-81.6769220000000047	2000 Prospect Ave, Cleveland, OH 44115	\N	88	88	(844) 407-2279	http://bloximages.newyork1.vip.townnews.com/csucauldron.com/content/tncms/assets/v3/editorial/8/74/874d5816-d731-11e4-a806-3bb8315f9447/5519d754a3912.image.jpg?resize=300%2C210	808	t	t	t	t	t	The Wolstein Center is an indoor arena located in downtown Cleveland, Ohio, United States, on the campus of Cleveland State University. It is home to the Cleveland State Vikings men's and women's basketball teams and the former home of the Cleveland Crunch and Cleveland Force of the NPSL and MISL.
28	Cleveland Botanical Garden	41.5111190000000008	-81.6095789999999965	11030 East Blvd, Cleveland, OH 44106	cbgarden.org	10	17	(216) 721-1600	http://www.universitycircle.org/files/locations/slider/cleveland-botanical-garden-3.jpg	1200	t	f	t	t	t	The Cleveland Botanical Garden, located in the University Circle neighborhood of Cleveland, Ohio, in the United States, was founded in 1930 as the Garden Center of Greater Cleveland. It was the first such organization in an American city. Originally housed in a converted boathouse on Wade Park Lagoon, the center served as a horticultural library, offering classes and workshops for gardeners and spearheading beautification projects in the community.
29	International Womens Air & Space Museum	41.5115199999999973	-81.6899209999999982	1501 N Marginal Rd, Cleveland, OH 44114	iwasm.org	8	20	(216) 623-1111	https://static1.squarespace.com/static/54c6a8f9e4b0d827821a26e8/t/54c8f32ee4b06b0aa190b7a3/1422455628134/	0	t	t	t	t	t	The International Womens Air & Space Museum, Inc. (IWASM) is a museum dedicated to the preservation of the history of women in aviation and space and the documentation of their continuing contributions today and in the future.
30	Cleveland Orchestra	41.5062229999999985	-81.6095880000000022	11001 Euclid Ave, Cleveland, OH 44106	clevelandorchestra.com	88	88	(216) 231-1111	http://2.bp.blogspot.com/-KzX_yPwtIBw/U3AhkzaDxzI/AAAAAAAAC3U/_GWpItfwJ6k/s1600/resize_a.jpg	808	t	t	t	t	t	The Cleveland Orchestra, based in Cleveland, is one of the five American orchestras informally referred to as the "Big Five". Founded in 1918 by the pianist and impresario Adella Prentiss Hughes, the orchestra plays most of its concerts at Severance Hall. As of 2016, the incumbent music director is Franz Welser-Möst.
32	Lakefront Reservation (Euclid Beach)	41.5828530000000001	-81.569554999999994	2-12 Cumberland Ave, Cleveland, OH 44110	clevelandmetroparks.com	0	23	\N	https://clevelandmetroparks.com/getmedia/37494a88-ffa1-4c6b-a793-abb5db35213f/Lakefront_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both	0	t	f	t	t	t	From beaches to boat ramps, fitness trails to fishing piers, Lakefront Reservation is a true gem in the “Emerald Necklace” anchoring Cleveland Metroparks presence on the shores of Lake Erie. 
33	Euclid Park Reservation	41.5617659999999987	-81.5312919999999934	Euclid, OH 44143	clevelandmetroparks.com	0	23	(216) 382-5660	https://clevelandmetroparks.com/getmedia/3d853842-01ca-44c3-85fd-152a49445a66/Euclid_Creek_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both	0	t	f	t	t	t	Follow Euclid Creek Valley along 2.5 miles of interesting geology along this verdant corridor, from Quarry Picnic Area to Highland Picnic Area.
34	Bedford Reservation	41.3759319999999988	-81.5766040000000032	Cuyahoga Valley National Park, 14505 Button Rd, Walton Hills, OH 44146	clevelandmetroparks.com	0	23	(216) 635-3200	https://clevelandmetroparks.com/getmedia/aec40394-b044-4dd8-b16a-394bc439f934/Bedford_03.jpg.ashx?h=300&w=500&mode=crop&scale=both	0	t	f	t	t	t	This reservation features a deep gorge carved out by Tinker’s Creek, with picturesque vistas and waterfalls.
35	Big Creek Reservation	41.4455389999999966	-81.7178159999999991	4101 Fulton Pkwy, Cleveland, OH 44144	clevelandmetroparks.com	0	23	(216) 635-3200	https://clevelandmetroparks.com/getmedia/45126d11-d74d-4386-b246-a077e9aeaa84/Big_Creek_Carousel.jpg.ashx?h=384&w=640&mode=crop&scale=both	0	t	f	t	t	t	A major component of Big Creek Reservation is Big Creek Parkway, a refreshing alternative to the standard suburban commuter routes to Cleveland.
36	East 55th Street Marina	441.531209999999987	-81.6520749999999964	5555 N Marginal Rd, Cleveland, OH 44114	clevelandmetroparks.com	11	23	(216) 391-5566	http://edwardscom.net/wp-content/uploads/2014/07/E55th-St-Marina-Signage-II.jpg	0	f	f	t	t	t	Many new facilities at East 55th Street Marina are open to the public! Included are a 1,200-foot fishing platform, fully stocked bait shop and marina store, e55 on the Lake restaurant and bar, a brand new Valvtect Marine Certified fuel dock and sixteen courtesy guest docks available for daily use.
37	Cleveland City Hall	41.5050120000000007	-81.6935610000000025	601 Lakeside Ave E, Cleveland, OH 44114	city.cleveland.oh.us	8	17	(216) 664-2561	http://static.panoramio.com/photos/large/34898674.jpg	0	f	f	f	t	t	Cleveland City Hall was built in 1916 at 601 Lakeside Avenue in downtown Cleveland's Civic Center and is where the Cleveland City Council meets.
38	Little Italy	41.5086370000000002	-81.6003199999999964	Cleveland, OH 44106	\N	88	88	\N	https://lh3.googleusercontent.com/_4a0Y5-NnjiOUuNyahjJJ98fLCYk46h8qi1PSpaBjMQpf1TurPcxXFUFYOEj_MFhBFsYnkLXxzE5tGY3dmukxfB9sIAJcFwjL1E6336hPFIPu8NgDpQuenP3	808	f	f	f	t	t	Little Italy (known locally as "Murray Hill" or "The Hill")  is an ethnic enclave that serves as the historic center of Cleveland's Italian American community. It is located from E. 119th to E. 125th streets on Murray Hill and Mayfield roads, situated at the eastern city limits, along a long, moderately sloping grade that ascends in elevation approximately 300 feet.
39	Crawford Auto-Aviation Museum	41.513415000000002	-81.6109809999999953	10825 East Blvd, Cleveland, OH 44106	wrhs.org	88	88	(216) 721-5722	http://www.cityprofile.com/forum/attachments/ohio/18569-cleveland-crawford-auto-aviation-museum-2.jpg	1000	t	t	t	t	t	The Crawford Auto-Aviation Museum is a collection in the University Circle neighborhood of Cleveland, Ohio. Part of the Western Reserve Historical Society and housed at the Cleveland History Center, it was founded by industrialist Frederick C. Crawford of TRW, and opened in 1965.
40	Cleveland Arcade	41.5000410000000031	-81.6903329999999954	401 Euclid Ave, Cleveland, OH 44114	theclevelandarcade.com	88	88	(216) 696-1408	http://www.theclevelandarcade.com/files/1949/gallery-arcade-interior-2.jpg	808	t	t	t	t	t	The Arcade in downtown Cleveland, Ohio, is a Victorian-era structure of two nine-story buildings, joined by a five-story arcade with a glass skylight spanning over 300 feet (91 m), along the four balconies.
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: -
--

COPY review (id, landmarkid, user_name, title, review, stars) FROM stdin;
1	1	KellyM	This place is nice	The food court is good if you want to grab some quick food before going to an event at Gateway.  Lot's of places to shop.  It's really nice during Christmas time when the entire place is decorated	4
2	2	KellyM	A fun way to lose money	Slots upon slots upon slots here.  Also, they have a ton of different table games.  It can get cramped on the weekends but otherwise it's a fun little excursion if you know when to walk away.  The buffet has a decent seletion of food	4
3	3	KellyM	A nice monument	Beautiful both outside and inside.  If you are into history swing by here	5
4	4	KellyM	The Q	Whether it is a Cavs, Monsters, or Gladiators game, a concert, or monster truck rally, the Q always does a great job hosting events.	5
5	5	KellyM	It's still the Jake to me	Besides seeing America's past time they also do a great job with fan interaction during the game and the food choices are excellent.  Now we just need for the tribe to win a World Series	5
6	6	KellyM	A massive museum that is also free!?  SHUT UP AN DON'T TAKE MY MONEY!	What more could you want, a large museum you can walk through and it is also free (they do take donations via donation boxes in the lobby).  You have to pay for special exhibits but it's not going to break the bank.	5
7	7	KellyM	Dead people, some of them are famous as well!	This places is pretty awesome to wander around.  Notable deceased include: John D. Rockefeller, President James Garfield, Ray Chapman the only baseball player to ever be killed in a game, as well as a plethora of others.	5
8	8	KellyM	A Zoo and a Rainforest	The zoo is pretty awesome and massive. You'll definitely get a good workout walking around.  I highly recommend taking extra time to go to the Rainforest and watch the Otters frolick.	5
9	9	KellyM	An awesome selection of food	If you need something for cooking a great meal, a West Side Market vendor probably carries it and it's probably waaaay cheaper than some dumb chain grocery store.	5
10	10	KellyM	Cool Art	The Free Stamp is basically a giant stamp that says free on it (hence the name).  It sounds dumb but is kinda' cool	5
11	11	KellyM	Broadway comes to Cleveland	This place is beautiful inside and is an absolute treasure to the city.  They also have super cheap nosebleed seats for all of the hottest Broadway Musicals that come through town.	5
12	12	KellyM	Maam, please get off the Dinosaur	Apparently, they have age restrictions (THAT AREN'T POSTED MIGHT I ADD) on the dinosaur "Steggy" outside the museum.  That's why they are getting 4 stars instead of 5.  Other than the facist age restrictions, this place is pretty awesome and great for people of any age.	4
13	13	KellyM	Cleveland: We like large things	Did you go visit our Free Stamp?  Then go see the largest outdoor Chandelier located in Playhouse Square.  It looks awesome at night when it is lit up.	5
14	14	KellyM	It's an odd shaped building	But it has a lot of cool art.  Most of which I do not understand because I am not smart.  But it looks cool so it's got that going for it, which is nice.	5
15	15	KellyM	EVEN KIDS GET THEIR OWN MUSEUM IN CLEVELAND!	Do you have children and want them to learn but also have fun so you don't have to listen to them complain?  Take them here	5
16	16	KellyM	Hello, Cleveland!	See a guitar Kurt Cobain played or something Janis Joplin wore on stage?  Yeah, this place is awesome.  The gift shop is over priced for the most part, but if you are a fan of Rock and Roll this place is for you.	5
17	17	KellyM	This place is fun	If you want your kid to learn and have fun so you don't have to listen to them complain, this is the place to take them	5
18	18	KellyM	You'll shoot your eye out!	Okay, no you won't but this place is a must see if you are a fan of the movie.	5
19	19	KellyM	The first line of defense for when Canada invades	This place is full of history and is a must see for those who are fans of military history	5
20	20	KellyM	One Fish, Two Fish, Red Fish, Blue Fish	Do you like looking at sea life?  This place is great for you.  It's a bit on the small side but it still is pretty cool.	5
21	21	KellyM	The Factory of Sadness	It'd be nice if the Browns could not suck, but this place isn't too bad since they did the renovations.	5
22	22	KellyM	A suburban mall	You can probably guess all the stores that are in this mall if you have ever visited a mall in the suburbs of America	5
23	23	KellyM	A fancy suburban mall	This is differs from most other malls because most of the stores are higher end.  Think Nordstrom, Saks 5th Ave, etc.	5
24	24	KellyM	How is this mall still open?	They have a food court, movie theatre, a planet fitness and a bunch of random different stores.	5
25	25	KellyM	Not Cooperstown	This place is pretty neat and if you are a fan of baseball it is definitely a must see.	5
26	26	KellyM	Nature not far from the city	The entire Shaker Lakes area is very beautiful and contains an abundunce of wildlife.  The nature center has a lot of information on the area and wildlife.	5
27	27	KellyM	It's like the Q's younger sibling	A mid-sized arena that has some great concerts and is also home to the Cleveland State Men and Women's basketball teams.  I wish they would bring back indoor soccer	5
28	28	KellyM	Take your allergy pills before you visit	This place is pretty and a great way to see some beautiful flowers in the middle of winter	5
29	29	KellyM	Space ladies!	A cool museum that is dedicated to the women who have made aviation and space history.	5
30	30	KellyM	A world class orchestra in Cleveland!	Their home venue of Severance Hall is an absolute gem and the Cleveland Orchestra is just phenomenal	5
31	31	KellyM	We have lots of parks	Garfield Park Reservation is a great way to get into the great outdoors and out of the hustle and bustle of the city	5
32	32	KellyM	A pretty lakefront park	Absolutely breath taking views of the lake, especially at sunset.  A great place to hold a BBQ.	5
33	33	KellyM	A nice park to explore or even just drive through!	Like my title says it's a wonderful park to drive through and it's even better if you get out and explore it!	5
34	34	KellyM	A park AND a golf course	The park is great and is a testament that the Cleveland Metroparks take care of all of their parks.  They also have a nice par 3 golf course for those who like to play the game.	5
35	35	KellyM	A small park	It's a nice park but it is a tad on the small side compared to other parks in the Metroparks system.	5
36	36	KellyM	A beautiful lakefront park	If you like to fish, head here.  There always seem to be people fishing all along here.  They also have a really nice paved trail that you can walk, jog, or ride your bike on.	5
91	10	Homer	"Art"	I thought this was boring and you people have horrible taste in "Art".	2
37	37	KellyM	Go inside and see how pretty it is	The outside looks pretty cool but inside the architecture is nothing short of beautiful	5
38	38	KellyM	Mmmm...Italian Food	Do you like authentic Italian food?  This is the place you need to visit.	5
39	39	KellyM	Cars and Planes!	This is part of the Western Reserve Historical Society.  They have tons of cool autombile and aviation related things.  A must see if you are into cars or aviation	5
40	40	KellyM	No video games here!	However, it is loaded with many shops, a hotel, and some beautiful architecture.	5
41	1	KevinC	Lot's of food and shopping options	Like I said in my title, they have a lot of food and shopping options here.  The movie theatre is pretty cool but is a bit old compared to other theatres around the city.	4
42	2	AdamG	A fun night out!	I like playing cards here.  It does get very busy on Friday and Saturday nights.	4
43	3	AlexisT	A Beautiful Monument	This monument is beautiful and also has some interesting history behind it.	5
44	4	KevinC	FYI	WARRIORS BLEW A 3-1 LEAD!	5
45	4	AdamG	To Add to KevinC's review	WARRIORS BLEW A 3-1 LEAD!	5
46	4	AlexisT	Did you know that...	THE WARRIORS BLEW A 3-1 LEAD!	5
47	4	KellyM	If (warriorsTotal2016FinalsWinsAfterFourGames = 3) && (cavsTotal2016FinalsWinsAfterFourGames = 1)	{System.out.Println("WARRIORS BLEW A 3-1 LEAD!");} else { System.out.Println("There is no else.");}	5
48	5	AlexisT	Great place to catch a baseball game	The food options are almost endless and it's a fun outing with friends or family.	4
49	6	AlexisT	AMAZING ART!	This place has a ton of amazing works of art including suits of armor!  AND it's free!	5
50	6	KevinC	Always a fun time	A great place to come and look at cool works of art.	5
51	8	KevinC	A Great Place for Kids!	Whether you are young or old this place is awesome!	5
52	8	AlexisT	This place is great!	It's a pretty awesome place to see different types of animals that are not found in this area.  The rainforest is pretty cool as well!	4
53	8	AdamG	Lot's of fun	A large range of different animals and a great way to spend a day.	5
54	9	AlexisT	So.  Much.  Food.	Whatever you want to make, they probably have	5
55	9	KevinC	Cool Place	This place has tons of different types of food.  It's getting four stars due to the horrible parking situation!	4
56	9	AdamG	Fun times!	The food selection here is just plain awesome.  The parking situation could be better.	4
57	10	AlexisT	A cool landmark	It's not a place you are going to spend a lot of time at.  However, it still looks cool.	5
58	11	AdamG	Drama!	So.  Much.  Drama... and musicals as well!  A great place to catch a show!	5
59	12	AlexisT	Lot's of cool stuff	They have a ton of interesting stuff here including a newly added outdoor space.	4
60	15	KevinC	A fun museum!	A great place for kids and adults to learn and have fun!	4
61	16	AdamG	This place...	ROCKS!	5
62	17	KevinC	Fun for Everyone!	Lot's of interactive stuff that makes learning science fun!	5
63	19	AlexisT	History in Cleveland	Obviously, this place is on the cramped side because it is a submarine, so if you are claustrophobic you might not like this.  This place is loaded with history and really interesting	5
64	22	AlexisT	A great mall	This place has tons of great stores that can probably satisfy everyones needs.	5
65	23	AdamG	Nice mall	The stores here are really expensive but they have really nice stuff.	5
66	25	KevinC	Baseball!	A great place to learn about baseball history!	5
67	27	AdamG	A smaller venue	Not too shabby of a venue.	4
68	27	AlexisT	Wolstein Center	This place is small compared to THE Ohio State University' Value City Arena.  STEP UP YOUR GAME CLEVELAND STATE UNIVERSITY!	1
69	28	KevinC	A lot of plants here!	It was very pretty and nice with all of the different types of plants they have.	3
70	29	AlexisT	Cool history stuff	Tons of really cool stuff through aviation and space history.	5
71	29	AdamG	This place is cool	If you like space, women, and aviation you'll like this place.  The parking kinda' sucks though!	3
72	30	KevinC	A great orchestra!	The world famous Cleveland Orchestra is amazing!	5
73	33	KevinC	Good Sized Park	It's big enough to where you can feel like you are in the middle of nowhere but not so big that you would be lost.	5
74	34	AlexisT	Great Park	Tons of trails to walk on and they even have a golf course!	5
75	35	KevinC	A small park	It's a really small park.  Not as good as the other parks in this system.	3
76	36	AdamG	A great place to hang out	It's right on the lake and you can go fishing or play volleyball!	5
77	37	AdamG	Nice building	It is a nice building.	4
78	38	AlexisT	A great neighborhood!	Tons of great food options.  The parking is pretty horrible though.	3
79	38	AdamG	Lot's of cool stuff!	Tons of great places to eat and art galleries to see.  The parking could be a bit better.	4
80	39	AlexisT	Cool Museum!	They have a huuuuuuuuge collection of aviation and automotive stuff.  A must see!	5
81	1	Homer	They have many things here	Including a Dunkin' Donuts...mmmmmm...Donuts.	5
82	2	Homer	Gambling is boring	I hate losing money but I like eating lot's of food.  Just like the Frying Dutchman I was kicked out of this buffet for nearly bankrupting the place from all the food I was able to eat.	1
83	5	Homer	ISOTOPES RULE, INDIANS DROOL!	No donuts but lots of other food and beer.  Go 'TOPES!	1
84	5	Steggy	More food options	More veggie options and less kids trying to climb on me, please!	3
85	6	Homer	Free but I have to pay money?	The signs clearly state it is free but my wife Marge made me put money in the donation box.	1
86	7	Homer	A cemetary?	Apparently there's a bunch of famous people buried here and historical stuff.  BO-O-O-O-RING!	1
87	7	Steggy	Very Quiet	Lot's of vegetation to eat and I am left alone.	5
88	8	Steggy	A great place to visit!	Tons of my friends live here so I try and visit them often.	5
89	9	Homer	Lot's of food	They have vegetables which my hippie kid likes, but they also have meat and donuts...mmmmm....donuts.  No beer though :(	4
90	9	Steggy	VEGGIES!	Lot's of vegetables for me to eat and no one jumping on my back...so far.	5
92	10	Steggy	Something that's bigger than me!	I saw people climbing on this and I felt the Free Stamps' pain.  Hang in there brother, they can't climb on you all the time!	5
93	12	Steggy	Please stop climbing on me!	I don't care how old you are, please stop!	5
94	12	Homer	SIR, YOU'RE MAKING A SCENE	My smart kid dragged me here.  I want to echo KellyM's review and say that if they didn't want adults on the dinosaur out front they should have a sign posted.  Just once I want someone to call me sir with out adding "your making a scene!"	5
95	13	Homer	THIS PLACE SUCKS	Sia can swing from a chandelier but I do it and the cops get called.	1
96	14	Homer	More dumb art	BORING!	1
97	15	Homer	I had other plans	The kids enjoyed it while I took a nap in the car.	5
98	15	Steggy	Go Here!	And climb on this dinosaur's back, not mine.	5
99	18	Homer	I shot my eye out	Apparently, the "prop" was more realistic than we thought once the boy loaded bbs into it.	2
100	19	Homer	THIS WAS NOT A SANDWICH	As my wife and kids had led me to believe.	1
101	20	Homer	Lot's of Fish...	However, you are not allowed to fish.  They need signs for this!	1
102	21	Homer	Football	My good friend Gerald Ford would like to eat nachos here with me while watching football	3
103	26	Homer	Nature Crap	We lost the boy but unfortunately he reappeared.  My hippie daughter, Lisa, liked this place.	2
104	28	Homer	More of getting told what to do!	Homer, stop eating the flowers!	1
105	31	Homer	A Park	That's it a park.  BORING!	1
106	32	Homer	Car was stolen	This park is really nice and my family and I had a really good time.  When we got back to where we had parked our car was gone.  The police later found our car, the culprit was The Lake Erie Monster (not the hockey team)...stupid monster from Lake Erie	1
107	33	Homer	You people love your parks	We drove through it and I almost took out bambi...stupid deer.	1
108	36	Homer	Fishing!	Na na na na na na na na Batman! Na na na na na na na na Batman! Batman! Batman! Batman!	5
109	38	Homer	Mmmm...Italian Food	Not one but TWO bakeries within a block of each other!	5
110	40	Homer	No video games here!?	I had to listen to the boy complain about their being no video games.  THANKS A LOT "ARCADE"!.	1
\.


--
-- Name: seq_app_user_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_app_user_id', 1, false);


--
-- Name: seq_itinerary_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_itinerary_id', 1, true);


--
-- Name: seq_landmark_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_landmark_id', 40, true);


--
-- Name: seq_review_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_review_id', 110, true);


--
-- Name: seq_suggestion_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_suggestion_id', 1, false);


--
-- Data for Name: suggestion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY suggestion (id, user_name, name, address, description) FROM stdin;
\.


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_name);


--
-- Name: landmark landmark_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY landmark
    ADD CONSTRAINT landmark_pkey PRIMARY KEY (landmarkid);


--
-- Name: city pk_city; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY city
    ADD CONSTRAINT pk_city PRIMARY KEY (name, latitude, longitude);


--
-- Name: itinerary pk_itinerary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itinerary
    ADD CONSTRAINT pk_itinerary PRIMARY KEY (itineraryid, landmarkid, user_name);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: suggestion suggestion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggestion
    ADD CONSTRAINT suggestion_pkey PRIMARY KEY (id);


--
-- Name: itinerary fk_itinerary_app_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itinerary
    ADD CONSTRAINT fk_itinerary_app_user FOREIGN KEY (user_name) REFERENCES app_user(user_name);


--
-- Name: itinerary fk_itinerary_landmark; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itinerary
    ADD CONSTRAINT fk_itinerary_landmark FOREIGN KEY (landmarkid) REFERENCES landmark(landmarkid);


--
-- Name: review fk_review_app_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_app_user FOREIGN KEY (user_name) REFERENCES app_user(user_name);


--
-- Name: review fk_review_landmark; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_landmark FOREIGN KEY (landmarkid) REFERENCES landmark(landmarkid);


--
-- PostgreSQL database dump complete
--

