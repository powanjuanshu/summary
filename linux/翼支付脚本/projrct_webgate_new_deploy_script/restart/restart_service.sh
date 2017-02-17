echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop service dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-service" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop service success!"
sleep 2s
echo "step 3: --------------------start service process--------------------"
rm -f /bestpayserver/project/paycenter-service/*.jar
cp -p /bestpayserver/project/paycenter-service.jar /bestpayserver/project/paycenter-service/
nohup java -jar /bestpayserver/project/paycenter-service/paycenter-service.jar >/dev/null 2>&1 &
echo "   start service success! "
echo "---------------------END---------------------"
