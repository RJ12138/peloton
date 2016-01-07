-- create the test tables
DROP TABLE IF EXISTS A;
DROP TABLE IF EXISTS B;

SET ENABLE_MERGEJOIN TO FALSE;
SET ENABLE_HASHJOIN TO FALSE;
SET ENABLE_NESTLOOP TO TRUE;

CREATE TABLE A(id INT, value INT);
CREATE TABLE B(id INT, value INT);

-- nested loop join with empty tables
SELECT * FROM A INNER JOIN B ON A.value = B.value ORDER BY A.id;
SELECT * FROM A LEFT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A RIGHT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A FULL OUTER JOIN B ON A.value = B.value ORDER BY A.id;;

-- load in the data

INSERT INTO A VALUES(0, 1);
INSERT INTO A VALUES(1, 11);
INSERT INTO A VALUES(2, 12);
INSERT INTO A VALUES(3, 13);
INSERT INTO A VALUES(4, 14);
INSERT INTO A VALUES(5, 15);
INSERT INTO A VALUES(6, 16);
INSERT INTO A VALUES(7, 17);
INSERT INTO A VALUES(8, 18);
INSERT INTO A VALUES(9, 19);

INSERT INTO B VALUES(0, 1);
INSERT INTO B VALUES(1, 11);
INSERT INTO B VALUES(2, 12);
INSERT INTO B VALUES(3, 13);
INSERT INTO B VALUES(4, 14);

-- nested loop join with non empty tables
SELECT * FROM A INNER JOIN B ON A.value = B.value ORDER BY A.id;
SELECT * FROM A LEFT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A RIGHT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A FULL OUTER JOIN B ON A.value = B.value ORDER BY A.id;;

-- load in some more data

INSERT INTO B VALUES(5, 15);
INSERT INTO B VALUES(5, 15);
INSERT INTO A VALUES(4, 14);

-- nested loop join with non empty tables
SELECT * FROM A INNER JOIN B ON A.value = B.value ORDER BY A.id;
SELECT * FROM A LEFT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A RIGHT OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
SELECT * FROM A FULL OUTER JOIN B ON A.value = B.value ORDER BY A.id;;
