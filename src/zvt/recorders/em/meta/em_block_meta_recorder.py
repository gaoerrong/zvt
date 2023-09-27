# -*- coding: utf-8 -*-

from zvt.contract.api import df_to_db,get_entities
from zvt.contract.recorder import Recorder
from zvt.domain import Block, BlockCategory,BlockStock
from zvt.recorders.em import em_api


class EMBlockRecorder(Recorder):
    provider = "em"
    data_schema = Block

    def run(self):
        for block_category in [BlockCategory.concept, BlockCategory.industry]:
            df = em_api.get_tradable_list(entity_type="block", block_category=block_category)
            self.logger.info(df)
            df_to_db(df=df, data_schema=self.data_schema, provider=self.provider, force_update=self.force_update)


class EMBlockStockRecorder(Recorder):
    provider = "em"
    data_schema = BlockStock

    def run(self):
        entities = get_entities(entity_type="block", exchanges=['cn'])
        for index, row in entities.iterrows():
            df = em_api.get_block_stock(row['code'],row['id'],row['name'],row['exchange'])
            self.logger.info(df)
            df_to_db(df=df, data_schema=self.data_schema, provider=self.provider, force_update=self.force_update)


if __name__ == "__main__":
    # recorder = EMBlockRecorder()
    # recorder.run()

    recorder = EMBlockStockRecorder()
    recorder.run();

# the __all__ is generated
__all__ = ["EMBlockRecorder","EMBlockStockRecorder"]
