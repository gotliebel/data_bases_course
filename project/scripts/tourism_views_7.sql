create or replace view hidden_phone as (
select travel_ag_id, regexp_replace(phone_number, '(.){9}', '*********', 2) as phone_number
from tourism.travel_ag);
