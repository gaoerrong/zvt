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
            'content_original_url': f"https://twitter.com{row['ids']}",
            'content': row['content']
        })
    return data



if __name__ == "__main__":
    logger.info("start to process excel files...")
    dir = "/Users/gaoerrong/Desktop/twitter"
    dollar_json, non_dollar_json = process_excel_files(dir)
    content = '''
    You are a professional stock investment expert. I have a lot of stock evaluation data. The format of the data is a json array, and the json data is as follows:
{}

Now please follow the steps below:
Classify according to the stock code and determine whether the sentiment is positive, negative, or neutral based on the content.For each stock code, output in the following format:

- stock code:
- sentiment:
- List of content mentioning stocks:
    -- content, content original url
    -- content, content original url
  '''.format(dollar_json)
    print(content)