CREATE TABLE restaurant(
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR,
	distance INTEGER,
	stars INTEGER CHECK (stars >=0),
	category VARCHAR,
	favorite_food VARCHAR,
	takeout BOOLEAN NOT NULL,
	last_visit DATE
);

insert into restaurant values( DEFAULT, 'lovies', 3, 3, 'bbq', 'pulled pork', true, '08-01-2019');  
insert into restaurant values( DEFAULT, 'chipotle', 1, 5, 'mexican', 'burrito bowl', true, '01-20-2006');
insert into restaurant values( DEFAULT, 'Naan Stop', 5, 2, 'indian', 'food', true, '05-10-2018');
insert into restaurant values( DEFAULT, 'Farm Burger', 3, 5, 'bbq', 'burgers', false, '05-12-2018');
insert into restaurant values( DEFAULT, 'McDonalds', 1, 1, 'fast food', 'chicken nuggets', false, '05-12-2000');

select * from restaurant;

-----Writing Queries-----
--1. The names of the restaurants that you gave a 5 stars to
select name from restaurant where stars = 5;
--2. The favorite dishes of all 5-star restaurants
select favorite_food from restaurant where stars = 5;
--3. The the id of a restaurant by a specific restaurant name, say 'Naan Stop'
select id from restaurant where name = 'Naan Stop';
--4. restaurants in the category of 'BBQ'
select * from restaurant where category = 'bbq';
--5. restaurants that do take out
select * from restaurant where takeout = true;
--6. restaurants that do take out and is in the category of 'BBQ'
select * from restaurant where takeout = true AND category = 'bbq';
--7. restaurants within 2 miles
select * from restaurant where distance <=2;
--8. restaurants you haven't ate at in the last week
select * from restaurant where last_visit >= '07-31-2019';
select * from restaurant where last_visit >= current_date - interval '7 days';
--9. restaurants you haven't ate at in the last week and has 5 stars
select * from restaurant where last_visit >= '07-31-2019' AND stars = 5;

-----Aggregation and Sorting Queries-----
--1. list restaurants by the closest distance.
SELECT * FROM restaurant ORDER BY distance ASC;
--2. list the top 2 restaurants by distance.
SELECT * FROM restaurant ORDER BY distance ASC LIMIT 2;
--3. list the top 2 restaurants by stars.
SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;
--4. list the top 2 restaurants by stars where the distance is less than 2 miles.
SELECT * FROM restaurant WHERE distance < 2 ORDER BY stars DESC LIMIT 2;
--5. count the number of restaurants in the db.
SELECT count(id) FROM restaurant;
--6. count the number of restaurants by category.
SELECT category, count(id) FROM restaurant GROUP BY category;
--7. get the average stars per restaurant by category.
SELECT category, sum(stars)/count(id) FROM restaurant GROUP BY category;
--8. get the max stars of a restaurant by category.
SELECT category, max(stars) FROM restaurant GROUP BY category;


