
-- Homework 3
-- by Sterling Bhollah & Daniel Rahill
-- 02/25/20

-------------------------------------------------
-------------------------------------------------
-- GENERAL INSTRUCTIONS
-- 
-- Each question must be answered using a query.
--
-- Sometimes the query will return a single
-- value (basically, a one-column, one-row
-- response), and sometimes it will return
-- multiple rows and columns.
--
-- When appropriate, I have added instructions or
-- hints concerning column names or functions
-- that you should use.
-- 
-- This is your friend:
-- https://sqlite.org/lang_corefunc.html
-- 
-- I have added commands to control when the
-- headers are printed, to make the results of
-- the queries look nicer.
-------------------------------------------------
-------------------------------------------------


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.mode column
.headers off
.print "1. The longest name in the dataset has this many letters:"
-- Hint: look up the LENGTH() function.
-- Your query would go below, it should return a single number:

SELECT length(name)
FROM data
ORDER BY length(name) DESC
LIMIT 1;



-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "\n2. The longest names in the dataset are:"
-- It is OK to hard-code the answer from the previous query into
-- this query.  Later, we will see how to avoid hard-coding numbers
-- like this.
-- There should be 4 lines of output, each with a different name.

SELECT DISTINCT name
FROM data
ORDER BY length(name) DESC
LIMIT 4;


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers on
.print "\n3. The year that Indiana had the most births was:"
-- This should print 2 columns, "year" and "births".

SELECT year AS "Year", sum(total) AS "Births"
FROM data
WHERE state = "IN"
GROUP BY year
ORDER BY sum(total) DESC
LIMIT 1;



-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers off
.print "\n4. 2018 is the most recent year in the dataset."
.print "   How many births did Indiana have in 2018?"
-- This should print a single number.
-- Side commentary: WOW!  That's a huge difference!  Why do
-- you think that the change in births is so drastic?

SELECT sum(total)
FROM data
WHERE state = "IN"
    AND year = 2018;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers on
.print "\n5. Perhaps this is a country-wide issue."
.print "   How many births happened in the entire country"
.print "   in the year from #3 as compared to 2018?"
-- This should print two columns: "year" and "births"
-- This should print two rows, one row for each of the years
-- requested in the instructions.

SELECT year AS "Year", sum(total) AS "Births"
FROM data
WHERE state = "IN"
    OR year = "2018"
GROUP BY year
ORDER BY sum(total) DESC
LIMIT 2;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "\n6. For each letter of the alphabet, count the"
.print "   number of names that start with that letter."
.print "   For simplicity, only consider the names"
.print "   associated with California in 2018."
-- This should print two columns: "letter" and "count"
-- Look at the SUBSTR(x,y,z) function as a quick way to
-- get the first letter of the string.
-- Unfortunately, the query may repeat computation.  That
-- is OK in this assignment, because we haven't learned
-- how to be more efficient about it (yet).

SELECT SUBSTR(name,1,1) AS "Letter",count(name) AS "Count"
FROM data
WHERE state = "CA"
    AND year = "2018"
GROUP BY SUBSTR(name,1,1);


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers off
.print "\n7. #6 is interesting.  Names starting with 'Z'"
.print "   are a lot more common than I thought!"
.print "   What is the least common letter for names to"
.print "   start with in the list from #6?"
-- This should print a single letter.
-- It is OK to reuse some of your query from #6.

SELECT SUBSTR(name,1,1)
FROM data
WHERE state = "CA"
    AND year = "2018"
GROUP BY SUBSTR(name,1,1)
ORDER BY count(name) ASC
LIMIT 1;


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers on
.print "\n8. Print the name and sex of the records that"
.print "   are represented in the query from #6 and that"
.print "   begin with the letter from #7, sorted"
.print "   alphabetically by name."
-- This should print two columns: "name" and "sex".
-- Use the LIKE clause.

SELECT name AS "Name", sex AS "Sex"
FROM data
WHERE state = "CA"
    AND year = "2018"
    AND name LIKE "U%"
ORDER BY name ASC;


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers off
.print "\n9. There was a \"Unique\" name in that list."
.print "   How many people have been given that \"Unique\""
.print "   name (in the entire dataset)?"
-- This should print a single number.

SELECT count(name)
FROM data
WHERE name = "Unique";


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers on
.print "\n10. Jesus had 12 Apostles:"
.print "      \"Peter\",\"James\",\"John\",\"Andrew\","
.print "      \"Nathaniel\",\"James\",\"Judas\",\"Jude\","
.print "      \"Matthew\",\"Philip\",\"Simon\",\"Thomas\""
.print "      Print them in a list along with how many"
.print "      babies have been given that name, sorted by"
.print "      the highest count."
-- This should print two columns: "name" and "births".
-- Use the IN clause.
-- Also, yes, I know... There are 2 Apostles named "James".

SELECT name AS "Name", sum(total) AS "Births"
FROM data
WHERE name IN ("Peter","James","John", "Andrew", "Nathaniel", "James", "Judas", "Jude", "Matthew", "Philip", "Simon", "Thomas")
GROUP BY name
ORDER BY sum(total) DESC;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "\n11. Repeat #10, but filter it so that only"
.print "    females are counted."

SELECT name AS "Name", sum(total) AS "Births"
FROM data
WHERE name IN ("Peter","James","John", "Andrew", "Nathaniel", "James", "Judas", "Jude", "Matthew", "Philip", "Simon", "Thomas")
    AND sex = "F"
GROUP BY name
ORDER BY sum(total) DESC;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "\n12. CREATIVITY!"
.print "    Come up with a creative query that explores"
.print "    something interesting in the dataset."
-- Note: This type of activity (exploring and coming up
-- with your own stuff) is where learning really happens.
-- Be creative and see what you can figure out!
-- Use the .print command to describe what your query is
-- doing.
SELECT year AS "Year", sum(total) AS "Births"
FROM data
WHERE name = "Woodrow" 
    AND (year = "1913"
        OR year = "1914"
        OR year = "1915"
        OR year = "1916"
        OR year = "1917"
        OR year = "1918" 
        OR year = "1919"
        OR year = "1920"
        OR year = "1921")
GROUP BY year;

.print " "
.print "Woodrow Wilson was president from 1913 to 1921. We wanted to analyze how the president's public opinion could change the frequency of his name in birthrates in the US" 
.print " "
.print "Woodrow Wilson was reelected by a small margin in 1916. Could indicate strong public opinion, but births in the next year do not reflect a growing public opinion."
.print " "
.print "The US entered WWI in 1917 - notice the increase in births in 1918."
.print " "
.print "However, notice the decline in births shortly after US enters the War as US casualties reach those of other countries and public support for the war wanes."
.print " "