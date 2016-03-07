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

```sql
insert into sales VALUES (1, 'Jan', 10);
insert into sales VALUES (2, 'Feb', 20);
insert into sales VALUES (3, 'Mar', 15);  
```
