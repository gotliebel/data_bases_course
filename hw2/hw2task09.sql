with all_unioned as (select (select concat(cd.members.firstname, ' ', cd.members.surname) from cd.members where cd.members.memid = cd.bookings.memid) as member,
                            (select cd.facilities.name from cd.facilities where cd.facilities.facid = cd.bookings.facid) as facility,
                            (select case when cd.bookings.memid = 0 then cd.facilities.guestcost * cd.bookings.slots
                                        else cd.facilities.membercost * cd.bookings.slots end as cost
                             from cd.facilities where cd.facilities.facid = cd.bookings.facid) as cost,
                            cd.bookings.starttime as starttime
                     from cd.bookings)
select all_unioned.member as member, all_unioned.facility as facility, all_unioned.cost as cost
from all_unioned
where cost > 30 and date_part('year', all_unioned.starttime) = 2012 and date_part('month', all_unioned.starttime) = 9 and date_part('day', all_unioned.starttime) = 14
order by all_unioned.cost desc, all_unioned.member, all_unioned.facility;
