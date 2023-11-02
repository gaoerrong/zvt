# -*- coding: utf-8 -*-

from sqlalchemy import Column, String, Float
from sqlalchemy.orm import declarative_base

from zvt.contract import Portfolio, PortfolioStock, Mixin
from zvt.contract.register import register_schema, register_entity

BlockMetaBase = declarative_base()


#: 板块
@register_entity(entity_type="block")
class Block(BlockMetaBase, Portfolio):
    __tablename__ = "block"

    #: 板块类型，行业(industry),概念(concept)
    category = Column(String(length=64))


@register_entity(entity_type="block_stock")
class BlockStock(BlockMetaBase, PortfolioStock):
    __tablename__ = "block_stock"


@register_entity(entity_type="block_stat_data")
class BlockStatData(BlockMetaBase, Mixin):
    __tablename__ = "block_stat_data"
    #: 板块编码
    code = Column(String(length=64))
    #: 板块名字
    name = Column(String(length=128))
    #: 上涨的股票在板块中总股数的占比
    stock_rise_rate = Column(Float)


register_schema(providers=["em", "eastmoney", "sina"], db_name="block_meta", schema_base=BlockMetaBase)
# the __all__ is generated
__all__ = ["Block", "BlockStock", "BlockStatData"]
