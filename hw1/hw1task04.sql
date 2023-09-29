select id, bmi, type
from (select id, bmi, case
    when bmi<18.5 then 'underweight'
    when 18.5<=bmi and bmi<25 then 'normal'
    when 25<=bmi and bmi<30 then 'overweight'
    when 30<=bmi and bmi<35 then 'obese'
    else 'extremely obese'
    end as type
      from (select id, weight / (height)^2 * 703 / 0.999890774 as bmi
from hw) as count_bmi) as count_types
order by bmi desc, id asc;
