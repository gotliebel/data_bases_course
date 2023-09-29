select facid, date_part('month', starttime) as month, sum(slots) as slots
from cd.bookings
where date_part('year', starttime) = 2012
group by rollup(facid, month)
order by facid, month;
