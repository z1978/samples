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