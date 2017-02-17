echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop web jetty process--------------------"
kill -9 `ps -ef|grep "tools/jetty-web" | grep -v "grep"|awk   '{print   $2} '`
echo "          stop all jetty-web success!"
sleep 2s
echo "step 3: --------------------jar web war package--------------------"
rm -rf /bestpayserver/project/paycenter-web/*
cp -p /bestpayserver/project/paycenter-http.war /bestpayserver/project/paycenter-web/
cd /bestpayserver/project/paycenter-web/
jar xf /bestpayserver/project/paycenter-web/*.war
sleep 5s
echo "step 4: --------------------restart web jetty--------------------"
cd /tools/jetty-web/bin
./jetty.sh restart
sleep 5s
echo "---------------------END---------------------"
