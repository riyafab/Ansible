#!/bin/bash

#this scripts output the health of node

set -x #debug mode
set -e # exit the script when there is an error
set -o #pipelfail
  
df -h
 
free -g

nproc

ps -ef
