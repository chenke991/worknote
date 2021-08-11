import pandas as pd
import xml.dom.minidom
import numpy as np
import datetime
import requests, json
from dateutil.relativedelta import relativedelta
import sys
import os
import pathlib
import smtplib, email
from email.mime.text import MIMEText
from email.utils import formataddr


class Covert(object):
    dir = ""
    wan_ip = ""

    def __init__(self) -> None:
        self.wan_ip = self.get_wanip()

    def mail_send(self, title, info):
        info = info + str(self.wan_ip)
        mail_host = "smtp.qq.com"
        mail_sender = "2738@qq.com"
        sender_pass = 'wnsgb'
        mail_receivers = "chen1@126.com"
        msg = MIMEText(info, 'plain', 'utf-8')
        msg['From'] = formataddr(["CCTV", mail_sender])
        msg['To'] = formataddr(["qq", mail_receivers])
        msg['Subject'] = title
        server = smtplib.SMTP_SSL(mail_host, 465)
        server.login(mail_sender, sender_pass)
        server.sendmail(mail_sender, mail_receivers, msg.as_string())
        server.quit()

    def get_wanip(self) -> str:
        ipFile = "/etc/ip.txt"
        path = pathlib.Path(ipFile)
        if path.is_file():
            f = open(ipFile, 'r')
            ip = f.read()
            f.close()
        else:
            ip = requests.get("http://ifconfig.me").content
            open(ipFile, 'wb').write(ip)
        return ip