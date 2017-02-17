package jaxb;

import javax.xml.bind.JAXBException;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@XmlAccessorType(XmlAccessType.FIELD) // 必须的，不然会报错，设置xml访问器模式
@XmlRootElement(name = "Resp")
public class CcbFastResponseDTO {
	@XmlElement(name = "TrxCode")
	private String trxCode;
	@XmlElement(name = "TrxDate")
	private String trxDate;
	@XmlElement(name = "TrxTime")
	private String trxTime;
	@XmlElement(name = "TraceNo")
	private String traceNo;
	@XmlElement(name = "CardNo")
	private String cardNo;
	@XmlElement(name = "OrderNo")
	private String orderNo;
	@XmlElement(name = "TxAmount")
	private String txAmount;
	@XmlElement(name = "RetCode")
	private String retCode;
	@XmlElement(name = "Merchant")
	private String merchant;
	@XmlElement(name = "MerchantNo")
	private String merchantNo;
	@XmlElement(name = "TermId")
	private String termId;
	@XmlElement(name = "TrxcurType")
	private String trxcurType;
	@XmlElement(name = "OrgTraceNo")
	private String orgTraceNo;
	@XmlElement(name = "OrgOrderNo")
	private String orgOrderNo;
	@XmlElement(name = "OrgRetCode")
	private String orgRetCode;
	@XmlElement(name = "Message")
	private String message;

	public static void main(String[] args) throws JAXBException {
		String s = "<Resp>"+
	"<TrxCode>1200</TrxCode>"+
	"<TrxDate>20140613</TrxDate>"+
	"<TraceNo>846112729</TraceNo>"+
	"<CardNo>6227003376210033803</CardNo>"+
	"<OrderNo>CM12014061300000033</OrderNo>"+
	"<TxAmount>2</TxAmount>"+
	"<RetCode>00</RetCode>"+
	"<Merchant></Merchant>"+
	"<TermId>1052900701103440003</TermId>"+
	"</Resp>";
		CcbFastResponseDTO ap1 = ModelAndXmlUtil.xml2Model(s,CcbFastResponseDTO.class);
      System.out.println(ap1.getMerchantNo()); // 没有此项为null，由此项没数据库为空字符串
      System.out.println(ap1);
	}
}
