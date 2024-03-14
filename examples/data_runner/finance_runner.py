# -*- coding: utf-8 -*-
import logging

from apscheduler.schedulers.background import BackgroundScheduler

from examples.recorder_utils import run_data_recorder
from zvt import init_log
from zvt.domain import (
    Stock,
    StockDetail,
    FinanceFactor,
    BalanceSheet,
    IncomeStatement,
    CashFlowStatement,
)

logger = logging.getLogger(__name__)

sched = BackgroundScheduler()

# 这个函数用来运行A股的财报数据
@sched.scheduled_job("cron", hour=1, minute=00, day_of_week=5)
def record_actor_data(data_provider="eastmoney", entity_provider="eastmoney"):
    # run_data_recorder(domain=Stock, data_provider=data_provider,sleeping_time=1)
    # run_data_recorder(domain=StockDetail, data_provider=data_provider,sleeping_time=1)
    run_data_recorder(domain=FinanceFactor, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True)
    run_data_recorder(domain=BalanceSheet, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True)
    run_data_recorder(
        domain=IncomeStatement, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True
    )
    run_data_recorder(
        domain=CashFlowStatement, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True
    )


# 这个函数用来运行美股的财报数据
@sched.scheduled_job("cron", hour=1, minute=00, day_of_week=5)
def record_us_actor_data(data_provider="eastmoney", entity_provider="em"):
    # run_data_recorder(domain=Stock, data_provider=data_provider,sleeping_time=1)
    # run_data_recorder(domain=StockDetail, data_provider=data_provider,sleeping_time=1)
    run_data_recorder(domain=FinanceFactor, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True)
    run_data_recorder(domain=BalanceSheet, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True)
    run_data_recorder(
        domain=IncomeStatement, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True
    )
    run_data_recorder(
        domain=CashFlowStatement, data_provider=data_provider, entity_provider=entity_provider,sleeping_time=1, day_data=True
    )

if __name__ == "__main__":
    init_log("finance_runner.log")

    # record_actor_data()
    record_us_actor_data()
    sched.start()

    sched._thread.join()
