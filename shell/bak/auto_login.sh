#--------------------------------------------------
# auto login
#--------------------------------------------------
#!/bin/sh
echo "---------- START ----------"
# export common profile
. ./z_profile
# export yesno function
. ./z_yse_no.sh

var_command=$1
echo 
if [ ! -n "${var_command}" ]; then
	echo "var_command IS NULL"
	exit 1
fi

if [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]; then
    CONST_USER=$2
	CONST_PASSWD=$3
	CONST_SERVER_HOSTNAME=$4
else
	echo "You will use default settings."
fi

echo "Are you really execute the command [${var_command}] in [${CONST_SERVER_HOSTNAME}]?"
# yes no dialog
yesno
if [ "$yes_or_no" == "yes" ]; then
	echo "do yes"
else
	echo "do no"
	exit 0
fi

function expect_run (){
expect<<EOF
    set timeout -1
    spawn $1
    expect {
          "yes/no" { send "yes\r"; exp_continue}
        "*assword:*" { send "${CONST_PASSWD}\r";expect eof}
    }
EOF
}

expect_run "ssh ${CONST_USER}@${CONST_SERVER_HOSTNAME} ${var_command}" > z_temp.txt
echo "========== Command execution result =========="
var_total=`wc -l z_temp.txt | awk '{print $1}'`
sed -n "3,${var_total}p" z_temp.txt

echo "---------- END ----------"
exit 0