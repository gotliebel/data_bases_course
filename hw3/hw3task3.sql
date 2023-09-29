select firstname, surname, round((sum(slots) * 0.5) / 10) * 10 as hours, rank() over (order by round((sum(slots) * 0.5) / 10) * 10 desc) as rank
from cd.members m join cd.bookings b on m.memid = b.memid
group by firstname, surname
order by rank, surname, firstname;
