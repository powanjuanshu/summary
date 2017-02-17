package com.bestpay.paycenter.entry.http;

import com.google.common.base.Preconditions;
import lombok.extern.slf4j.Slf4j;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

/**
 * desc: XmlAndModel 转换 Util
 * User: liangyandong
 * Date: 14-5-15
 * Time: 上午9:28
 */
@Slf4j
public class ModelAndXmlUtil {

    public static final String UTF8 = "UTF-8";

    private static <M> JAXBContext getJaxContent(Class<M> clazz) throws JAXBException {
        return JAXBContext.newInstance(clazz);
    }

    private static <M> Marshaller getMarshaller(M model) throws JAXBException {
        Preconditions.checkNotNull(model,"the model not be null");
        log.info("parse model:{}", model);
        JAXBContext jaxbContext = getJaxContent(model.getClass());
        return jaxbContext.createMarshaller();
    }

    /**
     * 输出XML报文
     */
    private static <M> String writerXml(M model,Marshaller marshaller) throws JAXBException, IOException {
        StringWriter writer = null;
        String result;
        try{
            writer = new StringWriter();
            marshaller.marshal(model, writer);
            result = writer.toString();
        }finally {
            if(null!=writer)writer.close();
        }
        log.info("writerXml result:{}", result);
        return result;
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @return          无格式,编码为UTF8,带标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2Xml(M model) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, UTF8, true);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param hasHead   true有标准头,false无标准头
     * @return         无格式,编码为UTF8,由hasHead来指定是否有标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByHead(M model,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, UTF8, hasHead);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param format    true格式化,false无格式
     * @return         由hasHead来指定是否格式化,编码为UTF8,标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormat(M model,boolean format) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, UTF8, true);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param encoding  指定编码
     * @return         无格式,编码由encoding指定,标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByEncoding(M model,String encoding) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, encoding, true);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param format    true格式化,false无格式
     * @param hasHead   true有标准头,false无标准头
     * @return         由format来指定是否格式化,编码UTF8,由hasHead来指定是否格式化标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormatAndHead(M model,boolean format,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, UTF8, hasHead);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param encoding  指定编码
     * @param hasHead   true有标准头,false无标准头
     * @return         无格式化,编码由encoding指定,由hasHead来指定是否格式化标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByEncodingAndHead(M model,String encoding,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, encoding, hasHead);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param format   true格式化,false无格式化
     * @param encoding  指定编码
     * @return         由format来指定是否格式化,编码由encoding指定,标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormatAndEncoding(M model,boolean format,String encoding) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, encoding, false);
    }

    /**
     * 对象转换成XML
     * @param model     转换Model
     * @param <M>       Model类型
     * @param format   true格式化,false无格式化
     * @param encoding  指定编码
     * @param hasHead   true有标准头,false无标准头
     * @return         由format来指定是否格式化,编码由encoding指定,由hasHead来指定是否格式化标准XML头
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByCondition(M model, boolean format, String encoding, boolean hasHead) throws JAXBException, IOException {
        Marshaller marshaller =  getMarshaller(model);
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,format);
        marshaller.setProperty(Marshaller.JAXB_ENCODING,encoding);
        marshaller.setProperty(Marshaller.JAXB_FRAGMENT,!hasHead);
        return writerXml(model,marshaller);
    }


    /**
     * xml转对象
     * @param xml       转换的Xml
     * @param claszz    Model类型
     * @param <M>       类型
     * @return          Model
     * @throws javax.xml.bind.JAXBException
     */
    public static <M> M xml2Model(String xml,Class<M> claszz) throws JAXBException {
        JAXBContext jaxbContext = getJaxContent(claszz);
        Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
        Object object = unmarshaller.unmarshal(new StringReader(xml));
        log.debug("xml2Model model:{}",object);
        return (M)object;
    }

}
