-- Homework 4 (100 Points)
-- by Sterling Bhollah

-------------------------------------------------
-------------------------------------------------
-- Part 1 (75 Points)
-------------------------------------------------
-------------------------------------------------
-- GENERAL INSTRUCTIONS
--
-- Each question must be answered using a singe
-- query.  The query may contain subqueries.
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
-- 
-- All queries will be performed against the
-- babynames database.
--
-- Note: This assignment is focused on subqueries.
-- You should not hard-code any values unless that
-- value has been specified in the question.
-- For example, you may not write 2 queries, but
-- save the result from the first query and just
-- type the result into the second query.  It must
-- all be done in one (potentially large) query.
-------------------------------------------------
-------------------------------------------------


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.mode column
.headers on
.print "1. The shortest names in the dataset are:"
-- This should print one column: "name".

SELECT DISTINCT name
FROM data
WHERE length(name) IN
    (SELECT min(length(name))
    FROM data)
ORDER BY length(name) ASC;


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers off
.print "2.  Count the number of distinct names that"
.print "are given to females but not males."

-- This should print out a single number.
-- If the name "Mary" is in this list, then it should
-- only be counted once.  In other words, we are
-- looking for the number of unique names, not the
-- total number of babies born with that name.

-- If you are curious, you could run this in reverse
-- and find out that there are 10743 distinct male
-- names that are not given to females.  Which sex
-- has more variety?

-- Oh, and there are 3042 names that are shared by
-- both sexes, in case you were dying to know that,
-- too!

SELECT DISTINCT count(name)
FROM data
WHERE sex NOT IN
    (SELECT DISTINCT count(names)
    FROM data
    WHERE sex = "M")
ORDER BY count(name) ASC
LIMIT 10;


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.headers on
.print "3.  Which years did female births outnumber"
.print "male births?"

-- This should print one column: year
-- HINT: this can be done by querying against two
-- subqueries.

-- SELECT ...



-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "4.  For each decade, calculate the average"
.print "number of babies that each name was given"
.print "to."

-- The Average should be calculated that the # of
-- names given that year divided by the total number
-- of babies born that year.  Don't split by sex.

-- This should print two columns: decade and average.

-- Hint: You can compute the decade by saying "year/10*10",
-- because of integer division.
-- Hint #2: Remember that you can GROUP BY two columns in
-- the same query.
-- Integer division is fine.

-- SELECT ...



-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
.print "5.  For each year, print the most popular"
.print "name, and the number of babies given that"
.print "name.  Order by year, descending."

-- This should print 3 colums: year, name, and total.

-- I will provide you with this CTE:
--  WITH totals AS (
--    SELECT year, name, SUM(total) AS total
--    FROM data
--    GROUP BY year, name
--    ORDER BY year DESC
--  )

-- You will need to use this CTE as well as a subquery.
-- Note: if you search online for this type of problem,
-- you will hear about something called a "window
-- function".  Ignore them.  They are beyond what we
-- are covering in this semester, and the point of this
-- problem is that it can be solved with a CTE and a
-- subquery.

-- SELECT ...



-------------------------------------------------
-------------------------------------------------
-- Part 2: Python and SQLite (25 Points)
-- 
-- Take your Homework 1, Part 1 module and re-write
-- it to so that it queries against the sqlite3
-- babynames database instead.
--
-- The beauty of this approach is that, because
-- your original code was in a module, you can
-- change how the module fulfills the `get_frequency()`
-- function request, and all of the scripts that you
-- wrote that use your module will benefit from
-- the improvements!
--
-- You can test your module by running your Homework
-- 1, parts 2 and 3 scripts, and see if you observe
-- an improvement in the speed of the scripts!
-------------------------------------------------
-------------------------------------------------














