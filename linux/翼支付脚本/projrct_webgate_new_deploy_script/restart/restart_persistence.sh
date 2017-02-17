echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop persistence dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-persistence" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop persistence success!"
sleep 1s
echo "step 3: --------------------start persistence process--------------------"
rm -f /bestpayserver/project/paycenter-persistence/*.jar
cp -p /bestpayserver/project/paycenter-persistence.jar /bestpayserver/project/paycenter-persistence/
nohup java -jar /bestpayserver/project/paycenter-persistence/paycenter-persistence.jar >/dev/null 2>&1 &
echo "   start persistence success!"
echo "---------------------END---------------------"
