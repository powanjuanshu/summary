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
public class TransContentModel {
	@XmlElement(name="ReturnCode",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String returnCode;
	@XmlElement(name="ReturnMsg",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String returnMsg;
	@XmlElement(name="ReturnNote",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private String returnNote;
	@XmlElement(name="RespData",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private RespDataModel respData;
	
}
