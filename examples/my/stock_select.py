import numpy as np

from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dKdata,
    StockDetail,
    Block1dKdata,
    Stockus1dKdata,
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

    code = 'V'
    data_schema = Stockus1dKdata
    order = Stockus1dKdata.timestamp.asc()

    start_timestamp = datetime.datetime.strptime('2023-08-01', '%Y-%m-%d')
    end_timestamp = datetime.datetime.strptime('2023-11-06', '%Y-%m-%d')

    k_data_list = get_data(
        data_schema=data_schema,
        code=code,
        start_timestamp=start_timestamp,
        end_timestamp=end_timestamp,
        order=order,
    )
    result = ema_select(k_data_list, 'stockus')
    print(f"计算结果: {result}")

def stock_select(strategy_type: int, **p_kv):
    # 从db中查询多少天的数据
    n = 100
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
        if strategy_type == "wave_band_3":
            temp = p_kv['n']
            matched = wave_band_select_3(k_data_list, temp, p_kv['rate_threshold'])
        elif strategy_type == "wave_band_1":
            matched = wave_band_select_1(k_data_list, p_kv['n'])
        elif strategy_type == "ema":
            matched = ema_select(k_data_list, p_kv['entity_type'])
        elif strategy_type == "vol":
            matched = vol_multiple_select(k_data_list)
        elif strategy_type == "t":
            matched = t_or_baoyun_pattern_select(k_data_list)

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
    for i in range(n - 3):
        if kline_data.iloc[i]['close'] <= kline_data.iloc[i + 1]['close']:
            return False

        # 检查第n-1天的最大值是否大于第n-2天的最小值
    if not min(kline_data.iloc[n - 3]['open'], kline_data.iloc[n - 3]['close']) <= max(kline_data.iloc[n - 2]['open'],
                                                                         kline_data.iloc[n - 2]['close']):
        return False

        # 检查第n天的最大值是否大于第n-1天的最小值
    if not min(kline_data.iloc[n - 2]['open'], kline_data.iloc[n - 2]['close']) <= max(kline_data.iloc[n-1]['open'], kline_data.iloc[n-1]['close']):
        return False

    return True

# ---------------------------------------------------------------------------------------------------------------------
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.从第一天到第n-2天股价在每天都在下降。
# 2.第n天的数据中取open和close的最大值大于第n-1天的数据中取open和close的最小值
# 4.如果符合上述全部逻辑，那么打印符合条件
# FIXME 这种方式适合a股中的板块选股,n选择3,4,5 可能选择4,5最合适了（4，5的过滤性太差了），试一试5天，或者7天
def wave_band_select_2(k_data_list, n):
    # 检查是否符合逻辑
    kline_data = k_data_list[-n:]
    for i in range(n - 2):
        if kline_data.iloc[i]['close'] <= kline_data.iloc[i + 1]['close']:
            return False

    # 检查第n天的最大值是否大于第n-1天的最小值
    previous_candle = kline_data.iloc[n - 2]
    current_candle = kline_data.iloc[n - 1]

    if max(current_candle['open'], current_candle['close']) > min(previous_candle['open'], previous_candle['close']):
        return True

    return False

# ---------------------------------------------------------------------------------------------------------------------
# 主要适用于a股的板块选股
# 代码规则
# 1.计算n-2中k线中每一天与第二天的收盘价对比是上升还是下降。保存到序列中
# 2.计算序列中下降的占比比例
# 3.计算最后一天的价格是比前一天的价格是上涨的
def wave_band_select_3(k_data_list, n, rate_threshold):
    # 检查是否符合逻辑
    kline_data = k_data_list[-n:]
    conditions = [max(kline_data.iloc[i]['close'], kline_data.iloc[i]['open']) > max(kline_data.iloc[i + 1]['close'],kline_data.iloc[i + 1]['open']) for i in range(n - 2)]
    # 计算下降的占比
    down_count = sum(conditions)  # 计算 True 的数量,也就是下降的占比
    total_count = len(conditions)  # 计算总数量
    down_percentage = down_count / total_count * 100  # 计算 True 的占比
    # 如果下降的占比 比 阈值小，那么就返回不满足
    if down_percentage < rate_threshold:
        return False
    # 检查第n天的最大值是否大于第n-1天的最小值
    previous_candle = kline_data.iloc[n - 2]
    current_candle = kline_data.iloc[n - 1]

    # 这个规则相对会宽松一些，未来上涨的概率小一些，风险大一些，但是机器过滤性差，需要人工做比较多的判断
    # if max(current_candle['open'], current_candle['close']) > min(previous_candle['open'], previous_candle['close']):
    # 这个规则相对严格一些，未来上涨的概率会大一些，风险小一些。但是机器会过滤掉一些。需要人工判断的少
    if current_candle['close'] > previous_candle['open']:
        return True

    return False

