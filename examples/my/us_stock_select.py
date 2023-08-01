def calculate_ema(prices, days):
    if len(prices) < days:
        raise ValueError("The number of prices should be greater than or equal to the number of days.")

    smoothing_factor = 2 / (days + 1)
    ema = [prices[0]]

    for i in range(1, len(prices)):
        current_ema = (prices[i] - ema[-1]) * smoothing_factor + ema[-1]
        ema.append(current_ema)

    return ema


# 测试数据，你可以用真实数据替换
closing_prices = [100, 102, 105, 110, 108, 107, 105, 103, 108, 112]
days = 5

ema_values = calculate_ema(closing_prices, days)
print(f"{days}-day EMA values: {ema_values}")
