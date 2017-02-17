echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "   user is bestpay,run now!"
else
echo "   user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"
echo "step 2: --------------------stop nginx --------------------"
kill -9 `ps -ef|grep "nginx" | grep -v "grep"|awk   '{print   $2} '`
echo "     stop nginx success!"
echo "step 2: --------------------done--------------------"

echo "step 3: --------------------stop web  wap  ws  jetty--------------------"
kill -9 `ps -ef|grep "jetty" | grep -v "grep"|grep -v "jetty-dubbo"|awk   '{print   $2} '`
echo "     stop all jetty success!"
echo "step 3: --------------------done--------------------"

echo "step 4: --------------------stop all dubbo process--------------------"
kill -9 `ps -ef|grep "paycenter-business" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop business success!"
kill -9 `ps -ef|grep "paycenter-persistence" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop engine success!"
kill -9 `ps -ef|grep "paycenter-service" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop service success!"
kill -9 `ps -ef|grep "paycenter-bank" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop bank success!"
kill -9 `ps -ef|grep "paycenter-notify" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop notify success!"
kill -9 `ps -ef|grep "paycenter-scheduledtasks" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop scheduledtasks success!"
kill -9 `ps -ef|grep "paycenter-manager" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop manager success!"
kill -9 `ps -ef|grep "paycenter-entry-dubbo" | grep -v "grep"|awk   '{print   $2} '`
echo "   stop dubbo success!"
echo "step 4: --------------------done--------------------"
echo "---------------------END---------------------"


