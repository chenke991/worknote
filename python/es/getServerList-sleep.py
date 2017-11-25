#!/usr/bin/env python3
#utf-8
import requests
import asyncio
from elasticsearch import Elasticsearch
import datetime,time
es = Elasticsearch()

import time
def to_sleep(n):
    print("Hello")
    return requests.get('http://baidu.com')


def mai(n):
    print("bye")
    data=to_sleep(1)
    print(data)
if __name__ == '__main__':
    t1=datetime.datetime.now()

    for i in range(10):
        mai(i)
        print(i)
    t2=datetime.datetime.now()
    t3=t2-t1
    print(t3)