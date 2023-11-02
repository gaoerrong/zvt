from zvt.contract.api import get_entities, get_data
from zvt.domain import (
    Stock1dKdata,
    StockDetail,
    Block1dKdata,
)
import datetime
import pandas as pd


# 波段选股方式，先有几天的下降，然后当天比前一天的收盘价要高
# 1.第一天，第二天，第三天股价在下降。
# 2.第四天的数据中取open和close的最大值大于第三天的数据中取open和close的最小值
# 2.第五天的数据中取open和close的最大值大于第四天的数据中取open和close的最小值
# 4.如果符合上述全部逻辑，那么打印符合条件
def wave_band_block_select(select_type: str):
    n = 60
    user_data_size = 5
    # 获取当前日期
    today = datetime.date.today()
    # 计算往前推 n 天的日期
    delta = datetime.timedelta(days=n)
    start_timestamp = today - delta

    entity_type = "stock"
    data_schema = Stock1dKdata
    order = Stock1dKdata.timestamp.asc()
    if select_type == "block":
        entity_type = "block"
        data_schema = Block1dKdata
        order = Block1dKdata.timestamp.asc()
    # 创建空的DataFrame
    matched_data = pd.DataFrame(columns=['code', 'name'])

    entities = get_entities(entity_type=entity_type)
    for index, row in entities.iterrows():
        k_data_list = get_data(
            data_schema=data_schema,
            code=row['code'],
            start_timestamp=start_timestamp,
            order=order,
        )
        if k_data_list.empty or len(k_data_list.index) < 30:
            continue
        # 检查是否符合逻辑
        last_five_data = k_data_list[-5:]
        if last_five_data.iloc[0]['close'] > last_five_data.iloc[1]['close'] > last_five_data.iloc[2]['close']:
            # 检查第四天的数据
            fourth_day = last_five_data.iloc[3]
            third_day = last_five_data.iloc[2]
            # 检查第四天的最大值是否大于第三天的最小值
            if max(fourth_day['open'], fourth_day['close']) > min(third_day['open'], third_day['close']):
                # 检查第五天的数据
                fifth_day = last_five_data.iloc[4]
                fourth_day = last_five_data.iloc[3]
                # 检查第五天的最大值是否大于第四天的最小值
                if max(fifth_day['open'], fifth_day['close']) > min(fourth_day['open'], fourth_day['close']):
                    # 符合条件，打印结果
                    new_data = pd.DataFrame([{'code': row['code'], 'name': row['name']}])
                    matched_data = pd.concat([matched_data, new_data], ignore_index=True)
                    print(f"符合条件,code:{row['code']},name:{row['name']}")

    if not matched_data.empty:
        matched_data.to_excel('/Users/gaoerrong/Downloads/a_select_result.xlsx', index=False)


if __name__ == "__main__":
    print("start select a stock...")
    wave_band_block_select('block')

