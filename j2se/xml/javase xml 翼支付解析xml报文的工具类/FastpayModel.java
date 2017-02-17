package com.bestpay.paycenter.entry.http;

import lombok.Data;
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
 * Time: 上午10:00
 */
@Getter // 可以去掉
@Setter // 可以去掉
@ToString
@XmlAccessorType(XmlAccessType.FIELD) // 必须的，不然会报错，设置xml访问器模式
//@XmlAccessorType  定义映射这个类中的何种类型需要映射到XML。可接收四个参数，分别是：
//XmlAccessType.FIELD：映射这个类中的所有字段到XML
//XmlAccessType.PROPERTY：映射这个类中的属性（get/set方法）到XML
//XmlAccessType.PUBLIC_MEMBER：将这个类中的所有public的field或property同时映射到XML（默认）
//XmlAccessType.NONE：不映射
@XmlRootElement(name = "Fastpay")
public class FastpayModel {

    private MessageModel Message;


}
