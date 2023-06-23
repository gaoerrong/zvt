# -*- coding: utf-8 -*-
import logging
import time

from apscheduler.schedulers.background import BackgroundScheduler
from sqlalchemy import or_

from examples.recorder_utils import run_data_recorder
from zvt import init_log, zvt_config
from zvt.domain import *
from zvt.informer.informer import EmailInformer

logger = logging.getLogger(__name__)

sched = BackgroundScheduler()


@sched.scheduled_job("cron", hour=15, minute=30, day_of_week=3)
def record_block():
    run_data_recorder(domain=Block, data_provider="sina")
    run_data_recorder(domain=Block, data_provider="sina", entity_provider="sina")


@sched.scheduled_job("cron", hour=15, minute=30)
def record_money_flow():
    entity_filter = [Block.code.like("new%") | Block.code.like("gn%")]
    run_data_recorder(
        domain=BlockMoneyFlow,
        data_provider="sina",
        entity_provider="sina",
        day_data=True,
        sleeping_time=5,
        entity_filters=entity_filter,
    )


if __name__ == "__main__":
    init_log("sina_data_runner.log")

    # record_block()
    record_money_flow()

    sched.start()

    sched._thread.join()
