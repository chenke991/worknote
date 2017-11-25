#!/usr/bin/env python3
#utf-8
import requests
import asyncio
from elasticsearch import Elasticsearch
import datetime,time
es = Elasticsearch()

import time
async def to_sleep(n):
    print("Hello")
    return requests.get('http://baidu.com')


async def mai(n):
    print("bye")
    data=await to_sleep(1)
    print(data)
if __name__ == '__main__':
    t1=datetime.datetime.now()

    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.gather(*[mai(1),mai(1),mai(1),mai(1),mai(2),mai(3),mai(4),mai(2),mai(2)]))
    t2=datetime.datetime.now()
    t3=t2-t1
    print(t3)