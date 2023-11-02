# -*- coding: utf-8 -*-
import logging

from apscheduler.schedulers.background import BackgroundScheduler
import inspect
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime, timedelta

from zvt.contract.api import get_entities, get_data, df_to_db
from examples.recorder_utils import run_data_recorder
from examples.report_utils import inform
from zvt import init_log
from zvt.domain import (
    Stock,
    BlockStock,
    BlockStatData,
    Stock1dHfqKdata,
    Stock1dKdata,
    Stockhk,
    Stockhk1dHfqKdata,
    Block,
    Block1dKdata,
    BlockCategory,
    Index,
    Index1dKdata,
)
from zvt.informer import EmailInformer
from zvt.utils import next_date, current_date

logger = logging.getLogger(__name__)

sched = BackgroundScheduler()


# 获取A股板块与股票之间的关系
def record_block_stock(data_provider="em", entity_provider="em", sleeping_time=1):
    # A股的板块与股票之间的关系
    run_data_recorder(
        domain=BlockStock,
        data_provider=data_provider,
        force_update=True,
        sleeping_time=sleeping_time,
    )


# 计算指定时间开始到当天，每天每个板块的上涨的股票数量占板块中股票总数量的占比
def calc_block_stock_rise_rate(data_provider="em",entity_provider="em", sleeping_time=1):
    data_schema = BlockStatData
    start_date = datetime(2023, 1, 1)
    end_date = datetime.now()
    calc_date_list = []
    current_date = start_date
    while current_date <= end_date:
        calc_date_list.append(current_date)
        current_date += timedelta(days=1)

    entities = get_entities(entity_type="block")
    for index, row in entities.iterrows():
        logger.info(f"calc block code:{row['code']},block name:{row['name']} ,index:{index}")
        df = do_calc_block_stock_rise_rate(calc_date_list,row)
        df_to_db(df=df, data_schema=data_schema, provider=data_provider, force_update=True)


# 计算日期列表中，板块中股票上涨的占比
def do_calc_block_stock_rise_rate(calc_date_list, row):
    columns = ['id', 'entity_id', 'timestamp', 'code', 'name', 'stock_rise_rate']
    df = pd.DataFrame(columns=columns)
    # 获取板块下的股票列表
    block_stock_df = get_data(data_schema=BlockStock, code=row['code'])
    stock_list = block_stock_df['stock_code'].to_list()
    # 获取每个股票指定日期是否上涨，上涨的判断日期是 close >= open 也就是收盘价要大于开盘价
    for date in calc_date_list:
        # 获取这天全部股票code的数据
        k_data_df = get_data(
            data_schema=Stock1dKdata,
            codes=stock_list,
            start_timestamp=date,
            end_timestamp=date

        )
        # 如果股票没有数据，那么跳过这一天，说明这一天不开盘（比如：周末）
        if k_data_df.empty:
            continue
        # 计算
        rise_stock = k_data_df['close'] >= k_data_df['open']
        rise_count = rise_stock.sum()

        # 计算比例
        rise_rate = round(rise_count / len(k_data_df), 2)

        # 组装数据
        temp_data = [f"{row['id']}_{date}",row['entity_id'],date,row['code'],row['name'],rise_rate]
        df.loc[len(df)] = temp_data

        logger.info(f"calc block code:{row['code']},block name:{row['name']} date:{date.strftime('%Y-%m-%d')},rise rate:{rise_rate * 100}%")
    return df


# 板块指定日期和指标的曲线图画出来
def show_block_stat_pict(block_code):
    start_date = datetime(2023, 9, 1)
    end_date = datetime.now()
    df = get_data(
        BlockStatData,
        code=block_code,
        columns=['timestamp','stock_rise_rate'],
        start_timestamp=start_date,
        end_timestamp=end_date
    )
    # 设置日期列为索引（X轴将以日期显示）
    df.set_index('timestamp', inplace=True)

    # 将stock_rise_rate转换为百分比形式
    df['stock_rise_rate'] = df['stock_rise_rate'] * 100

    # 创建曲线图
    plt.figure(figsize=(13, 8))  # 设置图形大小
    plt.plot(df.index, df['stock_rise_rate'], marker='o', linestyle='-', color='b', label='占比')

    # 添加标题和标签
    plt.title('stock rise rate.')
    plt.xlabel('date')
    plt.ylabel('rate')

    # 添加图例
    plt.legend()

    # 显示图形
    plt.grid(True)
    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    init_log("block_stock_runner.log")

    # record_block_stock()
    # calc_block_stock_rise_rate()
    #
    show_block_stat_pict('BK1150')