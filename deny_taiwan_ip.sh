#!/bin/bash

DAY=`date +%Y%m%d`
FILE="delegated-apnic-$DAY"
rm -f deny_taiwan_ip
rm -f tmp_ip
touch deny_taiwan_ip
touch tmp_ip
echo $FILE
wget ftp://ftp.apnic.net/pub/apnic/stats/apnic/"$FILE" #20161209
#NUM=`echo $?`
#NUM=1
if [ ! -z $FILE ]
then
    echo "取得完整檔案...轉換資料中...."
    grep TW $FILE | grep ipv4 | cut -d"|" -f 4,5 | sed s/256/24/g | sed s/512/23/g | sed s/1024/22/g | sed s/2048/21/g | sed s/4096/20/g | sed s/8192/19/g | sed s/16384/18/g | sed s/32768/17/g | sed s/65536/16/g | sed s/131072/15/g | sed s/262144/14/g | sed s/524288/13/g | sed s/1048576/12/g | sed s/2097152/11/g | sed s/\|/\\//g > tmp_ip

    for A in $(cat tmp_ip)
    do
         echo "deny $A;" >> deny_taiwan_ip
    done
        #echo "deny all;" >> deny_taiwan_ip
        rm -f tmp_ip
        rm -f $FILE
        echo "檔案轉換完成.....  deny_taiwan_ip 可以使用在nginx"
    exit 0
else
    echo "抱歉，未取得檔案...."
    rm -f tmp_ip
    rm -f $FILE
    exit 1
fi
