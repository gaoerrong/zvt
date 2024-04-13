import os
import re
import logging
import pandas as pd
import anthropic
import requests
import httpx
from openai import OpenAI
import json
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.header import Header
from zvt.informer import EmailInformer
from zvt import zvt_config

logger = logging.getLogger(__name__)

def process_excel_files(folder_path):
    excel_files = get_excel_files(folder_path)
    dollar_data = []
    non_dollar_data = []

    for file in excel_files:
        data = read_excel(file)
        for row in data:
            content = row['content']
            if has_stock_code(content):
                dollar_data.append(row)
            else:
                non_dollar_data.append(row)

    dollar_json = json.dumps(dollar_data, indent=4)
    non_dollar_json = json.dumps(non_dollar_data, indent=4)

    return dollar_json, non_dollar_json


def has_stock_code(text):
    pattern = r'\$[A-Za-z]+'
    match = re.search(pattern, text)
    if match:
        return True
    else:
        return False


def get_excel_files(folder_path):
    excel_files = []
    for file in os.listdir(folder_path):
        if file.endswith('.xlsx') or file.endswith('.xls'):
            excel_files.append(os.path.join(folder_path, file))
    return excel_files


def read_excel(file):
    data = []
    df = pd.read_excel(file)
    for index, row in df.iterrows():
        data.append({
            'id': row['ids'],
            'content': row['content']
        })
    return data


def call_claude(content):
    # 代理服务器的信息
    proxy_host = "127.0.0.1"  # 例如 '127.0.0.1'
    proxy_port = 8118  # 代理服务器端口
    proxies = {
        "http://": f"http://{proxy_host}:{proxy_port}",
    }
    http_client = httpx.Client(proxies=proxies, timeout=30)

    client = anthropic.Anthropic(
        # defaults to os.environ.get("ANTHROPIC_API_KEY")
        api_key="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",
        http_client=http_client
    )
    message = client.messages.create(
        model="claude-3-opus-20240229",
        max_tokens=4096,
        messages=[
            {"role": "user", "content": f"{content}"}
        ]
    )
    print(message.content)


def call_kimi(content):
    client = OpenAI(
        api_key="sk-gFx2U54PT14ZwA6b6xe3sJPrzSojHZbZRwIfGmhtdh6QU993",
        base_url="https://api.moonshot.cn/v1",
    )

    completion = client.chat.completions.create(
        model="moonshot-v1-8k",
        max_tokens=4096,
        messages=[
            {"role": "system",
             "content": "You are a professional stock investment expert"},
            {"role": "user", "content": f"{content}"}
        ],
        temperature=0.3,
    )

    return completion.choices[0].message.content


def generate_html_table(data):
    # 创建表格标题行
    table_header = "<tr><th>stock_code</th><th>positive_evaluation_summary</th><th>negative_evaluation_summary</th><th>neutral_evaluation_summary</th></tr>"

    # 创建表格内容行
    table_rows = ""
    for stock_code, evaluations in data.items():
        positive_evaluations = evaluations.get("positive_evaluation_summary", [])
        negative_evaluations = evaluations.get("negative_evaluation_summary", [])
        neutral_evaluations = evaluations.get("neutral_evaluation_summary", [])

        positive_list = "<ul>" + "".join(
            [f"<li><a href='https://twitter.com{evaluation['id']}'>{evaluation['content']}</a></li>" for evaluation in
             positive_evaluations]) + "</ul>"
        negative_list = "<ul>" + "".join(
            [f"<li><a href='https://twitter.com{evaluation['id']}'>{evaluation['content']}</a></li>" for evaluation in
             negative_evaluations]) + "</ul>"
        neutral_list = "<ul>" + "".join(
            [f"<li><a href='https://twitter.com{evaluation['id']}'>{evaluation['content']}</a></li>" for evaluation in
             neutral_evaluations]) + "</ul>"

        table_row = f"<tr><td>{stock_code}</td><td>{positive_list}</td><td>{negative_list}</td><td>{neutral_list}</td></tr>"
        table_rows += table_row

    # 创建完整的 HTML 表格
    html_table = f"<html><body><table>{table_header}{table_rows}</table></body></html>"
    return html_table

def send_email_with_html(html_content):
    email_action = EmailInformer()
    email_action.send_message('ger2005081097@gmail.com', "twitter content summary", html_content,content_type="html")

if __name__ == "__main__":
    logger.info("start to process excel files...")
    dir = "/Users/gaoerrong/Desktop/twitter"
    dollar_json, non_dollar_json = process_excel_files(dir)
    content = '''
    You are a professional stock investment expert. I have a lot of stock evaluation data. The format of the data is a json array, and the json data is as follows:
{}

Now please follow the steps below:
Step 1: Analyze the sentiment of each content:
  - Identify the stock codes mentioned in each content.
  - Determine whether the sentiment is positive, negative, or neutral based on the context.
Step 2: Summarize the content for each stock code by sentiment:
  - Create separate summaries for positive, negative, and neutral sentiments for each stock code.
Step 3: Output the results in JSON format:
  - Provide the positive evaluation summary, negative evaluation summary, and neutral evaluation summary for each stock code, along with the associated ID of the original content.
  - Output json array format example is:
  [
    {{
        "stock_code_key": "$TSLA",
        "positive_evaluation_summary":
        [],
        "negative_evaluation_summary":
        [],
        "neutral_evaluation_summary":
        [
            {{
                "id": 1,
                "content": ""
            }}
        ]
    }}
  ]
  - Remove step output,Only output json result
  '''.format(dollar_json)
    logger.info("start to call kimi...")
    json_data = call_kimi(content)
    # 将 JSON 数据解析为 Python 字典
    data = json.loads(json_data)

    # 生成 HTML 表格
    html_table = generate_html_table(data)
    # 发送邮件
    logger.info("start to send email...")
    # html_table = "<html><body><<a href='http://www.baidu.com'>testestet</a></body></html>"
    send_email_with_html(html_table)
    logger.info("end send email,send success...")