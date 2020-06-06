--comment 
--\ in the end of line
/*
Q1
The student number AND name of second year students who have 
	obtained a grade lower than 65 in at least two first year computer science (CS) courses.
*/

SELECT DISTINCT s.snum, s.sname \
FROM student s \
WHERE s.year = 2 \
AND exists ( \
				SELECT * \
				FROM mark m1, mark m2 \
				WHERE s.snum = m1.snum \
				AND s.snum = m2.snum \
				AND m1.cnum <> m2.cnum \
				AND m1.cnum LIKE 'CS1%' \
				AND m2.cnum LIKE 'CS1%' \
				AND m1.grade < 65 \
				AND m2.grade < 65) 


/*
Q2
The professor number AND name of professors in the computer science department 
who have taught a student in CS348 whose final grade was less than 60.
*/
SELECT DISTINCT p.pnum, p.pname
FROM professor p
WHERE p.dept = 'CS'
AND exists (
			SELECT *
			FROM class c
			WHERE p.pnum = c.pnum
			AND exist (
						SELECT *
						FROM course cou
						WHERE cou.cnum = c.cnum
						AND cou.name = 'CS348')
			AND exit (
						SELECT *
						FROM mark m
						WHERE m.cnum = c.cnum
						AND m.grade < 60))



/*
Q3
The number AND name of professors who are not 
	in the PM department AND who are teaching CS245 for the first time.
*/
SELECT DISTINCT p.pnum, p.pname
FROM professor p
WHERE p.dept <> “PM”
AND exist (
				SELECT * 
				FROM class c1
     			WHERE c1.pnum = p.pnum
     			AND c1.cnum = ”CS245”
     			AND not exist (
     								SELECT * 
     								FROM mark m
 									WHERE m.cnum = c1.cnum
 									AND m.term = c1.term
 									AND m.section = c1.section)
                    				AND not exist (
               											SELECT * 
               											FROM class c2
                                       					WHERE c2.cnum = ”CS245”
                                       					AND c2.pnum = p.pnum
                                      					AND c2.term <> c1.term))

/*
Q4
The student number AND name of 4th year students who have taken neither CS348 nor CS240.
*/
SELECT DISTINCT s.num. s.name \
FROM student s \
WHERE s.year = 4 \
AND not exist ( \
					SELECT *
					FROM mark m1, mark m2 \
					WHERE s.snum = m1.snum \
					AND s.snum = m2.snum \
					AND m.cnum != 
					AND)













