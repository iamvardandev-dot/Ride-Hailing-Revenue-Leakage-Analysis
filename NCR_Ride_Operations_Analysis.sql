create database mobility_analytics;
use mobility_analytics;
LOAD DATA INFILE 'E:/MySQL/Uploads/final_ncr_ride_bookings.csv'
INTO TABLE final_ncr_ride_bookings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select count(*) from final_ncr_ride_bookings;
# Objective 1: The Revenue Bleed by Location
select `Pickup Location`, sum(`Cancelled Rides by Driver`) as Total_Driver_Cancellations, sum(`Estimated_Values`) as Revenue_Lost_INR 
from final_ncr_ride_bookings where `Cancelled Rides by Driver` >0 group by `Pickup Location` order by Revenue_Lost_INR Desc limit 10;
# Objective 2: The "Why" Behind the Cancellations
select `Driver Cancellation Reason`,count(*) as Incident_Count, sum(`Estimated_Values`) as Revenue_Lost_INR from final_ncr_ride_bookings 
where `Cancelled Rides by Driver` > 0 group by `Driver Cancellation Reason` order by Incident_Count desc;
# Objective 3: The Cancellation Time Spikes
select hour(`Time`) as Hour_of_Day, sum(`Cancelled Rides by Driver`) AS Total_Driver_Cancellations FROM final_ncr_ride_bookings 
WHERE `Cancelled Rides by Driver` > 0 GROUP BY Hour_of_Day ORDER BY Total_Driver_Cancellations DESC LIMIT 5;
# Objective 4: The Customer Cancellation Drivers
select `Reason for cancelling by Customer`, count(*) as Incident_Count from final_ncr_ride_bookings where `Cancelled Rides by Customer`> 0 
group by `Reason for cancelling by Customer` order by Incident_Count desc;
# Objective 5: Vehicle Profitability and Performance
select `Vehicle Type`, count(`Booking ID`) as Total_Bookings, 
sum(CASE WHEN `Booking Status` = 'Completed' THEN 1 ELSE 0 END) AS Successful_Rides, 
sum(CASE WHEN `Booking Status` = 'Completed' THEN `Booking Value` ELSE 0 END) AS Actual_Revenue_INR
from final_ncr_ride_bookings group by `Vehicle Type` order by Actual_Revenue_INR desc;
# Objective 6: Payment Method vs. Ride Success
select `Payment Method`, count(`Booking ID`) as Total_Bookings, sum(CASE WHEN `Booking Status` = 'Completed' THEN 1 ELSE 0 END) AS Successful_Rides,
sum(CASE WHEN `Cancelled Rides by Driver` = 'Completed' THEN 1 ELSE 0 END) as Total_Driver_Cancellations from final_ncr_ride_bookings 
group by `Payment Method` order by Total_Driver_Cancellations desc;