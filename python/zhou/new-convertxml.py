# coding: utf-8
import pandas as pd
import xml.dom.minidom
import numpy as np
import datetime
import requests, json
from dateutil.relativedelta import relativedelta
import sys, os, pathlib
import smtplib, email
from email.mime.text import MIMEText
from email.utils import formataddr
from ftplib import FTP


def convert_date(datestr):
    datestr1 = str(datestr).split(' ')[0]
    year, month, day = datestr1.split('-')
    return ''.join([year, month, day])


def convert_time(datatimestr):
    if ' ' in str(datatimestr):
        timestr = str(datatimestr).split(' ')[1]
    else:
        timestr = str(datatimestr)
    hour, minute = str(timestr).split(':')[:2]
    if len(hour) == 1:
        hour = '0' + hour
    return ''.join([hour, minute, '00'])


def convert_last_date(datestr):
    newdatestr = datestr + relativedelta(days=1)
    datestr1 = str(datestr).split(' ')[0]
    year, month, day = datestr1.split('-')
    return ''.join([year, month, day])


def gen_child(date, starttime, endtime, title, doc, tv, xml_lang):
    a = doc.createElement('programme')
    a.setAttribute('start', starttime)
    a.setAttribute('stop', endtime)
    a.setAttribute('channel', 'abudhabi.ae')
    a.setAttribute('recordable', '')
    a.setAttribute('npvrenable', '')
    a.setAttribute('cpvrenable', '')

    a.setAttribute('id', '')
    a.setAttribute('type', 'Program')
    titlenode = doc.createElement('title')
    titlenode.setAttribute('lang', xml_lang)
    titletext = doc.createTextNode(title)
    titlenode.appendChild(titletext)
    datenode = doc.createElement('date')
    datetext = doc.createTextNode(str(date))
    datenode.appendChild(datetext)
    a.appendChild(titlenode)
    a.appendChild(datenode)
    tv.appendChild(a)


#filename = sys.argv[1]


def convertxls_to_xml(xlsfile, xmlfiles, xml_lang):
    filename = xlsfile
    print(filename)
    data = pd.read_excel(filename)

    doc = xml.dom.minidom.Document()
    tv = doc.createElement('tv')
    tv.setAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')
    tv.setAttribute('xmlns:xsd', 'http://www.w3.org/2001/XMLSchema')
    tv.setAttribute('version', '0')
    tv.setAttribute('xmlns', 'http://www.xmltv.org/xmltv')
    doc.appendChild(tv)
    date1 = ''
    starttime1 = ''
    for i in range(len(data)):
        title = data['TITLE'][i]
        starttime = data['TIME'][i]
        starttime1 = convert_time(starttime)
        if i != len(data) - 1:
            date = data['DATE'][i]
            if ':' in str(data['DATE'][i + 1]) or ' ' in str(
                    data['DATE'][i + 1]):
                date = data['DATE'][i + 1]
                date1 = convert_date(date)
                #print(date1)

            #print(starttime1)
            endtime = data['TIME'][i + 1]
            #print(endtime)
            endtime1 = convert_time(endtime)
            #print(endtime1)

            gen_child(date1, date1 + starttime1, date1 + endtime1, title, doc,
                      tv, xml_lang)
        else:
            if ':' in str(data['DATE'][i]) or ' ' in str(data['DATE'][i]):
                date = data['DATE'][i + 1]
                date1 = convert_date(date)
                #print(date1)
            #print(date)
            date1 = convert_last_date(
                datetime.datetime.strptime(date1, '%Y%m%d'))
            endtime1 = '000000'

            gen_child(date1, date1 + starttime1, date1 + endtime1, title, doc,
                      tv, xml_lang)
    for xmlfile in xmlfiles:
        fp = open(xmlfile, 'w', encoding='utf-8')
        doc.writexml(fp, indent='\t', addindent='\t', newl='\n')
        fp.close()
    # except Exception as err:
    #     er = "FUCK_ERROR,convert %s to  %s failed" % (filename, xmlfile)
    #     return er


#dowload excel file from url
def dowload_xls(urlstr, xlspath):
    #自动创建目录
    #if not os.path.exists(xlspath):
    #    os.makedirs(xlspath)

    url = urlstr
    xlsnamestr = urlstr.split('/')[-1]
    xlspath_abs = xlspath + "/" + str(xlsnamestr)
    xlsfile = requests.get(url)
    #if not xlsfile.status_code == 200 :
    #    print("FUCK_ERROR,status_code is ",xlsfile.status_code)
    #    return xlsfile.status_code
    print(xlsfile, xlspath_abs)
    open(xlspath_abs, 'wb').write(xlsfile.content)
    return xlsfile.status_code, xlspath_abs


def get_wanip():
    ipFile = "/tmp/ip.txt"
    path = pathlib.Path(ipFile)
    if path.is_file():
        f = open(ipFile, 'r')
        ip = f.read()
        f.close()
    else:
        ip = requests.get("http://ifconfig.me").content
        open(ipFile, 'wb').write(ip)
    return ip


