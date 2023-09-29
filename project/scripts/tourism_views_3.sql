create or replace view joined_directions_hotels as (
with joined as (select d.direction_id, city, type, dhi.hotel_id
                from tourism.directions d
                         join tourism.directions_hotels_id dhi on d.direction_id = dhi.direction_id)
select direction_id, j.hotel_id as hotel_id, city, type, price, stars, location
from joined j
         join tourism.hotels h on j.hotel_id = h.hotel_id);
