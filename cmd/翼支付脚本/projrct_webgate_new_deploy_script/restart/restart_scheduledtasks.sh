echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop scheduledtasks dubbo process--------------------"
kill -9 `ps -ef|grep "paycenter-scheduledtasks" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop scheduledtasks success!"
sleep 2s
echo "step 3: --------------------start scheduledtasks process--------------------"
rm -f /bestpayserver/project/paycenter-scheduledtasks/*.jar
cp -p /bestpayserver/project/paycenter-scheduledtasks.jar /bestpayserver/project/paycenter-scheduledtasks/
nohup java -jar /bestpayserver/project/paycenter-scheduledtasks/paycenter-scheduledtasks.jar >/dev/null 2>&1 &
echo "   start scheduledtasks success! "
echo "---------------------END---------------------"
