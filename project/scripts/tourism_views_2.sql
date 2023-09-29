create or replace view joined_directions_tickets as (
with joined as (select d.direction_id, city, type, dti.ticket_id
                from tourism.directions d
                         join tourism.directions_tickets_id dti on d.direction_id = dti.direction_id)
select direction_id,
       j.ticket_id as ticket_id,
       city,
       type,
       price,
       date,
       "from",
       "to",
       duration
from joined j
         join tourism.tickets t on j.ticket_id = t.ticket_id);
