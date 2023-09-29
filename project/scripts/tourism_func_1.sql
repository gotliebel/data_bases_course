create or replace function tickets_to_with_min_cost(direction varchar(50), cost integer)
    returns table
            (
                city  varchar(50),
                price integer
            )
as
$$
begin
    return query select j.city, t.price
                 from (select distinct d.city, dti.ticket_id
                       from tourism.directions d
                                join tourism.directions_tickets_id dti on d.direction_id = dti.direction_id) as j
                          join tourism.tickets t on j.ticket_id = t.ticket_id
                 where j.city = $1 and t.price <= $2;
end;
$$ language plpgsql;

