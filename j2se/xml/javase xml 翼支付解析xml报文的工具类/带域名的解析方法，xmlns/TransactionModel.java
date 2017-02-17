package com.jiexi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import jaxb.ModelAndXmlUtil;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="Transaction", namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
public class TransactionModel {
	@XmlElement(name="TransHead",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private TransHeadModel transHead;
	@XmlElement(name="TransContent",namespace="http://www.cebbank.com/wangshangyh/ebankToBiz")
	private TransContentModel transContent;
	
	
	
	
	
	
	
	public static void main(String[] args) throws Exception {
		String s = "<?xml version=\"1.0\" encoding=\"GBK\"?>\n" +
      "\n" +
      "<Transaction xmlns=\"http://www.cebbank.com/wangshangyh/ebankToBiz\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.cebbank.com/wangshangyh/ebankToBiz schema_v0.5.5.xsd\">\n" +
      "\t<SystemHead>\n" +
      "\t\t<Language>zh_CN</Language>\n" +
      "\t\t<Encodeing></Encodeing>\n" +
      "\t\t<Version></Version>\n" +
      "\t\t<ServiceName></ServiceName>\n" +
      "\t\t<CifNo>2006413533</CifNo>\n" +
      "\t\t<UserId>0006</UserId>\n" +
      "\t\t<SyMacFlag></SyMacFlag>\n" +
      "\t\t<MAC></MAC>\n" +
      "\t\t<SyPinFlag></SyPinFlag>\n" +
      "\t\t<PinSeed></PinSeed>\n" +
      "\t\t<LicenseId></LicenseId>\n" +
      "\t\t<Flag></Flag>\n" +
      "\t\t<Note></Note>\n" +
      "\t</SystemHead>\n" +
      "\n" +
      "<TransHead>\n" +
      "\t<TransCode>b2e004001</TransCode>\n" +
      "\t<BatchID>B2E000022608380</BatchID>\n" +
      "\t<JnlDate>2014-08-12</JnlDate>\n" +
      "\t<JnlTime>2014-08-12 11:42:47.861</JnlTime>\n" +
      "\t<response1></response1>\n" +
      "\t<response2></response2>\n" +
      "\t<response3></response3>\n" +
      "</TransHead>\n" +
      "<TransContent>\n" +
      "\t\t<ReturnCode>0000</ReturnCode>\n" +
      "\t\t<ReturnMsg>本次交易成功！</ReturnMsg>\n" +
      "\t\t<ReturnNote></ReturnNote>\n" +
      "\t\t<RespData>\n" +
      "\t\t  \t<accountNo>75010188000060608</accountNo>\n" +
      "\t\t\t<transferType>2120</transferType>\n" +
      "\t\t\t<toAccountName>乔张奇</toAccountName>\n" +
      "\t\t\t<toAccountNo>6226090215442845</toAccountNo>\n" +
      "\t\t\t<toBank>招商银行股份有限公司</toBank>\n" +
      "\t\t\t<toLocation></toLocation>\n" +
      "\t\t\t<amount>1</amount>\n" +
      "\t\t\t<checkNo></checkNo>\n" +
      "\t\t\t<checkPassword></checkPassword>\n" +
      "\t\t\t<note>差旅费</note>\n" +
      "\t\t\t<bankNo>308584000013</bankNo>\n" +
      "\t\t\t<isUrgent>1</isUrgent>\n" +
      "\t\t\t<cellphone>18017347992</cellphone>\n" +
      "\t\t\t<perOrEnt>1</perOrEnt>\n" +
      "\t\t\t<noteOther>测试用途</noteOther>\n" +
      "\t\t\t<transDateTime>2014-08-12T11:42:48</transDateTime>\n" +
      "\t\t\t<ClientPatchID>110485564520061259000000330006</ClientPatchID>\n" +
      "\t\t\t\n" +
      "\t\t\t<matchRule>1</matchRule>\n" +
      "\t\t\t<respond1></respond1>\n" +
      "\t\t\t<respond2></respond2>\n" +
      "\t\t\t<respond3></respond3>\n" +
      "\t\t\t<respond4></respond4>\n" +
      "\t\t\t<respond5></respond5>\n" +
      "\t  \t</RespData>\n" +
      "</TransContent>\n" +
      "</Transaction>";
		
		TransactionModel ap1 = ModelAndXmlUtil.xml2Model(s, TransactionModel.class);
		System.out.println(ap1.getTransContent());
	}
}
