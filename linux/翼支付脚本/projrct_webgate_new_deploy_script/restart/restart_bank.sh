echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop bank dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-bank" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop bank success!"
sleep 2s
echo "step 3: --------------------start bank process--------------------"
rm -f /bestpayserver/project/paycenter-bank/*.jar
rm -rf /bestpayserver/project/paycenter-bank/lib
cd /bestpayserver/project/paycenter-bank
tar -xvf /bestpayserver/project/paycenter-bank/bank-lib.tar.gz
cp -p /bestpayserver/project/paycenter-bank.jar /bestpayserver/project/paycenter-bank/
nohup java -jar /bestpayserver/project/paycenter-bank/paycenter-bank.jar >/dev/null 2>&1 &
echo "   start bank success! "
echo "---------------------END---------------------"
