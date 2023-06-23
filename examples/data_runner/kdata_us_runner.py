# -*- coding: utf-8 -*-
import logging

from apscheduler.schedulers.background import BackgroundScheduler
from sqlalchemy import and_
from examples.recorder_utils import run_data_recorder
from examples.report_utils import inform
from zvt import init_log
from zvt.domain import (
    Index,
    Stockus,
    Stockus1dKdata,
    Indexus,
    Indexus1dKdata,
)

logger = logging.getLogger(__name__)

sched = BackgroundScheduler()

# 每天上午8点开始调度
@sched.scheduled_job("cron", hour=8)
def record_stockus_data(data_provider="em", entity_provider="em", sleeping_time=1):
    # 美股指数
    run_data_recorder(domain=Indexus, data_provider=data_provider, force_update=False)
    entity_filter = [Indexus.entity_type == "indexus"]
    # 美股指数行情
    run_data_recorder(
        domain=Indexus1dKdata,
        data_provider=data_provider,
        entity_provider=entity_provider,
        day_data=True,
        sleeping_time=sleeping_time,
        entity_filters=entity_filter,
    )

    # 美股标的
    run_data_recorder(domain=Stockus, data_provider=data_provider, force_update=False)
    # 美股前复权行情
    run_data_recorder(
        domain=Stockus1dKdata,
        data_provider=data_provider,
        entity_provider=entity_provider,
        day_data=True,
        sleeping_time=sleeping_time,
    )


if __name__ == "__main__":
    init_log("kdata_us_runner.log")

    record_stockus_data()

    sched.start()

    sched._thread.join()
