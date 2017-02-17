echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------stop ws jetty process--------------------"
kill -9 `ps -ef|grep "tools/jetty-ws" | grep -v "grep"|awk   '{print   $2} '`
echo "          stop all jetty-ws success!"
sleep 2s
echo "step 3: --------------------jar ws war package--------------------"
rm -rf /bestpayserver/project/paycenter-ws/*
cp -p /bestpayserver/project/paycenter-ws.war /bestpayserver/project/paycenter-ws/
cd /bestpayserver/project/paycenter-ws/
jar xf /bestpayserver/project/paycenter-ws/*.war
sleep 5s
echo "step 4: --------------------restart web jetty--------------------"
cd /tools/jetty-ws/bin
./jetty.sh restart
sleep 5s
echo "---------------------END---------------------"
