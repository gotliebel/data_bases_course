create or replace view joined_tickets_travel_ag as (
with joined as (select t.ticket_id, price, date, "from", "to", duration, travel_ag_id
                from tourism.tickets t
                         join tourism.tickets_travel_ag_id ttai on t.ticket_id = ttai.ticket_id)
select ticket_id,
       j.travel_ag_id,
       price,
       date,
       "from",
       "to",
       duration,
       website
from joined j
         join tourism.travel_ag ta on j.travel_ag_id = ta.travel_ag_id);
