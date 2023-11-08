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
        if strategy_type == 1:
            matched = wave_band_select(k_data_list)

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


# 波段选股方式，先有几天的下降，然后当天比前一天的收盘价要高
# 1.第一天，第二天，第三天股价在下降。
# 2.第四天的数据中取open和close的最大值大于第三天的数据中取open和close的最小值
# 2.第五天的数据中取open和close的最大值大于第四天的数据中取open和close的最小值
# 4.如果符合上述全部逻辑，那么打印符合条件
def wave_band_select(k_data_list):
    # 检查是否符合逻辑
    last_five_data = k_data_list[-5:]
    if last_five_data.iloc[0]['close'] > last_five_data.iloc[1]['close'] > last_five_data.iloc[2]['close']:
        # 检查第四天的数据
        fourth_day = last_five_data.iloc[3]
        third_day = last_five_data.iloc[2]
        # 检查第四天的最大值是否大于第三天的最小值
        if max(fourth_day['open'], fourth_day['close']) > min(third_day['open'], third_day['close']):
            # 检查第五天的数据
            fifth_day = last_five_data.iloc[4]
            fourth_day = last_five_data.iloc[3]
            # 检查第五天的最大值是否大于第四天的最小值
            if max(fifth_day['open'], fifth_day['close']) > min(fourth_day['open'], fourth_day['close']):
                # 符合条件，打印结果
                return True

    return False

# 连续多天下降，然后当天形成T
# T形的规则是：?
# 1.最高与收盘相差小于0.5。最低与收盘相差大于1。（这样有个弊端是会过滤掉很多小盘股）
# 2.最高等于收盘，最低与收盘相差大于1

#均线 5>10>20 or 10>20>30

# 最近几天之内有一天的成交量特别大。需要接下来一段时间去关注。

if __name__ == "__main__":
    print("start select stock...")
    # a股板块选股
    stock_select(1, entity_type='block', data_schema=Block1dKdata, order=Block1dKdata.timestamp.asc(), sub_dir_path='a_block')
    # a股正股选股
    # stock_select(1, entity_type='stock', data_schema=Stock1dKdata, order=Stock1dKdata.timestamp.asc(), sub_dir_path='a_stock')
