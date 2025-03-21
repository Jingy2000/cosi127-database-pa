CREATE TABLE MotionPicture(
id INTEGER,
name VARCHAR(255),
rating FLOAT CHECK(rating >= 0 AND rating <=10),
-- use VARCHAR(255) instead of CHAR
production VARCHAR(255),
budget BIGINT CHECK(budget >= 0),
PRIMARY KEY(id)
);

CREATE TABLE User(
email VARCHAR(255),
name VARCHAR(255),
age INTEGER,
PRIMARY KEY(email)
);

CREATE TABLE Likes(
uemail VARCHAR(255),
mpid INTEGER,
-- add primary key
PRIMARY KEY(uemail,mpid),
FOREIGN KEY(uemail) REFERENCES User(email) ON DELETE CASCADE,
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);

CREATE TABLE Movie(
-- add mpid as primary key
mpid INTEGER PRIMARY KEY,
boxoffice_collection BIGINT CHECK(boxoffice_collection >=0),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE);

CREATE TABLE Series(
-- add mpid as primary key
mpid INTEGER PRIMARY KEY,
-- add season_count check: at least 1
season_count INTEGER CHECK(season_count >= 1),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE);

CREATE TABLE People(
id INTEGER PRIMARY KEY,
name VARCHAR(255),
nationality VARCHAR(255),
dob DATE,
-- gender can be use less space
gender VARCHAR(10)
);

CREATE TABLE Role(
mpid INTEGER,
pid INTEGER,
role_name VARCHAR(255),
PRIMARY KEY(mpid,pid,role_name),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE,
FOREIGN KEY(pid) REFERENCES People(id) ON DELETE CASCADE);

CREATE TABLE Award(
mpid INTEGER,
pid INTEGER,
award_name VARCHAR(255),
award_year YEAR,
PRIMARY KEY(mpid,pid,award_name,award_year),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE,
FOREIGN KEY(pid) REFERENCES People(id) ON DELETE CASCADE);

CREATE TABLE Genre(
mpid INTEGER,
genre_name VARCHAR(255),
PRIMARY KEY(mpid,genre_name),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE);

CREATE TABLE Location(
mpid INTEGER,
zip VARCHAR(10),
city VARCHAR(255),
country VARCHAR(255),
PRIMARY KEY(mpid,zip),
FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE);
