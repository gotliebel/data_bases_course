with joined as (select d.direction_id, city, type, hotel_id from tourism.directions d join tourism.directions_hotels_id dhi on d.direction_id = dhi.direction_id)
select city, avg(price) as price, avg(stars) as stars, first_value(avg(stars)) over (order by city)
from joined join tourism.hotels h on joined.hotel_id = h.hotel_id
group by city
order by city;