#mail to yunwei
def mail_send(mailinfo, title, info):

    ip = get_wanip()
    info = info + str(ip)
    mail_host = mailinfo.get("mail_host")
    mail_sender = mailinfo.get("mail_sender")
    sender_pass = mailinfo.get("sender_pass")
    mail_receivers = mailinfo.get("mail_receivers")
    msg = MIMEText(info, 'plain', 'utf-8')
    msg['From'] = formataddr(["CCTV-QQ", mail_sender])
    # msg['To'] = mail_receivers
    msg['Subject'] = title
    print(info, mailinfo, title, mail_host, mail_receivers)
    server = smtplib.SMTP_SSL(mail_host, mailinfo.get("smtp_ssl"))
    server.login(mail_sender, sender_pass)
    server.sendmail(mail_sender, mail_receivers, msg.as_string())
    server.quit()


#上传ftp
def ftp_upload(ftpinfo, local_file, remote_file):
    '''从本地上传文件到ftp
        参数:
            local_path: 本地文件
        remote_path: 远程文件
    '''
    ftp = FTP()
    print(ftpinfo, local_file, remote_file)
    ftp_ip = ftpinfo.get("ftp_ip")
    ftp.connect(ftp_ip, ftpinfo.get("ftp_port"), timeout=10)
    ftp.login(ftpinfo.get("ftp_user"), ftpinfo.get("ftp_pass"))
    if not os.path.isfile(local_file):
        print('%s 不存在' % local_file)
        raise Exception('%s 不存在\n' % local_file)

    buf_size = 1024
    file_handler = open(local_file, 'rb')
    ftp.storbinary('STOR %s' % remote_file, file_handler, buf_size)
    file_handler.close()
    msg = "上传: %s 到FTP %s 存为 %s 成功!\n" % (local_file, ftp_ip, remote_file)
    print(msg)
    return msg


if __name__ == "__main__":
    #begin
    #1,download xls file
    #2,convert xls to xml

    #读取配置文件
    ftp_cfg = json.load(open('/Users/chenke/Documents/cfg.json', "r"))
    msg = []
    #获取xls url 、下载保存目录和xml保存目录 参数
    for xlsfiles in ftp_cfg.get("xlsfiles"):
        xlsfileinfo = ftp_cfg.get("xlsfiles").get(xlsfiles)
        xlsurlstr = xlsfileinfo.get("xlsurlstr")
        lastestpath = xlsfileinfo.get("lastestpath")
        xlsdir = xlsfileinfo.get("xlsdir")
        xml_lang = xlsfileinfo.get("xml_lang")
        xmlftp_onlinename = xlsfileinfo.get("xmlftp_onlinename")
        #xlsdir="/data/xlsdir/"
        #开始计算程序执行时间
        startTime = datetime.datetime.now()
        timestampstr = startTime.strftime("%Y%m%d%H%M")

        #按时间生成保存目录
        xlspath = xlsdir + str(timestampstr)
        #创建日期目录
        dirs = [xlspath, lastestpath]
        for xpath in dirs:
            if not os.path.exists(xpath):
                os.makedirs(xpath)
        #下载指定url的xls文件
        ok, xlspath_abs = dowload_xls(xlsurlstr, xlspath)
        #状态码不是200就说明下载失败，此时返回FUCK_ERROR

        if ok != 200:
            #    print("FUCK_ERROR,status_code is ",ok)
            title = "Download FUCK_ERROR"
            info = "FUCK_ERROR,download %s status_code is %s\n" % (xlsurlstr,
                                                                   ok)
            mail_send(ftp_cfg.get("mailinfo"), title, info)

            #raise Exception("FUCK_ERROR,download %s status_code is %s" %(xlsurlstr, ok))
        else:
            er = ""
            #xls url下载成功，则转成xml文件并上传ftp
            # print(ftp_cfg.get("mailinfo"))
            xmlpath_bak = xlspath + "/" + xmlftp_onlinename
            xmllocalpath_online = lastestpath + '/' + xmlftp_onlinename
            #xmlpath_online="/data/xml/latest/bb.xml"
            xmlfiles = [xmlpath_bak, xmllocalpath_online]
            print(ok, xlspath_abs, xmlfiles)
            try:
                convertxls_to_xml(xlspath_abs, xmlfiles, xml_lang)
            except Exception as err:
                er = "FUCK_ERROR,convertxls_to_xml %s %s " % (xlspath_abs,
                                                              xmlfiles)
                msg.append(er)

            try:
                ftp_upload(xlsfileinfo, xmllocalpath_online, xmlftp_onlinename)
            except Exception as err:
                print("FTP 连接或登录失败 ，错误描述为：%s" % err)
                er = "FTP %s 上传失败 ，错误描述为：%s" % (xlsfileinfo.get("ftp_ip"), err)
                msg.append(er)

            endTime = datetime.datetime.now()

            if msg:
                title = "FUCK_ERROR 有错误!"
            else:
                title = "转换正常perfect"

            info = "\n\n".join(
                msg
            ) + "\nIt takes %s second\ndownload %s convert xls %s to xml %s\n" % (
                (endTime - startTime), xlsurlstr, xlspath_abs, xmlfiles)
            print(info + "d##############eeee")
            mail_send(ftp_cfg.get("mailinfo"), title, info)
