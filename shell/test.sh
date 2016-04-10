#!/bin/sh
. ./z_profile
echo ${CONST_SERVER_HOSTNAME}

#!/bin/sh
# export common profile
. ./z_profile
# export command function
. ./common_function.sh

auto_command ls ${RESULT_FILE_DIR}

cat ${RESULT_FILE_DIR}

exit 0