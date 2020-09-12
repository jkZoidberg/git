snort
idk
node_list
p
-p
node_list
help
node_list
-e
 node_list-e
node_list e
exit
help
job_spec[snort ]  
node0.idk.detertest
ssh node0.idk.detertest
ssh snort.idk.COMP232.isi.deterlab.net
node_list
pid
$ sudo -s
# whoami 
# root
sudo-s
help
help name
idk [&]
idk
cd\idk
cd/idk
node_list
--sever
sever
sudo snort --daq nfq -Q -v
snort.idk.COMP232.isi.deterlab.net
man 1 intro
ssh 
ssh snort.idk.COMP232.isi.deterlab.net
ssh idk.COMP232.isi.deterlab.net
ssh snort.COMP232.isi.deterlab.net
ssh snort.idk.COMP232.isi.deterlab.net
snort.idk.COMP232.isi.deterlab.net
list_node
node_list
ssh
ssh snort.idk.COMP232.isi.deterlab.net
sudo snort --daq nfq -Q -v
sudo snort --daq nfq -Q -v
#!/bin/bash
#
#
# Copyright (C) 2018 University of Southern California.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
#
# This program starts the ttylog logger
user_groups=$(groups)
exit_flag=1
for group in $user_groups; do     if [ "$group" = "root" ] || [ "$group" = "sudo" ] || [ "$group" = "wheel" ];     then         exit_flag=0;         break;     else         continue;     fi; done
if [ $exit_flag = 1 ]; then     bash;     exit; fi
if [ -z "$SSH_ORIGINAL_COMMAND" ]; then     function clean_up {         echo;         echo "END tty_sid:$CNT" >> $LOGPATH;         PSTRING_KILL=$(ps -o args -p ${PID_CONTCSV} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${CONTCSVPATH} ]]; then             sudo kill ${PID_CONTCSV} 2>/dev/null;         fi;         PSTRING_KILL=$(ps -o args -p ${PID_ANNOTATOR} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${ANNOTATORPATH} ]]; then             sudo kill ${PID_ANNOTATOR} 2>/dev/null;         fi;         PSTRING_KILL=$(ps -o args -p ${PID_INTERVENTION} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${ANNOTATORPATH} ]]; then             sudo kill ${PID_INTERVENTION} 2>/dev/null;         fi;         exit;     }     trap clean_up exit;      TTY_CMD=$(tty);     TTY=${TTY_CMD:5}     HN=$(cat /var/emulab/boot/nickname)     HOST=$(echo $HN | awk -F. '{print $(NF - 2)}');     EXP=$(echo $HN | awk -F. '{print $(NF - 1)}');     PROJ=$(echo $HN | awk -F. '{print $(NF)}')     USER=$USER;      sudo mkdir -p /var/log/ttylog/     if sudo [ -e "/proj/$PROJ/exp/$EXP/count.$HOST" ]; then         CNT=$(sudo cat /proj/$PROJ/exp/$EXP/count.$HOST);         let CNT++;         echo $CNT | sudo tee /proj/$PROJ/exp/$EXP/count.$HOST > /dev/null     else         sudo touch /proj/$PROJ/exp/$EXP/count.$HOST;         sudo chmod ugo+rw /proj/$PROJ/exp/$EXP/count.$HOST;         echo "0" > /proj/$PROJ/exp/$EXP/count.$HOST;         CNT=$(cat /proj/$PROJ/exp/$EXP/count.$HOST);     fi;      export TTY_SID=$CNT;     export TTY_USER=$USER;     LOGPATH=/var/log/ttylog/ttylog.$USER.$CNT;      sudo touch $LOGPATH;     sudo chmod ugo+rw $LOGPATH;      echo "starting session w tty_sid:$CNT" >> $LOGPATH;     echo "User prompt is ${USER}@${HOST}" >> $LOGPATH;     echo "Home directory is ${HOME}" >> $LOGPATH;      sudo /usr/local/src/ttylog/ttylog $TTY >> $LOGPATH 2>/dev/null &     CONTCSVDIR="/var/log/analyze_cont/";     if ! sudo [ -d $CONTCSVDIR ]; then         sudo mkdir -p $CONTCSVDIR;     fi;     CONTCSVPATH=${CONTCSVDIR}analyze.$USER.$CNT.csv;     sudo python3 /usr/local/src/analyze_continuous.py ${LOGPATH} ${CONTCSVPATH} 2>/dev/null &     PID_CONTCSV=$!;      if ! sudo [ -f $CONTCSVPATH ]; then         sudo touch ${CONTCSVPATH};     fi;      ANNDIR="/var/log/annotator/";     if ! sudo [ -d $ANNDIR ]; then         sudo mkdir -p $ANNDIR;     fi;     ANNOTATORPATH=${ANNDIR}annotate.$USER.$CNT     MILESTONEFILE="/var/log/milestones/milestone_file";     MILESTONEMESS="/var/log/milestones/milestone_messages";     if sudo [ -f $MILESTONEFILE ]; then     	if ! sudo [ -f ${ANNOTATORPATH} ]; then         	sudo touch ${ANNOTATORPATH};     	fi;         sudo perl /usr/local/src/milestones-lbl.pl ${MILESTONEFILE} ${CONTCSVPATH} ${ANNOTATORPATH} 2>/dev/null &         PID_ANNOTATOR=$!;         sudo python3 /usr/local/src/intervention.py ${ANNOTATORPATH} ${MILESTONEFILE} ${MILESTONEMESS} 2>/dev/null &         PID_INTERVENTION=$!;     fi;      bash;  elif [ "$(echo ${SSH_ORIGINAL_COMMAND} | grep '^sftp' )" ]; then     /usr/lib/openssh/sftp-server;  elif [ "$(echo ${SSH_ORIGINAL_COMMAND} | grep '^scp' )" ]; then     exec ${SSH_ORIGINAL_COMMAND};  elif [ "$(echo ${SSH_ORIGINAL_COMMAND})" ]; then     TMPPATH=/tmp/sshcmds.sh;     $(echo $SSH_ORIGINAL_COMMAND >> $TMPPATH);     bash $TMPPATH;     rm $TMPPATH;  fi
ssh snort.idk.COMP232.isi.deterlab.net
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
tcpdump
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
sudo /share/education/SecuringLegacySystems_JHU/process.pl /tmp/dump.pcap
No such file or directorysudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcapsudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
sudo tcpdump -i [10.1.1.0 / 24] -s 0 -w /tmp/dump.pcap
sudo tcpdump -i [interface] -s 0 -w /tmp/dump.pcap
ifconfig -a
#!/bin/bash
#
#
# Copyright (C) 2018 University of Southern California.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
#
# This program starts the ttylog logger
user_groups=$(groups)
exit_flag=1
for group in $user_groups; do     if [ "$group" = "root" ] || [ "$group" = "sudo" ] || [ "$group" = "wheel" ];     then         exit_flag=0;         break;     else         continue;     fi; done
if [ $exit_flag = 1 ]; then     bash;     exit; fi
if [ -z "$SSH_ORIGINAL_COMMAND" ]; then     function clean_up {         echo;         echo "END tty_sid:$CNT" >> $LOGPATH;         PSTRING_KILL=$(ps -o args -p ${PID_CONTCSV} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${CONTCSVPATH} ]]; then             sudo kill ${PID_CONTCSV} 2>/dev/null;         fi;         PSTRING_KILL=$(ps -o args -p ${PID_ANNOTATOR} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${ANNOTATORPATH} ]]; then             sudo kill ${PID_ANNOTATOR} 2>/dev/null;         fi;         PSTRING_KILL=$(ps -o args -p ${PID_INTERVENTION} --no-headers 2>/dev/null);         if [[ $PSTRING_KILL =~ ${ANNOTATORPATH} ]]; then             sudo kill ${PID_INTERVENTION} 2>/dev/null;         fi;         exit;     }     trap clean_up exit;      TTY_CMD=$(tty);     TTY=${TTY_CMD:5}     HN=$(cat /var/emulab/boot/nickname)     HOST=$(echo $HN | awk -F. '{print $(NF - 2)}');     EXP=$(echo $HN | awk -F. '{print $(NF - 1)}');     PROJ=$(echo $HN | awk -F. '{print $(NF)}')     USER=$USER;      sudo mkdir -p /var/log/ttylog/     if sudo [ -e "/proj/$PROJ/exp/$EXP/count.$HOST" ]; then         CNT=$(sudo cat /proj/$PROJ/exp/$EXP/count.$HOST);         let CNT++;         echo $CNT | sudo tee /proj/$PROJ/exp/$EXP/count.$HOST > /dev/null     else         sudo touch /proj/$PROJ/exp/$EXP/count.$HOST;         sudo chmod ugo+rw /proj/$PROJ/exp/$EXP/count.$HOST;         echo "0" > /proj/$PROJ/exp/$EXP/count.$HOST;         CNT=$(cat /proj/$PROJ/exp/$EXP/count.$HOST);     fi;      export TTY_SID=$CNT;     export TTY_USER=$USER;     LOGPATH=/var/log/ttylog/ttylog.$USER.$CNT;      sudo touch $LOGPATH;     sudo chmod ugo+rw $LOGPATH;      echo "starting session w tty_sid:$CNT" >> $LOGPATH;     echo "User prompt is ${USER}@${HOST}" >> $LOGPATH;     echo "Home directory is ${HOME}" >> $LOGPATH;      sudo /usr/local/src/ttylog/ttylog $TTY >> $LOGPATH 2>/dev/null &     CONTCSVDIR="/var/log/analyze_cont/";     if ! sudo [ -d $CONTCSVDIR ]; then         sudo mkdir -p $CONTCSVDIR;     fi;     CONTCSVPATH=${CONTCSVDIR}analyze.$USER.$CNT.csv;     sudo python3 /usr/local/src/analyze_continuous.py ${LOGPATH} ${CONTCSVPATH} 2>/dev/null &     PID_CONTCSV=$!;      if ! sudo [ -f $CONTCSVPATH ]; then         sudo touch ${CONTCSVPATH};     fi;      ANNDIR="/var/log/annotator/";     if ! sudo [ -d $ANNDIR ]; then         sudo mkdir -p $ANNDIR;     fi;     ANNOTATORPATH=${ANNDIR}annotate.$USER.$CNT     MILESTONEFILE="/var/log/milestones/milestone_file";     MILESTONEMESS="/var/log/milestones/milestone_messages";     if sudo [ -f $MILESTONEFILE ]; then     	if ! sudo [ -f ${ANNOTATORPATH} ]; then         	sudo touch ${ANNOTATORPATH};     	fi;         sudo perl /usr/local/src/milestones-lbl.pl ${MILESTONEFILE} ${CONTCSVPATH} ${ANNOTATORPATH} 2>/dev/null &         PID_ANNOTATOR=$!;         sudo python3 /usr/local/src/intervention.py ${ANNOTATORPATH} ${MILESTONEFILE} ${MILESTONEMESS} 2>/dev/null &         PID_INTERVENTION=$!;     fi;      bash;  elif [ "$(echo ${SSH_ORIGINAL_COMMAND} | grep '^sftp' )" ]; then     /usr/lib/openssh/sftp-server;  elif [ "$(echo ${SSH_ORIGINAL_COMMAND} | grep '^scp' )" ]; then     exec ${SSH_ORIGINAL_COMMAND};  elif [ "$(echo ${SSH_ORIGINAL_COMMAND})" ]; then     TMPPATH=/tmp/sshcmds.sh;     $(echo $SSH_ORIGINAL_COMMAND >> $TMPPATH);     bash $TMPPATH;     rm $TMPPATH;  fi
