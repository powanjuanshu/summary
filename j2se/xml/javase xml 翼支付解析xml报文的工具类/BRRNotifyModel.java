package com.bestpay.paycenter.entry.http;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * User: Administrator
 * Date: 14-5-21
 * Time: 上午10:02
 */
@Getter
@Setter
@ToString
@XmlAccessorType(XmlAccessType.FIELD)
public class BRRNotifyModel {
    private String instId;
    private String serialNo;
    private String date;
    private String fileName;
    private String digest;
    private String orginalSerialNo;
    private String originalDate;
    private String Extension;

    @XmlAttribute
    private String id;
}
