-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

DROP TABLE IF EXISTS app_user;
DROP SEQUENCE IF EXISTS seq_app_user_id;	
DROP TABLE IF EXISTS landmark;
DROP SEQUENCE IF EXISTS seq_landmark_id;	

CREATE SEQUENCE seq_app_user_id;

CREATE TABLE app_user (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_app_user_id'),
	user_name VARCHAR(64) NOT NULL,
	password VARCHAR(128) NOT NULL,
	salt VARCHAR(480) NOT NULL
);

CREATE SEQUENCE seq_landmark_id;

CREATE TABLE landmark (
id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_landmark_id'),
reviewid INTEGER NOT NULL,
name VARCHAR(128) NOT NULL,
longitude FLOAT NOT NULL,
latitude FLOAT NOT NULL,
address VARCHAR(256) NOT NULL,
website VARCHAR(256),
open_time INTEGER NOT NULL,
close_time INTEGER NOT NULL,
phone VARCHAR(32) NOT NULL,
image VARCHAR(256) NOT NULL,
admission INTEGER NOT NULL,
handicap_accessible BOOLEAN,
consession BOOLEAN,
kid_friendly BOOLEAN,
water BOOLEAN,
restroom BOOLEAN

);

INSERT INTO app_user(user_name, password, salt) VALUES ('KevinC', 'Z+6dbfgKW9yOzFOoTOkL2A==', 'o7BHFhCTGHVmsaQ/aV/eMtPLAKwjny7PfHNHYxNurH8jNTB98T6GXTKttD2Q/Oqkpp++6kqt0x1wwtk/dhYHslKuROy4z3exR3uKDEHXW+SYNXlGLpW5niA56ej2Jc/yCR5liYjKko8U3cGNuUFp/jp5bpfiLC1qif55iji0qZc=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AlexisT', 'ur6k/xfmGaYHjehKRyHM7w==', 'VZnfAUcRVK1W+5d62n6EBtmjN5o8VcdaeKSKiyJ/ufiWi4zcWlAP+4OqWjwViZCWUWTVETdz0RCaEXeYBFtVpcAFqCslnPPpETsIvdHl+Vf1pSudvqOl47y++QwQ0KAJa/DILzgqxe1mLoMfYwE0X8BEKgRzHAaBFBwXHE+uUTs=');
INSERT INTO app_user(user_name, password, salt) VALUES ('KellyM', 'abCu2Z/ss3lg15kZHH9a6A==', 'f1ekHQbXYiuAIvWspr/AkYwqewm/zGAgq7MiyLbI5Ddzw4bt8LZEh/H0eJ9BxbHuxF0UTSbMzivyuxhG0Uyd7ulEDH+DHIw389AD6BhK2A5KnDghFDneLj+hayKeG5ak/BHWBqInOoE2oMZrh/fiO5mve5U8PGhXePuwWDKris8=');
INSERT INTO app_user(user_name, password, salt) VALUES ('AdamG', 'QAHQxJ5fL70bj4KA1XqOEQ==', 'Kl9CB9BA1QQHdSBpDhafg8rdyWkhlf5s7jxbCKFURNQB26/OROT+K714NBADlkJBj009M+37PlPe+2y50I+yJbD8x0ZlonRHuRYJ9ewnHLaWrUJJLWICqCoTXOLfOuIl8jcXNH2Zov2mF1vKIEsdvBGOqC1txkLHUTjtidOcVCo=');

INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom)
VALUES ('1','1','Tower City','41.4972', '-81.6940', '230 W Huron Rd, Cleveland, OH 44113','www.towercitycenter.com/', '10', '15', '(216) 623-4750','https://devaulphotography.files.wordpress.com/2012/08/tower-city-center.jpg', '0', 'TRUE', 'TRUE', 'TRUE', 'TRUE','TRUE' );
INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom)
VALUES ('2','1','Jack Casino','41.498630', '-81.693118', '100 Public Square, Cleveland, OH 44113','jackentertainment.com/', '0', '23', '(216) 297-4777','http://rs346.pbsrc.com/albums/p411/kevincrumedy/Jack-Casino_zpseyfpss0u.jpg?w=280&h=210&fit=crop', '0', 'TRUE', 'TRUE', 'FALSE', 'TRUE','TRUE' );
INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom)
VALUES ('3','1','Soldiers and Sailors Monument','41.499482', '-81.692742', '3 Public Square, Cleveland, OH 44114','soldiersandsailors.com', '10', '14', '(216) 621-3710', 'http://cdn.c.photoshelter.com/img-get2/I0000AhZyQyunf70/fit=1000x750/Ohio-Cleveland-The-Advance-Guard-Soldiers-and-Sailors-Monument.jpg', '0', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE');
INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom)
VALUES ('4','1','Quicken Loans Arena','41.496559', '-81.688126', '1 Center Ct, Cleveland, OH 44115','theqarena.com', '88', '88', ' (216) 420-2000', 'http://www.nbabasketballarenas.com/images/Quicken-Loans-Arena.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE');
INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone, image, admission, handicap_accessible, consession, kid_friendly, water, restroom)
VALUES ('5','1','Progressive Field','41.496177','-81.684649', '2401 Ontario St, Cleveland, OH 44115','cleveland.indians.mlb.com', '88', '88', ' (216) 420-4487', 'http://www.theballparkguide.com/graphics/cleveland-indians/progressive-field-sign.jpg', '808', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE');



COMMIT;