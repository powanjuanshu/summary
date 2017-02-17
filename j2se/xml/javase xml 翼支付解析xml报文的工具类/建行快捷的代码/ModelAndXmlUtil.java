package jaxb;

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
 * desc: XmlAndModel ת�� Util
 * User: liangyandong
 * Date: 14-5-15
 * Time: ����9:28
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
     * ���XML����
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
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @return          �޸�ʽ,����ΪUTF8,����׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2Xml(M model) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, UTF8, true);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param hasHead   true�б�׼ͷ,false�ޱ�׼ͷ
     * @return         �޸�ʽ,����ΪUTF8,��hasHead��ָ���Ƿ��б�׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByHead(M model,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, UTF8, hasHead);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param format    true��ʽ��,false�޸�ʽ
     * @return         ��hasHead��ָ���Ƿ��ʽ��,����ΪUTF8,��׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormat(M model,boolean format) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, UTF8, true);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param encoding  ָ������
     * @return         �޸�ʽ,������encodingָ��,��׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByEncoding(M model,String encoding) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, encoding, true);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param format    true��ʽ��,false�޸�ʽ
     * @param hasHead   true�б�׼ͷ,false�ޱ�׼ͷ
     * @return         ��format��ָ���Ƿ��ʽ��,����UTF8,��hasHead��ָ���Ƿ��ʽ����׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormatAndHead(M model,boolean format,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, UTF8, hasHead);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param encoding  ָ������
     * @param hasHead   true�б�׼ͷ,false�ޱ�׼ͷ
     * @return         �޸�ʽ��,������encodingָ��,��hasHead��ָ���Ƿ��ʽ����׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByEncodingAndHead(M model,String encoding,boolean hasHead) throws JAXBException, IOException {
        return model2XmlByCondition(model, false, encoding, hasHead);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param format   true��ʽ��,false�޸�ʽ��
     * @param encoding  ָ������
     * @return         ��format��ָ���Ƿ��ʽ��,������encodingָ��,��׼XMLͷ
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.IOException
     */
    public static <M> String model2XmlByFormatAndEncoding(M model,boolean format,String encoding) throws JAXBException, IOException {
        return model2XmlByCondition(model, format, encoding, false);
    }

    /**
     * ����ת����XML
     * @param model     ת��Model
     * @param <M>       Model����
     * @param format   true��ʽ��,false�޸�ʽ��
     * @param encoding  ָ������
     * @param hasHead   true�б�׼ͷ,false�ޱ�׼ͷ
     * @return         ��format��ָ���Ƿ��ʽ��,������encodingָ��,��hasHead��ָ���Ƿ��ʽ����׼XMLͷ
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
     * xmlת����
     * @param xml       ת����Xml
     * @param claszz    Model����
     * @param <M>       ����
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
