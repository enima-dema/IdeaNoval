CREATE DATABASE ideanovaldb;

USE ideanovaldb;

CREATE TABLE member(
id_member INT NOT NULL AUTO_INCREMENT,
lastname VARCHAR(100),
firstname VARCHAR(100),
email VARCHAR(200),
password VARCHAR(30),
nickname VARCHAR(100),
is_active BOOLEAN,
user_type TINYINT,
PRIMARY KEY (id_member)
);

CREATE TABLE comments(
id_comments INT NOT NULL AUTO_INCREMENT,
content BLOB(500),
date_post DATETIME,
is_report BOOLEAN,
is_active BOOLEAN,
FOREIGN KEY id_member
REFERENCES member (id_member),
FOREIGN KEY id_idea
REFERENCES idea (id_idea),
PRIMARY KEY(id_comments)
);

CREATE TABLE idea (
	id_idea INT NOT NULL AUTO_INCREMENT,
	title_idea VARCHAR(50),
	desc_idea BLOB(1000),
	date_post_idea DATE,
	delay_idea INT,
	date_end_vote_i DATE,
	active_status_i BOOLEAN,
	type_idea TINYINT
	PRIMARY KEY(id_idea)
);

CREATE TABLE vote(
vote_top_flop TINYINT(1),
FOREIGN KEY id_member
REFERENCES member (id_member),
FOREIGN KEY id_idea
REFERENCES idea (id_idea),
PRIMARY KEY (id_member,id_idea)
);