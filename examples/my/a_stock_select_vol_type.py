# a股根据成交量来选股的方法

from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dHfqKdata,
)
import datetime
import numpy as np


def select_stock():
    # entities = get_entities(entity_type="stock")
    # 获取当前日期
    today = datetime.date.today()

    # 计算往前推 n 天的日期
    n = 10
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    stock_day_data_list = get_data(
        data_schema=Stock1dHfqKdata,code='600000',
        start_timestamp=start_timestamp,
    )
    # 计算均值
    print(stock_day_data_list)
    vol_ma = np.mean(stock_day_data_list)


if __name__ == "__main__":
    print("start select a stock...")
    select_stock()

