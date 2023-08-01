import pandas as pd
import talib as ta
import zipline
from zipline.api import symbol, record, order_target_percent, schedule_function, set_benchmark
from zipline.utils.events import date_rules, time_rules

"""人气指标"""


def initialize(context):
    print("init")
    context.asset = symbol('IBM')
    context.bar_count = 60
    context.period = 26
    # 设定AR的超卖线，低于它则买入
    context.over_sell = 80
    # 设定AR的超买线，高于它则卖出
    context.over_buy = 150
    schedule_function(rebalance, date_rules.every_day(), time_rules.market_open())


def rebalance(context, data):
    history = data.history(assets=context.asset,
                           fields=['open', 'high', 'low', 'close'],
                           bar_count=context.bar_count,
                           frequency='1d')
    date = history.index.values[-1]
    open = history['open'].values
    high = history['high'].values
    low = history['low'].values

    HO = high - open
    OL = open - low

    ar = ta.SUM(HO, timeperiod=context.period) / ta.SUM(OL, timeperiod=context.period) * 100

    buy_signal_triggered = False
    sell_signal_triggered = False

    price = data[context.asset].price
    record(price=price)

    if ar[-1] < context.over_sell:
        buy_signal_triggered = True
    elif ar[-1] > context.over_buy:
        sell_signal_triggered = True

    current_position = context.portfolio.positions[context.asset].amount

    if buy_signal_triggered and current_position == 0:
        print(str(date) + '==>Buy')
        order_target_percent(context.asset, 0.5)

    elif sell_signal_triggered and current_position > 0:
        print(str(date) + '==>Sell')
        order_target_percent(context.asset, 0.0)
    else:
        print("No trading")


if __name__ == '__main__':
    start_session = pd.to_datetime('2012-05-01', utc=True)
    end_session = pd.to_datetime('2013-05-01', utc=True)
    bundle_name = "custom-csv-bundle"
    capital = 10000

    perf = zipline.run_algorithm(start=start_session,
                                 end=end_session,
                                 initialize=initialize,
                                 bundle=bundle_name,
                                 capital_base=capital)

    perf.to_pickle("output.pkl")
