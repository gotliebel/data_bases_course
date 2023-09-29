select upper(full_nm) as full_name
from coins
group by upper(full_nm)
order by upper(full_nm);
