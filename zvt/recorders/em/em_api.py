# -*- coding: utf-8 -*-
import logging
import random

import pandas as pd
import requests

from zvt.api import generate_kdata_id
from zvt.contract import ActorType, AdjustType, IntervalLevel
from zvt.contract.api import decode_entity_id
from zvt.recorders.consts import DEFAULT_HEADER
from zvt.utils import to_pd_timestamp, to_float

logger = logging.getLogger(__name__)


# 机构持仓日期
def get_ii_holder_report_dates(code):
    return get_em_data(request_type='RPT_F10_MAIN_ORGHOLD', fields='REPORT_DATE,IS_COMPLETE',
                       filters=generate_filters(code=code), sort_by='REPORT_DATE', sort='desc')


# 十大股东持仓日期
def get_holder_report_dates(code):
    return get_em_data(request_type='RPT_F10_EH_HOLDERSDATE', fields='END_DATE,IS_DEFAULT,IS_REPORTDATE',
                       filters=generate_filters(code=code), sort_by='END_DATE', sort='desc')


# 十大流通股东日期
def get_free_holder_report_dates(code):
    return get_em_data(request_type='RPT_F10_EH_FREEHOLDERSDATE', fields='END_DATE,IS_DEFAULT,IS_REPORTDATE',
                       filters=generate_filters(code=code), sort_by='END_DATE', sort='desc')


# 机构持仓
def get_ii_holder(code, report_date, org_type):
    return get_em_data(request_type='RPT_MAIN_ORGHOLDDETAIL',
                       fields='SECURITY_CODE,REPORT_DATE,HOLDER_CODE,HOLDER_NAME,TOTAL_SHARES,HOLD_VALUE,FREESHARES_RATIO,ORG_TYPE,SECUCODE,FUND_DERIVECODE',
                       filters=generate_filters(code=code, report_date=report_date, org_type=org_type))


# 机构持仓汇总
def get_ii_summary(code, report_date, org_type):
    return get_em_data(request_type='RPT_F10_MAIN_ORGHOLDDETAILS',
                       fields='SECURITY_CODE,SECUCODE,REPORT_DATE,ORG_TYPE,TOTAL_ORG_NUM,TOTAL_FREE_SHARES,TOTAL_MARKET_CAP,TOTAL_SHARES_RATIO,CHANGE_RATIO,IS_COMPLETE',
                       filters=generate_filters(code=code, report_date=report_date, org_type=org_type))


def get_free_holders(code, end_date):
    return get_em_data(request_type='RPT_F10_EH_FREEHOLDERS',
                       fields='SECUCODE,END_DATE,HOLDER_NAME,HOLDER_CODE,HOLDER_CODE_OLD,HOLD_NUM,FREE_HOLDNUM_RATIO,FREE_RATIO_QOQ,IS_HOLDORG,HOLDER_RANK',
                       filters=generate_filters(code=code, end_date=end_date), sort_by='HOLDER_RANK')


def get_holders(code, end_date):
    return get_em_data(request_type='RPT_F10_EH_HOLDERS',
                       fields='SECUCODE,END_DATE,HOLDER_NAME,HOLDER_CODE,HOLDER_CODE_OLD,HOLD_NUM,HOLD_NUM_RATIO,HOLD_RATIO_QOQ,HOLDER_RANK,IS_HOLDORG',
                       filters=generate_filters(code=code, end_date=end_date), sort_by='HOLDER_RANK')


def get_url(type, sty, filters, order_by='', order='asc', pn=1, ps=2000):
    # 根据 url 映射如下
    # type=RPT_F10_MAIN_ORGHOLDDETAILS
    # sty=SECURITY_CODE,SECUCODE,REPORT_DATE,ORG_TYPE,TOTAL_ORG_NUM,TOTAL_FREE_SHARES,TOTAL_MARKET_CAP,TOTAL_SHARES_RATIO,CHANGE_RATIO,IS_COMPLETE
    # filter=(SECUCODE="000338.SZ")(REPORT_DATE=\'2021-03-31\')(ORG_TYPE="01")
    # sr=1
    # st=
    if order == 'asc':
        sr = 1
    else:
        sr = -1
    v = random.randint(1000000000000000, 9000000000000000)
    return f'https://datacenter.eastmoney.com/securities/api/data/get?type={type}&sty={sty}&filter={filters}&client=APP&source=SECURITIES&p={pn}&ps={ps}&sr={sr}&st={order_by}&v=0{v}'


def get_exchange(code):
    if code >= '333333':
        return 'SH'
    else:
        return 'SZ'


def actor_type_to_org_type(actor_type: ActorType):
    if actor_type == ActorType.raised_fund:
        return '01'
    if actor_type == ActorType.qfii:
        return '02'
    if actor_type == ActorType.social_security:
        return '03'
    if actor_type == ActorType.broker:
        return '04'
    if actor_type == ActorType.insurance:
        return '05'
    if actor_type == ActorType.trust:
        return '06'
    if actor_type == ActorType.corporation:
        return '07'
    assert False


def generate_filters(code=None, report_date=None, end_date=None, org_type=None):
    result = ''
    if code:
        result += f'(SECUCODE="{code}.{get_exchange(code)}")'
    if report_date:
        result += f'(REPORT_DATE=\'{report_date}\')'
    if org_type:
        result += f'(ORG_TYPE="{org_type}")'
    if end_date:
        result += f'(END_DATE=\'{end_date}\')'

    return result


