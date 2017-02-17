package com.bestpay.paycenter.gateway.business.biz;

import org.apache.commons.lang.ArrayUtils;

import com.solab.iso8583.util.ConvertUtil;

public class DesThreeJack {
    /* 初始置换表IP */
    public static int[] IP_Table = { 57,49,41,33,25,17,9,1,
            59,51,43,35,27,19,11,3,
            61,53,45,37,29,21,13,5,
            63,55,47,39,31,23,15,7,
            56,48,40,32,24,16,8,0,
            58,50,42,34,26,18,10,2,
            60,52,44,36,28,20,12,4,
            62,54,46,38,30,22,14,6};

    /* 逆初始置换表IP^-1 */
    public static int[] IP_1_Table = {39,7,47,15,55,23,63,31,
            38,6,46,14,54,22,62,30,
            37,5,45,13,53,21,61,29,
            36,4,44,12,52,20,60,28,
            35,3,43,11,51,19,59,27,
            34,2,42,10,50,18,58,26,
            33,1,41,9,49,17,57,25,
            32,0,40,8,48,16,56,24};

    /* 置换选择1 */
    public static int[] PC_1 = {56,48,40,32,24,16,8,
            0,57,49,41,33,25,17,
            9,1,58,50,42,34,26,
            18,10,2,59,51,43,35,
            62,54,46,38,30,22,14,
            6,61,53,45,37,29,21,
            13,5,60,52,44,36,28,
            20,12,4,27,19,11,3};

    /* 置换选择2 */
    public static int[] PC_2 = {13,16,10,23,0,4,2,27,
            14,5,20,9,22,18,11,3,
            25,7,15,6,26,19,12,1,
            40,51,30,36,46,54,29,39,
            50,44,32,47,43,48,38,55,
            33,52,45,41,49,35,28,31};

    /* 扩充置换表E */
    public static int[] E_Table = {31, 0, 1, 2, 3, 4,
            3, 4, 5, 6, 7, 8,
            7, 8,9,10,11,12,
            11,12,13,14,15,16,
            15,16,17,18,19,20,
            19,20,21,22,23,24,
            23,24,25,26,27,28,
            27,28,29,30,31, 0};

    /* 置换函数P */
    public static int[] P_Table = {15,6,19,20,28,11,27,16,
            0,14,22,25,4,17,30,9,
            1,7,23,13,31,26,2,8,
            18,12,29,5,21,10,3,24};

    /* S盒 */
    public static int[][][] S =/* S1 */
            {{{14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7},
                    {0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8},
                    {4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0},
                    {15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13}},
	/* S2 */
                    {{15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10},
                            {3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5},
                            {0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15},
                            {13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9}},
	/* S3 */
                    {{10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8},
                            {13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1},
                            {13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7},
                            {1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12}},
	/* S4 */
                    {{7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15},
                            {13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9},
                            {10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4},
                            {3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14}},
	/* S5 */
                    {{2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9},
                            {14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6},
                            {4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14},
                            {11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3}},
	/* S6 */
                    {{12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11},
                            {10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8},
                            {9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6},
                            {4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13}},
	/* S7 */
                    {{4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1},
                            {13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6},
                            {1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2},
                            {6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12}},
	/* S8 */
                    {{13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7},
                            {1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2},
                            {7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8},
                            {2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11}}};

    /* 对左移次数的规定 */
    public static int[] MOVE_TIMES = {1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};

    public static void main(String[] args) throws Exception {
        String data = "武萍"; /* 参加MAC的数据	*/
        String macKey = "a6F739b0"; /* MAC运算的密钥	*/
        /***des加密***/
        System.out.println("【加密数据：】"+data);
        System.out.println("【加密密钥：】"+macKey);
        String encrypt = DES_Encrypt(data, macKey);
        System.out.println("【加密结果：】"+encrypt);
        byte[] enc = ConvertUtil.hexStringToBytes(encrypt);

        /***des解密***/
        String decrypt = DES_Decrypt(enc, macKey);
        System.out.println("【解密数据：】"+enc);
        System.out.println("【解密密钥：】"+macKey);
        System.out.println("【解密结果：】"+decrypt);
    }

