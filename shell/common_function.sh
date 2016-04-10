#--------------------------------------------------
# yes no dialog
#--------------------------------------------------
function yesno (){
	read -p "Please input (Y/N) :" yn
	if [ "$yn" == "Y" ] || [ "$yn" == "y" ];then
		yes_or_no=yes
	elif [ "$yn"x == "N"x ] || [ "$yn"x == "n"x ]; then
		yes_or_no=no
	else
		echo "I don't know what your input, Please input y or n."
		yesno
	fi
}

#--------------------------------------------------
# auto password
#--------------------------------------------------
function expect_auto_password (){
	var_command=$1
	var_password=$2
expect<<EOF
    set timeout -1
    spawn $var_command
    expect {
          "yes/no" { send "yes\r"; exp_continue}
        "*assword:*" { send "${var_password}\r";expect eof}
    }
EOF
}

#--------------------------------------------------
# auto command
#--------------------------------------------------
function auto_command (){
	var_command=$1
	var_output_file_dir=$2
	
	if [ ! -n "${var_command}" ]; then
		echo "var_command IS NULL"
		exit 1
	fi

	if [ ! -n "${var_output_file_dir}" ]; then
		echo "var_output_file_dir IS NULL"
		exit 1
	fi

	if [ -n "$3" ] && [ -n "$4" ] && [ -n "$5" ]; then
		CONST_USER=$3
		CONST_PASSWD=$4
		CONST_SERVER_HOSTNAME=$5
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
		
	expect_auto_password "ssh ${CONST_USER}@${CONST_SERVER_HOSTNAME} ${var_command}" "${CONST_PASSWD}" > ${var_output_file_dir}
}