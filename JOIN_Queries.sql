CREATE TABLE tours (
    id SERIAL PRIMARY KEY,
    tour_name TEXT NOT NULL UNIQUE, 
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date >= start_date), 
    price REAL NOT NULL CHECK (price >= 0), 
    max_participants INT NOT NULL CHECK (max_participants >= 0), 
    guide_name TEXT NOT NULL,
    difficulty_level TEXT CHECK(difficulty_level IN ('Easy', 'Medium', 'Hard')) NOT NULL,
    pickup_location TEXT NOT NULL
);

INSERT INTO tours (tour_name, description, start_date, end_date, price, max_participants, guide_name, difficulty_level, pickup_location) VALUES
('Jerusalem Historical Tour', 'A guided tour through the Old City and Western Wall', '2025-03-10', '2025-03-10', 250.00, 25, 'Leonardo DiCaprio', 'Medium', 'Tel Aviv'),
('Jerusalem Night Tour', 'A magical night tour of historical sites', '2025-04-05', '2025-04-05', 280.00, 20, 'Jon Snow', 'Medium', 'Jerusalem'),
('Dead Sea Experience', 'A relaxing day at the Dead Sea with a visit to Masada', '2025-03-15', '2025-03-15', 320.00, 30, 'Brad Pitt', 'Easy', 'Tel Aviv'),
('Dead Sea Adventure', 'Floating in the Dead Sea and exploring Ein Gedi', '2025-05-02', '2025-05-02', 290.00, 28, 'Tyrion Lannister', 'Easy', 'Jerusalem'),
('Galilee and Sea of Galilee Tour', 'A scenic tour through the Galilee region', '2025-06-12', '2025-06-12', 350.00, 35, 'Scarlett Johansson', 'Medium', 'Haifa'),
('Mount Hermon Snow Trip', 'A winter adventure in Mount Hermon', '2025-02-20', '2025-02-21', 400.00, 20, 'Daenerys Targaryen', 'Hard', 'Tel Aviv'),
('Haifa and Akko Coastal Tour', 'A coastal journey through Haifa and Akko', '2025-07-07', '2025-07-07', 280.00, 30, 'Jaime Lannister', 'Easy', 'Haifa'),
('Eilat Desert Adventure', 'A thrilling jeep tour in the Eilat mountains', '2025-09-18', '2025-09-19', 500.00, 20, 'Tom Cruise', 'Hard', 'Eilat'),
('Negev Desert and Ramon Crater', 'Exploring the Negev and the famous Ramon Crater', '2025-10-10', '2025-10-11', 450.00, 25, 'Gandalf', 'Hard', 'Beersheba'),
('Nazareth and Christian Landmarks', 'A visit to the Holy Land sites in Nazareth', '2025-08-08', '2025-08-08', 300.00, 30, 'Legolas', 'Medium', 'Tel Aviv'),
('Tel Aviv City Tour', 'Exploring the modern and vibrant city of Tel Aviv', '2025-11-05', '2025-11-05', 260.00, 35, 'Frodo Baggins', 'Easy', 'Tel Aviv'),
('Judean Desert and Qumran Caves', 'A historical trip to the ancient caves of Qumran', '2025-12-01', '2025-12-01', 350.00, 25, 'Michael Jordan', 'Medium', 'Jerusalem');

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    country_name TEXT NOT NULL UNIQUE
);

INSERT INTO countries (country_name) VALUES 
('USA'),
('France'),
('Italy'),
('Spain'),
('Canada'),
('Japan'),
('Brazil'),
('Australia'),
('India'),
('Mexico');

CREATE TABLE tourists (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INT NOT NULL,
    tour_id INT NULL, -- Each tourist may be assigned to a tour or remain NULL
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (tour_id) REFERENCES tours(id) ON DELETE SET NULL
);

