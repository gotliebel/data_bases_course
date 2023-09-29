with find_rec as (select cd.members.memid, concat(cd.members.firstname, ' ', cd.members.surname) as recommender from cd.members)
select concat(cd.members.firstname, ' ', cd.members.surname) as member,
       (select find_rec.recommender from find_rec where find_rec.memid = cd.members.recommendedby) as recommender
from cd.members
order by member;
