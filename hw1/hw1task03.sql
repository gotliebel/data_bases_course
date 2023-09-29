select count(bmi) as underweight_count
from (select weight / (height)^2 * 703 / 0.999890774 as bmi
from hw) as hb
where bmi < 18.5;
