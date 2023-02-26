#!/bin/bash -x

REMOTE_HOST={{ remote_host }}
LOG_FILE={{ log_file }}
OUT_FILE=.status

#decolorizing the ansible output so python can read it
sed -e 's/\x1b\[[0-9;]*m//g' $LOG_FILE >/tmp/decolorized

#job to convert ansible output to json
python copystatus.py /tmp/decolorized $OUT_FILE

scp $OUT_FILE $REMOTE_HOST:$OUT_FILE
