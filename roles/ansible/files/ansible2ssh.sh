#!/bin/bash -x

ANSIBLE_HOSTS_FILE=/etc/ansible/hosts
HOSTNAME_FILE=/tmp/raw_hosts
USERS_FILE=/tmp/users
VARS_FILE=/tmp/vars
SSH_CONF_FILE=/tmp/ssh

awk '{print $1}' $ANSIBLE_HOSTS_FILE > $HOSTNAME_FILE 
awk -F 'main_user=' '{print $2}' $ANSIBLE_HOSTS_FILE > $USERS_FILE
paste $USERS_FILE $HOSTNAME_FILE   | grep -v "\[" | sort | uniq | sed '/^[[:space:]]*$/d' > $VARS_FILE

echo '' > $SSH_CONF_FILE  
while read each
   	do echo "${each}" | awk '{print "Host " $2}'		>> $SSH_CONF_FILE 
	echo "${each}"    | awk '{print "   HostName " $2}' 	>> $SSH_CONF_FILE 
	echo "${each}"    | awk '{print "   User " $1}'		>> $SSH_CONF_FILE 
done < $VARS_FILE

cat $SSH_CONF_FILE | tee ~/.ssh/config
