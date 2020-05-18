
-- Get Harry Potters ID

.mode column
.headers on

---------------------------------
.print "\nHarry Potter's ID is:"
SELECT id
FROM student
WHERE name like "Harry%";

---------------------------------
.print "\nHarry Potter's enrollment is:"
SELECT s.id, s.name, e.class_id
FROM student s
LEFT JOIN enrollment e
    ON s.id = e.stud_id
WHERE name like "Harry%";

---------------------------------
.print "\nHarry Potter's classes:"
SELECT s.id, s.name AS student, c.name AS class
FROM student s
LEFT JOIN enrollment e
    ON s.id = e.stud_id
LEFT JOIN class c
    ON e.class_id = c.id
WHERE s.name like "Harry%";


---------------------------------
.print "\nHarry Potter's classes:"
SELECT s.id,
    s.name AS student,
    c.name AS class,
    p.name AS professor
FROM student s
LEFT JOIN enrollment e
    ON s.id = e.stud_id
LEFT JOIN class c
    ON e.class_id = c.id
LEFT JOIN professor p
    ON c.prof_id = p.id
WHERE s.name like "Harry%";