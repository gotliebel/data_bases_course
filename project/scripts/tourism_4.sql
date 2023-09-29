with joined_directions_tickets as (select j.direction_id,
                                          price,
                                          date,
                                          "from",
                                          "to",
                                          duration,
                                          city,
                                          type
                                   from (tourism.tickets t join tourism.directions_tickets_id dt
                                         on t.ticket_id = dt.direction_id) as j
                                            join tourism.directions d on j.direction_id = d.direction_id),
     joined_directions_hotels as (select j.direction_id, price, stars, location
                                  from (tourism.hotels h join tourism.directions_hotels_id dhi
                                        on h.hotel_id = dhi.hotel_id) as j
                                           join tourism.directions d on j.direction_id = d.direction_id)
select date,
       "from",
       "to",
       city,
       avg(jdt.price) as ticket_price,
       avg(jdh.price) as hotel_price,
       avg(stars)     as stars,
       row_number() over (partition by avg(stars))
from joined_directions_tickets jdt
         join joined_directions_hotels jdh on jdt.direction_id = jdh.direction_id
group by date, "from", "to", city, location
having avg(jdt.price) > 400
order by city;
