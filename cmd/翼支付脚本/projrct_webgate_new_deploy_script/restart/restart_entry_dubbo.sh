echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];
then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"
echo "step 2: --------------------stop paycenter-entry-dubbo dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-entry-dubbo" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop paycenter-entry-dubbo success!"
sleep 2s
echo "
step 3: --------------------start notify process--------------------"
rm -f /bestpayserver/project/paycenter-entry-dubbo/*.jar
cp -p /bestpayserver/project/paycenter-entry-dubbo.jar /bestpayserver/project/paycenter-entry-dubbo/
nohup java -jar /bestpayserver/project/paycenter-entry-dubbo/paycenter-entry-dubbo.jar >/dev/null 2>&1 &
echo "   start notify success! "
echo "---------------------END---------------------"
