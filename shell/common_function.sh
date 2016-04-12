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
    var_user=$1
    var_password=$2
    var_server_hostname=$3
    var_output_file_dir=$4
    var_command="$5"
    
    if [ ! -n "${var_user}" ]; then
        echo "var_user IS NULL"
        exit 1
    fi

    if [ ! -n "${var_password}" ]; then
        echo "var_password IS NULL"
        exit 1
    fi

    if [ ! -n "${var_server_hostname}" ]; then
        echo "var_server_hostname IS NULL"
        exit 1
    fi

    if [ ! -n "${var_output_file_dir}" ]; then
        echo "var_output_file_dir IS NULL"
        exit 1
    fi
    
    if [ ! -n "${var_command}" ]; then
        echo "var_command IS NULL"
        exit 1
    fi

    echo "Are you really execute the command [${var_command}] in [${var_server_hostname}]?"
    # yes no dialog
    yesno
    if [ "$yes_or_no" == "yes" ]; then
        echo "do yes"
    else
        echo "do no"
        exit 0
    fi
        
    expect_auto_password "ssh ${var_user}@${var_server_hostname} ${var_command}" "${var_password}" > ${var_output_file_dir}
}
