-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

DROP TABLE IF EXISTS app_user;
DROP SEQUENCE IF EXISTS seq_app_user_id;	
DROP TABLE IF EXISTS landmark;
DROP SEQUENCE IF EXISTS seq_landmark_id;	
DROP TABLE IF EXISTS itinerary;
DROP SEQUENCE IF EXISTS seq_itinerary_id;
DROP TABLE IF EXISTS review;
DROP SEQUENCE IF EXISTS seq_review_id;
DROP TABLE IF EXISTS suggestion;
DROP SEQUENCE IF EXISTS seq_suggestion_id;

CREATE SEQUENCE seq_app_user_id;

CREATE TABLE app_user (
	user_name VARCHAR(64) PRIMARY KEY NOT NULL,
	password VARCHAR(128) NOT NULL,
	salt VARCHAR(480) NOT NULL
);

CREATE SEQUENCE seq_landmark_id;

CREATE TABLE landmark (
landmarkId INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_landmark_id'),
name VARCHAR(128) NOT NULL,
latitude FLOAT NOT NULL,
longitude FLOAT NOT NULL,
address VARCHAR(256) NOT NULL,
website VARCHAR(256),
open_time INTEGER NOT NULL,
close_time INTEGER NOT NULL,
phone VARCHAR(32),
image VARCHAR(256) NOT NULL,
admission INTEGER NOT NULL,
handicap_accessible BOOLEAN,
consession BOOLEAN,
kid_friendly BOOLEAN,
water BOOLEAN,
restroom BOOLEAN,
description VARCHAR(500) 

);
CREATE SEQUENCE seq_itinerary_id;

CREATE TABLE itinerary (
	
	itineraryId INTEGER NOT NULL,
	user_name VARCHAR(64) NOT NULL,
	landmarkId INTEGER NOT NULL,
	name VARCHAR(64) NOT NULL,
	date_started DATE,
	description VARCHAR(256),
	
	CONSTRAINT pk_itinerary PRIMARY KEY (itineraryId, landmarkId, user_name),
	CONSTRAINT fk_itinerary_app_user FOREIGN KEY (user_name) REFERENCES app_user(user_name),
	CONSTRAINT fk_itinerary_landmark FOREIGN KEY (landmarkId) REFERENCES landmark(landmarkId)
);

CREATE SEQUENCE seq_review_id;

CREATE TABLE review (
	id INTEGER NOT NULL,
	landmarkId INTEGER NOT NULL,
	user_name VARCHAR(64) NOT NULL,
	review VARCHAR(254) NOT NULL,
	stars INTEGER NOT NULL,
	
	CONSTRAINT pk_review PRIMARY KEY (id, landmarkId, user_name),
	CONSTRAINT fk_review_app_user FOREIGN KEY (user_name) REFERENCES app_user(user_name),
	CONSTRAINT fk_review_landmark FOREIGN KEY (landmarkId) REFERENCES landmark(landmarkId)
);
CREATE SEQUENCE seq_suggestion_id;

CREATE TABLE suggestion (
id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_suggestion_id'),
user_name VARCHAR(64) NOT NULL,
name VARCHAR(64) NOT NULL,
address VARCHAR(128) NOT NULL,
description VARCHAR(254) NOT NULL

);

