/*
 *  Copyright 2003, China Union Pay Co., Ltd.  All right reserved.
 *
 *  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CHINA UNION PAY CO.,
 *  LTD.  THE CONTENTS OF THIS FILE MAY NOT BE DISCLOSED TO THIRD
 *  PARTIES, COPIED OR DUPLICATED IN ANY FORM, IN WHOLE OR IN PART,
 *  WITHOUT THE PRIOR WRITTEN PERMISSION OF CHINA UNION PAY CO., LTD
 *
 *  Module Name:  $Id:$
 *
 *  Edit History:
 *
 *  2013年8月26日 Created by 谢超
 */
package com.bestpay.fund.service.impl.ccb.epay;

import java.io.UnsupportedEncodingException;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bestpay.fund.service.impl.ccb.epay.response.RespDownLoadFileMsg;
import com.bestpay.fund.service.impl.ccb.epay.response.RespQueryDownLoadFileMsg;

/**
 * 对账文件下载类
 * @author 谢超 创建于 2013年8月26日
 */
public class DownLoadFileUtil {
    private static final Logger logger = LoggerFactory.getLogger(DownLoadFileUtil.class);
    private final static String host = "127.0.0.1";// 外联平台ip
    private final static String timeout = "200000"; // 外联平台timeout
    private final static int port = 10086;// 外联平台port
    private final String trade_date = "20130901";// 对账文件日期
    private final String filePath = "C:\\Users\\Administrator\\Desktop\\DL\\CCB_EBSClient_B2C4FileCertV2.2Build20120818\\download\\";// 对账文件存放位置
    private static String fileName = StringUtils.EMPTY;// 对账文件类型名称
    private final String fileStyle = ".txt";// 对账文件类型
    private final static String merchant_id = "105290073990630";// 商户号
    private final String gzFileStyle = ".02.success.txt.gz";// 压缩文件类型
    private final String upGzFileStyle = ".02.success.txt";// 解压缩文件类型
    private final String charsetEncoding = "GBK";// 字符编码
    private String requestSeq = StringUtils.EMPTY;// 请求序列号
    private final String user_id = "57410748-0-087";// 操作员号
    private final String password = "1234567";// 操作员密码
    private final String tx_code_query = "5W1005";// 查询下载交易码
    private final String tx_code_download = "6W0111";// 下载交易码
    private final String pos_code = "798102370";// 柜台号

