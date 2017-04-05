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
	salt VARCHAR(128) NOT NULL
);

CREATE SEQUENCE seq_landmark_id;

CREATE TABLE landmark (
id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_landmark_id'),
reviewid INTEGER NOT NULL,
name VARCHAR(128) NOT NULL,
longitude FLOAT NOT NULL,
latitude FLOAT NOT NULL,
address VARCHAR(256) NOT NULL,
website VARCHAR(256) NOT NULL,
open_time INTEGER NOT NULL,
close_time INTEGER NOT NULL,
phone VARCHAR (32) NOT NULL

);

INSERT INTO app_user(user_name, password, salt) VALUES ('KevinC', 'BravoAdmin', 'adminSalt');
INSERT INTO app_user(user_name, password, salt) VALUES ('AlexisT', 'BravoAdmin', 'adminSalt');
INSERT INTO app_user(user_name, password, salt) VALUES ('KellyM', 'BravoAdmin', 'adminSalt');
INSERT INTO app_user(user_name, password, salt) VALUES ('AdamG', 'BravoAdmin', 'adminSalt');

INSERT INTO landmark(id, reviewid, name, longitude, latitude, address, website, open_time, close_time, phone)
VALUES ('1','1','Tower City','41.4972', '81.6940', '230 W Huron Rd, Cleveland, OH 44113','www.towercitycenter.com/', '10', '7', '(216) 623-4750');
COMMIT;