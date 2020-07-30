#!/bin/bash -xeu

yum -y install python3 python3-pip
alternatives --set python /usr/bin/python3
pip3 install ansible
