o "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"
echo "step 2: --------------------stop nginx --------------------"
kill -9 `ps -ef|grep "nginx" | grep -v "grep"|awk   '{print   $2} '`
echo "          stop nginx success!"
echo "step 3: --------------------restart nginx --------------------"
/tools/nginx/sbin/nginx
echo "step 3: --------------------done--------------------"

echo "--------------------- nginx  status!--------------------"
grep nginx
echo "---------------------END---------------------"
