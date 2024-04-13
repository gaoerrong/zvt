# -*- coding: utf-8 -*-
import json

import requests
from datetime import datetime

from zvt.api.utils import to_report_period_type
from zvt.api.utils import to_us_report_period_type
from zvt.domain import FinanceFactor, Stockus
from zvt.recorders.eastmoney.finance.base_china_stock_finance_recorder import BaseChinaStockFinanceRecorder
from zvt.utils.time_utils import to_pd_timestamp
from zvt.utils.utils import add_func_to_value, to_float
from zvt.recorders.eastmoney.common import (
    company_type_flag,
    get_fc,
    EastmoneyTimestampsDataRecorder,
    call_eastmoney_api,
    get_from_path_fields,
)

finance_factor_map = {
    # 基本每股收益(元)
    "basic_eps": "Epsjb",
    # 基本每股收益同比
    "basic_eps_yoy": "Epsjbyoy",
    # 扣非每股收益(元)
    "deducted_eps": "Epskcjb",
    # 稀释每股收益(元)
    "diluted_eps": "Epsxs",
    # 每股净资产(元)
    "bps": "Bps",
    # 每股资本公积(元)
    "capital_reserve_ps": "Mgzbgj",
    # 每股未分配利润(元)
    "undistributed_profit_ps": "Mgwfplr",
    # 每股经营现金流(元)
    "op_cash_flow_ps": "Mgjyxjje",
    # 成长能力指标
    #
    # 营业总收入(元)
    "total_op_income": "Totalincome",
    # 毛利润(元)
    "gross_profit": "Grossprofit",
    # 归属净利润(元)
    "net_profit": "Parentnetprofit",
    # 扣非净利润(元)
    "deducted_net_profit": "Bucklenetprofit",
    # 营业总收入同比增长
    "op_income_growth_yoy": "Totalincomeyoy",
    # 归属净利润同比增长
    "net_profit_growth_yoy ": "Parentnetprofityoy",
    # 扣非净利润同比增长
    "deducted_net_profit_growth_yoy": "Bucklenetprofityoy",
    # 营业总收入滚动环比增长
    "op_income_growth_qoq": "Totalincomerelativeratio",
    # 归属净利润滚动环比增长
    "net_profit_growth_qoq": "Parentnetprofitrelativeratio",
    # 扣非净利润滚动环比增长
    "deducted_net_profit_growth_qoq": "Bucklenetprofitrelativeratio",
    # 盈利能力指标
    #
    # 净资产收益率(加权)
    "roe": "Roejq",
    # 净资产收益率(扣非/加权)
    "deducted_roe": "Roekcjq",
    # 总资产收益率(加权)
    "rota": "Allcapitalearningsrate",
    # 毛利率
    "gross_profit_margin": "Grossmargin",
    # 净利率
    "net_margin": "Netinterest",
    # 收益质量指标
    #
    # 预收账款/营业收入
    "advance_receipts_per_op_income": "Accountsrate",
    # 销售净现金流/营业收入
    "sales_net_cash_flow_per_op_income": "Salesrate",
    # 经营净现金流/营业收入
    "op_net_cash_flow_per_op_income": "Operatingrate",
    # 实际税率
    "actual_tax_rate": "Taxrate",
    # 财务风险指标
    #
    # 流动比率
    "current_ratio": "Liquidityratio",
    # 速动比率
    "quick_ratio": "Quickratio",
    # 现金流量比率
    "cash_flow_ratio": "Cashflowratio",
    # 资产负债率
    "debt_asset_ratio": "Assetliabilityratio",
    # 权益乘数
    "em": "Equitymultiplier",
    # 产权比率
    "equity_ratio": "Equityratio",
    # 营运能力指标(一般企业)
    #
    # 总资产周转天数(天)
    "total_assets_turnover_days": "Totalassetsdays",
    # 存货周转天数(天)
    "inventory_turnover_days": "Inventorydays",
    # 应收账款周转天数(天)
    "receivables_turnover_days": "Accountsreceivabledays",
    # 总资产周转率(次)
    "total_assets_turnover": "Totalassetrate",
    # 存货周转率(次)
    "inventory_turnover": "Inventoryrate",
    # 应收账款周转率(次)
    "receivables_turnover": "Accountsreceiveablerate",
    # 专项指标(银行)
    #
    # 存款总额
    "fi_total_deposit": "Totaldeposit",
    # 贷款总额
    "fi_total_loan": "Totalloan",
    # 存贷款比例
    "fi_loan_deposit_ratio": "Depositloanratio",
    # 资本充足率
    "fi_capital_adequacy_ratio": "Capitaladequacyratio",
    # 核心资本充足率
    "fi_core_capital_adequacy_ratio": "Corecapitaladequacyratio",
    # 不良贷款率
    "fi_npl_ratio": "Nplratio",
    # 不良贷款拨备覆盖率
    "fi_npl_provision_coverage": "Nplprovisioncoverage",
    # 资本净额
    "fi_net_capital": "Netcapital_b",
    # 专项指标(保险)
    #
    # 总投资收益率
    "insurance_roi": "Tror",
    # 净投资收益率
    "insurance_net_investment_yield": "Nror",
    # 已赚保费
    "insurance_earned_premium": "Eapre",
    # 赔付支出
    "insurance_payout": "Comexpend",
    # 退保率
    "insurance_surrender_rate": "Surrate",
    # 偿付能力充足率
    "insurance_solvency_adequacy_ratio": "Solvenra",
    # 专项指标(券商)
    #
    # 净资本
    "broker_net_capital": "Netcapital",
    # 净资产
    "broker_net_assets": "Netassets",
    # 净资本/净资产
    "broker_net_capital_assets_ratio": "Captialrate",
    # 自营固定收益类证券规模/净资本
    "broker_self_operated_fixed_income_securities_net_capital_ratio": "Incomesizerate",
}

