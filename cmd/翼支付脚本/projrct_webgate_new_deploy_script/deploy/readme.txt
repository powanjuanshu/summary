ftp部署：
环境简介：
172.17.9.62,65,66为生产环境。
172.17.9.63:准生产环境
172.17.13.32：测试环境
部署说明：
maven打包后所有内容都会复制到本地D:\\alljar目录下，该部署是基于maven package的。
------------------------
66同步
/bestpayserver/stop_all.sh 
/bestpayserver/sync/sync_66.sh 
目录说明：
sync：63同步到生产环境的机器上，在63上执行，本地无法执行。路径：/bestpayserver/sync/*.sh

63：部署至63
32：部署至32

本地脚本说明：以32为例
script_32_all.bat——
script_32_app_all.bat——部署所有内容，包括应用和lib包。
script_32_app_bank.bat——部署应用paycenter-bank
script_32_app_business.bat——部署应用paycenter-business
script_32_app_http.bat——部署应用paycenter-http
script_32_app_manager.bat——部署应用paycenter-manager
script_32_app_notify.bat——部署应用paycenter-notify
script_32_app_persistence.bat——部署应用paycenter-persistence
script_32_app_scheduledtasks.bat——部署应用paycenter-scheduletasks
script_32_app_service.bat——部署应用paycenter-service
script_32_app_ws.bat——部署应用paycenter-ws
script_32_cert.bat——部署证书bank-cert
script_32_lib_all.bat——部署bank和manager的lib包
script_32_lib_bank.bat——部署bank的lib包
script_32_lib_manager.bat部署manager的lib包

部署到服务器上以后，服务器的部署脚本路径为：/bestpayserver/*.sh
reload_cert.sh——重新解压银行证书
restart_app.sh——重启所有应用，重新解压lib包，重新解压证书
restart_bank.sh——重启paycenter-bank，包括解压lib包
restart_business.sh——重启paycenter-business
restart_manager.sh——重启paycenter-manager，包括解压lib包
restart_nginx.sh——重启nginx
restart_notify.sh——重启paycenter-notify
restart_persistence.sh——重启paycenter-persistence
restart_scheduledtasks.sh——重启paycenter-scheduledtasks
restart_service.sh——重启paycenter-service
restart_wap_jetty.sh——重启wap_jetty
restart_web_jetty.sh——重启web_jetty
restart_ws_jetty.sh——重启ws_jetty
stop_all.sh——停止所有应用。

步骤说明：

