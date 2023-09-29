with joined as (select *
                from (tourism.directions d join tourism.directions_tickets_id dt
                      on d.direction_id = dt.direction_id) as j
                         join tourism.tickets t on j.ticket_id = t.ticket_id),
     ranked as (select *, rank() over (partition by type order by city) as row from joined)
select avg(row) as row, city, type, avg(price) as price
from ranked
group by city, type
having max(price) > 100
order by row, price desc;
