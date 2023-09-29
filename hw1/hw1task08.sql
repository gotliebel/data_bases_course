select upper(full_nm) as full_name, dt, high_price as price
from coins
where (upper(full_nm), dt, high_price) in (select upper(full_nm), max(dt), max(high_price) from coins group by upper(full_nm))
order by price desc, upper(full_nm);
