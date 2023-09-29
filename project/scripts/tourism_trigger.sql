create or replace function delete_id_directions_trigger() returns trigger as
$$begin
    delete from tourism.directions_tickets_id where tourism.directions_tickets_id.direction_id = old.direction_id;
    delete from tourism.directions_hotels_id where tourism.directions_hotels_id.direction_id = old.direction_id;
    return new;
end;
    $$language plpgsql;


create or replace trigger delete_id_directions_hotels
    before delete
    on tourism.directions
    for each row
    execute function delete_id_directions_trigger();
