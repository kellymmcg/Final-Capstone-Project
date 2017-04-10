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




CREATE SEQUENCE seq_app_user_id;

CREATE TABLE app_user (
	userId INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_app_user_id'),
	user_name VARCHAR(64) NOT NULL,
	password VARCHAR(128) NOT NULL,
	salt VARCHAR(480) NOT NULL
);

CREATE SEQUENCE seq_landmark_id;

CREATE TABLE landmark (
landmarkId INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_landmark_id'),
name VARCHAR(128) NOT NULL,
longitude FLOAT NOT NULL,
latitude FLOAT NOT NULL,
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
	
	itineraryId INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_itinerary_id'),
	userId INTEGER NOT NULL,
	name VARCHAR(64) NOT NULL,
	date_started DATE,
	description VARCHAR(256),
	
	CONSTRAINT fk_itinerary_app_user FOREIGN KEY (userId) REFERENCES app_user(userId)
);

CREATE TABLE itinerary_details (
	
	itineraryId INTEGER NOT NULL,
	landmarkId INTEGER NOT NULL,
	
	CONSTRAINT pk_itinerary_details PRIMARY KEY (itineraryId, landmarkId),
	CONSTRAINT fk_itinerary__details_itinerary FOREIGN KEY (itineraryId) REFERENCES itinerary(itineraryId),
	CONSTRAINT fk_itinerary_details_landmark FOREIGN KEY (landmarkId) REFERENCES landmark(landmarkId)
);

