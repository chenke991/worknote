# -*- coding: utf-8 -*-
import os
import subprocess
import platform


# ps |findstr "_[0-9]" #找所有_1至_9的进程
# Get-Process *_[0-9]|select-object path
# Get-Process *_[0-9]|select-object path|findstr "xiyou_game_9001"
class processCheck():
    def __init__(self, winexe="powershell", gameServer="*_[0-9]", winop="findstr", **kwargs):
        self.winexe = winexe
        self.gameServer = gameServer
        self.winop = winop
        # self.winop={getgameser:'Get-Process %s|select-object path',getsonepro:'ps |findstr %s'}

    def getDeployNums(self, **kwargs):
        WorkPath = "d:\\server\\wdrg"
        return os.listdir(WorkPath)

    def getProcessPath(self, **kwargs):
        dir_list = self.getDeployNums()
        resuNum={}
        for dir in dir_list:
            #p = 'Get-Process %s|select-object path|findstr %s' %(self.gameServer,dir)
            args = [r"powershell",r"Get-Process %s|select-object path|findstr %s" % (self.gameServer,dir)]
            p = subprocess.Popen(args,stdout=subprocess.PIPE) 
            dt = p.stdout.readlines()
            resuNum[dir]=len(dt)
        return resuNum

    def getProcessNum(self, *args):
        gameNums = self.powerShellExe(self.gameServer)
        return gameNums

    def powerShellExe(self, *args):
        args = [r"powershell", r"Get-Process %s|select-object path|findstr exe" % self.gameServer]
        p = subprocess.Popen(args, stdout=subprocess.PIPE)
        a = p.stdout.read()
        dt = len(a.splitlines())
        return dt


if __name__ == "__main__":
    #p = processCheck(gameServer="GameServer")
    p = processCheck(gameServer="*Server")
    #print p.getProcessNum()
    j = processCheck()
    #print j.getProcessNum()
    depNums = len(j.getDeployNums())
    #print "depNums is %s" % depNums
    #print "j.getProcessNum is %s" % j.getProcessNum()
    #if int(j.getProcessNum()) / 3 == int(p.getProcessNum()) and int(p.getProcessNum()) == depNums:
    if int(j.getProcessNum()) / 3 == depNums and int(p.getProcessNum())/3 == depNums:
        print "0"
#GameServer进程不正常
    elif int(p.getProcessNum())/3 != depNums:
        #print "GameServer errror"
        r = processCheck()
        resultDict = r.getProcessPath()
        re = map(lambda x: 0 if  int(x[1]) == 3 else x[0] , resultDict.items())
        for i in re:
            if i != 0:
                print i
        print "ERR"
#GameServer进程正常，子进程不正常
    else:
        #print "else"
        r = processCheck()
        resultDict = r.getProcessPath()
        re = map(lambda x: 0 if  int(x[1]) == 3 else x[0] , resultDict.items())
        for i in re:
            if i != 0:
                print i
        print "ERR"


