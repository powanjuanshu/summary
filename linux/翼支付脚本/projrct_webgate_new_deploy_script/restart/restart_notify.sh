echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop notify dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-notify" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop notify success!"
sleep 2s
echo "step 3: --------------------start notify process--------------------"
rm -f /bestpayserver/project/paycenter-notify/*.jar
cp -p /bestpayserver/project/paycenter-notify.jar /bestpayserver/project/paycenter-notify/
nohup java -jar /bestpayserver/project/paycenter-notify/paycenter-notify.jar >/dev/null 2>&1 &
echo "   start notify success! "
echo "---------------------END---------------------"
