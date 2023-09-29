with recursive t(a, b, n) as (
    select 1::numeric, 0::numeric, 0
    union all
    select a + b, a, n + 1 from t where n < 99
)
select n as nth, a as value from t;
