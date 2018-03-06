#!/bin/bash
echo 'input port:'$1
netstat -ap | grep $1
