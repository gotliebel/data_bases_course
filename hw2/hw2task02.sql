select recommendedby, count(recommendedby) as count
from cd.members
where recommendedby is not null
group by recommendedby
order by recommendedby;
