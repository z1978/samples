#--------------------------------------------------
# auto login
#--------------------------------------------------
#!/bin/sh
# export common profile
. ./z_profile
echo "ssh ${CONST_USER}@${CONST_SERVER_HOSTNAME} ls"
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

expect_run "ssh ${CONST_USER}@${CONST_SERVER_HOSTNAME} ls"