# ---------------------------------------------------------------------------------------------------------------------
# 连续多天下降，然后当天形成T或者当天的形态是包含前一天的股价形态的
# T形的规则是：?
# 1.最高与收盘相差小于0.5。最低与收盘相差大于1。（这样有个弊端是会过滤掉很多小盘股）
# 2.最高等于收盘，最低与收盘相差大于1
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.从第一天到第n-1天的股价都在下降，下降的判断依据是每天的开盘价和收盘价低于当天的30日ema。ema的数据我已经提前准备好了，放在了ema_dict中，请从这里面获取对应天的ema数据
# 2.第n天K线的开盘价高于第n-1天K线的最高价。第n天K线的收盘价低于第n-1天K线的最低价。
# 3.第n天的开盘价与最高价相差小于0.5，开盘价与收盘价相差小于0.5，最低价与收盘价相差大于1
# 4.其中第2点规则和第3点规则，满足其中一条规则就打印出来满足条件，否则打印出来不满足条件

def t_or_baoyun_pattern_select(kline_data):
    n = len(kline_data)

    if n < 2:
        return False
    ema_dict = calculate_ema(kline_data,30)

    # 判断前n-1天的股价是否下降
    for i in range(n - 2):
        if kline_data[i]['open'] >= ema_dict[kline_data[i]['timestamp']] or kline_data[i]['close'] >= ema_dict[kline_data[i]['timestamp']]:
            return False

    previous_candle = kline_data[n - 1]
    current_candle = kline_data[n]

    # 第二条规则
    if previous_candle['close'] < previous_candle['open'] and \
            current_candle['open'] > previous_candle['high'] and \
            current_candle['close'] < previous_candle['low']:
        return True
    # 第三条规则

    # 判断第n天的开盘价和收盘价是否满足条件
    if abs(current_candle['open'] - current_candle['high']) < 0.5 and \
            abs(current_candle['open'] - current_candle['close']) < 0.5 or \
            abs(current_candle['low'] - current_candle['close']) > 1:
        return True

    return False


