#!/usr/bin/python2.7
# -*- coding: utf-8 -*- 

import pymongo
import pysolr
import simplejson
import time
import redis
from bson.objectid import ObjectId

db='resources'
collection='resources'
col = pymongo.Connection("172.16.79.14:37017")[db][collection]
rediscli = redis.Redis('172.16.79.23', 6379, db=7)
queue_name = "epdres_sync"



condition = {}


def push_id(_id):
    rediscli.lpush(queue_name, db+"."+collection+","+_id)

def main():
    cursor = col.find(condition, timeout=False)
   
    total = cursor.count()
    index=0
    for item in cursor:
        index+=1

        _id=str(item['_id'])
        print "%d/%d:%s"%(index,total,_id)
        push_id(_id)


if __name__ == '__main__':
    main()
