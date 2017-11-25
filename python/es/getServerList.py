#!/usr/bin/env python3
#utf-8
import requests,asynci888o
from elasticsearch import Elasticsearch
import datetime
es = Elasticsearch()

def Get_Info(url,gamename,platform,server_id,**kwargs):
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
    try:
        info_lists = requests.get('https://yunwei.2xi.com/api/gameservicelist/', params={'g': 'mfwz'}).json()
        for info in info_lists:
            url = "http://" + info['domain'] + "/stat"
            Get_Info(url=url,gamename=str(info['game_name']).lower(),platform=info['platform_en_name'],server_id=info['number'])
    except:
        print("错误")
    t2 = datetime.datetime.now()
    use_time = t2 - t1
    print(use_time.seconds)

