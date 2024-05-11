CREATE TABLE uber_ride (
    ride_id SERIAL PRIMARY KEY,
    ride_timestamp TIMESTAMP,
    ride_status VARCHAR(20)  -- "ride_completed", "cancelled_by_driver" or "cancelled_by_user"
);


INSERT INTO uber_ride (ride_timestamp, ride_status)
VALUES
    ('2024-05-09 08:30:00', 'cancelled_by_driver'),
    ('2024-05-09 09:00:00', 'cancelled_by_user'),
    ('2024-05-09 10:00:00', 'ride_completed'),
    ('2024-05-09 11:00:00', 'cancelled_by_user'),
    ('2024-05-09 12:00:00', 'cancelled_by_driver'),
    ('2024-05-09 13:00:00', 'cancelled_by_user'),
    ('2024-05-09 14:00:00', 'cancelled_by_user'),
    ('2024-05-09 15:00:00', 'cancelled_by_user'),
    ('2024-05-09 16:00:00', 'ride_completed'),
    ('2024-05-09 17:00:00', 'cancelled_by_user'),
    ('2024-05-09 18:00:00', 'ride_completed'),
    ('2024-05-09 19:00:00', 'cancelled_by_user'),
    ('2024-05-09 20:00:00', 'cancelled_by_user'),
    ('2024-05-09 21:00:00', 'cancelled_by_user'),
    ('2024-05-09 22:00:00', 'cancelled_by_driver'),
    ('2024-05-09 13:00:00', 'cancelled_by_user'),
    ('2024-05-09 14:00:00', 'cancelled_by_user'),
    ('2024-05-09 15:00:00', 'cancelled_by_user'),
    ('2024-05-09 16:00:00', 'ride_completed'),
    ('2024-05-09 17:00:00', 'cancelled_by_user'),
    ('2024-05-09 18:00:00', 'cancelled_by_driver'),
    ('2024-05-09 19:00:00', 'cancelled_by_user'),
    ('2024-05-09 20:00:00', 'cancelled_by_user'),
    ('2024-05-09 21:00:00', 'cancelled_by_user'),
    ('2024-05-09 22:00:00', 'cancelled_by_driver');
	
SELECT * FROM UBER_RIDE

--You are given a uber_ride table with columns ride_id, ride_time_stamp, ride_status.
--(which has information about the ride)


--Find out % of ride cancelled by uber_driver

--Total Cancelled Drive Count
--Total Drive Cancelled by driver
--Percentage


SELECT ROUND(SUM(CASE
	   			 WHEN RIDE_STATUS='cancelled_by_driver' THEN 1
	             ELSE 0
	             END)::numeric/ (SELECT COUNT(1) FROM UBER_RIDE WHERE RIDE_STATUS<>'ride_completed')::numeric
			     *100,2) AS PERCENTAGE_CANCELLED_BY_DRIVER
FROM UBER_RIDE


--TASK
-- Your Task is to find out how how many ride were cancelled by user in the evening 
-- hour > 17 is considered as evening 

--COUNT OF RIDE CANCELLED BY USER
--IN EVENING

SELECT
COUNT(RIDE_STATUS),
EXTRACT(HOUR FROM RIDE_TIMESTAMP) AS HOUR
FROM UBER_RIDE
WHERE RIDE_STATUS='cancelled_by_user'
AND EXTRACT(HOUR FROM RIDE_TIMESTAMP) > 17
GROUP BY 2




