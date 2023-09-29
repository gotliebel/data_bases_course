create or replace view joined_countries_directions as (
select direction_id, c.city as city, country, type
from tourism.countries c
         join tourism.directions d on c.city = d.city);