    /* 解密文件 */
    public static String DES_Decrypt (byte[] cipherFile, String keyStr) throws Exception {
        int nLen = cipherFile.length;
        int macLen=0;
        int count=0;
        byte[] tmp = new byte[1];
        int tmpLen=0;
        byte[] keyStrByte = keyStr.getBytes("GBK");
        byte[] tmpChar = new byte[618];
        byte[] plainBlock = new byte[8];
        byte[] cipherBlock = new byte[8];
        byte[] keyBlock = new byte[8];
        byte[] bKey = new byte[64];
        byte[][] subKeys = new byte[16][48];
		/* 设置密钥 */
        for (int i = 0; i < 8;i++) {
            keyBlock[i] = keyStrByte[i];
        }
		/* 将密钥转换为二进制流 */
        Char8ToBit64(keyBlock, bKey);
		/* 生成子密钥 */
        DES_MakeSubKeys(bKey, subKeys);
        macLen = nLen;
        count = macLen %8;
        /**密文长度一定是8的倍数**/
        for (int i = 0;i < macLen / 8;i++) {
            cipherBlock = new byte[8];
            for (int j=0;j<8;j++) {
                cipherBlock[j] = cipherFile[j+8*i];
            }
            plainBlock = new byte[8]; // 必须要初始化
            DES_DecryptBlock(cipherBlock, subKeys, plainBlock);
            for (int ii=0;ii<8;ii++) {
                tmpChar[8*i+ii] = plainBlock[ii];
            }
        }
        tmp[0] = tmpChar[macLen-1];
        tmpLen = Integer.valueOf(new String(tmp));
        byte[] plainFile = new byte[nLen];
        for (int i=0;i<macLen-tmpLen;i++) {
            plainFile[i] = tmpChar[i];
        }
        String data = new String(plainFile,"GBK");
        return data.trim();
    }

    /* 解密单个分组 */
    public static void DES_DecryptBlock (byte[] cipherBlock, byte[][] subKeys, byte[] plainBlock) {
        byte[] cipherBits = new byte[64];
        byte[] copyRight = new byte[48];
        Char8ToBit64(cipherBlock, cipherBits);
		/* 初始置换（IP置换） */
        DES_IP_Transform(cipherBits);
		/* 16轮迭代 */
        for(int cnt = 15; cnt >= 0; cnt--){
            for (int i =0;i<32;i++) {
                copyRight[i] = cipherBits[32+i];
            }
			/* 将右半部分进行扩展置换，从32位扩展到48位 */
            DES_E_Transform(copyRight);
			/* 将右半部分与子密钥进行异或操作 */
            DES_XOR(copyRight,subKeys[cnt],48);
			/* 异或结果进入S盒，输出32位结果 */
            DES_SBOX(copyRight);
			/* P置换 */
            DES_P_Transform(copyRight);
			/* 将明文左半部分与右半部分进行异或 */
            DES_XOR(cipherBits,copyRight,32);
            if (cnt != 0) {
				/* 最终完成左右部的交换 */
                DES_Swap(cipherBits);
            }
        }
		/* 逆初始置换（IP^1置换） */
        DES_IP_1_Transform(cipherBits);
        Bit64ToChar8(cipherBits,plainBlock);
    }

    /* 加密文件 */
    public static String DES_Encrypt(String plainFile, String keyStr) throws Exception {
        byte[] cipherFile = new byte[1024];
        byte[] plainFileByte = plainFile.getBytes("GBK");
        byte[] keyBlock = keyStr.getBytes("GBK");
        byte[] bKey = new byte[64];
        byte[][] subKeys = new byte[16][48];
        int i = 0;
        byte[] plainBlock = new byte[8];
        byte[] cipherBlock = new byte[8];
		/* 将密钥转换为二进制流 */
        Char8ToBit64(keyBlock, bKey);
		/* 生成子密钥 */
        DES_MakeSubKeys(bKey, subKeys);
        int maclen = plainFile.getBytes("GBK").length;
        int count = maclen % 8;
        for (i=0; i < maclen / 8; i++) {
            for (int j = 0; j < 8; j++) {
                plainBlock[j] = plainFileByte[j+i*8];
            }
            cipherBlock = new byte[8]; // 必须要初始化
            DES_EncryptBlock(plainBlock, subKeys, cipherBlock);
            for (int ii=0; ii<8;ii++) {
                cipherFile[i*8+ii]=cipherBlock[ii];
            }
        }
        plainBlock = new byte[8];
        for (int ii = 0;ii<count;ii++) {
            plainBlock[ii] = plainFileByte[plainFileByte.length-count+ii];
        }
        for (int ii = 0;ii<7-count;ii++) {
            plainBlock[ii+count]='0';
        }
        plainBlock[7] = (byte) String.valueOf((8 - count)).charAt(0);
        cipherBlock = new byte[8]; // 必须要初始化
        DES_EncryptBlock(plainBlock, subKeys, cipherBlock);
        for (int ii = 0;ii<8;ii++) {
            cipherFile[ii+i*8]= cipherBlock[ii];
        }
        byte[] aa = ArrayUtils.subarray(cipherFile, 0, ArrayUtils.indexOf(cipherFile, (byte)0x00));
        return ConvertUtil.bytesToHexString(aa);
    }

