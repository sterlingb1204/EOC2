.mode column
.headers on

-- the first query
.print "\nFiltering for Indiana......"
SELECT * 
FROM data
WHERE name = "Colin" 
    AND year = 1998 
    AND state = "IN";

-- the second query
.print "\nFiltering for Texas........"
SELECT * 
FROM data
WHERE name = "Colin" 
    AND year = 1998 
    AND state = "TX";
    
-- The Third Query
.print "\nFiltering for both........."
SELECT * 
FROM data 
WHERE name = "Colin" 
    AND year = 1998 
    AND (state = "TX"
        OR state = "IN");

.print "\nFiltering for both V2........."
SELECT * 
FROM data 
WHERE name = "Colin" 
    AND year = 1998 
    AND state in ("IN","TX");