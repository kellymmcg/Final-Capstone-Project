-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

DROP TABLE IF EXISTS app_user;
DROP SEQUENCE IF EXISTS seq_app_user_id;

CREATE SEQUENCE seq_app_user_id;

CREATE TABLE app_user (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_app_user_id'),
	user_name VARCHAR(64) NOT NULL,
	password VARCHAR(128) NOT NULL
);

INSERT INTO app_user(user_name, password) VALUES ('KevinC', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('AlexisT', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('KellyM', 'BravoAdmin');
INSERT INTO app_user(user_name, password) VALUES ('AdamG', 'BravoAdmin');

COMMIT;