echo "synchronize 65 start--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi

echo "--------------------scp 65 start--------------------"
echo "--------------------scp 65 bank-cert--------------------"
scp /bestpayserver/sync/bank-cert.tar.gz bestpay@172.17.9.65:/bestpayserver/project/bank-cert
echo "--------------------scp 65 lib--------------------"
scp /bestpayserver/sync/bank-lib.tar.gz bestpay@172.17.9.65:/bestpayserver/project/paycenter-bank/
scp /bestpayserver/sync/manager-lib.tar.gz bestpay@172.17.9.65:/bestpayserver/project/paycenter-manager/
echo "--------------------scp 65 jar and war--------------------"
scp /bestpayserver/sync/*.jar /bestpayserver/sync/*.war bestpay@172.17.9.65:/bestpayserver/project/
echo "--------------------scp 65 script--------------------"
scp /bestpayserver/*.sh server65:/bestpayserver/
echo "--------------------done--------------------"
exit


