-- Ideanoval --
CREATE DATABASE ideanovaldb;

USE ideanovaldb;

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

