#!/usr/bin/env python3
#utf-8
import requests,asyncio
from elasticsearch import Elasticsearch
import datetime
es = Elasticsearch()

async def Get_Info(url,gamename,platform,server_id,**kwargs):
    '''获取接口信息'''
    print(url)
    try:
        re = requests.get(url,timeout=1).json()
        re['status'] = "ok"
    except:
        re = {'platform':platform,'server_id':server_id,'status':"error","db":"false"}

    re['datetime'] = datetime.datetime.now()
    print(re)
    es.index(index=gamename,doc_type=gamename,body=re)



if __name__ == '__main__':
    t1 = datetime.datetime.now()
    task = []
    try:
        info_lists = requests.get('https://yunwei.2xi.com/api/gameservicelist/', params={'g': 'mfwz'}).json()
        for info in info_lists:
            url = "http://" + info['domain'] + "/stat"
            task.append(asyncio.ensure_future(Get_Info(url=url,gamename=str(info['game_name']).lower(),platform=info['platform_en_name'],server_id=info['number'])))
    except:
        print("错误")
    loop = asyncio.get_event_loop()
    # tasks = [asyncio.ensure_future()]
    loop.run_until_complete(asyncio.gather(*task))
    t2 = datetime.datetime.now()
    use_time = t2 - t1
    print(use_time.seconds)
