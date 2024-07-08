import numpy as np

from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dKdata,
    StockDetail,
    Block1dKdata,
    Stockus1dKdata,
    Stockus1wkKdata,
    BlockStock,
)
import datetime
import pandas as pd
import mplfinance as mpf
import os
import talib
import matplotlib.pyplot as plt
import numpy


def test_stock_select():
    # code = 'BK1015'
    # data_schema = Block1dKdata
    # order = Block1dKdata.timestamp.asc()

    # code = '601179'
    # data_schema = Stock1dKdata
    # order = Stock1dKdata.timestamp.asc()

    code = 'CPNG'
    data_schema = Stockus1dKdata
    order = Stockus1dKdata.timestamp.asc()

    start_timestamp = datetime.datetime.strptime('2023-11-01', '%Y-%m-%d')
    end_timestamp = datetime.datetime.strptime('2024-02-23', '%Y-%m-%d')

    k_data_list = get_data(
        data_schema=data_schema,
        code=code,
        start_timestamp=start_timestamp,
        end_timestamp=end_timestamp,
        order=order,
    )
    result = week_tight_stock_selection(k_data_list)
    print(f"计算结果: {result}")


def stock_select(strategy_type: int, **p_kv):
    # 从db中查询多少周的数据
    n = 52
    # 获取当前日期
    today = datetime.date.today()
    # 创建文件夹
    output_dir = f"/Users/gaoerrong/Downloads/stock_select_result/{p_kv['sub_dir_path']}/{today.strftime('%Y-%m-%d')}"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # 计算往前推 n 周的日期
    delta = datetime.timedelta(days=n * 7)
    start_timestamp = today - delta

    # 创建空的DataFrame 用于保存结果
    matched_data = pd.DataFrame(columns=['code', 'name'])
    entities = get_entities(entity_type=p_kv["entity_type"])
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=p_kv["data_schema"],
            code=row['code'],
            start_timestamp=start_timestamp,
            order=p_kv["order"],
        )
        if k_data_list.empty or len(k_data_list.index) < 30:
            continue
        matched = False
        
        # 执行具体的选股策略
        if strategy_type == "tight":
            matched = week_tight_stock_selection(k_data_list)
        else:
            print("strategy_type invalid...")

        # end 选股策略切换逻辑
        if matched:
            new_data = pd.DataFrame([{'code': row['code'], 'name': row['name']}])
            matched_data = pd.concat([matched_data, new_data], ignore_index=True)
            # 输出k线图
            file_name = f"{output_dir}/{row['code']}_{row['name'].replace('/', '_')}.png"
            plot_candlestick(k_data_list, title=f"{row['code']}_{row['name']}", output_filename=file_name)
            print(f"符合条件,code:{row['code']},name:{row['name']}")
        else:
            continue

    if not matched_data.empty:
        select_result_file_name = f"{output_dir}/{p_kv['entity_type']}_select_result.xlsx"
        matched_data.to_excel(select_result_file_name, index=False)


# I have the following weekly K-line data structure, which contains n weeks of data.
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# Please implement a stock selection method according to the following requirements. If the conditions are met, it returns true, otherwise it returns false:
# 1.In recent 3 weeks,each weekly close should be within about 1% of the prior week’s close.
# 2.In recent 3 weeks,each weekly close should > 10-week ema.
def week_tight_stock_selection(kline_data):
    # Calculate the 10-week EMA
    df = kline_data
    df['10_week_ema'] = calculate_ema(df['close'], 10)

    # Check condition 1: Each weekly close should be within about 1% of the prior week’s close in the recent 3 weeks
    recent_closes = df['close'].iloc[-3:]
    if not all(abs(recent_closes.pct_change().iloc[1:]) <= 0.01):
        return False

    # Check condition 2: Each weekly close should be greater than the 10-week EMA in the recent 3 weeks
    recent_ema = df['10_week_ema'].iloc[-3:]
    if not all(recent_closes > recent_ema):
        return False

    return True

# 绘制K线图
def plot_candlestick(kline_data, title, output_filename):
    # 解析K线数据
    df_new = kline_data[['timestamp', 'open', 'high', 'low', 'close', 'volume']]
    # df_new['timestamp'] = pd.to_datetime(df_new['timestamp'])
    # df_new.loc[:, 'timestamp'] = pd.to_datetime(df_new['timestamp'])
    df_new.columns = ['Date', 'Open', 'High', 'Low', 'Close', 'Volume']

    # 设置日期为索引
    df_new.set_index('Date', inplace=True)
    # 调用make_marketcolors函数，定义K线颜色
    mc = mpf.make_marketcolors(
        up="red",  # 上涨K线的颜色
        down="green",  # 下跌K线的颜色
        edge="black",  # 蜡烛图箱体的颜色
        volume="blue",  # 成交量柱子的颜色
        wick="black"  # 蜡烛图影线的颜色
    )

    # 调用make_mpf_style函数，自定义图表样式
    # 函数返回一个字典，查看字典包含的数据，按照需求和规范调整参数
    plt.rcParams['font.sans-serif'] = ['Arial Unicode MS']
    style = mpf.make_mpf_style(base_mpl_style="ggplot", marketcolors=mc, rc={'font.family': 'Arial Unicode MS'})
    # 绘制蜡烛图
    mpf.plot(df_new, type='candle', title=title, style=style, volume=True, mav=(5,10,20), ylabel="price", figratio=(12, 6),
             savefig=output_filename)


###########################################################
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 帮忙实现一下如下规则的代码
# 1.帮我计算每天的30日ema。并且用dict来保存，key是日期，value是计算出来的结果值
# 2.请使用talib库

# 计算ema，保存到dict中，key是日期，value是这一天的值
def calculate_ema(kline_data, n):
    ema_dict = {}
    close_prices = [data['close'] for data in kline_data]
    timestamps = [data['timestamp'] for data in kline_data]

    ema = talib.EMA(close_prices, timeperiod=n)

    for i in range(len(timestamps)):
        ema_dict[timestamps[i]] = ema[i]

    return ema_dict


if __name__ == "__main__":
    print("start select stock...")
    stock_select("tight", entity_type='stockus', data_schema=Stockus1wkKdata, order=Stockus1wkKdata.timestamp.asc(), sub_dir_path='us_stock')
    # test_stock_select()
