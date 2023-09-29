create sequence events_idies;
select setval('events_idies', 1);
create or replace function f_auction_payload() returns trigger
as
$$
declare
    event_id integer;
begin
    event_id := nextval('events_idies');
    insert into auctioneer values (event_id, new.payload::json->'auctioneer'->>'firstname', new.payload::json->'auctioneer'->>'lastname', new.payload::json->'auctioneer'->>'nickname', new.payload::json->'auctioneer'->>'email');
    insert into attachment values (event_id, new.payload::json->'attachment'->>'filename', new.payload::json->'attachment'->'location'->>'datacenter', new.payload::json->'attachment'->'location'->>'localname');
    insert into bet values (event_id, (new.payload::json->'bet'->>'volume')::numeric, to_timestamp((new.payload::json->'bet'->>'ts')::integer));
    return null;
end
$$ language plpgsql;



create or replace trigger t_v_auction_payload
    instead of insert
    on v_auction_payload
    for each row
execute function f_auction_payload();