def get_em_data(request_type, fields, filters, sort_by='', sort='asc', pn=1, ps=2000):
    url = get_url(type=request_type, sty=fields, filters=filters, order_by=sort_by, pn=pn, ps=ps)
    resp = requests.get(url)
    if resp.status_code == 200:
        json_result = resp.json()
        if json_result and json_result['result']:
            data: list = json_result['result']['data']
            if json_result['result']['pages'] > pn:
                next_data = get_em_data(request_type=request_type, fields=fields, filters=filters, sort_by=sort_by,
                                        sort=sort, pn=pn + 1, ps=ps)
                if next_data:
                    data = data + next_data
                    return data
            else:
                return data
        return None
    raise RuntimeError(f'request em data code: {resp.status_code}, error: {resp.text}')


# quote
# url = 'https://push2his.eastmoney.com/api/qt/stock/kline/get?'
# 日线      klt=101
# 周线      klt=102
# 月线      klt=103
#
# limit    lmt=2000
#
# 结束时间   end=20500000
#
# 复权      fqt 0 不复权 1 前复权 2 后复权
#          iscca
#
# 字段
# f51,f52,f53,f54,f55,
# timestamp,open,close,high,low
# f56,f57,f58,f59,f60,f61,f62,f63,f64
# volumn,turnover,震幅,change_pct,change,turnover_rate
# 深圳
# secid=0.399001&klt=101&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
# secid=0.399001&klt=102&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
# secid=0.000338&klt=101&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
#
# 港股
# secid=116.01024&klt=102&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
# 美股
# secid=106.BABA&klt=102&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
#
# 上海
# secid=1.512660&klt=101&fqt=1&lmt=66&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1
def get_kdata(entity_id, level=IntervalLevel.LEVEL_1DAY, adjust_type=AdjustType.qfq, limit=5000):
    entity_type, exchange, code = decode_entity_id(entity_id)
    level = IntervalLevel(level)

    sec_id = to_em_sec_id(entity_id)
    fq_flag = to_em_fq_flag(adjust_type)
    level_flag = to_em_level_flag(level)
    url = f'https://push2his.eastmoney.com/api/qt/stock/kline/get?secid={sec_id}&klt={level_flag}&fqt={fq_flag}&lmt={limit}&end=20500000&iscca=1&fields1=f1,f2,f3,f4,f5,f6,f7,f8&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61,f62,f63,f64&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1'

    resp = requests.get(url, headers=DEFAULT_HEADER)
    resp.raise_for_status()
    results = resp.json()

    kdatas = []

    if results:
        klines = results['data']['klines']
        name = results['data']['name']

        # TODO: ignore the last unfinished kdata now,could control it better if need
        for result in klines[:-1]:
            # "2000-01-28,1005.26,1012.56,1173.12,982.13,3023326,3075552000.00"
            # time,open,close,high,low,volume,turnover
            fields = result.split(',')
            the_timestamp = to_pd_timestamp(fields[0])

            the_id = generate_kdata_id(entity_id=entity_id, timestamp=the_timestamp, level=level)

            kdatas.append(dict(id=the_id,
                               timestamp=the_timestamp,
                               entity_id=entity_id,
                               code=code,
                               name=name,
                               level=level.value,
                               open=to_float(fields[1]),
                               close=to_float(fields[2]),
                               high=to_float(fields[3]),
                               low=to_float(fields[4]),
                               volume=to_float(fields[5]),
                               turnover=to_float(fields[6])))
    if kdatas:
        df = pd.DataFrame.from_records(kdatas)
        return df


def to_em_fq_flag(adjust_type: AdjustType):
    adjust_type = AdjustType(adjust_type)
    if adjust_type == AdjustType.bfq:
        return 0
    if adjust_type == AdjustType.qfq:
        return 1
    if adjust_type == AdjustType.hfq:
        return 2


def to_em_level_flag(level: IntervalLevel):
    level = IntervalLevel(level)
    if level == IntervalLevel.LEVEL_1DAY:
        return 101
    if level == IntervalLevel.LEVEL_1WEEK:
        return 102
    if level == IntervalLevel.LEVEL_1MON:
        return 103

    assert False


def to_em_sec_id(entity_id):
    entity_type, exchange, code = decode_entity_id(entity_id)

    # 深圳
    if exchange == 'sz':
        return f'0.{code}'
    # 上海
    if exchange == 'sh':
        return f'1.{code}'
    # 港股
    if exchange == 'hk':
        return f'116.{code}'
    # 美股
    if exchange == 'us':
        return f'106.{code}'
    assert False


if __name__ == '__main__':
    # pprint(get_free_holder_report_dates(code='000338'))
    # pprint(get_holder_report_dates(code='000338'))
    # pprint(get_holders(code='000338', end_date='2021-03-31'))
    # pprint(get_free_holders(code='000338', end_date='2021-03-31'))
    # pprint(get_ii_holder(code='000338', report_date='2021-03-31',
    #                      org_type=actor_type_to_org_type(ActorType.corporation)))
    # pprint(get_ii_summary(code='000338', report_date='2021-03-31',
    #                       org_type=actor_type_to_org_type(ActorType.corporation)))
    df = get_kdata(entity_id='stock_sz_000001')
    print(df)
# the __all__ is generated
__all__ = ['get_ii_holder_report_dates', 'get_holder_report_dates', 'get_free_holder_report_dates', 'get_ii_holder',
           'get_ii_summary', 'get_free_holders', 'get_holders', 'get_url', 'get_exchange', 'actor_type_to_org_type',
           'generate_filters', 'get_em_data']