INSERT INTO app_user(user_name, password, salt) VALUES ('KevinC', 'Z+6dbfgKW9yOzFOoTOkL2A==', 'o7BHFhCTGHVmsaQ/aV/eMtPLAKwjny7PfHNHYxNurH8jNTB98T6GXTKttD2Q/Oqkpp++6kqt0x1wwtk/dhYHslKuROy4z3exR3uKDEHXW+SYNXlGLpW5niA56ej2Jc/yCR5liYjKko8U3cGNuUFp/jp5bpfiLC1qif55iji0qZc=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AlexisT', 'ur6k/xfmGaYHjehKRyHM7w==', 'VZnfAUcRVK1W+5d62n6EBtmjN5o8VcdaeKSKiyJ/ufiWi4zcWlAP+4OqWjwViZCWUWTVETdz0RCaEXeYBFtVpcAFqCslnPPpETsIvdHl+Vf1pSudvqOl47y++QwQ0KAJa/DILzgqxe1mLoMfYwE0X8BEKgRzHAaBFBwXHE+uUTs=');
INSERT INTO app_user(user_name, password, salt) VALUES ('KellyM', 'abCu2Z/ss3lg15kZHH9a6A==', 'f1ekHQbXYiuAIvWspr/AkYwqewm/zGAgq7MiyLbI5Ddzw4bt8LZEh/H0eJ9BxbHuxF0UTSbMzivyuxhG0Uyd7ulEDH+DHIw389AD6BhK2A5KnDghFDneLj+hayKeG5ak/BHWBqInOoE2oMZrh/fiO5mve5U8PGhXePuwWDKris8=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AdamG', 'QAHQxJ5fL70bj4KA1XqOEQ==', 'Kl9CB9BA1QQHdSBpDhafg8rdyWkhlf5s7jxbCKFURNQB26/OROT+K714NBADlkJBj009M+37PlPe+2y50I+yJbD8x0ZlonRHuRYJ9ewnHLaWrUJJLWICqCoTXOLfOuIl8jcXNH2Zov2mF1vKIEsdvBGOqC1txkLHUTjtidOcVCo=');

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Tower City','41.4972', '-81.6940', '230 W Huron Rd, Cleveland, OH 44113','www.towercitycenter.com/', '10', '19', '(216) 623-4750','https://devaulphotography.files.wordpress.com/2012/08/tower-city-center.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE','TRUE','Tower City Center, originally known as Cleveland Union Terminal, is a large mixed-use facility located on Public Square in downtown Cleveland, Ohio.' );

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Jack Casino','41.498630', '-81.693118', '100 Public Square, Cleveland, OH 44113','jackentertainment.com/', '0', '23', '(216) 297-4777','http://rs346.pbsrc.com/albums/p411/kevincrumedy/Jack-Casino_zpseyfpss0u.jpg?w=280&h=210&fit=crop', '0', 'TRUE', 'TRUE', 'FALSE', 'TRUE','TRUE',null );

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Soldiers and Sailors Monument','41.499482', '-81.692742', '3 Public Square, Cleveland, OH 44114','soldiersandsailors.com', '10', '18', '(216) 621-3710', 'http://cdn.c.photoshelter.com/img-get2/I0000AhZyQyunf70/fit=1000x750/Ohio-Cleveland-The-Advance-Guard-Soldiers-and-Sailors-Monument.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Quicken Loans Arena','41.496559', '-81.688126', '1 Center Ct, Cleveland, OH 44115','theqarena.com', '88', '88', ' (216) 420-2000', 'http://www.nbabasketballarenas.com/images/Quicken-Loans-Arena.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Progressive Field','41.496177','-81.684649', '2401 Ontario St, Cleveland, OH 44115','cleveland.indians.mlb.com', '88', '88', ' (216) 420-4487', 'http://www.theballparkguide.com/graphics/cleveland-indians/progressive-field-sign.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Museum of Art','41.509723', '-81.611485', '11150 East Blvd, Cleveland, OH 44106','clevelandart.org', '10', '17', '(216) 421-7350', 'http://www.destination360.com/north-america/us/ohio/images/s/cleveland-museum-of-art.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Lakeview Cemetery','41.513455','-81.588915', '12316 Euclid Ave, Cleveland, OH 44106', 'lakeviewcemetery.com', '10', '17', '(216) 421-2665', 'https://s3-us-west-2.amazonaws.com/find-a-grave-prod/photos/2005/25/CEM915_110680411771.jpg', '0', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Metroparks Zoo','41.446518','-81.707773', '3900 Wildlife Way, Cleveland, OH 44109', 'clevelandmetroparks.com', '10', '17', '(216) 661-6500', 'https://www.2016cle.com/RNC2016/media/RNC2016/Things%20to%20Do/Parks%20and%20Recreation/cleveland_metroparks_zoo.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('West Side Market','41.484692', '-81.703062', '1975 W 25th St, Cleveland, OH 44113', 'westsidemarket.org', '7', '18', '(216) 664-3387', 'https://planning-org-uploaded-media.s3.amazonaws.com/legacy_resources/greatplaces/spaces/2008/img/westsidemarket01.jpg', '1425', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Willard Park(Free Stamp)','41.505379', '-81.692324', 'Cleveland, OH 44114', null, '0', '23', '(216) 664-2485', 'https://devaulphotography.files.wordpress.com/2012/08/free-stamp-1a.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Playhouse Square','41.501275','-81.680723', '1501 Euclid Ave, Cleveland, OH 44115', 'playhousesquare.org', '88', '88', '(216) 241-6000', 'https://segd.org/sites/default/files/styles/galleryformatter_slide/public/Playhouse_spectacular.jpg?itok=Kt7ZE3lS', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Museum of Natural History','41.511470', '-81.613358', '1 Wade Oval Dr, Cleveland, OH 44106', 'cmnh.org' , '10', '17', '(216) 231-4600', 'http://media.architecturaldigest.com/photos/55f9dfa600a69f791feb27b2/master/pass/dam-images-daily-2015-04-cleveland-museum-cleveland-museum-of-natural-history-150-million-expansion-01.jpg', '1500', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('The Largest Outdoor Chandelier in The World','41.500902', '-81.681771', 'E 14th St, Cleveland, OH 44115', null , '0', '23', null, 'http://images.midwestliving.mdpcdn.com/sites/midwestliving.com/files/102718406_w.jpg', '0', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Museum of Contemporary Art Cleveland','41.508908', '-81.604637', '11400 Euclid Ave, Cleveland, OH 44106', 'mocacleveland.org' , '11', '17', '(216) 421-8671', 'http://planning.city.cleveland.oh.us/projects/assets/projectID44_182.jpg', '950', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Childrens Museum of Cleveland','41.504248','-81.659839', '3813 Euclid Ave, Cleveland, OH 44115', 'clevelandchildrensmuseum.org' , '88', '88', '(216) 791-7114', 'http://community-wealth.org/sites/clone.community-wealth.org/files/styles/large/public/Children%27s%20museum.jpg?itok=FNIz9zaQ', '808', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Rock and Roll Hall of Fame','41.508546', '-81.695368', '1100 E 9th St, Cleveland, OH 44114', 'rockhall.com' , '10', '17', '(216) 781-7625', 'http://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/525/2015/12/01201858/rock-and-roll-hall-of-fame-and-muse.jpg', '2350', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Great Lakes Science Center','41.507424', '-81.696724', '601 Erieside Ave, Cleveland, OH 44114', 'greatscience.com' , '10', '17', '(216) 694-2000', 'http://cache.marriott.com/propertyimages/c/clewb/phototour/clewb_phototour32.jpg?Log=1', '950', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('A Christmas Story House','41.468730','-81.687394', '3159 W 11th St, Cleveland, OH 44109', 'achristmasstoryhouse.com' , '10', '17', '(216) 298-4919', 'https://upload.wikimedia.org/wikipedia/commons/a/aa/A_Christmas_Story_house.JPG', '1100', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('USS Cod Submarine Memorial','41.510090','-81.691571', '1201 N Marginal Rd, Cleveland, OH 44114', 'usscod.org' , '10', '17', '(216) 566-8770', 'https://static.spplus.com/pictures/uss-cod-small.jpg', '1200', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Aquarium','41.496538', '-81.703793', '2000 Sycamore St, Cleveland, OH 44113', 'greaterclevelandaquarium.com' , '10', '17', '(216) 862-8803', 'http://inacents.com/wp-content/uploads/2013/09/130804-Greater-Cleveland-Aquarium-2.jpg', '2000', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Browns Stadium','41.506062', '-81.699570', '100 Alfred Lerner Way, Cleveland, OH 44114','firstenergystadium.com' , '88', '88', '(440) 891-5001', 'https://www.theclio.com/web/ul/25060.55019.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Great Northern Mall','41.417032', '-81.905928', '4954 Great Northern Mall, North Olmsted, OH 44070','shoppinggreatnorthernmall.com' , '10', '21', '(440) 734-6304', 'http://media.syracuse.com/post-standard/photo/2017/01/06/21822245-large.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Beachwood Mall','41.498415', '-81.494066', '26300 Cedar Rd, Beachwood, OH 44122','beachwoodplace.com' , '10', '21', '(216) 464-9460', 'http://content.wkyc.com/photo/2014/06/05/1401995613000-Beachwood-Place_2924800_ver1.0.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Richmond Town Square','41.541751', '-81.494481', '691 Richmond Rd, Richmond Heights, OH 44143','shoprichmondtownsquare.com' , '10', '21', '(440) 449-3200', 'http://www.wkyc.com/img/resize/content.wkyc.com/photo/2017/03/17/Richmond%20Town%20Square_1489791904673_8990596_ver1.0.JPG?preset=534-401', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Baseball Heritage Museum','41.511171', '-81.644304', '6601 Lexington Ave, Cleveland, OH 44103','baseballheritagemuseum.org' , '10', '14', '(216) 789-1083', 'https://baseballheritagemuseum.org/wp-content/uploads/2015/11/20140921_123500-300x225-300x225.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Nature Center at Shaker Lakes','41.485030', '-81.574454', '2600 S Park Blvd, Cleveland, OH 44120','shakerlakes.org' , '10', '17', '(216) 321-5935', 'http://media.cleveland.com/shaker-heights/photo/nature-center2jpg-ba90b8fd172f8b0c.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Wolstein Center','41.499331', '-81.676922', '2000 Prospect Ave, Cleveland, OH 44115', null , '88', '88', '(844) 407-2279', 'http://bloximages.newyork1.vip.townnews.com/csucauldron.com/content/tncms/assets/v3/editorial/8/74/874d5816-d731-11e4-a806-3bb8315f9447/5519d754a3912.image.jpg?resize=300%2C210', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Botanical Garden','41.511119', '-81.609579', '11030 East Blvd, Cleveland, OH 44106', 'cbgarden.org' , '10', '17', '(216) 721-1600', 'http://www.universitycircle.org/files/locations/slider/cleveland-botanical-garden-3.jpg', '1200', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('International Womens Air & Space Museum','41.511520', '-81.689921', '1501 N Marginal Rd, Cleveland, OH 44114', 'iwasm.org' , '8', '20', '(216) 623-1111', 'https://static1.squarespace.com/static/54c6a8f9e4b0d827821a26e8/t/54c8f32ee4b06b0aa190b7a3/1422455628134/', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Orchestra','41.506223', '-81.609588', '11001 Euclid Ave, Cleveland, OH 44106', 'clevelandorchestra.com' , '88', '88', '(216) 231-1111', 'http://2.bp.blogspot.com/-KzX_yPwtIBw/U3AhkzaDxzI/AAAAAAAAC3U/_GWpItfwJ6k/s1600/resize_a.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Garfield Park Reservation','41.430542', '-81.605177', '11350 Broadway Ave, Garfield Heights, OH 44125', 'clevelandmetroparks.com' , '0', '23', '(216) 341-3152', 'https://c1.staticflickr.com/4/3748/8936947421_fb4ff2f430_b.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Lakefront Reservation (Euclid Beach)','41.582853', '-81.569555', '2-12 Cumberland Ave, Cleveland, OH 44110', 'clevelandmetroparks.com' , '0', '23', null, 'https://clevelandmetroparks.com/getmedia/37494a88-ffa1-4c6b-a793-abb5db35213f/Lakefront_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Euclid Park Reservation','41.561766', '-81.531292', 'Euclid, OH 44143', 'clevelandmetroparks.com' , '0', '23', '(216) 382-5660', 'https://clevelandmetroparks.com/getmedia/3d853842-01ca-44c3-85fd-152a49445a66/Euclid_Creek_Thumb_01.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Bedford Reservation','41.375932', '-81.576604', 'Cuyahoga Valley National Park, 14505 Button Rd, Walton Hills, OH 44146', 'clevelandmetroparks.com' , '0', '23', '(216) 635-3200', 'https://clevelandmetroparks.com/getmedia/aec40394-b044-4dd8-b16a-394bc439f934/Bedford_03.jpg.ashx?h=300&w=500&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Big Creek Reservation','41.445539', '-81.717816', '4101 Fulton Pkwy, Cleveland, OH 44144', 'clevelandmetroparks.com' , '0', '23', '(216) 635-3200', 'https://clevelandmetroparks.com/getmedia/45126d11-d74d-4386-b246-a077e9aeaa84/Big_Creek_Carousel.jpg.ashx?h=384&w=640&mode=crop&scale=both', '0', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('East 55th Street Marina','441.531210', '-81.652075', '5555 N Marginal Rd, Cleveland, OH 44114', 'clevelandmetroparks.com' , '11', '23', '(216) 391-5566', 'http://edwardscom.net/wp-content/uploads/2014/07/E55th-St-Marina-Signage-II.jpg', '0', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland City Hall','41.505012', '-81.693561', '601 Lakeside Ave E, Cleveland, OH 44114', 'city.cleveland.oh.us' , '8', '17', '(216) 664-2561', 'http://static.panoramio.com/photos/large/34898674.jpg', '0', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Little Italy','41.508637', '-81.600320', 'Cleveland, OH 44106', null , '88', '88', null, 'https://lh3.googleusercontent.com/_4a0Y5-NnjiOUuNyahjJJ98fLCYk46h8qi1PSpaBjMQpf1TurPcxXFUFYOEj_MFhBFsYnkLXxzE5tGY3dmukxfB9sIAJcFwjL1E6336hPFIPu8NgDpQuenP3', '808', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Crawford Auto-Aviation Museum','41.513415', '-81.610981', '10825 East Blvd, Cleveland, OH 44106', 'wrhs.org' , '88', '88', '(216) 721-5722', 'http://www.cityprofile.com/forum/attachments/ohio/18569-cleveland-crawford-auto-aviation-museum-2.jpg', '1000', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO landmark(name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom, description)
VALUES ('Cleveland Arcade','41.500041', '-81.690333', '401 Euclid Ave, Cleveland, OH 44114', 'theclevelandarcade.com' , '88', '88', '(216) 696-1408', 'http://www.theclevelandarcade.com/files/1949/gallery-arcade-interior-2.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE',null);

INSERT INTO itinerary(userId, name, date_started, description) VALUES (4,'Test Itinerary','2017-04-09','This is my first itinerary!');
INSERT INTO itinerary(userId, name, date_started, description) VALUES (2,'Test Itinerary','2017-04-09','This is my first itinerary!');
INSERT INTO itinerary(userId, name, date_started, description) VALUES (4,'Second Itinerary','2017-04-09','This is my first itinerary!');

INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (1, 1);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (1, 2);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (1, 3);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (2, 4);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (2, 1);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (2, 16);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (3, 1);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (3, 15);
INSERT INTO itinerary_details(itineraryId, landmarkId) VALUES (3, 7);



COMMIT;