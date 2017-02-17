package com.bestpay.fund.service.impl.ccb.epay;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

public class SocketUtil {

    private static Logger log = Logger.getLogger(SocketUtil.class);

    private Socket s;
    private OutputStream serverOutput = null;
    private InputStream serverInput = null;
    private final String host;
    private int port = -1;
    private String timeout = null;
    private boolean isSuccess = true;

    /**
     * 构造方法完成初始化
     * @param host,port,timeout
     */
    public SocketUtil(String host, int port, String timeOut) {

        this.host = host;
        this.port = port;
        this.timeout = timeOut;
        openConnection();
    }

    /**
     * 打开连接的输入输出流
     * @return boolean
     */
    public boolean openConnection() {

        try {
            // 连接telnet服务器
            s = new Socket(host, port);

            if (timeout != null && !timeout.equals("")) {
                s.setSoTimeout(Integer.parseInt(timeout));
            } else {
                s.setSoTimeout(3 * 1000);// 3秒
            }
            System.out.println("SocketClient:---------->" + host + ":" + port + " Socket连接成功");
            serverOutput = s.getOutputStream();
            serverInput = s.getInputStream();
        } catch (Exception e) {
            isSuccess = false;
            System.out.println("SocketClient:Exception when openConnection()-" + e);
            this.closeConnection();
            return false;
        }
        return true;
    }

    /**
     * 关闭连接的输入输出流
     * @author mick.ge
     */
    public void closeConnection() {

        try {
            // 关闭输出
            if (serverOutput != null) {
                serverOutput.close();
            }
        } catch (Exception e) {
            log.error("SocketClient:Exception when closeConnection()-" + e);
        }

        try {
            // 关闭输入
            if (serverInput != null) {
                serverInput.close();
            }
        } catch (Exception e) {
            log.error("SocketClient:Exception when closeConnection()-" + e);
        }

        try {
            if (s != null) {
                s.close();// 关闭socket
            }
        } catch (Exception e) {
            log.error("SocketClient:Exception when closeConnection()-" + e);
        }

        log.debug("SocketClient:---------->" + host + ":" + port + " Socket连接关闭");
    }

    /**
     * 发送数据
     * @param sndStr
     * @return boolean
     */
    public boolean sndData(byte[] sndByte) {

        try {
            log.debug("从SOCKET发送出去的消息,字节数组长度:" + sndByte.length);
            serverOutput.write(sndByte);
            serverOutput.flush();
            log.debug("SOCKET消息发送成功...");
            return true;
        } catch (SocketTimeoutException ste) {
            log.debug("SocketClient:SocketTimeout when sndData()-" + ste);
            closeConnection();
            return false;
        } catch (Exception e) {
            log.debug("SocketClient:Exception when sndData()-" + e);
            closeConnection();
            return false;
        }

    }

    /**
     * 接收数据
     * @param lenSize
     * @return 数据字符串
     */
    public byte[] rcvData() {
        log.debug("客户端开始接收数据==========");
        String readLine = null;
        byte[] lenBuffer = null;

        try {
            int len = 0;
            int num = serverInput.read();
            log.debug("service read num======" + num);
            List ls = new ArrayList();
            while (num != -1) {
                ls.add(num);
                num = serverInput.read();
            }
            len = ls.size();
            lenBuffer = new byte[len];
            for (int i = 0; i < len; i++) {
                int a = (Integer) ls.get(i);
                byte c = (byte) a;
                lenBuffer[i] = c;
            }

            // 生成字符串对象,写入日志
            readLine = new String(lenBuffer); // ,InitServer.CHARSET
            log.debug("从SOCKET收消息时,字节数组长度:" + lenBuffer.length);
            log.debug("字符长度为：" + readLine.length());
            log.debug("SOCKET消息接收成功...");
        } catch (SocketTimeoutException ste) {
            lenBuffer = null;
            log.error("SocketClient:SocketTimeout when rcvData()-" + ste);
        } catch (Exception ex) {
            lenBuffer = null;
            log.error("SocketClient:Exception when rcvData()-" + ex);
        }
        /*
         * finally { this.closeConnection(); }
         */
        return lenBuffer;
    }

    /**
     * @return the isSuccess
     */
    public boolean isSuccess() {
        return isSuccess;
    }
}
