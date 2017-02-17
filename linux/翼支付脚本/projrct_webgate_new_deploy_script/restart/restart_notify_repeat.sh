echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to root and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop paycenter-notify-repeat dubbo process--------------------"
kill -9 `ps -ef|grep "paycenter-notify-repeat" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop notify-repeat success!"
sleep 2s
echo "step 3: --------------------start paycenter-notify-repeat process--------------------"
rm -f /bestpayserver/project/paycenter-notify-repeat/*.jar
cp -p /bestpayserver/project/paycenter-notify-repeat.jar /bestpayserver/project/paycenter-notify-repeat/
nohup java -jar /bestpayserver/project/paycenter-notify-repeat/paycenter-notify-repeat.jar >/dev/null 2>&1 &
echo "   start notify-repeat success!"
echo "---------------------END---------------------"
