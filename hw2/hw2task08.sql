select concat(firstname, ' ', surname) as member, name as facility
from ((cd.members m
join cd.bookings b on m.memid = b.memid) as first_join
join cd.facilities f on first_join.facid = f.facid) as joined
where joined.name like 'Tennis Court%'
group by firstname, surname, name
order by firstname, surname, name;
