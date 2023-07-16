
from zvt.contract.api import  get_data
from zvt.domain import (
    Stock1dHfqKdata,
)
import datetime
import numpy as np

# 获取当前日期
today = datetime.date.today()

# 计算往前推 7 天的日期
delta = datetime.timedelta(days=7)
start_timestamp = today - delta

stock_day_data_list = get_data(
    data_schema=Stock1dHfqKdata,code='xxx',
    order=Stock1dHfqKdata.timestamp.asc()
)
# 计算均值
vol_ma = np.mean(stock_day_data_list)


