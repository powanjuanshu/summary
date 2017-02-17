echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop wap jetty process--------------------"
kill -9 `ps -ef|grep "tools/jetty-wap" | grep -v "grep"|awk   '{print   $2} '`
echo "          stop all jetty-wap success!"
sleep 2s
echo "step 3: --------------------jar wap war package--------------------"
rm -rf /bestpayserver/project/paycenter-wap/*
cp -p /bestpayserver/project/paycenter-http.war /bestpayserver/project/paycenter-wap/
cd /bestpayserver/project/paycenter-wap/
jar xf /bestpayserver/project/paycenter-wap/*.war
sleep 5s
echo "step 4: --------------------restart wap jetty--------------------"
cd /tools/jetty-wap/bin
./jetty.sh restart
sleep 5s
echo "---------------------END---------------------"
