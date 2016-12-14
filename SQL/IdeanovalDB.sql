CREATE DATABASE ideanovaldb;

USE ideanovaldb;

CREATE TABLE member(
id_member INT NOT NULL AUTO_INCREMENT,
lastname VARCHAR(100),
firstname VARCHAR(100),
email VARCHAR(200),
password VARCHAR(30),
nickname VARCHAR(100),
active_status_m BOOLEAN,
user_type TINYINT,
PRIMARY KEY (id_member)
);

CREATE TABLE theme (
id_theme INT NOT NULL AUTO_INCREMENT,
label_theme VARCHAR(50),
PRIMARY KEY(id_theme)
);

CREATE TABLE idea (
id_idea INT NOT NULL AUTO_INCREMENT,
title_idea VARCHAR(50),
desc_idea BLOB(1000),
date_post_idea DATE,
delay_idea INT,
date_end_vote_i DATE,
active_status_i BOOLEAN,
report_status_i BOOLEAN,
type_idea TINYINT,
id_theme INT NOT NULL,
FOREIGN KEY (id_theme)
REFERENCES theme(id_theme),
PRIMARY KEY(id_idea)
);

CREATE TABLE comment(
id_comment INT NOT NULL AUTO_INCREMENT,
content_comment BLOB(500),
date_post DATETIME,
report_status_c BOOLEAN,
active_status_c BOOLEAN,
id_member INT NOT NULL,
FOREIGN KEY (id_member)
REFERENCES member (id_member),
id_idea INT NOT NULL,
FOREIGN KEY (id_idea)
REFERENCES idea (id_idea),
PRIMARY KEY(id_comment)
);

CREATE TABLE vote(
vote_top_flop SMALLINT(2),
id_member INT NOT NULL,
FOREIGN KEY (id_member)
REFERENCES member (id_member),
id_idea INT NOT NULL,
FOREIGN KEY (id_idea)
REFERENCES idea (id_idea),
PRIMARY KEY (id_member,id_idea)
);

CREATE TABLE surveyoption(
id_s_option INT NOT NULL AUTO_INCREMENT,
label_s_option VARCHAR(150),
id_idea INT NOT NULL,
FOREIGN KEY(id_idea)
REFERENCES idea(id_idea),
PRIMARY KEY(id_s_option)
);

CREATE TABLE answer(
id_answer INT NOT NULL AUTO_INCREMENT,
label_other VARCHAR(100),
id_s_option INT NOT NULL,
id_member INT NOT NULL,
FOREIGN KEY (id_member)
REFERENCES member(id_member),
FOREIGN KEY (id_s_option)
REFERENCES surveyoption(id_s_option),
PRIMARY KEY(id_answer)
);

CREATE TABLE alert (
id_alert INT NOT NULL AUTO_INCREMENT,
date_alert DATETIME,
id_comment INT NOT NULL,
FOREIGN KEY (id_comment)
REFERENCES comment(id_comment),
id_idea INT NOT NULL,
FOREIGN KEY (id_idea)
REFERENCES idea(id_idea),
PRIMARY KEY(id_alert)
);

CREATE TABLE picture (
id_picture INT NOT NULL AUTO_INCREMENT,
caption_picture VARCHAR(50),
url_picture VARCHAR(255),
id_idea INT NOT NULL,
FOREIGN KEY(id_idea)
REFERENCES idea(id_idea),
PRIMARY KEY (id_picture)
);

