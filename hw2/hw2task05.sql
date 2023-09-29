select surname, firstname, memid, min(joined.starttime) as starttime
from (select surname, firstname, b.memid, b.starttime
      from cd.members m
      join cd.bookings b on m.memid = b.memid
      where b.starttime > '2012-09-01') as joined
group by surname, firstname, memid
order by memid;
