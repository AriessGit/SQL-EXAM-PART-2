CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    movie_name TEXT NOT NULL UNIQUE, -- Unique movie name
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INT NOT NULL CHECK (year >= 2009), -- Ensures movie is from the last 15 years
    revenue REAL NOT NULL CHECK (revenue >= 0) -- Revenue in millions, cannot be negative
);

INSERT INTO movies (movie_name, genre, country, language, year, revenue) VALUES
('Oppenheimer', 'Biography', 'USA', 'English', 2023, 960),
('Barbie', 'Comedy', 'USA', 'English', 2023, 1440),
('Dune Part Two', 'Sci-Fi', 'USA', 'English', 2024, 700),
('John Wick 4', 'Action', 'USA', 'English', 2023, 440),
('Everything Everywhere All at Once', 'Sci-Fi', 'USA', 'English', 2022, 140),
('The Batman', 'Action', 'USA', 'English', 2022, 772),
('Spider Man No Way Home', 'Action', 'USA', 'English', 2021, 1920),
('Top Gun Maverick', 'Action', 'USA', 'English', 2022, 1490),
('The Whale', 'Drama', 'USA', 'English', 2022, 55),
('Guardians of the Galaxy Vol 3', 'Action', 'USA', 'English', 2023, 845),
('Parasite', 'Thriller', 'South Korea', 'Korean', 2019, 266),
('Train to Busan 2', 'Horror', 'South Korea', 'Korean', 2020, 92),
('Decision to Leave', 'Mystery', 'South Korea', 'Korean', 2022, 23),
('Joker', 'Drama', 'USA', 'English', 2019, 1074),
('Tenet', 'Sci-Fi', 'USA', 'English', 2020, 365),
('The Irishman', 'Crime', 'USA', 'English', 2019, 8),
('Ford v Ferrari', 'Drama', 'USA', 'English', 2019, 225),
('1917', 'War', 'UK', 'English', 2019, 385),
('The Farewell', 'Drama', 'USA', 'English/Chinese', 2019, 23),
('The Banshees of Inisherin', 'Comedy', 'Ireland', 'English', 2022, 49),
('Django Unchained', 'Western', 'USA', 'English', 2012, 426),
('Avengers Endgame', 'Action', 'USA', 'English', 2019, 2798),
('Black Panther', 'Action', 'USA', 'English', 2018, 1347),
('Coco', 'Animation', 'USA', 'English/Spanish', 2017, 807),
('Mad Max Fury Road', 'Action', 'Australia', 'English', 2015, 380),
('Inception', 'Sci-Fi', 'USA', 'English', 2010, 837),
('The Revenant', 'Adventure', 'USA', 'English', 2015, 532),
('La La Land', 'Musical', 'USA', 'English', 2016, 447),
('The Secret in Their Eyes', 'Crime', 'Argentina', 'Spanish', 2009, 34),
('No Time to Die', 'Action', 'UK', 'English', 2021, 774);

--1. Count how many movies exist for each GENRE.
SELECT genre, COUNT(*) AS number_of_movies FROM movies GROUP BY genre ORDER BY number_of_movies DESC; 

--2. Find the total revenue for each year in the movie industry.
SELECT year, SUM(revenue) AS total_revenue FROM movies GROUP BY year ORDER BY year DESC;

--3. Find the average revenue per genre
SELECT genre, AVG(revenue) AS avr_rev FROM movies GROUP BY genre ORDER BY avr_rev DESC;

--4. Find the average revenue per genre for each language separately.
SELECT genre, language, AVG(revenue) AS avr_rev FROM movies GROUP BY genre,language ORDER BY avr_rev DESC;

--5. Identify the language with the fewest movies. 
SELECT language, COUNT(movie_name) AS fewest_num_of_mov FROM movies GROUP BY language ORDER BY fewest_num_of_mov ASC LIMIT 1;

--6 . Identify the country with the most movies. 
SELECT country, COUNT(movie_name) AS most_num_of_mov FROM movies GROUP BY country ORDER BY most_num_of_mov DESC LIMIT 1;

--7.Display genres that have more than 2 movies.
SELECT genre, COUNT(movie_name) AS num_of_mov FROM movies GROUP BY genre HAVING COUNT(movie_name) > 2 ORDER BY num_of_mov ASC; 

--8.Display years where total revenue exceeded 1,000.
SELECT year, SUM(revenue) AS total_revenue_over_1K FROM movies GROUP BY year HAVING SUM(revenue) >1000 ORDER BY year DESC;

--9.Display languages that have at least 3 movies.
SELECT language, COUNT(movie_name) AS num_of_mov_atl_3 FROM movies GROUP BY language HAVING COUNT(movie_name) >= 3 ORDER BY num_of_mov_atl_3 DESC;

