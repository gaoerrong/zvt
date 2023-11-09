from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dKdata,
    StockDetail,
    Block1dKdata,
)
import datetime
import pandas as pd
import mplfinance as mpf
import os
import talib


def stock_select(strategy_type: int, **p_kv):
    # 从db中查询多少天的数据
    n = 60
    user_data_size = 5
    # 获取当前日期
    today = datetime.date.today()
    # 创建文件夹
    output_dir = f"/Users/gaoerrong/Downloads/stock_select_result/{p_kv['sub_dir_path']}/{today.strftime('%Y-%m-%d')}"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
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
        
        #### 执行具体的选股策略
        if strategy_type == 1:
            matched = wave_band_select(k_data_list, p_kv['n'])
        elif strategy_type == 2:
            matched = ema_select(k_data_list,p_kv)
        elif strategy_type == 3:
            matched = vol_multiple_select(k_data_list)

        ## end 选股策略切换逻辑
        if matched:
            new_data = pd.DataFrame([{'code': row['code'], 'name': row['name']}])
            matched_data = pd.concat([matched_data, new_data], ignore_index=True)
            # 输出k线图
            file_name = f"{output_dir}/{row['code']}_{row['name']}.png"
            plot_candlestick(k_data_list, title=f"{row['code']}_{row['name']}", output_filename=file_name)
            print(f"符合条件,code:{row['code']},name:{row['name']}")
        else:
            continue

    if not matched_data.empty:
        select_result_file_name = f"{output_dir}/{p_kv['entity_type']}_select_result.xlsx"
        matched_data.to_excel(select_result_file_name, index=False)

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
    style = mpf.make_mpf_style(base_mpl_style="ggplot", marketcolors=mc)
    # 绘制蜡烛图
    mpf.plot(df_new, type='candle', title=title, style=style, volume=True, mav=(5,10,20), ylabel="price", figratio=(12, 6),
             savefig=output_filename)


# ---------------------------------------------------------------------------------------------------------------------
# 波段选股方式，先有几天的下降，然后当天比前一天的收盘价要高
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.从第一天到第n-2天股价在每天都在下降。
# 2.第n-1天的数据中取open和close的最大值大于第n-2天的数据中取open和close的最小值
# 2.第n天的数据中取open和close的最大值大于第n-1天的数据中取open和close的最小值
# 4.如果符合上述全部逻辑，那么打印符合条件
def wave_band_select_1(k_data_list, n):
    # 检查是否符合逻辑
    kline_data = k_data_list[-n:]
    for i in range(n - 2):
        if kline_data[i]['close'] >= kline_data[i + 1]['close']:
            return False

        # 检查第n-1天的最大值是否大于第n-2天的最小值
    if not min(kline_data[n - 2]['open'], kline_data[n - 2]['close']) <= max(kline_data[n - 1]['open'],
                                                                         kline_data[n - 1]['close']):
        return False

        # 检查第n天的最大值是否大于第n-1天的最小值
    if not min(kline_data[n - 1]['open'], kline_data[n - 1]['close']) <= max(kline_data[n]['open'], kline_data[n]['close']):
        return False

    return True

# ---------------------------------------------------------------------------------------------------------------------
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.从第一天到第n-1天股价在每天都在下降。
# 2.第n天的数据中取open和close的最大值大于第n-1天的数据中取open和close的最小值
# 4.如果符合上述全部逻辑，那么打印符合条件
# FIXME 这种方式适合a股中的板块选股,n选择3,4,5 可能选择4,5最合适了
def wave_band_select_2(k_data_list, n):
    # 检查是否符合逻辑
    kline_data = k_data_list[-n:]
    for i in range(n - 1):
        if kline_data[i]['close'] >= kline_data[i + 1]['close']:
            return False

        # 检查第n天的最大值是否大于第n-1天的最小值
    if not min(kline_data[n - 1]['open'], kline_data[n - 1]['close']) <= max(kline_data[n]['open'], kline_data[n]['close']):
        return False

    return True


# ---------------------------------------------------------------------------------------------------------------------
# 连续多天下降，然后当天形成T
# T形的规则是：?
# 1.最高与收盘相差小于0.5。最低与收盘相差大于1。（这样有个弊端是会过滤掉很多小盘股）
# 2.最高等于收盘，最低与收盘相差大于1

# ---------------------------------------------------------------------------------------------------------------------
#均线 5>10>15 or 10>20>30
def ema_select(kline_data,**p_kv):
    closing_prices = kline_data['close']
    ma5 = talib.EMA(closing_prices, timeperiod=5)
    ma10 = talib.EMA(closing_prices, timeperiod=10)
    ma15 = talib.EMA(closing_prices, timeperiod=15)
    ma20 = talib.EMA(closing_prices, timeperiod=20)
    ma30 = talib.EMA(closing_prices, timeperiod=30)

    entity_type = p_kv['entity_type']
    # a 股中使用5,10，,15
    if entity_type in ["block","stock"]:
        n = 3
        # 先判断最新的三天是否满足5日>10日>15日
        for i in range(len(ma5) - n, len(ma5)):
            if ma5[i] <= ma10[i] or ma10[i] <= ma15[i]:
                return False

        # 在判断之前的几天是30日>20日>10日
        for i in range(len(ma5) - 3 * n, len(ma5) - 2 * n):
            if ma5[i] >= ma10[i] or ma10[i] >= ma15[i]:
                return False
    # 港股和美股
    else:
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


# ---------------------------------------------------------------------------------------------------------------------
# 最近几天之内有一天的成交量特别大。需要接下来一段时间去关注。
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.最近5天中有一天的成交量是30日成交量ma的3倍
def vol_multiple_select(k_data_list):
    if len(k_data_list) < 60:
        return False
    n = 30
    multiple = 3
    volume = k_data_list['volume']
    # 计算30日成交量均线（MA）
    ma_volume = talib.MA(volume, timeperiod=n)[-1]

    # 检查最近5天中是否有一天的成交量是30日成交量均线的3倍
    for i in range(n - 5, n):
        if k_data_list[i]['volume'] >= multiple * ma_volume:
            return True

    return False
# ---------------------------------------------------------------------------------------------------------------------


# 前几天一直在下降，某一天突然大于 5，10，,15日均线

if __name__ == "__main__":
    print("start select stock...")
    # a股板块选股
    stock_select(1, n=7, entity_type='block', data_schema=Block1dKdata, order=Block1dKdata.timestamp.asc(), sub_dir_path='a_block')
    # a股正股选股
    # stock_select(1, n=7, entity_type='stock', data_schema=Stock1dKdata, order=Stock1dKdata.timestamp.asc(), sub_dir_path='a_stock')
