package com.bestpay.paycenter.entry.http;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.xml.bind.annotation.*;

/**
 * User: Administrator
 * Date: 14-5-21
 * Time: 上午10:01
 */
@Getter
@Setter
@ToString
@XmlAccessorType(XmlAccessType.FIELD)
public class MessageModel {

    @XmlElement(name = "BRRNotify")
    private BRRNotifyModel BRRNotify;

    @XmlAttribute
    private String id;
}
