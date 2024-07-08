import requests
import json
# headers = {
#     'Content-Type': 'application/json'
# }
# requestResponse = requests.get("https://api.tiingo.com/tiingo/fundamentals/aapl/statements?token=547174075c0b1730f672f193ef7287b4799c7998", headers=headers)
# json_str = json.dumps(requestResponse.json(), indent=4)
# print(json_str)

import finnhub
finnhub_client = finnhub.Client(api_key="cq5jot9r01qhs6itn06gcq5jot9r01qhs6itn070")

print(finnhub_client.company_profile(symbol='AAPL'))