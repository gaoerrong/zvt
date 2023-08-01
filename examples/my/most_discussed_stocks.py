import pandas as pd
import re

# 用于存储股票符号计数的字典
stocks = {}

stock_ids = {}

df = pd.read_excel('/Users/gaoerrong/Downloads/Workbook.xlsx',header=None)
df.columns = ['id', 'text']
for row in df.itertuples(index=False):
    # 从推文文本中提取股票符号
    try:
        symbols = re.findall(r'\$[A-Z]+', row.text)
    except Exception:
        print(row.text)
    # 循环遍历每个股票符号并计数
    for symbol in symbols:
        if symbol in stocks:
            stocks[symbol] += 1
            stock_ids[symbol].append(f"https://twitter.com{row.id}")
        else:
            stocks[symbol] = 1
            stock_ids[symbol] = []
            stock_ids[symbol].append(f"https://twitter.com{row.id}")

# 将字典转换为pandas数据框并按计数排序
df = pd.DataFrame.from_dict(stocks, orient='index', columns=['count'])
df = df.sort_values(by=['count'], ascending=False)

# 打印最常提到的10个股票
print(df.head(10))
for key, value in stock_ids.items():
    stock_ids[key] = list(set(value))
print(stock_ids)