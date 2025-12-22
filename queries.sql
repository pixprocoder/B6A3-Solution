-- get all
SELECT * FROM users;

SELECT * FROM vehicles;

SELECT * FROM bookings;

-- problem 01 (join)
SELECT b.booking_id, u.name as customer_name, v.vehicle_name, b.start_date, b.end_date, b.status
FROM
    bookings AS b
    INNER JOIN users AS u ON b.user_id = u.user_id
    INNER JOIN vehicles as v ON b.vehicle_id = v.vehicle_id;

-- problem 02 (exists)
SELECT *
from vehicles AS v
WHERE
    NOT EXISTS (
        SELECT 1
        FROM bookings b
        WHERE
            b.vehicle_id = v.vehicle_id
    )