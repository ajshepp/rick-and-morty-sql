-- create table of information
CREATE TABLE people (
	id SERIAL PRIMARY KEY,
	gender_id INTEGER REFERENCES genders, -- REFERNECES will not always take place
	first_name TEXT,
	last_name TEXT,
	age INTEGER
) ;

-- display full table
SELECT * FROM people ;

-- display specific entries
SELECT first_name, age FROM people ;

-- display entries w/ specific conditions
SELECT first_name FROM people WHERE age < 20 ;	

-- insert entry into table
INSERT INTO people (first_name, last_name, age, sex) VALUES
('first', 'last', 34, TRUE/FALSE) ;

-- delete entry from table
DELETE FROM people WHERE id = 2 ;


INSERT INTO genders (name, title) VALUES
('', '') ; 

-- sample rick & morthy season / episode / entries
INSERT INTO episodes (season, episode, title) VALUES
(1, 1, 'Pilot'),
(1, 2, 'Lawnmower Dog'),
(1, 3, 'Anatomy Park'),
(1, 4, 'M. Night Shaym-Aliens!'),
(1, 5, 'Meeseeks and Destroy'),
(1, 6, 'Rick Potion #9'),
(1, 7, 'Raising Gazorpazorp'),
(1, 8, 'Rixty Minutes'),
(1, 9, 'Something Ricked This Way Comes'),
(1, 10, 'Close Rick-counters of the Rick Kind'),
(1, 11, 'Ricksy Business') ;


-- update a column in table
UPDATE people
SET gender_id = 2
WHERE id = 3 OR id = 5 OR id = 8 ;

-- connect two tables (does not make a new table)
SELECT * FROM people
JOIN genders ON people.gender_id = genders.id ;

-- display specific columns from table
SELECT genders.title, people.last_name FROM people
JOIN genders ON people.gender_id = genders.id ;

-- linking table: How to link two tables together in a many-to-many relationship
CREATE TABLE people__episodes (
	person_id INTEGER REFERENCES people, 
	episode_id INTEGER REFERENCES episodes,
	UNIQUE(person_id, episode_id)
) ;

-- inserting mass entries at one time
INSERT INTO people__episodes (person_id, episode_id) VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11) ;


-- How to create a many-to-one relationship between people and genders
-- AND a many-to-many relationship between people and episodes

-- tables MUST HAVE a shared column in order to map with JOIN
-- JOIN multiple tables and columns to view at one time


-- ///////// final table /////////
SELECT genders.title ,people.first_name, people.last_name, episodes.season, episodes.episode, episodes.title FROM people__episodes
JOIN people ON people__episodes.person_id = people.id
JOIN genders ON people.gender_id = genders.id
JOIN episodes ON people__episodes.episode_id = episodes.id ;