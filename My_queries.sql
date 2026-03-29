/*
Answer to the question no. 1 
-------------------------------*/

SELECT *
FROM   employee
WHERE  salary = (SELECT DISTINCT salary
                   FROM   employee
                   ORDER  BY salary DESC
                   LIMIT  1 OFFSET 1) LIMIT 3;


/*
Answer to the question no. 2 
-------------------------------*/

SELECT *
FROM   employee
WHERE  salary = (SELECT DISTINCT salary
                 FROM   employee
                 ORDER  BY salary DESC
                 LIMIT  1 OFFSET 1) LIMIT  1;


/*
Answer to the question no. 3 
-------------------------------*/

SELECT   Avg(pending_balance) AS `Average Pending Balance`,
         open_branch_id       AS `Open Branch ID`
FROM     account
WHERE    status = 'ACTIVE' && pending_balance < 4300
GROUP BY open_branch_id;


/*
Answer to the question no. D 
-------------------------------*/

Offset-Based Pagination Query.
SELECT * FROM employees ORDER BY id LIMIT 10 OFFSET 0;

Cursor-Based Pagination Query.
SELECT * FROM employees WHERE id > 50 ORDER BY id LIMIT 10;

There are two kinds of pagination query in SQL.

      1. Offset-Based Pagination / Page-Based.
      2. Cursor-Based Pagination / Keyset Pagination / Seek Pagination.

1. SQL OFFSET Pagination (Skip and Take)
Offset pagination in SQL is a common pagination method that displays data by skipping a certain number of rows, but it can be slow on large datasets.

How it works:
It works using OFFSET and LIMIT. LIMIT 10 means showing the next 10 records and OFFSET 20 means skipping the first 20 records. It works well for static datasets that don’t change frequently.

Advantages:
It is simple and easy to implement.

Disadvantages:
When we use offset pagination, the database has to scan all the previous records according to the offset number. So if the value of offset is very large, for example 1 million records, it slows down the application.

Example:
SELECT * FROM users
ORDER BY id
LIMIT 10 OFFSET 50;

This query shows the next 10 records, skipping first 50 records.


2. Keyset Pagination (Seek Method)
Keyset Pagination (or Seek Method) is an advanced and faster method that loads data using a unique key (ID) of the last viewed record, which improves performance on large tables.

How it works:
The ID of the last seen record or an indexed column is used in the WHERE clause to reach the specified location.

Advantages:
It is very fast even in very large datasets, because it directly uses the index to reach the specified location. It reduces the pressure on the database and speeds up page loading.

Cursor-based pagination is highly recommended for faster data retrieval, especially for real-time data manipulation. For Example, if the cursor is at 20,000 and limit is 20, the database reads from 20,000 to 20,020, instead of reading from the 0 record. This consistent query time is a major advantage. It is suitable for infinite scrolling.

Disadvantages:
It is a bit complicated to implement. It only works on unique columns.

Example:

SELECT * FROM employees
WHERE id > 50
ORDER BY id
LIMIT 10;

This query shows 10 records which id are greater than 50.


/*
Answer to the question no. D 
-------------------------------*/

SELECT COUNT(DISTINCT OPEN_BRANCH_ID) AS `Total Branch Number` FROM `account`;








