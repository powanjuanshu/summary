echo "synchronize 66 start--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi

echo "--------------------scp 66 start--------------------"
echo "--------------------scp 66 bank-cert--------------------"
scp -r /bestpayserver/sync/bank-cert.tar.gz bestpay@172.17.9.66:/bestpayserver/project/bank-cert
echo "--------------------scp 66 lib--------------------"
scp /bestpayserver/sync/bank-lib.tar.gz bestpay@172.17.9.66:/bestpayserver/project/paycenter-bank/
scp /bestpayserver/sync/manager-lib.tar.gz bestpay@172.17.9.66:/bestpayserver/project/paycenter-manager/
echo "--------------------scp 66 jar and war--------------------"
scp /bestpayserver/sync/*.jar /bestpayserver/sync/*.war bestpay@172.17.9.66:/bestpayserver/project/
echo "--------------------scp 66 script--------------------"
scp /bestpayserver/*.sh server66:/bestpayserver/
echo "--------------------done--------------------"
exit


