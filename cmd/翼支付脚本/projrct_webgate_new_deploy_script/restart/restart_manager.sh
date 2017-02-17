echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop manager dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-manager" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop manager success!"
sleep 2s
echo "step 3: --------------------start manager process--------------------"
rm -f /bestpayserver/project/paycenter-manager/*.jar
rm -rf /bestpayserver/project/paycenter-manager/lib
cd /bestpayserver/project/paycenter-manager
tar -xvf /bestpayserver/project/paycenter-manager/manager-lib.tar.gz
cp -p /bestpayserver/project/paycenter-manager.jar /bestpayserver/project/paycenter-manager/
nohup java -jar /bestpayserver/project/paycenter-manager/paycenter-manager.jar >/dev/null 2>&1 &
echo "   start manager success! "
echo "---------------------END---------------------"
