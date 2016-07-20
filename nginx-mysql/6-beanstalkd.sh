#!/bin/bash

wget https://github.com/kr/beanstalkd/archive/v1.10.tar.gz

tar zxvf v1.10.tar.gz && rm -rf v1.10.tar.gz

mv beanstalkd-1.10/ /usr/local/beanstalkd

cd /usr/local/beanstalkd

make && make install

mkdir -p /var/lib/beanstalkd/binlog

echo '
[Unit]
Description=Beanstalkd is a simple, fast work queue
After=network.target

[Service]
User=nobody
ExecStart=/usr/local/bin/beanstalkd
' >> /usr/lib/systemd/system/beanstalkd.service


systemctl enable beanstalkd.service

systemctl start beanstalkd.service