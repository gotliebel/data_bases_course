select dt, high_price, vol
from coins
where coins.symbol = 'DOGE' and coins.dt similar to '%2018%' and coins.avg_price * 100 > 0.1;
