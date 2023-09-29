create or replace function count_non_volatile_days(full_nm text) returns integer as $$
    declare
        r coins%rowtype;
        counter integer;
    begin
        if $1 not in (select coins.full_nm from coins) then
            raise exception 'Crypto currency with name "%s" is absent in database!', $1 using errcode = '02000';
        end if;
        counter := 0;
        for r in select * from coins where coins.full_nm = $1
        loop
            if r.low_price = r.high_price then
                counter := counter + 1;
            end if;
            end loop;
        return counter;
    end;
$$ language plpgsql;
