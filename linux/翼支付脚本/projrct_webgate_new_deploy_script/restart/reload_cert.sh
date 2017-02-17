echo "--------------------START--------------------"
echo "step 1: --------------------check user--------------------"
if [ `whoami` = "bestpay" ];then
echo "    user is bestpay,run now!"
else
echo "    user is not bestpay,please change the user to bestpay and try again!"
exit 0
fi
echo "step 1: --------------------done--------------------"

echo "step 2: --------------------reload cert--------------------"
rm -rf /bestpayserver/project/bank-cert/lib
cd /bestpayserver/project/bank-cert
tar -xvf /bestpayserver/project/bank-cert/bank-cert.tar.gz
echo "---------------------OK---------------------"
