package com.bestpay.paycenter.entry.http;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-5-21
 * Time: 上午10:54
 * To change this template use File | Settings | File Templates.
 */
public class Main {
    public static void main(String[] args) throws Exception {
        String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<Fastpay>\n" +
                "    <Message id=\"8621405190135379644\">\n" +
                "        <BRRNotify id=\"BRRNotify\">\n" +
                "            <instId>1210</instId>\n" +
                "            <serialNo>8621405190135379644</serialNo>\n" +
                "            <date>20140519 17:56:01</date>\n" +
                "            <fileName>1210_FSP_BRRF_20140519_140519631001050289.txt</fileName>\n" +
                "            <digest>22F49y9RP66A9Vjs2c/WZU5div0=</digest>\n" +
                "            <orginalSerialNo>140519631001050289</orginalSerialNo>\n" +
                "            <originalDate>20140519 17:51:44</originalDate>\n" +
                "            <Extension/>\n" +
                "        </BRRNotify>\n" +
                "        <Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">\n" +
                "            <SignedInfo>\n" +
                "                <CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>\n" +
                "                <SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>\n" +
                "                <Reference URI=\"#BRRNotify\">\n" +
                "                    <Transforms>\n" +
                "                        <Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/>\n" +
                "                    </Transforms>\n" +
                "                    <DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>\n" +
                "                    <DigestValue>jEXcjcr5w/G3HeECxcjBjuK3DFA=</DigestValue>\n" +
                "                </Reference>\n" +
                "            </SignedInfo>\n" +
                "            <SignatureValue>Dx2mNvkvH1JBKU+BzV+DS3RqXcj+/+WfeRC/QqBbmOOGeegytACttdLdtuzIOex/lLOiQXZiWXjQ\n" +
                "                iw0muRBLb+yvT7xBT+JRjhLoXuZwfSqzdE+n3KHKqTrL10ciEzb7xK33eyFL83NIs8jr679HH2xp\n" +
                "                cBPGUspWxPBeN9XQnMA=\n" +
                "            </SignatureValue>\n" +
                "        </Signature>\n" +
                "    </Message>\n" +
                "</Fastpay>\n";

        FastpayModel ap1 = ModelAndXmlUtil.xml2Model(xml,FastpayModel.class);
        System.out.println(ap1.getMessage().getBRRNotify().getDigest());
        System.out.println(ap1);

        FastpayModel f = new FastpayModel();
        MessageModel m = new MessageModel();
        BRRNotifyModel b = new BRRNotifyModel();
        b.setDate("aaa1");
        b.setDigest("aaa1");
        b.setExtension("aaa1");
        b.setFileName("aaa1");
        b.setInstId("aaa1");
        b.setOrginalSerialNo("aaa1");
        b.setOriginalDate("aaa1");
        b.setSerialNo("aaa1");
        m.setBRRNotify(b);
        m.setId("ccc");
        b.setId("bbb");
        f.setMessage(m);
        String reqXml = ModelAndXmlUtil.model2XmlByHead(f,false);
        System.out.println(reqXml);
    }
}
