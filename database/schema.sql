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
	password VARCHAR(128) NOT NULL
);

CREATE SEQUENCE seq_landmark_id;

CREATE TABLE landmark (
id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_landmark_id'),
reviewid INTEGER,
name VARCHAR(128) NOT NULL,
longitude FLOAT NOT NULL,
latitude FLOAT NOT NULL,
address VARCHAR(256) NOT NULL,
website VARCHAR(256),
open_time INTEGER,
close_time INTEGER,
phone VARCHAR (32) NOT NULL

);

INSERT INTO app_user(user_name, password) VALUES ('KevinC', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('AlexisT', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('KellyM', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('AdamG', 'BravoAdmin');

COMMIT;