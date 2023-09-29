select website, avg(price) as price, "to", row_number() over (order by avg(price))
from (tourism.travel_ag t join tourism.tickets_travel_ag_id ttai on t.travel_ag_id = ttai.travel_ag_id) as j join tourism.tickets t on j.ticket_id = t.ticket_id
where website like '%%anextour%%'
group by website, "to"
order by price;
