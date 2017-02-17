package com.bestpay.paycenter.entry.http;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.xml.bind.annotation.*;
import java.io.Serializable;

/**
 * desc: 请求报文头
 * User: liangyandong
 * Date: 14-5-8
 * Time: 上午11:06
 */
@ToString
@Setter
@Getter
@XmlAccessorType(XmlAccessType.FIELD)
//@XmlType(propOrder = {"seqno","orgno","time","date","transcode"}) 排序
public class Head implements Serializable {

//    @XmlAttribute(required = true)        属性
//    private String sss;
//    @XmlAttribute
//    private int ccc;

    /**交易报文代码**/
    private String transcode;
    /**交易日期**/
    private String date;
    /**交易时间**/
    private String time;
    /**机构名称**/
    private String orgno;
    /**交易流水号**/
    private String seqno;

}