    /* 加密单个分组 */
    public static void DES_EncryptBlock (byte[] plainBlock, byte[][] subKeys, byte[] cipherBlock) {
        byte[] plainBits = new byte[64];
        byte[] copyRight = new byte[48];
        Char8ToBit64(plainBlock, plainBits);
        DES_IP_Transform(plainBits);
        for (int cnt = 0; cnt < 16; cnt++) {
            for (int i = 0; i < 32; i++) {
                copyRight[i] = plainBits[32+i];
            }
			/* 将右半部分进行扩展置换，从32位扩展到48位 */
            DES_E_Transform(copyRight);
			/* 将右半部分与子密钥进行异或操作 */
            DES_XOR(copyRight, subKeys[cnt], 48);
			/* 异或结果进入S盒，输出32位结果 */
            DES_SBOX(copyRight);
			/* P置换 */
            DES_P_Transform(copyRight);
			/* 将明文左半部分与右半部分进行异或 */
            DES_XOR(plainBits, copyRight, 32);
            if (cnt != 15) {
				/* 最终完成左右部的交换 */
                DES_Swap(plainBits);
            }
        }
		/* 逆初始置换（IP^1置换） */
        DES_IP_1_Transform(plainBits);
        Bit64ToChar8(plainBits, cipherBlock);
    }

    /* 将二进制位串转为长度为8的字符串 */
    public static void Bit64ToChar8 (byte[] bit, byte[] ch) {
        for (int cnt = 0;cnt<8;cnt++) {
            byte[] temp = ArrayUtils.subarray(bit, cnt*8, 8+cnt*8);
            BitToByte(temp, ch, cnt);
        }
    }

    /* 二进制转换成字节 */
    public static void BitToByte (byte[] temp, byte[] ch, int count) {
        for (int cnt=0;cnt<8;cnt++) {
            ch[count] |= temp[cnt]<<cnt;
        }
    }

    /* IP逆置换 */
    public static void DES_IP_1_Transform (byte[] data) {
        byte[] temp = new byte[64];
        for (int cnt = 0;cnt<64;cnt++) {
            temp[cnt] = data[IP_1_Table[cnt]];
        }
        for (int i=0;i<64;i++) {
            data[i] = temp[i];
        }
    }

    /* 交换 */
    public static void DES_Swap (byte[] plainBits) {
        byte[] temp = new byte[32];
        for (int i = 0;i<32;i++) {
            temp[i] =  plainBits[i];
        }
        for (int i = 0;i<32;i++) {
            plainBits[i] = plainBits[32+i];
            plainBits[32+i] = temp[i];
        }
    }

    /* P置换 */
    public static void DES_P_Transform (byte[] data) {
        byte[] temp = new byte[32];
        for (int cnt = 0; cnt< 32;cnt++) {
            temp[cnt] = data[P_Table[cnt]];
        }
        for (int i = 0; i< 32;i++) {
            data[i] = temp[i];
        }
    }

