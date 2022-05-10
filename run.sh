#!/bin/bash -x
LOG_FILE=~/last_run
cd $(git rev-parse --show-toplevel)
unbuffer ansible-playbook default.yml | tee $LOG_FILE
date>> $LOG_FILE
