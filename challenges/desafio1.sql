-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.Signature_Types(
    signature_id INT PRIMARY KEY AUTO_INCREMENT,
    signature_type VARCHAR(45) NOT NULL,
    signature_value DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(45) NOT NULL,
    user_age INT NOT NULL,
    user_signature_date DATE NOT NULL,
    signature_id INT NOT NULL,
    FOREIGN KEY (signature_id) REFERENCES SpotifyClone.Signature_Types (signature_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_title VARCHAR(100) NOT NULL,
    album_release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_title VARCHAR(100) NOT NULL,
    song_duration_sec INT NOT NULL,
    album_id INT NOT NULL,
	artist_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.Albums (album_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.History(
	user_id INT NOT NULL,
    song_id INT NOT NULL,
    history_date DATETIME NOT NULL,
	CONSTRAINT PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.Users (user_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.Songs (song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Following(
	user_id INT NOT NULL,
    artist_id INT,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.Users (user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Signature_Types (signature_type, signature_value)
VALUES
	('gratuito', '0.00'),
	('familiar', '7.99'),
	('universitário', '5.99'),
	('pessoal', '6.99');

INSERT INTO SpotifyClone.Users (user_name, user_age, signature_id, user_signature_date)
VALUES
	('Barbara Liskov', '82', '1', '2019-10-20'),
	('Robert Cecil Martin', '58', '1', '2017-01-06'),
	('Ada Lovelace', '37', '2', '2017-12-30'),
	('Martin Fowler', '46', '2', '2017-01-17'),
	('Sandi Metz', '58', '2', '2018-04-29'),
	('Paulo Freire', '19', '3', '2018-02-14'),
	('Bell Hooks', '26', '3', '2018-01-05'),
	('Christopher Alexander', '85', '4', '2019-06-05'),
	('Judith Butler', '45', '4', '2020-05-13'),
	('Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO SpotifyClone.Artists (artist_name)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
    
INSERT INTO SpotifyClone.Albums (album_title, album_release_year, artist_id)
VALUES
	('Renaissance', '2022', '1'),
	('Jazz', '1978', '2'),
	('Hot Space', '1982', '2'),
	('Falso Brilhante', '1998', '3'),
	('Vento de Maio', '2001', '3'),
	('QVVJFA?', '2003', '4'),
	('Somewhere Far Beyond', '2007', '5'),
	('I Put A Spell On You', '2012', '6');
    
INSERT INTO SpotifyClone.Songs (song_title, song_duration_sec, album_id, artist_id)
VALUES
	('Break My Soul', '279', '1', '1'),
	('Virgo\'s Groove', '369', '1', '1'),
	('Alien Superstar', '116', '1', '1'),
	('Don\'t Stop Me Now', '203', '2', '2'),
	('Under Pressure', '152', '3', '2'),
	('Como Nossos Pais', '105', '4', '3'),
	('O Medo de Amar é o Medo de Ser Livre', '207', '5', '3'),
	('Samba em Paris', '267', '6', '4'),
	('The Bard\'s Song', '244', '7', '5'),
	('Feeling Good', '100', '8', '6');
    
INSERT INTO SpotifyClone.History (user_id, song_id, history_date)
VALUES
	('1', '8', '2022-02-28 10:45:55'),
	('1', '2', '2020-05-02 05:30:35'),
	('1', '10', '2020-03-06 11:22:33'),
	('2', '10', '2022-08-05 08:05:17'),
	('2', '7', '2020-01-02 07:40:33'),
	('3', '10', '2020-11-13 16:55:13'),
	('3', '2', '2020-12-05 18:38:30'),
	('4', '8', '2021-08-15 17:10:10'),
	('5', '8', '2022-01-09 01:44:33'),
	('5', '5', '2020-08-06 15:23:43'),
	('6', '7', '2017-01-24 00:31:17'),
	('6', '1', '2017-10-12 12:35:20'),
	('7', '4', '2011-12-15 22:30:49'),
	('8', '4', '2012-03-17 14:56:41'),
	('9', '9', '2022-02-24 21:14:22'),
	('10', '3', '2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.Following (user_id, artist_id)
VALUES
    ('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');
