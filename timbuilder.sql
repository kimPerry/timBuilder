CREATE DATABASE timbuilder

CREATE TABLE RSU(
	rsu_id INT NOT NULL AUTO_INCREMENT,
	url VARCHAR(255) NOT NULL,
	rsu_username VARCHAR(255) NOT NULL,
	rsu_password VARCHAR(255) NOT NULL,
	latitude DECIMAL(11, 8) NOT NULL,
	longitude DECIMAL(11, 8) NOT NULL,
	milepost DECIMAL(38, 8),
	PRIMARY KEY (rsu_id)
);

CREATE TABLE MILEPOST(
	milepost_id INT NOT NULL AUTO_INCREMENT,
	route VARCHAR(255),
	milepost DECIMAL(38, 8),
	direction VARCHAR(255),
	latitude DECIMAL(11, 8),
	longitude DECIMAL(11, 8),
	elevation_ft DECIMAL(38, 8),
	bearing DECIMAL(38,8),	
	PRIMARY KEY (milepost_id)
);

CREATE TABLE CATEGORY(
	category_id INT NOT NULL AUTO_INCREMENT,
	category VARCHAR(255),	
	PRIMARY KEY (category_id)
);

CREATE TABLE ITIS_CODE(
	itis_code_id INT NOT NULL AUTO_INCREMENT,
	itis_code INT,
	description VARCHAR(255),
	category_id INT NOT NULL,
	PRIMARY KEY (itis_code_id),
	CONSTRAINT fk_category FOREIGN KEY (category_id) 	
	REFERENCES CATEGORY(category_id)
);

INSERT INTO RSU (url, rsu_username, rsu_password, latitude, longitude)
VALUES ('192.168.0.145', 'v3user', 'password', 41.123456, 110.123456);

INSERT INTO CATEGORY (category)
VALUES ('speedLimit');

INSERT INTO CATEGORY (category)
VALUES ('advisory');

INSERT INTO CATEGORY (category)
VALUES ('workZone');

INSERT INTO CATEGORY (category)
VALUES ('exitService');

INSERT INTO ITIS_CODE (description, category_id, itis_code)
VALUES ('Speed Limit', 1, 268);


INSERT INTO ITIS_CODE (description, category_id, itis_code)
VALUES ('Accident', 2, 513);


INSERT INTO ITIS_CODE (description, category_id, itis_code)
VALUES ('Incident', 2, 531);

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 0.0, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 0.2, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 0.6, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 0.8, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 1.0, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 1.2, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 1.4, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 1.6, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 1.8, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 2.0, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 2.2, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 2.4, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 2.6, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 2.8, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 3.0, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 3.2, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 3.4, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 3.6, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 3.8, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 4.0, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 4.2, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 4.4, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 4.6, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 4.8, 'westbound')

INSERT INTO MILEPOST (route, milepost, direction, latitude, longitude, elevation_ft, bearing)
VALUES ('I 80', 5.0, 'westbound')