INSERT INTO app_user(user_name, password, salt) VALUES ('KevinC', 'Z+6dbfgKW9yOzFOoTOkL2A==', 'o7BHFhCTGHVmsaQ/aV/eMtPLAKwjny7PfHNHYxNurH8jNTB98T6GXTKttD2Q/Oqkpp++6kqt0x1wwtk/dhYHslKuROy4z3exR3uKDEHXW+SYNXlGLpW5niA56ej2Jc/yCR5liYjKko8U3cGNuUFp/jp5bpfiLC1qif55iji0qZc=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AlexisT', 'ur6k/xfmGaYHjehKRyHM7w==', 'VZnfAUcRVK1W+5d62n6EBtmjN5o8VcdaeKSKiyJ/ufiWi4zcWlAP+4OqWjwViZCWUWTVETdz0RCaEXeYBFtVpcAFqCslnPPpETsIvdHl+Vf1pSudvqOl47y++QwQ0KAJa/DILzgqxe1mLoMfYwE0X8BEKgRzHAaBFBwXHE+uUTs=');
INSERT INTO app_user(user_name, password, salt) VALUES ('KellyM', 'abCu2Z/ss3lg15kZHH9a6A==', 'f1ekHQbXYiuAIvWspr/AkYwqewm/zGAgq7MiyLbI5Ddzw4bt8LZEh/H0eJ9BxbHuxF0UTSbMzivyuxhG0Uyd7ulEDH+DHIw389AD6BhK2A5KnDghFDneLj+hayKeG5ak/BHWBqInOoE2oMZrh/fiO5mve5U8PGhXePuwWDKris8=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AdamG', 'QAHQxJ5fL70bj4KA1XqOEQ==', 'Kl9CB9BA1QQHdSBpDhafg8rdyWkhlf5s7jxbCKFURNQB26/OROT+K714NBADlkJBj009M+37PlPe+2y50I+yJbD8x0ZlonRHuRYJ9ewnHLaWrUJJLWICqCoTXOLfOuIl8jcXNH2Zov2mF1vKIEsdvBGOqC1txkLHUTjtidOcVCo=');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Tower City','41.4972', '-81.6940', '230 W Huron Rd, Cleveland, OH 44113','www.towercitycenter.com/', '10', '19', '(216) 623-4750','https://devaulphotography.files.wordpress.com/2012/08/tower-city-center.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE','TRUE','Tower City Center, originally known as Cleveland Union Terminal, is a large mixed-use facility located on Public Square in downtown Cleveland, Ohio.' );


INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Jack Casino','41.498630', '-81.693118', '100 Public Square, Cleveland, OH 44113','jackentertainment.com/', '0', '23', '(216) 297-4777','http://rs346.pbsrc.com/albums/p411/kevincrumedy/Jack-Casino_zpseyfpss0u.jpg?w=280&h=210&fit=crop', '0', 'TRUE', 'TRUE', 'FALSE', 'TRUE','TRUE', 'Jack Cleveland Casino is located in the former Higbee Building at Tower City Center in downtown Cleveland. The casino has 1,609 slot machines, 119 table games, and 35 electronic table games.' );

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Soldiers and Sailors Monument','41.499482', '-81.692742', '3 Public Square, Cleveland, OH 44114','soldiersandsailors.com', '10', '18', '(216) 621-3710', 'http://cdn.c.photoshelter.com/img-get2/I0000AhZyQyunf70/fit=1000x750/Ohio-Cleveland-The-Advance-Guard-Soldiers-and-Sailors-Monument.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE','Located in the southeast quadrant of Public Square in downtown Cleveland, it opened July 4, 1894. F.F. Schnitzer was the supervising architect who oversaw the creation of the structure. The monument is regularly open to the public free of charge.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Quicken Loans Arena','41.496559', '-81.688126', '1 Center Ct, Cleveland, OH 44115','theqarena.com', '88', '88', ' (216) 420-2000', 'http://www.nbabasketballarenas.com/images/Quicken-Loans-Arena.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The building is the home of the Cleveland Cavaliers of the National Basketball Association (NBA), the Cleveland Monsters of the American Hockey League, and the Cleveland Gladiators of the Arena Football League. The arena opened in October 1994 as part of the Gateway Sports and Entertainment Complex with adjacent Progressive Field, which opened in April of that year.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Progressive Field','41.496177','-81.684649', '2401 Ontario St, Cleveland, OH 44115','cleveland.indians.mlb.com', '88', '88', ' (216) 420-4487', 'http://www.theballparkguide.com/graphics/cleveland-indians/progressive-field-sign.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Progressive Field is a baseball park located in the downtown area of Cleveland, Ohio, United States. It is the home field of the Cleveland Indians of Major League Baseball and, together with Quicken Loans Arena, is part of the Gateway Sports and Entertainment Complex.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Museum of Art','41.509723', '-81.611485', '11150 East Blvd, Cleveland, OH 44106','clevelandart.org', '10', '17', '(216) 421-7350', 'http://www.destination360.com/north-america/us/ohio/images/s/cleveland-museum-of-art.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The Cleveland Museum of Art (CMA) is an art museum located in the Wade Park District, in the University Circle neighborhood on Clevelands east side. Internationally renowned for its substantial holdings of Asian and Egyptian art, the museum houses a diverse permanent collection of more than 45,000 works of art from around the world.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Lakeview Cemetery','41.513455','-81.588915', '12316 Euclid Ave, Cleveland, OH 44106', 'lakeviewcemetery.com', '10', '17', '(216) 421-2665', 'https://s3-us-west-2.amazonaws.com/find-a-grave-prod/photos/2005/25/CEM915_110680411771.jpg', '0', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'Lake View Cemetery is on the east side of Cleveland, Ohio, along the East Cleveland and Cleveland Heights borders. More than 104,000 people are buried at Lake View, with more than 700 burials each year.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Metroparks Zoo','41.446518','-81.707773', '3900 Wildlife Way, Cleveland, OH 44109', 'clevelandmetroparks.com', '10', '17', '(216) 661-6500', 'https://www.2016cle.com/RNC2016/media/RNC2016/Things%20to%20Do/Parks%20and%20Recreation/cleveland_metroparks_zoo.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The Cleveland Metroparks Zoo is a 183-acre (74 ha) zoo in Cleveland, Ohio. The Zoo is divided into several areas: Australian Adventure; African Savanna; Northern Trek; The Primate, Cat & Aquatics Building; The RainForest; and Waterfowl Lake.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('West Side Market','41.484692', '-81.703062', '1975 W 25th St, Cleveland, OH 44113', 'westsidemarket.org', '7', '18', '(216) 664-3387', 'https://planning-org-uploaded-media.s3.amazonaws.com/legacy_resources/greatplaces/spaces/2008/img/westsidemarket01.jpg', '1425', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The West Side Market is the oldest operating indoor/outdoor market space in Cleveland, Ohio. It is located at the corner of West 25th Street and Lorain Avenue in the Ohio City neighborhood.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Willard Park(Free Stamp)','41.505379', '-81.692324', 'Cleveland, OH 44114', null, '0', '23', '(216) 664-2485', 'https://devaulphotography.files.wordpress.com/2012/08/free-stamp-1a.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE','Willard Park is a public park in downtown Cleveland, in the U.S. state of Ohio. The park sits at the northwest corner of East 9th Street and Lakeside Avenue, adjacent to Cleveland City Hall, and is within the boundaries of the Cleveland Mall historic district. It is the location of the public sculpture Free Stamp, and is the home of the original Cleveland Fire Fighters Memorial.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Playhouse Square','41.501275','-81.680723', '1501 Euclid Ave, Cleveland, OH 44115', 'playhousesquare.org', '88', '88', '(216) 241-6000', 'https://segd.org/sites/default/files/styles/galleryformatter_slide/public/Playhouse_spectacular.jpg?itok=Kt7ZE3lS', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Playhouse Square is a theater district in downtown Cleveland, Ohio. It is the largest performing arts center in the United States outside of New York.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Museum of Natural History','41.511470', '-81.613358', '1 Wade Oval Dr, Cleveland, OH 44106', 'cmnh.org' , '10', '17', '(216) 231-4600', 'http://media.architecturaldigest.com/photos/55f9dfa600a69f791feb27b2/master/pass/dam-images-daily-2015-04-cleveland-museum-cleveland-museum-of-natural-history-150-million-expansion-01.jpg', '1500', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The Cleveland Museum of Natural History is a natural history museum located approximately five miles (8 km) east of downtown Cleveland, Ohio in University Circle, a 550-acre (220 ha) concentration of educational, cultural and medical institutions.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('The Largest Outdoor Chandelier in The World','41.500902', '-81.681771', 'E 14th St, Cleveland, OH 44115', null , '0', '23', null, 'http://images.midwestliving.mdpcdn.com/sites/midwestliving.com/files/102718406_w.jpg', '0', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE','The historic Playhouse Square Theater district displays a 20 ft. tall chandelier made with 4,200 crystals, hanging 44 ft. above the street.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Museum of Contemporary Art Cleveland','41.508908', '-81.604637', '11400 Euclid Ave, Cleveland, OH 44106', 'mocacleveland.org' , '11', '17', '(216) 421-8671', 'http://planning.city.cleveland.oh.us/projects/assets/projectID44_182.jpg', '950', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','The Museum of Contemporary Art Cleveland, better known by its acronym, MOCA, is a contemporary art museum located in Cleveland, Ohio. Founded in 1968 by Marjorie Talalay, Agnes Gund, and Nina Castelli Sundell as The New Gallery, the museum was renamed the Cleveland Center for Contemporary Art in 1984.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Childrens Museum of Cleveland','41.504248','-81.659839', '3813 Euclid Ave, Cleveland, OH 44115', 'clevelandchildrensmuseum.org' , '88', '88', '(216) 791-7114', 'http://community-wealth.org/sites/clone.community-wealth.org/files/styles/large/public/Children%27s%20museum.jpg?itok=FNIz9zaQ', '808', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','It is dedicated to helping young children develop physically, emotionally, and socially. It also encourages adults to aid children in their development. One permanent exhibit, Splish! Splash!, is designed to teach children, through interactive displays, about water transportation.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Rock and Roll Hall of Fame','41.508546', '-81.695368', '1100 E 9th St, Cleveland, OH 44114', 'rockhall.com' , '10', '17', '(216) 781-7625', 'http://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/525/2015/12/01201858/rock-and-roll-hall-of-fame-and-muse.jpg', '2350', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Rock and Roll Hall of Fame and Museum, located on the shore of Lake Erie in downtown Cleveland, Ohio, recognizes and archives the history of the best-known and most influential artists, producers, engineers, and other notable figures who have had some major influence on the development of rock and roll.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Great Lakes Science Center','41.507424', '-81.696724', '601 Erieside Ave, Cleveland, OH 44114', 'greatscience.com' , '10', '17', '(216) 694-2000', 'http://cache.marriott.com/propertyimages/c/clewb/phototour/clewb_phototour32.jpg?Log=1', '950', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Great Lakes Science Center is a museum and educational facility in downtown Cleveland, Ohio, United States. Many of the exhibits document the features of the natural environment in the Great Lakes region of the United States.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('A Christmas Story House','41.468730','-81.687394', '3159 W 11th St, Cleveland, OH 44109', 'achristmasstoryhouse.com' , '10', '17', '(216) 298-4919', 'https://upload.wikimedia.org/wikipedia/commons/a/aa/A_Christmas_Story_house.JPG', '1100', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','A Christmas Story House is a museum in Cleveland, Ohios Tremont neighborhood. The 19th-century Victorian, which was used in the exterior scenes of Ralphie Parkers house in the 1983 film A Christmas Story, was purchased by a private developer in 2004 and has been restored and renovated to appear as it did both inside and outside in the film.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('USS Cod Submarine Memorial','41.510090','-81.691571', '1201 N Marginal Rd, Cleveland, OH 44114', 'usscod.org' , '10', '17', '(216) 566-8770', 'https://static.spplus.com/pictures/uss-cod-small.jpg', '1200', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','USS Cod (SS/AGSS/IXSS-224) is a Gato-class submarine, the only vessel of the United States Navy to be named for the cod, named after the worlds most important food fish of the North Atlantic and North Pacific.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Aquarium','41.496538', '-81.703793', '2000 Sycamore St, Cleveland, OH 44113', 'greaterclevelandaquarium.com' , '10', '17', '(216) 862-8803', 'http://inacents.com/wp-content/uploads/2013/09/130804-Greater-Cleveland-Aquarium-2.jpg', '2000', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Greater Cleveland Aquarium is an aquarium in Cleveland, Ohio, USA. Occupying the historic FirstEnergy Powerhouse building located on the west bank of the Cuyahoga River in the citys Flats district, the aquarium which opened in January 2012 consists of approximately 70,000 square feet (6,500 m2) of exhibition space and features exhibits representing both local and exotic species of fish.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Browns Stadium','41.506062', '-81.699570', '100 Alfred Lerner Way, Cleveland, OH 44114','firstenergystadium.com' , '88', '88', '(440) 891-5001', 'https://www.theclio.com/web/ul/25060.55019.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','First Energy Stadium is the home field of the Cleveland Browns of the National Football League (NFL), and serves as a venue for other events such as college and high school football, soccer, and concerts.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Great Northern Mall','41.417032', '-81.905928', '4954 Great Northern Mall, North Olmsted, OH 44070','shoppinggreatnorthernmall.com' , '10', '21', '(440) 734-6304', 'http://media.syracuse.com/post-standard/photo/2017/01/06/21822245-large.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Great Northern Mall, is a single-level enclosed shopping mall in North Olmsted, Ohio, a suburb of Cleveland. Its anchor stores are Macys, Dillards, Sears, J. C. Penney and Dicks Sporting Goods.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Beachwood Mall','41.498415', '-81.494066', '26300 Cedar Rd, Beachwood, OH 44122','beachwoodplace.com' , '10', '21', '(216) 464-9460', 'http://content.wkyc.com/photo/2014/06/05/1401995613000-Beachwood-Place_2924800_ver1.0.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Beachwood Place is an upscale shopping mall located in Beachwood, Ohio, a Greater Cleveland suburb. It opened in 1978 and is anchored by Dillards, Nordstrom,Zara, and Saks Fifth Avenue. More than 140 additional specialty shops and restaurants are located there, including Lacoste, Louis Vuitton within Saks, Swarovski, Chanel within Saks, L''Occitane En Provence, and Coach.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Richmond Town Square','41.541751', '-81.494481', '691 Richmond Rd, Richmond Heights, OH 44143','shoprichmondtownsquare.com' , '10', '21', '(440) 449-3200', 'http://www.wkyc.com/img/resize/content.wkyc.com/photo/2017/03/17/Richmond%20Town%20Square_1489791904673_8990596_ver1.0.JPG?preset=534-401', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Richmond Town Square is a super regional shopping mall, it''s anchor stores include JCPenney and Sears. Richmond  is also home to a 20-screen Regal Cinemas theater.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Baseball Heritage Museum','41.511171', '-81.644304', '6601 Lexington Ave, Cleveland, OH 44103','baseballheritagemuseum.org' , '10', '14', '(216) 789-1083', 'https://baseballheritagemuseum.org/wp-content/uploads/2015/11/20140921_123500-300x225-300x225.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','League Park was a baseball park located in Cleveland, Ohio, United States. It is situated at the northeast corner of E. 66th Street and Lexington Avenue in the Hough neighborhood. It was built in 1891 as a wood structure and rebuilt using concrete and steel in 1910.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Nature Center at Shaker Lakes','41.485030', '-81.574454', '2600 S Park Blvd, Cleveland, OH 44120','shakerlakes.org' , '10', '17', '(216) 321-5935', 'http://media.cleveland.com/shaker-heights/photo/nature-center2jpg-ba90b8fd172f8b0c.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Nature Center at Shaker Lakes is a nonprofit organization in Shaker Heights, Ohio that works to conserve a natural area, educate visitors about nature, and promote better environmental stewardship.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Wolstein Center','41.499331', '-81.676922', '2000 Prospect Ave, Cleveland, OH 44115', null , '88', '88', '(844) 407-2279', 'http://bloximages.newyork1.vip.townnews.com/csucauldron.com/content/tncms/assets/v3/editorial/8/74/874d5816-d731-11e4-a806-3bb8315f9447/5519d754a3912.image.jpg?resize=300%2C210', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Wolstein Center is an indoor arena located in downtown Cleveland, Ohio, United States, on the campus of Cleveland State University. It is home to the Cleveland State Vikings men''s and women''s basketball teams and the former home of the Cleveland Crunch and Cleveland Force of the NPSL and MISL.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Botanical Garden','41.511119', '-81.609579', '11030 East Blvd, Cleveland, OH 44106', 'cbgarden.org' , '10', '17', '(216) 721-1600', 'http://www.universitycircle.org/files/locations/slider/cleveland-botanical-garden-3.jpg', '1200', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','The Cleveland Botanical Garden, located in the University Circle neighborhood of Cleveland, Ohio, in the United States, was founded in 1930 as the Garden Center of Greater Cleveland. It was the first such organization in an American city. Originally housed in a converted boathouse on Wade Park Lagoon, the center served as a horticultural library, offering classes and workshops for gardeners and spearheading beautification projects in the community.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('International Womens Air & Space Museum','41.511520', '-81.689921', '1501 N Marginal Rd, Cleveland, OH 44114', 'iwasm.org' , '8', '20', '(216) 623-1111', 'https://static1.squarespace.com/static/54c6a8f9e4b0d827821a26e8/t/54c8f32ee4b06b0aa190b7a3/1422455628134/', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The International Womens Air & Space Museum, Inc. (IWASM) is a museum dedicated to the preservation of the history of women in aviation and space and the documentation of their continuing contributions today and in the future.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Orchestra','41.506223', '-81.609588', '11001 Euclid Ave, Cleveland, OH 44106', 'clevelandorchestra.com' , '88', '88', '(216) 231-1111', 'http://2.bp.blogspot.com/-KzX_yPwtIBw/U3AhkzaDxzI/AAAAAAAAC3U/_GWpItfwJ6k/s1600/resize_a.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Cleveland Orchestra, based in Cleveland, is one of the five American orchestras informally referred to as the "Big Five". Founded in 1918 by the pianist and impresario Adella Prentiss Hughes, the orchestra plays most of its concerts at Severance Hall. As of 2016, the incumbent music director is Franz Welser-Möst.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Garfield Park Reservation','41.430542', '-81.605177', '11350 Broadway Ave, Garfield Heights, OH 44125', 'clevelandmetroparks.com' , '0', '23', '(216) 341-3152', 'https://c1.staticflickr.com/4/3748/8936947421_fb4ff2f430_b.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','Garfield Park Reservation is located in Garfield Heights. The reservation features picnic areas, a wetland, and trails.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Lakefront Reservation (Euclid Beach)','41.582853', '-81.569555', '2-12 Cumberland Ave, Cleveland, OH 44110', 'clevelandmetroparks.com' , '0', '23', null, 'https://clevelandmetroparks.com/getmedia/37494a88-ffa1-4c6b-a793-abb5db35213f/Lakefront_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','From beaches to boat ramps, fitness trails to fishing piers, Lakefront Reservation is a true gem in the “Emerald Necklace” anchoring Cleveland Metroparks presence on the shores of Lake Erie. ');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Euclid Park Reservation','41.561766', '-81.531292', 'Euclid, OH 44143', 'clevelandmetroparks.com' , '0', '23', '(216) 382-5660', 'https://clevelandmetroparks.com/getmedia/3d853842-01ca-44c3-85fd-152a49445a66/Euclid_Creek_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','Follow Euclid Creek Valley along 2.5 miles of interesting geology along this verdant corridor, from Quarry Picnic Area to Highland Picnic Area.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Bedford Reservation','41.375932', '-81.576604', 'Cuyahoga Valley National Park, 14505 Button Rd, Walton Hills, OH 44146', 'clevelandmetroparks.com' , '0', '23', '(216) 635-3200', 'https://clevelandmetroparks.com/getmedia/aec40394-b044-4dd8-b16a-394bc439f934/Bedford_03.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','This reservation features a deep gorge carved out by Tinker’s Creek, with picturesque vistas and waterfalls.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Big Creek Reservation','41.445539', '-81.717816', '4101 Fulton Pkwy, Cleveland, OH 44144', 'clevelandmetroparks.com' , '0', '23', '(216) 635-3200', 'https://clevelandmetroparks.com/getmedia/45126d11-d74d-4386-b246-a077e9aeaa84/Big_Creek_Carousel.jpg.ashx?h=384&w=640&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','A major component of Big Creek Reservation is Big Creek Parkway, a refreshing alternative to the standard suburban commuter routes to Cleveland.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('East 55th Street Marina','441.531210', '-81.652075', '5555 N Marginal Rd, Cleveland, OH 44114', 'clevelandmetroparks.com' , '11', '23', '(216) 391-5566', 'http://edwardscom.net/wp-content/uploads/2014/07/E55th-St-Marina-Signage-II.jpg', '0', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE','Many new facilities at East 55th Street Marina are open to the public! Included are a 1,200-foot fishing platform, fully stocked bait shop and marina store, e55 on the Lake restaurant and bar, a brand new Valvtect Marine Certified fuel dock and sixteen courtesy guest docks available for daily use.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland City Hall','41.505012', '-81.693561', '601 Lakeside Ave E, Cleveland, OH 44114', 'city.cleveland.oh.us' , '8', '17', '(216) 664-2561', 'http://static.panoramio.com/photos/large/34898674.jpg', '0', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE','Cleveland City Hall was built in 1916 at 601 Lakeside Avenue in downtown Cleveland''s Civic Center and is where the Cleveland City Council meets.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Little Italy','41.508637', '-81.600320', 'Cleveland, OH 44106', null , '88', '88', null, 'https://lh3.googleusercontent.com/_4a0Y5-NnjiOUuNyahjJJ98fLCYk46h8qi1PSpaBjMQpf1TurPcxXFUFYOEj_MFhBFsYnkLXxzE5tGY3dmukxfB9sIAJcFwjL1E6336hPFIPu8NgDpQuenP3', '808', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE','Little Italy (known locally as "Murray Hill" or "The Hill")  is an ethnic enclave that serves as the historic center of Cleveland''s Italian American community. It is located from E. 119th to E. 125th streets on Murray Hill and Mayfield roads, situated at the eastern city limits, along a long, moderately sloping grade that ascends in elevation approximately 300 feet.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Crawford Auto-Aviation Museum','41.513415', '-81.610981', '10825 East Blvd, Cleveland, OH 44106', 'wrhs.org' , '88', '88', '(216) 721-5722', 'http://www.cityprofile.com/forum/attachments/ohio/18569-cleveland-crawford-auto-aviation-museum-2.jpg', '1000', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'The Crawford Auto-Aviation Museum is a collection in the University Circle neighborhood of Cleveland, Ohio. Part of the Western Reserve Historical Society and housed at the Cleveland History Center, it was founded by industrialist Frederick C. Crawford of TRW, and opened in 1965.');

INSERT INTO landmark(name, latitude, longitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Arcade','41.500041', '-81.690333', '401 Euclid Ave, Cleveland, OH 44114', 'theclevelandarcade.com' , '88', '88', '(216) 696-1408', 'http://www.theclevelandarcade.com/files/1949/gallery-arcade-interior-2.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','The Arcade in downtown Cleveland, Ohio, is a Victorian-era structure of two nine-story buildings, joined by a five-story arcade with a glass skylight spanning over 300 feet (91 m), along the four balconies.');

INSERT INTO itinerary(itineraryId, user_name, landmarkId, name, date_started, description) VALUES (1, 'AdamG', 3, 'Test Itinerary','2017-04-09','This is my first itinerary!');






COMMIT;