echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop business dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-business" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop business success!"
sleep 2s
echo "step 3: --------------------start business process--------------------"
rm -f /bestpayserver/project/paycenter-business/*.jar
cp -p /bestpayserver/project/paycenter-business.jar /bestpayserver/project/paycenter-business/
nohup java -jar /bestpayserver/project/paycenter-business/paycenter-business.jar >/dev/null 2>&1 &
echo "   start business success! "
echo "---------------------END---------------------"
