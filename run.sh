#!/bin/bash -x
export TERM=xterm
LOG_FILE=~/last_run
WORK_DIR=$(echo "${BASH_SOURCE[0]}" | sed  -e"s/\/run\.sh//")
cd $WORK_DIR
time unbuffer ansible-playbook --forks 8 default.yml | tee $LOG_FILE
date>> $LOG_FILE
