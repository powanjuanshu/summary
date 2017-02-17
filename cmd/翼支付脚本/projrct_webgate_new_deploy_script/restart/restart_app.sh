echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"
echo "step 2: --------------------stop nginx --------------------"
kill -9 `ps -ef|grep "nginx" | grep -v "grep"|awk   '{print   $2} '`
echo "          stop nginx success!"
echo "step 2: --------------------done--------------------"
echo "step 3: --------------------stop web  wap  ws  jetty--------------------"
kill -9 `ps -ef|grep "/tools/jetty" | grep -v "grep"|grep -v "jetty-dubbo"|awk   '{print   $2} '`
echo "          stop all jetty success!"
echo "step 3: --------------------done--------------------"
echo "step 4: --------------------stop all dubbo process--------------------"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-persistence" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop persistence success!"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-service" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop service success!"

kill -9 `ps -ef|grep "bestpayserver/project/paycenter-bank" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop bank success!"


kill -9 `ps -ef|grep "bestpayserver/project/paycenter-bank-msgforwarding" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop bank-msgforwarding success!"


kill -9 `ps -ef|grep "bestpayserver/project/paycenter-notify" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop notify success!"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-manager" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop manager success!"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-business" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop business success!"
kill -9 `ps -ef|grep "bestpayserver/project/paycenter-entry-dubbo" | grep -v "grep"|awk   '{print   $2} '`
echo "      stop entry-dubbo success!"
echo "step 4: --------------------done--------------------"

echo "step 5: --------------------start all process--------------------"
echo "--------------------reload bank-cert--------------------"
rm -rf /bestpayserver/project/bank-cert/lib
cd /bestpayserver/project/bank-cert/
tar -xvf /bestpayserver/project/bank-cert/bank-cert.tar.gz
echo "--------------------reload bank-cert success--------------------"
rm -f /bestpayserver/project/paycenter-persistence/*.jar
cp -p /bestpayserver/project/paycenter-persistence.jar /bestpayserver/project/paycenter-persistence/
nohup java -jar /bestpayserver/project/paycenter-persistence/paycenter-persistence.jar >/dev/null 2>&1 &
echo "   start persistence success! 10s later to start bank-msgforwarding!"
sleep 15s

rm -rf /bestpayserver/project/paycenter-bank-msgforwarding/lib
rm -f /bestpayserver/project/paycenter-bank-msgforwarding/*.jar
cd /bestpayserver/project/paycenter-bank-msgforwarding
tar -xvf /bestpayserver/project/paycenter-bank-msgforwarding/bank-lib.tar.gz
cp -p /bestpayserver/project/paycenter-bank-msgforwarding.jar /bestpayserver/project/paycenter-bank-msgforwarding/
nohup java -jar /bestpayserver/project/paycenter-bank-msgforwarding/paycenter-bank-msgforwarding.jar >/dev/null 2>&1 &
echo "   start bank-msgforwarding success! 5s later to start bank!"
sleep 5s

rm -rf /bestpayserver/project/paycenter-bank/lib
rm -f /bestpayserver/project/paycenter-bank/*.jar
cd /bestpayserver/project/paycenter-bank
tar -xvf /bestpayserver/project/paycenter-bank/bank-lib.tar.gz
cp -p /bestpayserver/project/paycenter-bank.jar /bestpayserver/project/paycenter-bank/
nohup java -jar /bestpayserver/project/paycenter-bank/paycenter-bank.jar >/dev/null 2>&1 &
echo "   start bank success! 5s later to start manager!"
sleep 1s
rm -f /bestpayserver/project/paycenter-manager/*.jar
rm -rf /bestpayserver/project/paycenter-manager/lib
cd /bestpayserver/project/paycenter-manager
tar -xvf /bestpayserver/project/paycenter-manager/manager-lib.tar.gz
cp -p /bestpayserver/project/paycenter-manager.jar /bestpayserver/project/paycenter-manager/
nohup java -jar /bestpayserver/project/paycenter-manager/paycenter-manager.jar >/dev/null 2>&1 &
echo "   start manager success! 5s later to start notify!"
sleep 10s
rm -f /bestpayserver/project/paycenter-notify/*.jar
cp -p /bestpayserver/project/paycenter-notify.jar /bestpayserver/project/paycenter-notify/
nohup java -jar /bestpayserver/project/paycenter-notify/paycenter-notify.jar >/dev/null 2>&1 &
echo "   start notify success! 5s later to start notify-repeat!"
sleep 1s
rm -f /bestpayserver/project/paycenter-business/*.jar
cp -p /bestpayserver/project/paycenter-business.jar /bestpayserver/project/paycenter-business/
nohup java -jar /bestpayserver/project/paycenter-business/paycenter-business.jar >/dev/null 2>&1 &
echo "   start business success! 5s later to start service!"
sleep 30s
rm -f /bestpayserver/project/paycenter-service/*.jar
cp -p /bestpayserver/project/paycenter-service.jar /bestpayserver/project/paycenter-service/
nohup java -jar /bestpayserver/project/paycenter-service/paycenter-service.jar >/dev/null 2>&1 &
echo "   start service success! 5s later to start jetty!"
sleep 15s
rm -f /bestpayserver/project/paycenter-entry-dubbo/*.jar
cp -p /bestpayserver/project/paycenter-entry-dubbo.jar /bestpayserver/project/paycenter-entry-dubbo/
nohup java -jar /bestpayserver/project/paycenter-entry-dubbo/paycenter-entry-dubbo.jar >/dev/null 2>&1 &
echo "   start entry-dubbo success! 5s later to start jetty!"sleep 8s
echo "step 5: --------------------done--------------------"


echo "step 11: --------------------jar web wap ws war package --------------------"
rm -rf /bestpayserver/project/paycenter-web/*
cp -p /bestpayserver/project/paycenter-http.war /bestpayserver/project/paycenter-web/
cd /bestpayserver/project/paycenter-web/
jar xf /bestpayserver/project/paycenter-web/*.war
sleep 1s
rm -rf /bestpayserver/project/paycenter-wap/*
cp -p /bestpayserver/project/paycenter-http.war /bestpayserver/project/paycenter-wap/
cd /bestpayserver/project/paycenter-wap/
jar xf /bestpayserver/project/paycenter-wap/*.war
sleep 1s
rm -rf /bestpayserver/project/paycenter-ws/*
cp -p /bestpayserver/project/paycenter-ws.war /bestpayserver/project/paycenter-ws/
cd /bestpayserver/project/paycenter-ws/
jar xf /bestpayserver/project/paycenter-ws/*.war
sleep 15s
echo "step 11: --------------------done--------------------"

echo "step 22: --------------------restart web jetty--------------------"
cd /tools/jetty-web/bin
./jetty.sh restart
echo "step 22: --------------------done--------------------"
echo "step 33: --------------------restart wap jetty--------------------"
cd /tools/jetty-wap/bin
./jetty.sh restart
echo "step 33: --------------------done--------------------"
echo "step 44: --------------------restart ws jetty--------------------"
cd /tools/jetty-ws/bin
./jetty.sh restart
echo "step 44: --------------------done--------------------"
echo "step 55: --------------------restart nginx --------------------"
/tools/nginx/sbin/nginx
echo "step 55: --------------------done--------------------"
echo "---------------------all app and webserver status!--------------------"
ps -ef|grep service&ps -ef|grep persistence&ps -ef|grep bank&ps -ef|grep manager&ps -ef|grep notify&ps -ef|grep jetty&ps -ef|grep nginx
echo "---------------------END---------------------"
