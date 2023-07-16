import tweepy
import re
import pandas as pd
from datetime import datetime, timedelta

# Twitter API凭证
consumer_key = "Y6FCgAyuCSUretGjo6V1bF8NT"  # 替换成您的API密钥
consumer_secret = "ph85rKnfGOELrhAf7RNeD10PAWwjpMwMq7pMuyfCw2cD5CiL1n"  # 替换成您的API密钥
access_token = "38080603-h4yqXk4WGG9UE3owapGyGM0eCPgH1Go8UPjcMY8qe"  # 替换成您的访问令牌
access_token_secret = "yJswC1CX4y8hrqxKlN2RAz8m5XPDzSincFiNVQBTFzImd"  # 替换成您的访问令牌密钥

# 验证Twitter API凭证
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

# 创建API对象
api = tweepy.API(auth)

# 获取您关注的Twitter账户列表
following = api.friends_ids()

# 用于存储股票符号计数的字典
stocks = {}

# 指定日期
date_since = datetime.now() - timedelta(days=2)  # 获取过去n天的推文

# 循环遍历每个您关注的Twitter账户
for user_id in following:
    # 获取用户对象
    user = api.get_user(user_id)
    # 按日期分页获取用户时间线
    for tweet in tweepy.Cursor(api.user_timeline, user_id=user_id, since_id=date_since.strftime('%Y-%m-%d'), tweet_mode='extended').items():
        # 从推文文本中提取股票符号
        symbols = re.findall(r'\$[A-Z]+', tweet.full_text)
        # 循环遍历每个股票符号并计数
        for symbol in symbols:
            if symbol in stocks:
                stocks[symbol] += 1
            else:
                stocks[symbol] = 1

# 将字典转换为pandas数据框并按计数排序
df = pd.DataFrame.from_dict(stocks, orient='index', columns=['count'])
df = df.sort_values(by=['count'], ascending=False)

# 打印最常提到的10个股票
print(df.head(10))