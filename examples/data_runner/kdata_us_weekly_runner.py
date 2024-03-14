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
    Stockus1wkKdata,
    Indexus,
    Indexus1dKdata,
)

logger = logging.getLogger(__name__)


def record_stockus_data(data_provider="em", entity_provider="em", sleeping_time=1):
    # 美股周数据前复权行情
    run_data_recorder(
        domain=Stockus1wkKdata,
        data_provider=data_provider,
        entity_provider=entity_provider,
        day_data=True,
        sleeping_time=sleeping_time,
    )


if __name__ == "__main__":
    init_log("kdata_us_runner.log")

    record_stockus_data()
