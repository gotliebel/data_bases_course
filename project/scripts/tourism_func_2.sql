create or replace function avg_price_minute_flight(cost integer, duration integer) returns float
as $$begin
    return cost::float / duration::float;
end;
$$ language plpgsql;
