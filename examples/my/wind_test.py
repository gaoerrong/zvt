### 第一步：导入 WindPy 模块，并通过 w.start() 启动 API 接口
from WindPy import *  # python导入模块的方式： from 模块名  import 函数名
w.start() # 启动接口，若不开启就会报‘-103’的错误提示

from WindCharts import *  #导入绘图的模块

error, wsd_df = w.wsd("000001.SZ", "open,high,low,close,volume", "2019-01-01", "2019-05-13", "Fill=Previous", usedf = True)
## 绘图
chart = WCandlestick("平安银行", "数据来源: wind", data=wsd_df, ma=[5,10,20,30,60]) #使用API获取K线数据，数据集必须包含'open','high','low','close','date' 5列数据
chart.plot()
