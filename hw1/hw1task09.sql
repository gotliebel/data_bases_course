delete
from coins
where coins.tx_cnt = 0 or coins.tx_vol = 0 or coins.active_addr_cnt = 0 or coins.vol = 0;
