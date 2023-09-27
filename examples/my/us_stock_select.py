import talib
from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stockus1dKdata,
    StockDetail,
)
import datetime


# 成交量放大
def vol_select_type():
    n = 60
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta
    # select_result = []
    entities = get_entities(entity_type="stockus")
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=Stockus1dKdata,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=Stockus1dKdata.timestamp.asc(),
        )
        if len(k_data_list) < 30:
            continue
        vol_list = k_data_list['volume']
        ma_vol = talib.MA(vol_list, timeperiod=10)
        for i in range(len(vol_list) - 5, len(vol_list)):
            # 如果成交量小于X股的，跳过
            if vol_list[i] < 1000000:
                continue
            if vol_list[i] >= 3 * ma_vol[i]:
                print(f"成交量选股,code:{row['code']},名称:{row['name']},满足条件，请关注...")
                # select_result.append(row['code']).append(",")
                break


# ema的方式选股，10日>20日>30日，
# todo 可以考虑加一下成交量放大的条件（这几天有一天的成交量是成交量均线的2，3倍以上）
def ema_select_type():
    n = 150
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    entities = get_entities(entity_type="stockus")
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=Stockus1dKdata,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=Stockus1dKdata.timestamp.asc(),
        )
        if k_data_list.empty or len(k_data_list.index) < 100:
            continue
        closing_prices = k_data_list['close']
        check_result = check_ma_conditions(closing_prices)
        if check_result:
            print(f"code:{row['code']},名称:{row['name']},满足条件，请关注...")


def check_ma_conditions(closing_prices):
    ma10 = talib.EMA(closing_prices, timeperiod=10)
    ma20 = talib.EMA(closing_prices, timeperiod=20)
    ma30 = talib.EMA(closing_prices, timeperiod=30)
    n = 3
    # 先判断最新的三天是否满足10日>20日>30日
    for i in range(len(ma10) - n, len(ma10)):
        if ma10[i] <= ma20[i] or ma20[i] <= ma30[i]:
            return False

    # 在判断之前的几天是30日>20日>10日
    for i in range(len(ma10) - 3*n, len(ma10) - 2*n):
        if ma10[i] >= ma20[i] or ma20[i] >= ma30[i]:
            return False

    return True


if __name__ == "__main__":
    print("start select a stock...")
    # ema_select_type()
    vol_select_type()
