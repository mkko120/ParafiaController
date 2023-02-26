DROP DATABASE IF EXISTS portal;
CREATE DATABASE portal;
CREATE USER 'portal'@'localhost' IDENTIFIED BY 'zaq1@WSX';
GRANT ALL PRIVILEGES ON portal.* TO 'portal'@'localhost';

USE portal;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE admins (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    privileges integer NOT NULL, # level of privileges; the higher the number, the more admin can do
    PRIMARY KEY (id),
    FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE nabozenstwa (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(255) NOT NULL,
    opis VARCHAR(255) NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE rezerwacje (
    id INT NOT NULL AUTO_INCREMENT,
    id_uzytkownika INT NOT NULL,
    id_nabozenstwa INT NOT NULL,
    termin DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_uzytkownika) REFERENCES users(id),
    FOREIGN KEY (id_nabozenstwa) REFERENCES nabozenstwa(id)
);

INSERT INTO users (username, password) VALUES ('admin', 'admin');
INSERT INTO users (username, password) VALUES ('user', 'user');

INSERT INTO admins (username, privileges) VALUES ('admin', 100);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Intencje mszalne',
    'Intencje mszalne w trakcie modlitwy powszechnej',
    10.00
);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Rożaniec przed mszą świętą',
    'Modlitwa przed mszą świętą (jedna dziesiątka)',
    25.00
);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Wypominki',
    'Wypominki w trakcie mszy świętej',
    5.00
);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Chrzest',
    'Chrzest dziecka w Chrystusie Jezusie',
    200.00
);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Ślub',
    'Ślub w Kościele',
    500.00
);

INSERT INTO nabozenstwa (nazwa, opis, cena) VALUES (
    'Pogrzeb',
    'Pogrzeb na cmentarzu parafialnym',
    300.00
);

