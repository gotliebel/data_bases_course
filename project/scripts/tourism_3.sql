select website,
       avg(price) as price,
       avg(stars) as stars,
       location,
       rank() over (partition by location order by avg(stars) desc)
from (tourism.travel_ag ta join tourism.hotels_travel_ag_id htai on ta.travel_ag_id = htai.travel_ag_id) as joined
         join tourism.hotels h on joined.hotel_id = h.hotel_id
group by website, location
having avg(stars) >= 3
order by location, stars desc;
