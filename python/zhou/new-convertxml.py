import pandas as pd 
import xml.dom.minidom
import numpy as np
import datetime
import requests
from dateutil.relativedelta import relativedelta
import sys,os,pathlib
import smtplib,email
from email.mime.text import MIMEText
from email.utils import formataddr


def convert_date(datestr):
    datestr1 = str(datestr).split(' ')[0]
    year, month, day = datestr1.split('-')
    return ''.join([year,month,day])

def convert_time(datatimestr):
    if ' ' in str(datatimestr):
        timestr = str(datatimestr).split(' ')[1]
    else:
        timestr = str(datatimestr)
    hour, minute = str(timestr).split(':')[:2]
    if len(hour) == 1:
        hour = '0' + hour
    return ''.join([hour,minute,'00'])

def convert_last_date(datestr):
    newdatestr = datestr + relativedelta(days=1)
    datestr1 = str(datestr).split(' ')[0]
    year, month, day = datestr1.split('-')
    return ''.join([year,month,day])

def gen_child(date, starttime, endtime, title,doc,tv):
    a = doc.createElement('programme')
    a.setAttribute('start',starttime)
    a.setAttribute('stop',endtime)
    a.setAttribute('channel','abudhabi.ae')
    a.setAttribute('recordable','')
    a.setAttribute('npvrenable','')
    a.setAttribute('cpvrenable','')
    
    a.setAttribute('id','')
    a.setAttribute('type','Program')
    titlenode = doc.createElement('title')
    titlenode.setAttribute('lang','en')
    titletext = doc.createTextNode(title)
    titlenode.appendChild(titletext)
    datenode = doc.createElement('date')
    datetext = doc.createTextNode(str(date))
    datenode.appendChild(datetext)
    a.appendChild(titlenode)
    a.appendChild(datenode)
    tv.appendChild(a)
#filename = sys.argv[1]

def convertxls_to_xml(xlsfile,xmlfile):
    filename=xlsfile
    xmlfile=xmlfile
    print(filename)
    data = pd.read_excel(filename)
    
    doc = xml.dom.minidom.Document()
    tv = doc.createElement('tv')
    tv.setAttribute('xmlns:xsi','http://www.w3.org/2001/XMLSchema-instance')
    tv.setAttribute('xmlns:xsd','http://www.w3.org/2001/XMLSchema')
    tv.setAttribute('version','0')
    tv.setAttribute('xmlns','http://www.xmltv.org/xmltv')
    doc.appendChild(tv)
    date1 = ''
    starttime1 = ''
    for i in range(len(data)):
        title = data['TITLE'][i]
        starttime = data['TIME'][i]
        starttime1 = convert_time(starttime)
        if i != len(data) - 1:
            date = data['DATE'][i]
            if ':' in str(data['DATE'][i + 1]) or ' ' in str(data['DATE'][i + 1]):
                date = data['DATE'][i + 1]
                date1 = convert_date(date)
                #print(date1)
            
            #print(starttime1)
            endtime = data['TIME'][i + 1]
            #print(endtime)
            endtime1 = convert_time(endtime)
            #print(endtime1)
            
            gen_child(date1, date1 + starttime1, date1 + endtime1, title,doc,tv)
        else:
            if ':' in str(data['DATE'][i]) or ' ' in str(data['DATE'][i]):
                date = data['DATE'][i + 1]
                date1 = convert_date(date)
                #print(date1)
            #print(date)
            date1 = convert_last_date(datetime.datetime.strptime(date1,'%Y%m%d'))
            endtime1 = '000000'
            
            gen_child(date1, date1 + starttime1, date1 + endtime1, title,doc,tv)
    fp = open(xmlfile,'w',encoding='utf-8')
    doc.writexml(fp,indent='\t',addindent='\t',newl='\n')

#dowload excel file from url
def dowload_xls(urlstr,xlspath):
    #自动创建目录
    if not os.path.exists(xlspath):
        os.makedirs(xlspath)

    url=urlstr
    xlsnamestr=urlstr.split('/')[-1]
    xlspath_abs=xlspath+"/"+str(xlsnamestr)
    xlsfile=requests.get(url)
    #if not xlsfile.status_code == 200 :
    #    print("FUCK_ERROR,status_code is ",xlsfile.status_code)
    #    return xlsfile.status_code
    print(xlsfile,xlspath_abs)
    open(xlspath_abs,'wb').write(xlsfile.content)
    return xlsfile.status_code,xlspath_abs

def get_wanip():
    ipFile="/etc/ip.txt"
    path=pathlib.Path(ipFile)
    if path.is_file():
        f=open(ipFile,'r')
        ip=f.read()
        f.close()
    else:
        ip=requests.get("http://ifconfig.me").content
        open(ipFile,'wb').write(ip)
    return ip

#mail to yunwei
def mail_send(title,info):
    ip=get_wanip()
    info=info+str(ip)
    mail_host="smtp.qq.com"
    mail_sender = "278@qq.com"
    sender_pass='abc'
    mail_receivers="chenke991@126.com"
    msg=MIMEText(info,'plain','utf-8')
    msg['From']=formataddr(["CCTV", mail_sender]) 
    msg['To'] =  formataddr(["qq",mail_receivers])
    msg['Subject'] = title
    server=smtplib.SMTP_SSL(mail_host,465)
    server.login(mail_sender,sender_pass)
    server.sendmail(mail_sender,mail_receivers,msg.as_string())
    server.quit()
    

#begin
#1,download xls file
#2,convert xls to xml

xlsdir="/data/xlsdir/"
startTime=datetime.datetime.now()
timestampstr=startTime.strftime("%Y%m%d%H%M")
xlspath=xlsdir+str(timestampstr)
xlsurlstr='http://123.9/CGTN.xls'
ok,xlspath_abs=dowload_xls(xlsurlstr,xlspath)
if ok != 200:
#    print("FUCK_ERROR,status_code is ",ok) 
    title="FUCK_ERROR"
    info="FUCK_ERROR,download %s status_code is %s"%(xlsurlstr,ok)
    mail_send(title,info)
    raise Exception("FUCK_ERROR,download %s status_code is %s"%(xlsurlstr,ok))
else:
    xmlpath_abs=xlspath+"/"+'a.xml'
    print(ok,xlspath_abs ,xmlpath_abs)
    convertxls_to_xml(xlspath_abs,xmlpath_abs)
    endTime=datetime.datetime.now()
    
    title="转换正常perfect"
    info="It takes %s second\ndownload %s convert xls %s to xml %s ok\n"%((endTime-startTime),xlsurlstr,xlspath_abs,xmlpath_abs)
    mail_send(title,info)
