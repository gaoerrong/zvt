import requests

# 构建API请求的URL
url = f"https://twitter.com/SuperLuckeee/status/1680815043510763521"

# 发起HTTP请求
response = requests.get(url)

# 检查请求是否成功
if response.status_code == 200:
    # 解析HTML内容或使用其他方法提取所需数据
    html = response.text
    # 处理数据...
    print(html)
else:
    # 请求失败
    print("请求失败:", response.status_code)
