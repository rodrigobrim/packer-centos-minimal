#!/bin/bash -xeu

yum -y install python3 curl
alternatives --set python /usr/bin/python3
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
/usr/bin/python3 /tmp/get-pip.py
/usr/local/bin/pip3 install ansible
