with joined as (select name, sum(monthlymaintenance) as sum from cd.facilities group by name),
     ranked as (select name, row_number() over (order by sum desc) as rank from joined)
select name, rank
from ranked
order by rank, name
limit 3;
