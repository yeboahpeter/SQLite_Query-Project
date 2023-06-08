---note---
/*note/*

----
Looking at the data
----

---- To the query, select the query and click the Run icon----
SELECT *
FROM IMDB250MoviesIMDB250Moviescsv;

--- Changing table name---

ALTER TABLE IMDB250MoviesIMDB250Moviescsv RENAME TO Movies;
SELECT *
FROM Movies;

---- Top 5 Highest Budgeted Movies----
SELECT name, budget
FROM Movies
ORDER BY Budget DESC
LIMIT 5;

----Select the query and run it----

UPDATE Movies
SET 
Budget = REPLACE(budget,2400000000,23500000);

UPDATE Movies
SET 
Budget = REPLACE(budget,550000000,6650000);

SELECT*
FROM Movies; 

----Top 5 Ratd Movies----

SELECT name,rating 
FROM Movies 
LIMIT 5; 

----Top 5 Box Office ---- 

SELECT name, Box_office 
FROM Movies 
ORDER BY Box_office DESC 
LIMIT 5;

SELECT name, budget, box_office, (box_office - budget) AS 'Profit' 
FROM Movies 
ORDER BY Profit DESC;

SELECT directors, COUNT(*) AS 'number' 
FROM Movies 
GROUP BY directors 
ORDER BY number DESC
LIMIT 10;


----Most Popular Genre----

SELECT* 
FROM Movies;

select genre, count(*) as genre_count

from(

  select trim(value) as genre

  from Movies

  cross join json_each('["' || REPLACE(genre, ',', '","') || '"]')

  )

  group by genre

  order by genre_count DESC

  limit 5;
  
  ----Movies per rating----
  
  SELECT Certificate, Count(*) AS 'Number' 
  FROM Movies 
  GROUP BY Certificate 
  ORDER BY Number DESC;
  
  ----Best Year For Movies---- 
  
  SELECT year, count(*) AS 'Number' 
  FROM Movies 
  GROUP BY Year 
  ORDER BY Number DESC 
  LIMIT 10;
  
 ----Amount of Movies per Year---- 
 
 SELECT year 
 FROM Movies 
 ORDER BY year
 LIMIT 10; 
 
 ----Amount of Movies per Decade---- 
 
 SELECT 
 year/10*10+1 AS decade_start, 
 year/10*10+10 AS decade_end, 
 COUNT(year) AS 'number' 
 FROM Movies 
 GROUP BY year/10 
 ORDER BY decade_start; 
 
 
 SELECT 
 year/10*10+1 AS decade_start, 
 year/10*10+10 AS decade_end, 
 COUNT(year) AS 'number' 
 FROM Movies 
 GROUP BY year/10 
 ORDER BY number DESC; 
 