    /* S盒置换 */
    public static void DES_SBOX (byte[] data) {
        int line;
        int row;
        int output;
        int cur1;
        int cur2;
        for (int cnt = 0; cnt < 8;cnt++) {
            cur1 = cnt*6;
            cur2 = cnt<<2;
			/* 计算在S盒中的行与列 */
            line = (data[cur1]<<1) + data[cur1+5];
            row = (data[cur1+1]<<3) + (data[cur1+2]<<2) + (data[cur1+3]<<1) +data[cur1+4];
            output = S[cnt][line][row];
			/* 化为2进制 */
            data[cur2] = (byte) ((output&0X08)>>3);
            data[cur2+1] = (byte) ((output&0X04)>>2);
            data[cur2+2] = (byte) ((output&0X02)>>1);
            data[cur2+3] = (byte) (output&0x01);
        }
    }

    /* 异或 */
    public static void DES_XOR (byte[] R, byte[] L, int count) {
        for (int cnt = 0; cnt < count; cnt++) {
            R[cnt] ^= L[cnt];
        }
    }

    /* 扩展置换 */
    public static void DES_E_Transform (byte[] data) {
        byte[] temp = new byte[48];
        for (int cnt = 0; cnt < 48; cnt++) {
            temp[cnt] = data[E_Table[cnt]];
        }
        for (int i = 0; i < 48; i++) {
            data[i] = temp[i];
        }
    }

    /* IP置换 */
    public static void DES_IP_Transform (byte[] data) {
        byte[] temp = new byte[64];
        for (int cnt = 0; cnt < 64; cnt++) {
            temp[cnt] = data[IP_Table[cnt]];
        }
        for (int i = 0;i < 64; i++) {
            data[i] = temp[i];
        }
    }

    /* 生成子密钥 */
    public static void DES_MakeSubKeys (byte[] key, byte[][] subKeys) {
        byte[] temp = new byte[56];
        DES_PC1_Transform(key, temp); /* PC1置换 */
        for (int cnt = 0; cnt < 16; cnt++) { /* 16轮跌代，产生16个子密钥 */
            DES_ROL(temp, MOVE_TIMES[cnt]); /* 循环左移 */
            DES_PC2_Transform(temp, subKeys[cnt]); /* PC2置换，产生子密钥 */
        }
    }

    /* 密钥置换2 */
    public static void DES_PC2_Transform (byte[] key, byte[] tempbts) {
        for (int cnt = 0;cnt < 48;cnt++) {
            tempbts[cnt] = key[PC_2[cnt]];
        }
    }

    /* 循环左移 */
    public static void DES_ROL (byte[] data, int time) {
        byte[] temp = new byte[56];
        if (time == 1) {
            temp[0] = data[0];
        } else if (time == 2) {
            temp[0] = data[0];
            temp[1] = data[1];
        }
        if (time == 1) {
            temp[1] = data[28];
        } else if (time == 2) {
            temp[2] = data[28];
            temp[3] = data[29];
        }
        if (time == 1) {
            for (int i=0;i<27;i++) {
                data[i] = data[i+1];
            }
        } else if (time == 2) {
            for (int i=0;i<26;i++) {
                data[i] = data[i+2];
            }
        }
        if (time == 1) {
            data[27] = temp[0];
        } else if (time == 2) {
            data[26] = temp[0];
            data[27] = temp[1];
        }
        if (time == 1) {
            for (int i = 28; i < 55; i++) {
                data[i] = data[i+1];
            }
        } else if (time == 2) {
            for (int i = 28; i < 54; i++) {
                data[i] = data[i+2];
            }
        }
        if (time == 1) {
            data[55] = temp[1];
        } else if (time == 2) {
            data[54] = temp[2];
            data[55] = temp[3];
        }
    }

    /* 密钥置换1 */
    public static void DES_PC1_Transform (byte[] key, byte[] tempbts) {
        for (int cnt = 0; cnt < 56; cnt++) {
            tempbts[cnt] = key[PC_1[cnt]];
        }
    }

    /* 将长度为8的字符串转为二进制位串 */
    public static void Char8ToBit64 (byte[] keyBlock, byte[] bKey) {
        for (int cnt = 0; cnt < 8; cnt++) {
            ByteToBit(keyBlock[cnt], bKey, cnt);
        }
    }
    /* 字节转换成二进制 */
    public static void ByteToBit (byte ch, byte[] bKey, int count) {
        for (int cnt = 0; cnt < 8; cnt++) {
            bKey[cnt+count*8] = (byte) ((ch >> cnt)&1);
        }
    }
}
