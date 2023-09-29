create or replace view joined_hotels_travel_ag as (
with joined as (select h.hotel_id, price, stars, location, valid_from, valid_to, travel_ag_id
                from tourism.hotels h
                         join tourism.hotels_travel_ag_id htai on h.hotel_id = htai.hotel_id)
select hotel_id,
       j.travel_ag_id,
       price,
       stars,
       location,
       valid_from,
       valid_to,
       website
from joined j
         join tourism.travel_ag ta on j.travel_ag_id = ta.travel_ag_id);
