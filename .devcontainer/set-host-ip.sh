#!/bin/bash
echo $(cat /etc/resolv.conf |grep -i '^nameserver'|head -n1|cut -d ' ' -f2) host.docker.internal >> /etc/hosts