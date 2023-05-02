 -- Finding the app with an ID of 1880 --
 SELECT * FROM analytics
 WHERE id = 1880;

 -- Finding the ID and app name of all app that were last updated in Augest 01, 2018 --
 SELECT id, app_name FROM analytics
 WHERE last_updated = '2018-07-01';

 -- Finding the number of apps in each category --
 SELECT category, COUNT(category) FROM analytics
 GROUP BY category;

 -- Finding the five most reviewed apps and their number of reviews --
 SELECT app_name, reviews FROM analytics
 ORDER BY reviews DESC
 LIMIT 5;

 -- Finding the most reviewed app with a rating of 4.8 or higher --
 SELECT app_name, reviews, rating FROM analytics
 WHERE reviews = (SELECT MAX(reviews) FROM analytics
 WHERE rating >= 4.8);

 -- Finding the average rating for each category (ordered highest to lowest) --
 SELECT category, AVG(rating) FROM analytics
 GROUP BY category
 ORDER BY AVG(rating) DESC;

 -- Finding the name, price, and rating of the most expensive app with a rating lower than 3 --
 SELECT app_name, price, rating FROM analytics
 WHERE price = (SELECT MAX(price) FROM analytics
 WHERE rating < 3);

 -- Finding all apps with a min install no higher than 50 that have a rating (ordered highest rating to lowest) --
 SELECT app_name, min_installs, rating FROM analytics
 WHERE min_installs <= 50 AND rating >= 0
 ORDER BY rating DESC;

 -- Finding the names of all apps with a rating lower than 3 and at least 10000 reviews --
 SELECT app_name FROM analytics
 WHERE rating < 3 AND reviews <= 10000;

 -- Finding the 10 most reviewed apps that cost between $0.10 and $1.00 --
 SELECT app_name, reviews, price FROM analytics
 WHERE price BETWEEN 0.10 AND 1.00
 ORDER BY reviews DESC
 LIMIT 10;

 -- Finding the most out of date app --
 SELECT app_name, last_updated FROM analytics
 WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

 -- Finding the most expensive app --
 SELECT app_name, price FROM analytics
 WHERE price = (SELECT MAX(price) FROM analytics);

 -- Counting all the reviews--
 SELECT COUNT(reviews) FROM analytics;
 -- Do you want the sum instead? --
 SELECT SUM(reviews) FROM analytics;

 -- Finding all categories that have more than 300 apps--
 SELECT category, COUNT(app_name) FROM analytics
 GROUP BY category
 HAVING COUNT(app_name) > 300;

 -- Finding the app that has the largest install to review ratio among app that have been installed at least 100,000 times--
 SELECT app_name, min_installs, reviews, ROUND(min_installs/reviews,2) AS proportion
 FROM analytics ORDER BY proportion DESC LIMIT 1;
 --I had to look at someone else's answer to figure it out--