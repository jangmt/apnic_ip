## 透過 APNIC 的資訊，取得某個國家的IP位址

*  使用 allow_taiwan_ip.sh  可以產生給 nginx 使用的 config 檔案
```
[mtchang@demo apnic_ip]$ ./allow_taiwan_ip.sh 
delegated-apnic-20190410
--2019-04-10 08:50:42--  ftp://ftp.apnic.net/pub/apnic/stats/apnic/delegated-apnic-20190410
           => ‘delegated-apnic-20190410’
Resolving ftp.apnic.net (ftp.apnic.net)... 202.12.29.205, 2001:dc0:2001:11::205
Connecting to ftp.apnic.net (ftp.apnic.net)|202.12.29.205|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /pub/apnic/stats/apnic ... done.
==> SIZE delegated-apnic-20190410 ... 2935253
==> PASV ... done.    ==> RETR delegated-apnic-20190410 ... done.
Length: 2935253 (2.8M) (unauthoritative)

100%[=======================================================================================================>] 2,935,253    506KB/s   in 8.3s   

2019-04-10 08:50:54 (344 KB/s) - ‘delegated-apnic-20190410’ saved [2935253]

取得完整檔案...轉換資料中....
檔案轉換完成..... allow_taiwan_ip 可以設定導給 nginx 使用 
```


* 可以參考 nginx_sample.conf 加入允許或是阻擋的設定
```
 # 全部通行白名單IP
 #include /etc/nginx/conf.d/whitelist_ip;
 # 指定阻擋黑名單
 #include /etc/nginx/conf.d/blacklist_ip;
 # 限制特定客戶IP通行，避免和上面混用
 #include /etc/nginx/conf.d/only_customer_ip;
 #include /etc/nginx/conf.d/allow_taiwan_ip;
```
 
