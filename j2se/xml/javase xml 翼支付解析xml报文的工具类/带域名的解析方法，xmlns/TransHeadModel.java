package com.jiexi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(namespace="aaa")
public class TransHeadModel {
	@XmlElement(name="TransCode",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String transCode;
	@XmlElement(name="BatchID",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String batchID;
	@XmlElement(name="JnlDate",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String jnlDate;
	@XmlElement(name="JnlTime",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String jnlTime;
	@XmlElement(name="response1",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String response1;
	@XmlElement(name="response2",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String response2;
	@XmlElement(name="response3",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String response3;
}
