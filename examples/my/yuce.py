from zvt.domain import Stock, Stock1dHfqKdata
from zvt.ml import MaStockMLMachine
Stock.record_data(provider="em")
entity_ids = ["stock_sz_002855"]
# Stock1dHfqKdata.record_data(provider="em", entity_ids=entity_ids, sleeping_time=1)
machine = MaStockMLMachine(entity_ids=["stock_sz_002855"], data_provider="em")
machine.train()
machine.predict()
machine.draw_result(entity_id="stock_sz_002855")