with joined as (select name, sum(monthlymaintenance) as sum from cd.facilities group by name),
     ranked as (select name, ntile(3) over (order by sum) as ntile from joined)
select name, case when ntile = 1 then 'low' when ntile = 2 then 'average' else 'high' end as revenue
from ranked
order by ntile desc, name;
