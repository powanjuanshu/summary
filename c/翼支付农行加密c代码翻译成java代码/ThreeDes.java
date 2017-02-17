package threedes;

import org.apache.axis.utils.ArrayUtil;
import org.apache.commons.lang.ArrayUtils;

public class ThreeDes {
	public static void main(String[] args) {
		byte[] e_str = new byte[4096+1]; /* 参加MAC的数据	*/
		byte[] Flag = new byte[1+1]; /* 加解密标志	*/
		byte[] mackey = new byte[64+1]; /* MAC运算的密钥	*/
		int maclen = 0; /* 参加MAC的数据长度	*/
		byte[] d_str = new byte[4096+1]; /* DES MAC运算结果	*/
		byte[] yh_str = new byte[4096+1]; /* DES MAC运算结果	*/
		byte[] base64_str = new byte[4096+1]; /* base64编码值	*/
		int ret_len = 0;
		byte[] szTemp = new byte[4096+1];
		int len1;
		int len2;
		int len3;
		int len4;
		int len5;
		String abc1;
		String abc2;
		String abc3;
		
		Flag[0] = 'D'; /*加解密标志D加密，E解密*/
//		Flag[1] = '\0'; // ?可不可不写
		
		String data = "737854912058894282"; /*源字符串*/
		char[] datachar = data.toCharArray();
		for (int i=0; i<datachar.length;i++) {
			byte dat = (byte) datachar[i];
			e_str[i] = dat;
		}
		
		String key = "a6F739b0"; /*密钥*/
		char[] keychar = key.toCharArray();
		for (int i=0; i<keychar.length;i++) {
			byte dat = (byte) datachar[i];
			mackey[i]=dat;
		}
		
		maclen = data.length();
		
		/***des加密***/
		
		DES_Encrypt(e_str, mackey, d_str);
		
		
	}
	
	public static int DES_Encrypt(byte[] e_str, byte[] mackey, byte[] d_str) {
		int count = 0;
		int maclen = 0;
		int realen = 0;
		int i = 0;
		byte[] plainBlock = new byte[8+1]; 
		byte[] cipherBlock = new byte[8+1];
		byte[] keyBlock = new byte[8+1];
		byte[] bKey = new byte[64+1];
		byte[][] subKeys = new byte[16][48];
		
		/* 设置密钥 */
		for (int t=0;t<8;t++) {
			keyBlock[t] = mackey[t];
		}
		
		/* 将密钥转换为二进制流 */
		Char8ToBit64(keyBlock, bKey);
		
		/* 生成子密钥 */
		DES_MakeSubKeys(bKey,subKeys);
		
		
		
		
		return 0;
	}
	/* 生成子密钥 */
	public static int DES_MakeSubKeys(byte[] bKey, byte[][] subKeys) {
		byte[] temp = new byte[56+1];
		int cnt;
		
		
		return 0;
	}
	/* 密钥置换1 */
	public static int DES_PC1_Transform(byte[] key,byte[] tempbts) {
		
		return 0;
	}
	
	
	public static int Char8ToBit64(byte[] ch, byte[] bit) {
		int cnt;
		for (cnt = 0; cnt < 8; cnt++) {
			byte[] bytearray = new byte[8];
			int cnt2;
			for (cnt2 = 0;cnt2 <8;cnt2++) {
				bytearray [cnt] = (byte) (((ch[cnt] >> cnt2))&1);
			}
			for (int i = 0;i<8;i++) {
				bit[cnt*8+i] = bytearray[i];
			}
		}
		
		return 0;
	}
	
	/* 字节转换成二进制 */
	public static int ByteToBit(byte ch, byte[] bit) {
		
		return 0;
	}
	
}
