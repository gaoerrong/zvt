# -*- coding: utf-8 -*-
import logging

from apscheduler.schedulers.background import BackgroundScheduler

from examples.recorder_utils import run_data_recorder
from examples.report_utils import inform
from zvt import init_log
from zvt.domain import (
    Stock,
    BlockStock,
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


def record_block_stock(data_provider="em", entity_provider="em", sleeping_time=1):
    # A股的板块与股票之间的关系
    run_data_recorder(
        domain=BlockStock,
        data_provider=data_provider,
        force_update=True,
        sleeping_time=sleeping_time,
    )


if __name__ == "__main__":
    init_log("block_stock_runner.log")

    record_block_stock()