add_func_to_value(finance_factor_map, to_float)
finance_factor_map["report_period"] = ("ReportDate", to_report_period_type)
finance_factor_map["report_date"] = ("ReportDate", to_pd_timestamp)


class ChinaStockFinanceFactorRecorder(BaseChinaStockFinanceRecorder):
    url = "https://emh5.eastmoney.com/api/CaiWuFenXi/GetZhuYaoZhiBiaoList"
    finance_report_type = "ZhuYaoZhiBiaoList"

    data_schema = FinanceFactor
    data_type = 1

    # ----- for 美股 start ------
    entity_schema = Stockus
    entity_provider = "em"
    finance_factor_map["report_period"] = ("ReportType", to_us_report_period_type)
    # ----- for 美股 end ------

    def get_data_map(self):
        return finance_factor_map

    def init_timestamps(self, entity_item):
        if entity_item.entity_type == 'stockus':
            return self.init_us_timestamps(entity_item)
        else:
            return super().init_timestamps(entity_item)

    def init_us_timestamps(self, entity_item):
        secucode = self.get_us_stock_secucode(entity_item)
        if secucode is None:
            return None
        data_array = self.get_us_stock_finance_data(secucode)

        if data_array is None:
            return None

        timestamp_json_list = []
        for json_data in data_array:
            data_dict = {}
            date_obj = datetime.strptime(json_data['REPORT_DATE'], "%Y-%m-%d %H:%M:%S")
            data_dict['ReportDate'] = date_obj.strftime("%Y-%m-%d")  # 报告期
            data_dict['ReportTitle'] = json_data['REPORT_DATA_TYPE'].replace(" ", "") # 报告title
            timestamp_json_list.append(data_dict)

        if self.timestamp_path_fields:
            timestamps = [get_from_path_fields(data, self.timestamp_path_fields) for data in timestamp_json_list]

        return [to_pd_timestamp(t) for t in timestamps]

    # 用于区分美股还是a股，美股的在这里获取，a股的就直接用父类中的方法
    def record(self, entity, start, end, size, timestamps):
        if entity.entity_type == "stockus":
            return self.us_record(entity, start, end, size, timestamps)
        else:
            return super().record(entity, start, end, size, timestamps)

    def us_record(self,entity,start,end,size,timestamps):
        data_array = self.get_us_stock_finance_data(self.get_us_stock_secucode(entity))
        if data_array is None:
            return None

        converted_data = []
        for data in data_array:
            data_dict = self.us_finance_data_convert(data,start,end)
            #不需要处理，因为之前已经处理过了
            if data_dict is not None:
                converted_data.append(data_dict)

        return converted_data

    def us_finance_data_convert(self,json_data,start,end):
        data_dict = {}
        date_obj = datetime.strptime(json_data['REPORT_DATE'], "%Y-%m-%d %H:%M:%S")
        # 判断时间是否在start end的范围之内,在范围内的才进行数据转换，不在范围内的说明之前处理过了
        if not start < date_obj <= end:
            return None
        data_dict['ReportDate'] = date_obj.strftime("%Y-%m-%d") #报告期
        data_dict['ReportType'] = json_data['REPORT_TYPE'] #报告类型

        if "BASIC_EPS" in json_data:
            data_dict['Epsjb'] = json_data['BASIC_EPS'] #基本每股收益
        elif "BASIC_EPS_CS" in json_data:
            data_dict['Epsjb'] = json_data['BASIC_EPS_CS']

        if "BASIC_EPS_YOY" in json_data:
            data_dict['Epsjbyoy'] = json_data['BASIC_EPS_YOY'] #基本每股收益同比
        elif "BASIC_EPS_CS_YOY" in json_data:
            data_dict['Epsjbyoy'] = json_data['BASIC_EPS_CS_YOY'] #基本每股收益同比

        if "DILUTED_EPS" in json_data:
            data_dict['Epsxs'] = json_data['DILUTED_EPS'] #稀释每股收益
        elif "DILUTED_EPS_CS" in json_data:
            data_dict['Epsxs'] = json_data['DILUTED_EPS_CS']  # 稀释每股收益
        #data_dict['Bps'] = json_data['Bps'] #每股净资产
        # data_dict['Mgzbgj'] = json_data['Mgzbgj'] #每股资本公积
        #data_dict['Mgwfplr'] = json_data['Mgwfplr']
        #data_dict['Mgjyxjje'] = json_data['Mgjyxjje']

        if "OPERATE_INCOME" in json_data:
            data_dict['Totalincome'] = json_data.get('OPERATE_INCOME') #营业总收入
        elif "TOTAL_INCOME" in json_data:
            data_dict['Totalincome'] = json_data.get('TOTAL_INCOME')  # 营业总收入

        if "OPERATE_INCOME_YOY" in json_data:
            data_dict['Totalincomeyoy'] = json_data.get('OPERATE_INCOME_YOY')
        elif "TOTAL_INCOME_YOY" in json_data:
            data_dict['Totalincomeyoy'] = json_data.get('TOTAL_INCOME_YOY') #营业总收入同比增长

        data_dict['Grossprofit'] = json_data.get('GROSS_PROFIT') #毛利润
        data_dict['Parentnetprofit'] = json_data.get('PARENT_HOLDER_NETPROFIT') #归属净利润
        data_dict['Parentnetprofityoy'] = json_data.get('PARENT_HOLDER_NETPROFIT_YOY') #归母净利润同比
        data_dict['Grossmargin'] = json_data.get('GROSS_PROFIT_RATIO') #毛利率
        data_dict['Netinterest'] = json_data.get('NET_PROFIT_RATIO') #净利率
        data_dict['Accountsreceiveablerate'] = json_data.get('ACCOUNTS_RECE_TR') #应收账款周转率（次）
        data_dict['Inventoryrate'] = json_data.get('INVENTORY_TR') #存货周转率(次)
        data_dict['Totalassetrate'] = json_data.get('TOTAL_ASSETS_TR') #总资产周转率(次)
        data_dict['Accountsreceivabledays'] = json_data.get('ACCOUNTS_RECE_TDAYS') #应收账款周转天数(天)
        data_dict['Inventorydays'] = json_data.get('INVENTORY_TDAYS') #存货周转天数(天)
        data_dict['Totalassetsdays'] = json_data.get('TOTAL_ASSETS_TDAYS') #总资产周转天数(天)
        data_dict['Roekcjq'] = json_data.get('ROE_AVG') #净资产收益率
        data_dict['Allcapitalearningsrate'] = json_data.get('ROA') #总资产净利率
        data_dict['Liquidityratio'] = json_data.get('CURRENT_RATIO') #流动比率(倍)
        data_dict['Quickratio'] = json_data.get('SPEED_RATIO') #速动比率(倍)
        data_dict['Operatingrate'] = json_data.get('OCF_LIQDEBT') #经营业务现金净额/流动负债
        data_dict['Assetliabilityratio'] = json_data.get('DEBT_ASSET_RATIO') #资产负债率
        data_dict['Equityratio'] = json_data.get('EQUITY_RATIO') #产权比率
        return data_dict


    def get_us_stock_finance_data(self,secucode):
        url = ("https://datacenter.eastmoney.com/securities/api/data/v1/get?reportName=RPT_USF10_FN_GMAININDICATOR&"
               "columns=SECUCODE%2CSECURITY_CODE%2CSECURITY_NAME_ABBR%2CREPORT_DATE%2CCURRENCY%2CDATE_TYPE_CODE%2CREPORT_TYPE%2CFINANCIAL_DATE%2COPERATE_INCOME%2COPERATE_INCOME_YOY%2CGROSS_PROFIT%2CGROSS_PROFIT_YOY%2CPARENT_HOLDER_NETPROFIT%2CPARENT_HOLDER_NETPROFIT_YOY%2CBASIC_EPS%2CDILUTED_EPS%2CGROSS_PROFIT_RATIO%2CNET_PROFIT_RATIO%2CACCOUNTS_RECE_TR%2CINVENTORY_TR%2CTOTAL_ASSETS_TR%2CACCOUNTS_RECE_TDAYS%2CINVENTORY_TDAYS%2CTOTAL_ASSETS_TDAYS%2CROE_AVG%2CROA%2CCURRENT_RATIO%2CSPEED_RATIO%2COCF_LIQDEBT%2CDEBT_ASSET_RATIO%2CEQUITY_RATIO%2CUSF10_FN_GMAININDICATOR&"
               f"filter=(SECUCODE%3D%22{secucode}%22)(DATE_TYPE_CODE%20in%20(%22003%22%2C%22008%22%2C%22006%22%2C%22007%22))&"
               "pageNumber=1&pageSize=500&sortTypes=-1%2C1&sortColumns=REPORT_DATE%2CDATE_TYPE_CODE&source=SECURITIES&client=APP&v=011143222493676341")
        resp = requests.get(url)
        resp_json = resp.json()
        if resp_json.get("success"):
            return resp.json().get("result").get("data")
        else:
            url = ("https://datacenter.eastmoney.com/securities/api/data/v1/get?reportName=RPT_USF10_FN_IMAININDICATOR&"
                   "columns=ORG_CODE%2CSECURITY_CODE%2CSECUCODE%2CSECURITY_NAME_ABBR%2CSECURITY_INNER_CODE%2CSTD_REPORT_DATE%2CREPORT_DATE%2CDATE_TYPE%2CDATE_TYPE_CODE%2CREPORT_TYPE%2CREPORT_DATA_TYPE%2CFISCAL_YEAR%2CSTART_DATE%2CNOTICE_DATE%2CACCOUNT_STANDARD%2CACCOUNT_STANDARD_NAME%2CCURRENCY%2CCURRENCY_NAME%2CORGTYPE%2CTOTAL_INCOME%2CTOTAL_INCOME_YOY%2CPREMIUM_INCOME%2CPREMIUM_INCOME_YOY%2CPARENT_HOLDER_NETPROFIT%2CPARENT_HOLDER_NETPROFIT_YOY%2CBASIC_EPS_CS%2CBASIC_EPS_CS_YOY%2CDILUTED_EPS_CS%2CPAYOUT_RATIO%2CCAPITIAL_RATIO%2CROE%2CROE_YOY%2CROA%2CROA_YOY%2CDEBT_RATIO%2CDEBT_RATIO_YOY%2CEQUITY_RATIO&"
                   "quoteColumns=&"
                   f"filter=(SECUCODE%3D%22{secucode}%22)(DATE_TYPE_CODE%20in%20(%22003%22%2C%22006%22%2C%22007%22%2C%22008%22))&"
                   "pageNumber=1&pageSize=6&sortTypes=-1&sortColumns=REPORT_DATE&source=SECURITIES&client=PC&v=07947743303511008")
            resp = requests.get(url)
            resp_json = resp.json()
            if resp_json.get("success"):
                return resp.json().get("result").get("data")
            else:
                return None


    def get_us_stock_secucode(self,entity):
        url = ("https://datacenter.eastmoney.com/securities/api/data/v1/get?reportName=RPT_USF10_INFO_ORGPROFILE&"
               "columns=SECUCODE%2CSECURITY_CODE%2CORG_CODE%2CSECURITY_INNER_CODE%2CORG_NAME%2CORG_EN_ABBR%2CBELONG_INDUSTRY%2CFOUND_DATE%2CCHAIRMAN%2CREG_PLACE%2CADDRESS%2CEMP_NUM%2CORG_TEL%2CORG_FAX%2CORG_EMAIL%2CORG_WEB%2CORG_PROFILE&"
               "quoteColumns=&"
               f"filter=(SECURITY_CODE%3D%22{entity.code}%22)&"
               "pageNumber=1&pageSize=200&sortTypes=&sortColumns=&source=SECURITIES&client=PC&v=001563525977490987")
        resp = requests.get(url)
        resp_json = resp.json()
        if resp_json.get("success"):
            secucode = resp.json().get("result").get("data")[0].get("SECUCODE")
            return secucode
        else:
            return None

if __name__ == "__main__":
    # init_log('finance_factor.log')
    recorder = ChinaStockFinanceFactorRecorder(codes=["000001"])
    # recorder.run()
    entity = Stockus()
    entity.code = "ABVX"
    start = datetime.strptime("1997-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
    end = datetime.strptime("2024-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")

    result = recorder.us_record(entity, start, end, size=10, timestamps=None)
    print(result)
# the __all__ is generated
__all__ = ["ChinaStockFinanceFactorRecorder"]
