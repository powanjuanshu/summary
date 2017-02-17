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
 *  2013年8月27日 Created by 谢超
 */
package com.bestpay.fund.service.impl.ccb.epay;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 外联平台连接辅助类
 * @author 谢超 创建于 2013年8月27日
 */
public class OutConnUtil {
    private static final Logger logger = LoggerFactory.getLogger(OutConnUtil.class);

    /**
     * @param host 外联平台地址
     * @param port 外联平台端口
     * @param timeout 外联平台超时时限
     * @return 外联平台连接对象
     */
    public static SocketUtil openConnection(String host, int port, String timeout) {
        logger.info("连接建行外联平台中...");
        logger.info("外联平台 host: {}", host);
        logger.info("外联平台 port: {}", port);
        logger.info("外联平台 timeout: {}", timeout);
        SocketUtil socketUtil = null;
        socketUtil = new SocketUtil(host, port, timeout);// 连接外联平台
        if (socketUtil.isSuccess()) {
            logger.info("连接建行外联平台成功!");
        } else {
            logger.error("连接建行外联平台失败!");
            return null;
        }
        return socketUtil;
    }
}