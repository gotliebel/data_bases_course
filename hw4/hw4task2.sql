with recursive rec(memid, firstname, surname, recommendedby) as (
    select memid, firstname, surname, recommendedby
    from cd.members
    where memid = 1
    union all
    select m.memid, m.firstname, m.surname, m.recommendedby
    from rec r, cd.members m
    where r.memid = m.recommendedby
)
select memid, firstname, surname
from rec
where memid != 1
order by memid;
