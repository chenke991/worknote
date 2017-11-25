#!/usr/bin/env python3
#utf-8
import requests,asyncio,aiohttp,json
from elasticsearch import Elasticsearch
import datetime
es = Elasticsearch()

async def Get_Info(url,gamename,platform,server_id,**kwargs):
    '''获取接口信息'''
    print(url)
    try:
        # re = requests.get(url,timeout=1).json()
        # re['status'] = "ok"
        if gamename == "mfwz" and platform == "191game":
            url = url.replace("xiyou-g.", "")
        async with aiohttp.ClientSession() as session:
            async with session.get('http://' + url + '/stat') as resp:
                data = json.loads(await resp.text())
                data['current_time'] = datetime.datetime.utcnow()
                data['status'] = "ok"
                data['domain'] = 'http://' + url + '/stat'
                es.index(index=gamename, doc_type=gamename, body=data)
                print(url,data['domain'])
    except:
        data = {'platform':platform,'server_id':server_id,'status':"error","db":"false",'current_time':datetime.datetime.utcnow(),'domain':"error",'nowversion':'00000','scgs':'false'}
        es.index(index=gamename, doc_type=gamename, body=data)




if __name__ == '__main__':
    t1 = datetime.datetime.now()
    loop = asyncio.get_event_loop()
    urls = requests.get('https://yunwei.2xi.com/api/gameservicelist/', params={'g': 'mfwz'}).json()
    try:
        tasks = [asyncio.ensure_future(Get_Info(a['domain'],str(a['game_name']).lower(),a['platform_en_name'],a['number'] )) for a in urls]
        loop.run_until_complete(asyncio.gather(*tasks))
    except:
        print("错误")
    t2 = datetime.datetime.now()
    use_time = t2 - t1
    print(use_time.seconds)