INSERT INTO tourists (first_name, last_name, passport_number, date_of_birth, gender, email, phone, country_id, tour_id) VALUES
('Leonardo', 'DiCaprio', 'P123456', '1974-11-11', 'Male', 'leo.d@gmail.com', '+1-555123456', 1, NULL),
('Brad', 'Pitt', 'P234567', '1963-12-18', 'Male', 'brad.p@hotmail.com', '+1-555234567', 1, NULL),
('Tom', 'Cruise', 'P345678', '1962-07-03', 'Male', 'tom.c@amazon.com', '+1-555345678', 1, NULL),
('Scarlett', 'Johansson', 'P456789', '1984-11-22', 'Female', 'scarlett.j@gmail.com', '+1-555456789', 2, NULL),
('Natalie', 'Portman', 'P567890', '1981-06-09', 'Female', 'natalie.p@hotmail.com', '+1-555567890', 2, NULL),
('Tyrion', 'Lannister', 'P678901', '1978-05-25', 'Male', 'tyrion.l@amazon.com', '+1-555678901', 3, 11),
('Jon', 'Snow', 'P789012', '1986-12-26', 'Male', 'jon.s@gmail.com', '+1-555789012', 3, 6),
('Arya', 'Stark', 'P890123', '1996-03-10', 'Female', 'arya.s@hotmail.com', '+1-555890123', 4, 11),
('Daenerys', 'Targaryen', 'P901234', '1990-04-20', 'Female', 'dany.t@amazon.com', '+1-555901234', 4, 10),
('Jaime', 'Lannister', 'P012345', '1975-09-17', 'Male', 'jaime.l@gmail.com', '+1-555012345', 5, 5),
('Peter', 'Dinklage', 'P112345', '1969-06-11', 'Male', 'peter.d@hotmail.com', '+1-555112345', 5, 4),
('Jason', 'Momoa', 'P212345', '1979-08-01', 'Male', 'jason.m@amazon.com', '+1-555212345', 6, 9),
('Kit', 'Harington', 'P312345', '1986-12-26', 'Male', 'kit.h@gmail.com', '+1-555312345', 6, 8),
('Emilia', 'Clarke', 'P412345', '1986-10-23', 'Female', 'emilia.c@hotmail.com', '+1-555412345', 7, 7),
('Nikolaj', 'Coster-Waldau', 'P512345', '1970-07-27', 'Male', 'nikolaj.c@amazon.com', '+1-555512345', 7, 4),
('Sean', 'Bean', 'P612345', '1959-04-17', 'Male', 'sean.b@gmail.com', '+1-555612345', 8, 7),
('Lena', 'Headey', 'P712345', '1973-10-03', 'Female', 'lena.h@hotmail.com', '+1-555712345', 8, 3),
('Sophie', 'Turner', 'P812345', '1996-02-21', 'Female', 'sophie.t@amazon.com', '+1-555812345', 9, 10),
('Maisie', 'Williams', 'P912345', '1997-04-15', 'Female', 'maisie.w@gmail.com', '+1-555912345', 9, 5),
('Mark', 'Addy', 'P1012345', '1964-01-14', 'Male', 'mark.a@hotmail.com', '+1-5551012345', 10, 3),
('Rory', 'McCann', 'P1112345', '1969-04-24', 'Male', 'rory.m@amazon.com', '+1-5551112345', 10, 6),
('Gwendoline', 'Christie', 'P1212345', '1978-10-28', 'Female', 'gwendoline.c@gmail.com', '+1-5551212345', 1, 8),
('Alfie', 'Allen', 'P1312345', '1986-09-12', 'Male', 'alfie.a@hotmail.com', '+1-5551312345', 2, 2),
('Isaac', 'Hempstead Wright', 'P1412345', '1999-04-09', 'Male', 'isaac.h@amazon.com', '+1-5551412345', 3, 12),
('Jack', 'Gleeson', 'P1512345', '1992-05-20', 'Male', 'jack.g@gmail.com', '+1-5551512345', 4, 5),
('Iain', 'Glen', 'P1612345', '1961-06-24', 'Male', 'iain.g@hotmail.com', '+1-5551612345', 5, 9),
('Conleth', 'Hill', 'P1712345', '1964-11-24', 'Male', 'conleth.h@amazon.com', '+1-5551712345', 6, 5),
('Carice', 'van Houten', 'P1812345', '1976-09-05', 'Female', 'carice.v@gmail.com', '+1-5551812345', 7, 9),
('Hafþór', 'Júlíus Björnsson', 'P1912345', '1988-11-26', 'Male', 'hafthor.b@hotmail.com', '+1-5551912345', 8, 5),
('Richard', 'Madden', 'P2012345', '1986-06-18', 'Male', 'richard.m@amazon.com', '+1-5552012345', 9, 9);

--1. Display a list of tourists along with the countries they came from. 

SELECT t.*, c.country_name AS origin_country FROM tourists t JOIN countries c ON t.country_id = c.id;

--2. Display a list of tourists and the details of the trip they are assigned to, but only for assigned tourists.

SELECT trs.first_name, trs.last_name, tr.* FROM tourists trs JOIN tours tr ON trs.tour_id = tr.id WHERE trs.tour_id IS NOT NULL;

--3. Display all tourists and the details of their assigned trip. If a tourist is not assigned, 
--NULL should appear in the trip details columns

SELECT trs.*, tr.* FROM tourists trs LEFT JOIN tours tr ON trs.tour_id = tr.id;

/* 
4.  Display all tourists and the details of their assigned trip.
	  If a tourist is not assigned, 
	  NULL should appear in the trip details columns + also display all trips. If a trip has no 
	  assigned tourists, NULL should appear in the tourist details columns. (Hint: FULL JOIN)*/

SELECT trs.*, tr.* FROM tourists trs FULL JOIN tours tr ON trs.tour_id = tr.id;

/* 
 5.  A. Display a list of tourists who are not assigned to any trip.
     B. In a separate query, write an SQL statement to delete a tourist who is not assigned to any trip. */
--A:
SELECT trs.first_name, trs.last_name, tr.* FROM tourists trs LEFT JOIN tours tr ON trs.tour_id = tr.id WHERE trs.tour_id IS NULL;
--B:
DELETE FROM tourists WHERE tour_id IS NULL;

/*6. A.  Display a list of trips that have no assigned tourists.
     B.  Extend the registration time for trips that currently have no registered tourists by 
    		 adding one year to their trip date. (Hint: UPDATE query)*/
--A:
SELECT trs.first_name, trs.last_name, tr.* FROM tourists trs FULL JOIN tours tr ON trs.tour_id = tr.id WHERE trs.first_name IS NULL;
--B:
UPDATE tours tr SET end_date = '2026-03-10' WHERE tr.id = 1;

--7. Count how many trips have no assigned tourists (not even one).
SELECT COUNT(*) AS NO_regi_tour FROM tourists trs RIGHT JOIN tours tr ON trs.tour_id = tr.id WHERE trs.id IS NULL;

--8. Display all possible combinations of tourists and trips.
SELECT trs.*, tr.* FROM tourists trs, tours tr ;



