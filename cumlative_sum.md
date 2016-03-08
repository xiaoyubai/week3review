## SQL example

You have the following monthly sales data

  ```
  ID  |  month |  sales
  ----+--------+---------
   1  |    Jan |   10
   2  |    Feb |   20  
   3  |    Mar |   15
  ...
  ```

### Write a query to get running totals

```
ID  |  month |  sales | running total
----+--------+--------+-------------
 1  |    Jan |   10   |     10
 2  |    Feb |   20   |     30
 3  |    Mar |   15   |     45
...
```


1. Open postgres on the work stations by opening finder and typing "postgres"

1. In your terminal, create your database: `CREATE DATABASE sales;`

2. Open the database: `psql -U postgres sales`

3. Create the tables:

    ```sql
    CREATE TABLE sales (
        ID      int,
        month   varchar(10),
        sales   int
    );
    ```
4. To add items, you can use `INSERT INTO`.


### Answer

```sql
insert into sales VALUES (1, 'Jan', 10);
insert into sales VALUES (2, 'Feb', 20);
insert into sales VALUES (3, 'Mar', 15);  
```

```sql
SELECT
    s1.ID AS id,
    s1.month AS month,
    s1.sales AS sales,
    SUM(s2.sales) AS running_total
FROM sales1 AS s1
JOIN sales1 AS s2
ON s1.ID >= s2.ID
GROUP BY s1.ID, s1.month, s1.sales
ORDER BY s1.id;
```

#### Here you can see the table after self join.

```sql
SELECT s1.*, s2.* FROM sales1 AS s1 JOIN sales1 AS s2 on s1.ID >= s2.ID;

```
