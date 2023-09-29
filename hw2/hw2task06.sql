select firstname, surname
from (select firstname, surname
      from cd.members m
      join (select recommendedby from cd.members) r on m.memid = r.recommendedby) as joined
group by firstname, surname
order by surname, firstname;
