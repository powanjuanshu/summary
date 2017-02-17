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
public class RespDataModel {
	@XmlElement(name="accountNo",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String accountNo;
	@XmlElement(name="transferType",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String transferType;
	@XmlElement(name="toAccountName",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String toAccountName;
	@XmlElement(name="toAccountNo",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String toAccountNo;
	@XmlElement(name="toBank",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String toBank;
	@XmlElement(name="toLocation",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String toLocation;
	@XmlElement(name="amount",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String amount;
	@XmlElement(name="checkNo",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String checkNo;
	@XmlElement(name="checkPassword",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String checkPassword;
	@XmlElement(name="note",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String note;
	@XmlElement(name="bankNo",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String bankNo;
	@XmlElement(name="isUrgent",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String isUrgent;
	@XmlElement(name="cellphone",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String cellphone;
	@XmlElement(name="perOrEnt",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String perOrEnt;
	@XmlElement(name="noteOther",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String noteOther;
	@XmlElement(name="transDateTime",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String transDateTime;
	@XmlElement(name="ClientPatchID",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String clientPatchID;
	@XmlElement(name="matchRule",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String matchRule;
	@XmlElement(name="respond1",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String respond1;
	@XmlElement(name="respond2",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String respond2;
	@XmlElement(name="respond3",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String respond3;
	@XmlElement(name="respond4",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String respond4;
	@XmlElement(name="respond5",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String respond5;
	
}
