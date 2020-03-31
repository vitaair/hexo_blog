#!/bin/bash
DIR=`dirname $0`

hexo clean
hexo generate
hexo server
sleep 5

echo "=====>Finish!<====="