    /**
     * 对账文件下载
     * @author Administrator
     */
    public void downLoadFile() {
        logger.info("调用对账文件下载接口");
        logger.info("下载对账文件日期：{}", trade_date);

        // 获得对应商户对账文件名称
        fileName = "SHOP." + merchant_id + ".";
        requestSeq = "000000111";// SeqDaoImpl.getCcbEpaySeq()
        SocketUtil socketQueryUtil = OutConnUtil.openConnection(host, port, timeout);
        if (socketQueryUtil == null) {
            logger.error("发送查询对账文件请求连接建行外联平台失败! {}");
            return;
        }
        // 生成请求xml报文
        StringBuilder reqQueryXml = new StringBuilder();
        reqQueryXml.append("<?xml version=\"1.0\" encoding=\"GB2312\" standalone=\"yes\" ?>").append("<TX>");
        reqQueryXml.append("<REQUEST_SN>").append(requestSeq).append("</REQUEST_SN>");
        reqQueryXml.append("<CUST_ID>").append(merchant_id).append("</CUST_ID>");
        reqQueryXml.append("<USER_ID>").append(user_id).append("</USER_ID>");
        reqQueryXml.append("<PASSWORD>").append(password).append("</PASSWORD>");
        reqQueryXml.append("<TX_CODE>").append(tx_code_query).append("</TX_CODE>");
        reqQueryXml.append("<LANGUAGE>").append("CN").append("</LANGUAGE>");
        reqQueryXml.append("<TX_INFO>").append("<DATE>").append(trade_date).append("</DATE>");;
        reqQueryXml.append("<KIND>").append("1").append("</KIND>");
        reqQueryXml.append("<FILETYPE>").append("1").append("</FILETYPE>");
        reqQueryXml.append("<TYPE>").append("0").append("</TYPE>");
        reqQueryXml.append("<NORDERBY>").append("2").append("</NORDERBY>");
        reqQueryXml.append("<POS_CODE>").append(pos_code).append("</POS_CODE>");
        reqQueryXml.append("<ORDER>").append("").append("</ORDER>");
        reqQueryXml.append("<STATUS>").append("1").append("</STATUS>");
        reqQueryXml.append("</TX_INFO>").append("</TX>");
        String reqQuery = reqQueryXml.toString();
        logger.error("查询对账文件请求报文：{}\n", reqQuery);
        byte[] sendxml;
        sendxml = reqQuery.getBytes();
        socketQueryUtil.sndData(sendxml);
        byte[] respxml = socketQueryUtil.rcvData();
        String xmlrevi = "";
        RespQueryDownLoadFileMsg downloadResp = null;
        String downFileName = StringUtils.EMPTY;// 待下载对账文件名
        try {
            xmlrevi = new String(respxml, charsetEncoding);
            downloadResp = new RespQueryDownLoadFileMsg().fromXML(xmlrevi);
            if (downloadResp == null) {
                return;
            }
            downFileName = downloadResp.getInfo().getFILE_NAME();
            logger.info("查询对账文件响应报文：{}\n", xmlrevi);
            logger.info("返回码：{}", downloadResp.getRETURN_CODE());
            logger.info("返回信息：{}", downloadResp.getRETURN_MSG());
            logger.info("返回文件名：{}", downFileName);
        } catch (UnsupportedEncodingException e) {
            logger.error("请求编码异常! {}", e);
        }
        SocketUtil socketDownLoadUtil = OutConnUtil.openConnection(host, port, timeout);
        if (socketDownLoadUtil == null) {
            logger.info("发送下载对账文件请求连接建行外联平台失败! {}");
        }
        // 生成请求xml报文
        StringBuilder downLoadXml = new StringBuilder();
        downLoadXml.append("<?xml version=\"1.0\" encoding=\"GB2312\" standalone=\"yes\" ?>").append("<TX>");
        downLoadXml.append("<REQUEST_SN>").append(requestSeq).append("</REQUEST_SN>");
        downLoadXml.append("<CUST_ID>").append(merchant_id).append("</CUST_ID>");
        downLoadXml.append("<USER_ID>").append(user_id).append("</USER_ID>");
        downLoadXml.append("<PASSWORD>").append(password).append("</PASSWORD>");
        downLoadXml.append("<TX_CODE>").append(tx_code_download).append("</TX_CODE>");
        downLoadXml.append("<LANGUAGE>").append("CN").append("</LANGUAGE>");
        downLoadXml.append("<TX_INFO>").append("<SOURCE>").append(downFileName).append("</SOURCE>");;
        downLoadXml.append("<FILEPATH>").append("merchant/shls").append("</FILEPATH>");
        downLoadXml.append("<LOCAL_REMOTE>").append("0").append("</LOCAL_REMOTE>");
        downLoadXml.append("</TX_INFO>").append("</TX>");
        String reqDownLoad = downLoadXml.toString();
        logger.info("下载对账文件请求报文：{}\n", reqDownLoad);
        byte[] sendDownLoadxml;
        sendDownLoadxml = reqDownLoad.getBytes();
        socketDownLoadUtil.sndData(sendDownLoadxml);
        byte[] respDownLoadxml = socketDownLoadUtil.rcvData();
        String xmlDownLoadrevi = "";
        String resRecodeCode = "";// 下载响应码
        try {
            xmlDownLoadrevi = new String(respDownLoadxml, charsetEncoding);
            RespDownLoadFileMsg downloadFileResp = new RespDownLoadFileMsg().fromXML(xmlDownLoadrevi);
            if (downloadFileResp == null) {
                return;
            }
            resRecodeCode = downloadFileResp.getRETURN_CODE();
            logger.info("下载对账文件响应报文：{}\n", xmlDownLoadrevi);
            logger.info("返回码：{}", downloadFileResp.getRETURN_CODE());
            logger.info("返回信息：{}", downloadFileResp.getRETURN_MSG());
        } catch (UnsupportedEncodingException e) {
            logger.error("请求编码异常! {}", e);
        }
        if ("000000".equals(resRecodeCode)) {
            // 对账文件下载成功
            logger.info("对账文件下载成功!");
            // 解压缩对账文件
            String upGzFile = filePath + fileName + trade_date + gzFileStyle;
            GzFileUtil.upGzFile(upGzFile);
            // 转换对账文件格式
            String sourceFilePath = filePath + fileName + trade_date + upGzFileStyle;
            String targetFilePath = filePath + trade_date + fileStyle;
            CovertFileFormatUtil.covert(sourceFilePath, targetFilePath);
        } else {
            logger.info("对账文件下载超时失败,文件不完整,请重新下载!");
        }

    }

    public static void main(String[] args) {
        new DownLoadFileUtil().downLoadFile();
    }
}