# ---------------------------------------------------------------------------------------------------------------------
#均线 5>10>15 or 10>20>30
def ema_select(kline_data, entity_type):
    closing_prices = kline_data['close']
    k_line_data_len = len(kline_data)
    ma5 = talib.EMA(closing_prices, timeperiod=5)
    ma10 = talib.EMA(closing_prices, timeperiod=10)
    ma15 = talib.EMA(closing_prices, timeperiod=15)
    ma20 = talib.EMA(closing_prices, timeperiod=20)
    ma30 = talib.EMA(closing_prices, timeperiod=30)

    # a 股中使用5,10，,15
    if entity_type in ["block","stock"]:
        # 最新一天的均线值
        now_ema5 = ma5.iloc[k_line_data_len - 1]
        now_ema10 = ma10.iloc[k_line_data_len - 1]
        now_ema15 = ma15.iloc[k_line_data_len - 1]
        # 获取最近n天的ema均线数据
        pre_n_day = 6
        start_index = k_line_data_len - pre_n_day
        end_index = k_line_data_len - 1
        pre_n_ema5 = ma5[start_index:end_index]
        pre_n_ema10 = ma10[start_index:end_index]
        pre_n_ema15 = ma15[start_index:end_index]

        # 最新一天的均线满足ema5 > ema10 > ema15
        if now_ema5 > now_ema10 > now_ema15:
            # 检查n天前的ma均线是否不满足条件
            conditions = [pre_n_ema5.iloc[i] > pre_n_ema10.iloc[i] > pre_n_ema15.iloc[i] for i in
                          range(len(pre_n_ema5))]
            # 如果conditions中包含False，那么就说明刚满足条件，可以进入观察列表
            if False in conditions:
                return True

        return False
    # 港股和美股
    else:
        # 最新一天的均线值
        now_ema10 = ma10.iloc[k_line_data_len - 1]
        now_ema20 = ma20.iloc[k_line_data_len - 1]
        now_ema30 = ma30.iloc[k_line_data_len - 1]
        # 获取最近n天的ema均线数据
        pre_n_day = 6
        start_index = k_line_data_len - pre_n_day
        end_index = k_line_data_len - 1
        pre_n_ema10 = ma10[start_index:end_index]
        pre_n_ema20 = ma20[start_index:end_index]
        pre_n_ema30 = ma30[start_index:end_index]

        # 最新一天的均线满足ema10 > ema20 > ema30
        if now_ema10 > now_ema20 > now_ema30:
            # 检查n天前的ma均线是否不满足条件
            conditions = [pre_n_ema10.iloc[i] > pre_n_ema20.iloc[i] > pre_n_ema30.iloc[i] for i in range(len(pre_n_ema10))]
            # 如果conditions中包含False，那么就说明刚满足条件，可以进入观察列表
            if False in conditions:
                return True

        return False

# ---------------------------------------------------------------------------------------------------------------------
# 最近几天之内有一天的成交量特别大。需要接下来一段时间去关注。
# 你是一名Python股票量化编程专家。
# 我有如下数据结构的日线级别的k线，k线中包含了n天的数据
# kline_data['timestamp', 'open', 'high', 'low', 'close', 'volume']
#
# 代码规则如下：
# 1.最近5天中有一天的成交量是30日成交量ma的3倍
# TODO  2.高成交量的收盘价要收于其交易区间的上半部分
def vol_multiple_select(k_data_list):
    k_data_len = len(k_data_list)
    if k_data_len < 30:
        return False
    # 股价低于2美金的去掉，没价值
    if k_data_list.iloc[k_data_len - 1]['close'] < 2:
        return False
    multiple = 2
    volume = np.array(k_data_list['volume'])
    # 计算10日成交量均线（MA）
    ma10_volume = talib.MA(volume, timeperiod=10)

    # 检查最近6天中是否有一天的成交量是30日成交量均线的3倍
    for i in range(k_data_len - 6, k_data_len):
        k_data_temp = k_data_list.iloc[i]
        ma_10_volume_temp = ma10_volume[i]
        if k_data_temp['volume'] >= multiple * ma_10_volume_temp:
            return True

    return False
# ---------------------------------------------------------------------------------------------------------------------


# 前几天一直在下降，某一天突然大于 5，10，,15日均线

if __name__ == "__main__":
    print("start select stock...")
    # a股板块选股
    # stock_select("wave_band_3", n=7, rate_threshold=80, entity_type='block', data_schema=Block1dKdata, order=Block1dKdata.timestamp.asc(), sub_dir_path='a_block')
    # a股正股选股 可能n=10天 or 9 or 8天的概率会大一点 （可能在加个条件，最后一天的股价要站上5日均线？？）
    # stock_select("wave_band_3", n=9, rate_threshold=80, entity_type='stock', data_schema=Stock1dKdata, order=Stock1dKdata.timestamp.asc(), sub_dir_path='a_stock')
    # 用于美股选股  TODO 美股的选择上尽量选择日成交量在100w美元以上的
    # 周末选股之后，进入观察列表，然后根据回调再次买入
    # stock_select("ema", entity_type='stockus', data_schema=Stockus1dKdata, order=Stockus1dKdata.timestamp.asc(), sub_dir_path='us_stock')
    # stock_select("vol", entity_type='stockus', data_schema=Stockus1dKdata, order=Stockus1dKdata.timestamp.asc(), sub_dir_path='us_stock')
    # test_stock_select()
