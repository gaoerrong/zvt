# a股根据成交量来选股的方法

from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dKdata,
    StockDetail,
)
import datetime
import numpy as np


# 最后一天的成交量是n天中成交量最低的
def last_day_vol_low():
    n = 100
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    entities = get_entities(entity_type="stock")
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=Stock1dKdata,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=Stock1dKdata.timestamp.desc(),
        )
        if k_data_list.empty or len(k_data_list.index) < 80:
            continue
        # 判断最后一行的成交量是否是全部成交量的最小值
        last_volume = k_data_list['volume'].iloc[0]
        min_volume = k_data_list['volume'].min()

        if last_volume == min_volume:
            stock_detail = get_stock_detail(row['code'])
            # 所属行业
            industries = ''
            #所属板块
            concept_indices = ''
            if not stock_detail.empty:
                temp = stock_detail.iloc[0]
                industries = temp['industries']
                concept_indices = temp['concept_indices']

            print(f"code:{row['code']},名称:{row['name']},行业:{industries},最新一天:{k_data_list.iloc[0]['timestamp'].strftime('%Y-%m-%d')},的成交量是:{n} 天中成交量最小的，请关注...")


# 最后一天的成交量是前一天的倍数
def vol_multiple():
    n = 10
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    entities = get_entities(entity_type="stock")
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=Stock1dKdata,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=Stock1dKdata.timestamp.desc(),
        )
        if k_data_list.empty or len(k_data_list.index) < 2:
            continue
        # 获取DataFrame中第一个和第二个记录的'volume'值
        first_volume = k_data_list.iloc[0]['volume']
        second_volume = k_data_list.iloc[1]['volume']

        if 2 < (first_volume / second_volume) < 4:
            stock_detail = get_stock_detail(row['code'])
            # 所属行业
            industries = ''
            #所属板块
            concept_indices = ''
            if not stock_detail.empty:
                temp = stock_detail.iloc[0]
                industries = temp['industries']
                concept_indices = temp['concept_indices']

            print(f"code:{row['code']},名称:{row['name']},行业:{industries},最新一天:{k_data_list.iloc[0]['timestamp'].strftime('%Y-%m-%d')},的成交量是前一日成交量的倍数，请关注...")


# 倒数第三天是百日新低，倒数第二天比倒数第三天的成交量1.多倍以上，倒数第一天的成交量大于倒数第二天的
def vol_low_up():
    n = 100
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    entities = get_entities(entity_type="stock")
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=Stock1dKdata,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=Stock1dKdata.timestamp.desc(),
        )
        if k_data_list.empty or len(k_data_list.index) < 3:
            continue
        # 倒数第一天
        last_volume = k_data_list.iloc[0]['volume']
        # 倒数第二天
        last_1_k_data = k_data_list.iloc[1]
        last_1_volume = k_data_list.iloc[1]['volume']
        # 倒数第三天
        last_2_volume = k_data_list.iloc[2]['volume']
        min_volume = k_data_list['volume'].min()

        if last_2_volume == min_volume and (last_1_volume / last_2_volume) > 1 and last_volume > last_1_volume and last_1_k_data['close'] > last_1_k_data['open']:
            stock_detail = get_stock_detail(row['code'])
            # 所属行业
            industries = ''
            #所属板块
            concept_indices = ''
            if not stock_detail.empty:
                temp = stock_detail.iloc[0]
                industries = temp['industries']
                concept_indices = temp['concept_indices']

            print(f"code:{row['code']},名称:{row['name']},行业:{industries},最新一天:{k_data_list.iloc[0]['timestamp'].strftime('%Y-%m-%d')},的成交量是前一日成交量的倍数，请关注...")


def get_stock_detail(code):
    stock_detail = get_data(
        data_schema=StockDetail,
        code=code,
    )
    return stock_detail


if __name__ == "__main__":
    print("start select a stock...")
    # last_day_vol_low()
    vol_multiple()
    # vol_low_up()

