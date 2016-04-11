#!/bin/sh
. ./z_profile
echo ${CONST_SERVER_HOSTNAME}

#!/bin/sh
# export common profile
. ./z_profile
# export command function
. ./common_function.sh

var_command="hostname"
auto_command ${CONST_USER} ${CONST_PWD} ${CONST_DB_SERVER_HOSTNAME} ${RESULT_FILE_DIR} ${var_command}
cat ${RESULT_FILE_DIR}

exit 0
