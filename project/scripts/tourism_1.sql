select rank() over (order by avg(price) desc), avg(price) as average_price, location
from tourism.hotels
group by location
having avg(price) > 150
order by average_price desc, location;
