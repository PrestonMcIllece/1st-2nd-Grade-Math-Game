SET SESSION sql_mode = 'STRICT_ALL_TABLES';
DROP DATABASE IF EXISTS space_math;
CREATE DATABASE space_math;
USE space_math;

CREATE TABLE User (
	id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(32),
    lname VARCHAR(32),
	password VARCHAR(64),
    admin ENUM('Yes', 'No')
);	

CREATE TABLE Game (
	gamenum INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descript TEXT
);

CREATE TABLE Progress (
	userid INTEGER UNSIGNED  PRIMARY KEY,
	gamenum INTEGER UNSIGNED,
    dateplayed TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (userid) REFERENCES User (id),
    FOREIGN KEY (gamenum) REFERENCES Game (gamenum)
 
);

INSERT INTO User (fname, lname, password, admin) VALUES
	("Rachel", "Luker", "rachelpassword", "Yes"),
    ("Preston", "McIllece", "prestonpassword", "Yes"),
    ("Destin", "West", "destinpassword", "Yes"),
    ("Tiffany", "Taghvaiee", "tiffanypassword", "Yes"),
    ("chile", "1", "childpassword", "No");

INSERT INTO Game (descript) VALUES
    ("Students will be shown an expression and will have to decide whether adding or subtracting the numbers gives the correct answer"),
    ("Students will be shown an expression at the top of the screen and will have a grid of answer tiles to choose the correct answer from"),
    ("Students will be shown a 3 digit number with 1 of the numbers highlighted and they will have to select if that number is in the
    ones, tens, or hundreds place");

INSERT INTO Progress (userid, gamenum, dateplayed) VALUES
	(1, 1, NULL),
    (3, 2, NULL),
    (4, 3, NULL);




