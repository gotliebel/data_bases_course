create or replace view hidden_website as (
select travel_ag_id, regexp_replace(website, '(.){10}', '**********', 6) as website
from tourism.travel_ag);
