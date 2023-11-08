import pandas as pd
import mplfinance as mpf

def plot_candlestick(kline_data, output_filename):
    # 解析K线数据
    # 假设K线数据是一个包含日期、开盘价、最高价、最低价、收盘价和交易量的列表
    dates = [data[0] for data in kline_data]
    open_prices = [data[1] for data in kline_data]
    high_prices = [data[2] for data in kline_data]
    low_prices = [data[3] for data in kline_data]
    close_prices = [data[4] for data in kline_data]
    volumes = [data[5] for data in kline_data]

    # 创建DataFrame
    df = pd.DataFrame({
        'Date': pd.to_datetime(dates),
        'Open': open_prices,
        'High': high_prices,
        'Low': low_prices,
        'Close': close_prices,
        'Volume': volumes
    })

    # 设置日期为索引
    df.set_index('Date', inplace=True)
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
    mpf.plot(df, type='candle', style=style, volume=True, ylabel="price", figratio=(12, 6), savefig=output_filename)

# 示例用法
kline_data = [
    ['2022-01-01', 100, 120, 80, 110,10009],
    ['2022-01-02', 110, 130, 100, 120,10009],
    ['2022-01-03', 120, 140, 110, 130,10009],
['2022-01-04', 120, 140, 110, 130,10009],
['2022-01-05', 120, 140, 110, 130,10009],
['2022-01-06', 120, 140, 110, 130,10009],
    # ...更多的K线数据
]

output_file = "/Users/gaoerrong/Downloads/candlestick_chart.png"
plot_candlestick(kline_data, output_file)
