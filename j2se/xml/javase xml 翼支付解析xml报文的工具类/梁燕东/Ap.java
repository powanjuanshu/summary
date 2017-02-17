package com.bestpay.paycenter.entry.http;

import com.bestpay.paycenter.commons.util.DateUtil;
import com.thoughtworks.xstream.XStream;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import javax.xml.bind.JAXBException;
import javax.xml.bind.annotation.*;
import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * desc: 请求报文(头+体) 农行借记卡
 * User: liangyandong
 * Date: 14-5-8
 * Time: 上午11:06
 */
@Slf4j
@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
public class Ap implements Serializable {

//    private Head head;
//
//    private Body body;
//
//
//    public Ap(){}
//
//    public Ap(Head head,Body body){
//        this.head = head;
//        this.body = body;
//    }
//
//
//    public static void main(String[] args) throws IOException, JAXBException {
//        Head head1 = new Head();
//        head1.setDate(DateUtil.getCurrent(DateUtil.datePattern));
//        head1.setTime(DateUtil.getCurrent(DateUtil.timePattern));
//        head1.setOrgno("NYYH");
//        head1.setSeqno(DateUtil.getCurrent());
//        head1.setTranscode(TransCode.JG0101.name());
//
//        Body body1 = new Body();
//        body1.setAccno("22222222222");
//        body1.setAmt("1000.00");
//        body1.setCardname("翼支付");
//        body1.setCardno("1111111111111");
//
//        Ap ap = new Ap(head1,body1);
//
//        AbcUtil abcUtil = new AbcUtil();
//        String reqXml = ModelAndXmlUtil.model2XmlByHead(ap,false);
//        log.debug("请求报文:{}",reqXml);
//        byte[] reqData = abcUtil.getReqData(reqXml);
//        String respXml = new String(reqData);
//        log.debug("完整请求报文 (16):{}\r\n(String):{}",reqData,respXml);
//        respXml = respXml.substring(4,respXml.length());
//        Ap ap1 = ModelAndXmlUtil.xml2Model(respXml,Ap.class);
//        log.debug("ap1:{}",ap1);
//    }

}
