#--------------------------------------------------
# get
#--------------------------------------------------
var_total=`wc -l z_temp.txt | awk '{print $1}'`
sed -n "3,${var_total}p" z_temp.txt
sed -n "${var_total}p" z_temp.txt
awk 'NR==5 {print $2}' z_temp.txt
awk 'NR==3,NR==10 {print $1}' z_temp.txt
awk 'NR>3 && NR<5 {print $1}' z_temp.txt