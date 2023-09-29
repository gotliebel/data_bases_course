create or replace function serial_generator(start_val_inc integer, last_val_ex integer)
    returns table
            (
                serial_generator integer
            )
as
$$
declare

    cur_value integer;
begin
    create table t
    (
        val integer
    );
    cur_value := $1;
    loop
        if cur_value >= $2 then
            exit;
        end if;
        insert into t values (cur_value);
        cur_value := cur_value + 1;
    end loop;
    return query select * from t;
end;
$$ language plpgsql;
