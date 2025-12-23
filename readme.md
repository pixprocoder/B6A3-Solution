## Overview

This project contains the solution for Assignment 03, which involved performing PostgreSQL queries on a vehicle rental system database.

### Important Links

- [ERD Diagram](https://drawsql.app/teams/pixprocoder-studio/diagrams/vehicle-rental-system)
- [Question 01](https://www.dropbox.com/scl/fi/gtw2woufak6bm8h7qwrvu/question-01.mp4?rlkey=aa94ldwtrap7wdxplpgcyps6f&st=lb5b75zz&dl=0)
- [Question 02](https://www.dropbox.com/scl/fi/brsff89uy3f2o0csdm03i/question-02.mp4?rlkey=7fq7edc0aica8oj2oik69iqs8&st=riwdysjv&dl=0)
- [Question 03](https://www.dropbox.com/scl/fi/9q2evth39tpcnmkpsevb3/question-03.mp4?rlkey=wsxxf4wfzzn76tgjhb5y8l7ls&st=0u4jo56q&dl=0)
- [Question 04](https://www.dropbox.com/scl/fi/0d8nfg1j4nanru4wlbrni/question-04.mp4?rlkey=dxnkbisco9phmxaql8yzb7hce&st=tr4d3z8o&dl=0)

### Files

- `queries.sql` - Contains all PostgreSQL queries for the assignment
- `readme.md` - This file

### Assignment Details

The assignment required writing SQL queries for a vehicle rental system database. The queries included operations such as:

- Data retrieval
- Filtering and sorting
- Aggregations
- Joins between tables
- Other common SQL operations

The following queries were implemented in `queries.sql`:

#### Query 01 - JOIN Operation

```sql
SELECT b.booking_id, u.name as customer_name, v.vehicle_name, b.start_date, b.end_date, b.status
FROM
    bookings AS b
    INNER JOIN users AS u ON b.user_id = u.user_id
    INNER JOIN vehicles as v ON b.vehicle_id = v.vehicle_id;
```

This query retrieves booking information along with customer and vehicle details by joining the bookings, users, and vehicles tables. It provides a comprehensive view of each booking with the associated customer name and vehicle name.

#### Query 02 - EXISTS Subquery

```sql
SELECT *
from vehicles AS v
WHERE
    NOT EXISTS (
        SELECT 1
        FROM bookings b
        WHERE
            b.vehicle_id = v.vehicle_id
    )
```

This query finds all vehicles that don't have any bookings by using a NOT EXISTS subquery. It returns vehicles that are currently available as they have no associated bookings in the bookings table.

#### Query 03 - WHERE Clause Filtering

```sql
SELECT * FROM vehicles AS v WHERE v.type = 'car';
```

This query filters the vehicles table to return only vehicles of type 'car'. It demonstrates basic filtering using a WHERE clause.

#### Query 04 - GROUP BY and HAVING Clauses

```sql
SELECT v.vehicle_name, COUNT(b.booking_id) as total_bookings
FROM vehicles AS v
    INNER JOIN bookings AS b ON v.vehicle_id = b.vehicle_id
GROUP BY
    v.vehicle_id,
    v.vehicle_name
HAVING
    COUNT(b.booking_id) > 2;
```

This query groups vehicles by their ID and name, then counts the number of bookings for each vehicle. The HAVING clause filters the results to show only vehicles that have more than two booking. This is useful for identifying popular vehicles.
