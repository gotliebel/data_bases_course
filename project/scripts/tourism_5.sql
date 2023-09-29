select city, type, max(price) as max_price, max(stars) as max_stars, rank() over (partition by city order by max(stars))
from (tourism.directions d join tourism.directions_hotels_id dhi on d.direction_id = dhi.direction_id) as j join tourism.hotels h on j.hotel_id = h.hotel_id
group by city, type,location
having max(price) > 150
order by max_price desc, city desc;
