#include "jni.h"
#include <stdio.h>
#include "HelloJNI.h"


#define PLAIN_FILE_OPEN_ERROR -1
#define KEY_FILE_OPEN_ERROR -2
#define CIPHER_FILE_OPEN_ERROR -3
#define OK 1;
typedef char ElemType;

       /* ��ʼ�û���IP */
int IP_Table[64] = { 57,49,41,33,25,17,9,1,
                                 59,51,43,35,27,19,11,3,
                                 61,53,45,37,29,21,13,5,
                                 63,55,47,39,31,23,15,7,
                                 56,48,40,32,24,16,8,0,
                                 58,50,42,34,26,18,10,2,
                                 60,52,44,36,28,20,12,4,
                                 62,54,46,38,30,22,14,6};
/* ���ʼ�û���IP^-1 */
int IP_1_Table[64] = {39,7,47,15,55,23,63,31,
           38,6,46,14,54,22,62,30,
           37,5,45,13,53,21,61,29,
           36,4,44,12,52,20,60,28,
           35,3,43,11,51,19,59,27,
           34,2,42,10,50,18,58,26,
           33,1,41,9,49,17,57,25,
           32,0,40,8,48,16,56,24};

/* �����û���E */
int E_Table[48] = {31, 0, 1, 2, 3, 4,
                  3, 4, 5, 6, 7, 8,
                  7, 8,9,10,11,12,
                  11,12,13,14,15,16,
                  15,16,17,18,19,20,
                  19,20,21,22,23,24,
                  23,24,25,26,27,28,
                  27,28,29,30,31, 0};

/* �û�����P */
int P_Table[32] = {15,6,19,20,28,11,27,16,
                  0,14,22,25,4,17,30,9,
                  1,7,23,13,31,26,2,8,
                  18,12,29,5,21,10,3,24};

/* S�� */
int S[8][4][16] =/* S1 */
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
/* �û�ѡ��1 */
int PC_1[56] = {56,48,40,32,24,16,8,
              0,57,49,41,33,25,17,
              9,1,58,50,42,34,26,
              18,10,2,59,51,43,35,
              62,54,46,38,30,22,14,
              6,61,53,45,37,29,21,
              13,5,60,52,44,36,28,
              20,12,4,27,19,11,3};

/* �û�ѡ��2 */
int PC_2[48] = {13,16,10,23,0,4,2,27,
              14,5,20,9,22,18,11,3,
              25,7,15,6,26,19,12,1,
              40,51,30,36,46,54,29,39,
              50,44,32,47,43,48,38,55,
              33,52,45,41,49,35,28,31};
/*122�е�46������47*/              

/* �����ƴ����Ĺ涨 */
int MOVE_TIMES[16] = {1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};

int ByteToBit(ElemType ch,ElemType bit[8+1]);
int BitToByte(ElemType bit[8+1],ElemType *ch);
int Char8ToBit64(ElemType ch[8+1],ElemType bit[64+1]);
int Bit64ToChar8(ElemType bit[64+1],ElemType ch[8+1]);
int DES_MakeSubKeys(ElemType key[64+1],ElemType subKeys[16][48]);
int DES_PC1_Transform(ElemType key[64+1], ElemType tempbts[56+1]);
int DES_PC2_Transform(ElemType key[56+1], ElemType tempbts[48+1]);
int DES_ROL(ElemType data[56+1], int time);
int DES_IP_Transform(ElemType data[64+1]);
int DES_IP_1_Transform(ElemType data[64+1]);
int DES_E_Transform(ElemType data[48+1]);
int DES_P_Transform(ElemType data[32+1]);
int DES_SBOX(ElemType data[48+1]);
int DES_XOR(ElemType R[48+1], ElemType L[48+1],int count);
int DES_Swap(ElemType left[32+1],ElemType right[32+1]);
int DES_EncryptBlock(ElemType plainBlock[8+1], ElemType subKeys[16][48], ElemType cipherBlock[8+1]);
int DES_DecryptBlock(ElemType cipherBlock[8+1], ElemType subKeys[16][48], ElemType plainBlock[8+1]);
int DES_Encrypt(char *plainFile, char *keyStr,char *cipherFile);
int DES_Decrypt(char *cipherFile, char *keyStr,char *plainFile,int nLen);
int base64Encode( unsigned char *dst, int *dlen, unsigned char *src, int slen );
int base64Decode( unsigned char *dst, int *dlen, unsigned char *src, int slen);
void Hex2Str(char *sSrc, char *sDest, int nSrcLen);

JNIEXPORT jstring JNICALL Java_HelloJNI_hello
  (JNIEnv *env, jobject aa, jstring jdata, jstring jkey, jstring jresult)
{
	printf("hello,world\n");
	char *data = (*env)->GetStringUTFChars(env,jdata,0); // ����ʹ��GetStringUTFChars()����������bb(jstring����)ת����ΪUTF-8�ĸ�ʽ, ���ܹ��ڱ��ط�����ʹ����.
	char *key = (*env)->GetStringUTFChars(env,jkey,0); // ����ʹ��GetStringUTFChars()����������cc(jstring����)ת����ΪUTF-8�ĸ�ʽ, ���ܹ��ڱ��ط�����ʹ����.
	char *result = (*env)->GetStringUTFChars(env,jresult,0); // ����ʹ��GetStringUTFChars()����������dd(jstring����)ת����ΪUTF-8�ĸ�ʽ, ���ܹ��ڱ��ط�����ʹ����.

	printf("data:[%s]\n", data);
	printf("key:[%s]\n", key);
	printf("result:[%s]\n", result);
	
	char e_str[4096+1]; /* �μ�MAC������ */
	char mackey[64+1]; /* MAC�������Կ	*/
	char d_str[4096+1]; /* DES MAC������ */

	memset(&e_str, 0, sizeof(e_str)); // ���������ڴ�ռ�,�൱������
	memset(&mackey, 0, sizeof(mackey)); // ���������ڴ�ռ�,�൱������
	memset(&d_str, 0, sizeof(d_str)); // ���������ڴ�ռ�,�൱������

	strcpy(e_str, data); // ��data�����ַ������Ƶ�e_str�����ַ�����
	strcpy(mackey, key); // ��key�����ַ������Ƶ�mackey�����ַ�����

	printf("e_str:[%s]\n", e_str); // ��ӡ�����ַ���
	printf("mackey:[%s]\n", mackey); // ��ӡ�����ַ���

	/***des����***/
	DES_Encrypt(e_str, mackey, d_str);

	(*env)->ReleaseStringUTFChars(env, jdata, data); // ע��:��ʹ��������ת��֮��Ķ���֮��,��Ҫ��ʾ����ReleaseStringUTFChars����,��JVM�ͷ�ת����UTF-8��string�Ķ���Ŀռ�,�������ʾ�ĵ��õĻ�,JVM�л�һֱ����ö���,���ᱻ��������������,��˾ͻᵼ���ڴ����
	(*env)->ReleaseStringUTFChars(env, jkey, key); // ע��:��ʹ��������ת��֮��Ķ���֮��,��Ҫ��ʾ����ReleaseStringUTFChars����,��JVM�ͷ�ת����UTF-8��string�Ķ���Ŀռ�,�������ʾ�ĵ��õĻ�,JVM�л�һֱ����ö���,���ᱻ��������������,��˾ͻᵼ���ڴ����

	printf("d_str:[%s]\n", d_str); // ��ӡ�����ַ���

	printf("����ʮ������:\n");
	int i;  
	for(i=0;i<24;i++)
	{
	  	printf("pppppp:%02x ",d_str[i]);
	}
	
	//char* tmpstr = "retrun string succeeded";
	//jstring rtstr = (*env)->NewStringUTF(env, tmpstr);

	//int a = 0xffaa;
	//char buff[20];
	//sprintf(buff, "0x%x", a); // ��a��ʮ�����Ʒ�ʽ��ʽ����buff��
	//printf("ttttt:[%s]\n", buff); // ��ӡ�����ַ���
	
	/**
	��char�ַ���ת����ʮ�����Ƶ��ַ���,
	һ��char�ַ�ת����ʮ�����ƺ���Ҫ2���ַ����洢.
	����:a��ascii��ֵ��97,ת����ʮ��������61.A��ascii��65.
	*/
	char xxx[24];
	sprintf(xxx+0, "%02X", (unsigned char)d_str[0]); // ��d_str[0]��ʮ�����Ʒ�ʽ��ʽ����xxx��,��ͬ��xxx[0]��xxx[1]��,������ͬ
	sprintf(xxx+2, "%02x", (unsigned char)d_str[1]);
	sprintf(xxx+4, "%02x", (unsigned char)d_str[2]);
	sprintf(xxx+6, "%02x", (unsigned char)d_str[3]);
	sprintf(xxx+8, "%02x", (unsigned char)d_str[4]);
	sprintf(xxx+10, "%02x", (unsigned char)d_str[5]);
	sprintf(xxx+12, "%02x", (unsigned char)d_str[6]);
	sprintf(xxx+14, "%02x", (unsigned char)d_str[7]);
	sprintf(xxx+16, "%02x", (unsigned char)d_str[8]);
	sprintf(xxx+18, "%02x", (unsigned char)d_str[9]);
	sprintf(xxx+20, "%02x", (unsigned char)d_str[10]);
	sprintf(xxx+22, "%02x", (unsigned char)d_str[11]);
	sprintf(xxx+24, "%02x", (unsigned char)d_str[12]);
	sprintf(xxx+26, "%02x", (unsigned char)d_str[13]);
	sprintf(xxx+28, "%02x", (unsigned char)d_str[14]);
	sprintf(xxx+30, "%02x", (unsigned char)d_str[15]);
	sprintf(xxx+32, "%02x", (unsigned char)d_str[16]);
	sprintf(xxx+34, "%02x", (unsigned char)d_str[17]);
	sprintf(xxx+36, "%02x", (unsigned char)d_str[18]);
	sprintf(xxx+38, "%02x", (unsigned char)d_str[19]);
	sprintf(xxx+40, "%02x", (unsigned char)d_str[20]);
	sprintf(xxx+42, "%02x", (unsigned char)d_str[21]);
	sprintf(xxx+44, "%02x", (unsigned char)d_str[22]);
	sprintf(xxx+46, "%02x", (unsigned char)d_str[23]);
	jstring yyy = (*env)->NewStringUTF(env, xxx);
	jresult = yyy;
	return yyy;
}


/* �ֽ�ת���ɶ����� */
int ByteToBit(ElemType ch, ElemType bit[8+1]){
    int cnt;
    for(cnt = 0;cnt < 8; cnt++){
        *(bit+cnt) = (ch>>cnt)&1;
    }
    return 0;
}

/* ������ת�����ֽ� */
int BitToByte(ElemType bit[8+1],ElemType *ch){
    int cnt;
    for(cnt = 0;cnt < 8; cnt++){
        *ch |= *(bit + cnt)<<cnt;
    }
    return 0;
}

/* ������Ϊ8���ַ���תΪ������λ�� */
int Char8ToBit64(ElemType ch[8+1],ElemType bit[64+1]){
    int cnt;
   /* printf("in Char8ToBit64: ch=[%s]\n",ch);*/
    for(cnt = 0; cnt < 8; cnt++){       
        ByteToBit(*(ch+cnt),bit+(cnt<<3));
       /* printf("in Char8ToBit64: cnt=[%d]bit=[%c]\n",cnt,bit);*/
    }
    return 0;
}

/* ��������λ��תΪ����Ϊ8���ַ��� */
int Bit64ToChar8(ElemType bit[64+1],ElemType ch[8+1]){
    int cnt;
    memset(ch,0,8);
    for(cnt = 0; cnt < 8; cnt++){
        BitToByte(bit+(cnt<<3),ch+cnt);
    }
    return 0;
}

/* ��������Կ */
int DES_MakeSubKeys(ElemType key[64+1],ElemType subKeys[16][48]){
    ElemType temp[56+1];
    int cnt;
    DES_PC1_Transform(key,temp);/* PC1�û� */
    for(cnt = 0; cnt < 16; cnt++){/* 16�ֵ���������16������Կ */
        DES_ROL(temp,MOVE_TIMES[cnt]);/* ѭ������ */
        DES_PC2_Transform(temp,subKeys[cnt]);/* PC2�û�����������Կ */
    }
    return 0;
}

/* ��Կ�û�1 */
int DES_PC1_Transform(ElemType key[64+1], ElemType tempbts[56+1]){
    int cnt;   
    for(cnt = 0; cnt < 56; cnt++){
        tempbts[cnt] = key[PC_1[cnt]];
    }
    return 0;
}

/* ��Կ�û�2 */
int DES_PC2_Transform(ElemType key[56+1], ElemType tempbts[48+1]){
    int cnt;
    for(cnt = 0; cnt < 48; cnt++){
        tempbts[cnt] = key[PC_2[cnt]];
    }
    return 0;
}

/* ѭ������ */
int DES_ROL(ElemType data[56+1], int time){   
    ElemType temp[56+1];

    /* ���潫Ҫѭ���ƶ����ұߵ�λ */
    memcpy(temp,data,time);
    memcpy(temp+time,data+28,time);
   
    /* ǰ28λ�ƶ� */
    memcpy(data,data+time,28-time);
    memcpy(data+28-time,temp,time);

    /* ��28λ�ƶ� */
    memcpy(data+28,data+28+time,28-time);
    memcpy(data+56-time,temp+time,time);   

    return 0;
}

/* IP�û� */
int DES_IP_Transform(ElemType data[64+1]){
    int cnt;
    ElemType temp[64+1];
    for(cnt = 0; cnt < 64; cnt++){
        temp[cnt] = data[IP_Table[cnt]];
    }
    memcpy(data,temp,64);/*printf("IP�û�:data=len[%d][%s]\n",strlen(data),data);*/
    return 0;
}

/* IP���û� */
int DES_IP_1_Transform(ElemType data[64+1]){
    int cnt;
    ElemType temp[64+1];
    for(cnt = 0; cnt < 64; cnt++){
        temp[cnt] = data[IP_1_Table[cnt]];
    }
    memcpy(data,temp,64);
    return 0;
}

/* ��չ�û� */
int DES_E_Transform(ElemType data[48+1]){
    int cnt;
    ElemType temp[48+1];
    for(cnt = 0; cnt < 48; cnt++){
        temp[cnt] = data[E_Table[cnt]];
    }   
    memcpy(data,temp,48);
    return 0;
}

/* P�û� */
int DES_P_Transform(ElemType data[32+1]){
    int cnt;
    ElemType temp[32+1];
    for(cnt = 0; cnt < 32; cnt++){
        temp[cnt] = data[P_Table[cnt]];
    }   
    memcpy(data,temp,32);
    return 0;
}

/* ��� */
int DES_XOR(ElemType R[48+1], ElemType L[48+1] ,int count){
    int cnt;
    for(cnt = 0; cnt < count; cnt++){
        R[cnt] ^= L[cnt];
    }
    return 0;
}

/* S���û� */
int DES_SBOX(ElemType data[48+1]){
    int cnt;
    int line,row,output;
    int cur1,cur2;
    for(cnt = 0; cnt < 8; cnt++){
        cur1 = cnt*6;
        cur2 = cnt<<2;
       
        /* ������S���е������� */
        line = (data[cur1]<<1) + data[cur1+5];
        row = (data[cur1+1]<<3) + (data[cur1+2]<<2)
            + (data[cur1+3]<<1) + data[cur1+4];
        output = S[cnt][line][row];

        /* ��Ϊ2���� */
        data[cur2] = (output&0X08)>>3;
        data[cur2+1] = (output&0X04)>>2;
        data[cur2+2] = (output&0X02)>>1;
        data[cur2+3] = output&0x01;
    }   
    return 0;
}

/* ���� */
int DES_Swap(ElemType left[32+1], ElemType right[32+1]){
    ElemType temp[32+1];
    memcpy(temp,left,32);   
    memcpy(left,right,32);   
    memcpy(right,temp,32);
    return 0;
}

/* ���ܵ������� */
int DES_EncryptBlock(ElemType plainBlock[8+1], ElemType subKeys[16][48], ElemType cipherBlock[8+1]){
    ElemType plainBits[64+1];/*ly*/
    ElemType copyRight[48+1];/*ly*/
    int cnt;

    memset(&plainBits, 0, sizeof(plainBits)); 
    Char8ToBit64(plainBlock,plainBits); /*printf("+in ���ܵ�������plainBlock=[%s],plainBits=len[%d][%s]\n",plainBlock, strlen(plainBits),plainBits);    */  
    /* ��ʼ�û���IP�û��� */
    DES_IP_Transform(plainBits);printf("��ʼ�û���plainBits=len[%d][%s]\n",strlen(plainBits),plainBits);

    /* 16�ֵ��� */
    for(cnt = 0; cnt < 16; cnt++){       
        memcpy(copyRight,plainBits+32,32);
        /* ���Ұ벿�ֽ�����չ�û�����32λ��չ��48λ */
        DES_E_Transform(copyRight);
        /* ���Ұ벿��������Կ���������� */
        DES_XOR(copyRight,subKeys[cnt],48);   
        /* ���������S�У����32λ��� */
        DES_SBOX(copyRight);
        /* P�û� */
        DES_P_Transform(copyRight);
        /* ��������벿�����Ұ벿�ֽ������ */
        DES_XOR(plainBits,copyRight,32);
        if(cnt != 15){
            /* ����������Ҳ��Ľ��� */
            DES_Swap(plainBits,plainBits+32);
        }
    }
    /* ���ʼ�û���IP^1�û��� */
    DES_IP_1_Transform(plainBits);
    Bit64ToChar8(plainBits,cipherBlock);
    return 0;
}

/* ���ܵ������� */
int DES_DecryptBlock(ElemType cipherBlock[8+1], ElemType subKeys[16][48],ElemType plainBlock[8+1]){
    ElemType cipherBits[64+1];
    ElemType copyRight[48+1];
    int cnt;

    Char8ToBit64(cipherBlock,cipherBits);       
    /* ��ʼ�û���IP�û��� */
    DES_IP_Transform(cipherBits);
   
    /* 16�ֵ��� */
    for(cnt = 15; cnt >= 0; cnt--){       
        memcpy(copyRight,cipherBits+32,32);
        /* ���Ұ벿�ֽ�����չ�û�����32λ��չ��48λ */
        DES_E_Transform(copyRight);
        /* ���Ұ벿��������Կ���������� */
        DES_XOR(copyRight,subKeys[cnt],48);       
        /* ���������S�У����32λ��� */
        DES_SBOX(copyRight);
        /* P�û� */
        DES_P_Transform(copyRight);       
        /* ��������벿�����Ұ벿�ֽ������ */
        DES_XOR(cipherBits,copyRight,32);
        if(cnt != 0){
            /* ����������Ҳ��Ľ��� */
            DES_Swap(cipherBits,cipherBits+32);
        }
    }
    /* ���ʼ�û���IP^1�û��� */
    DES_IP_1_Transform(cipherBits);
    Bit64ToChar8(cipherBits,plainBlock);
    return 0;
}

/* �����ļ� */
int DES_Encrypt(char *plainFile, char *keyStr,char *cipherFile){
    //FILE *plain,*cipher;
    int count=0;
    int maclen=0;
    int realen=0;
    int i=0;
    ElemType plainBlock[8+1],cipherBlock[8+1],keyBlock[8+1];
    ElemType bKey[64+1];
    ElemType subKeys[16][48];
    
   /* printf("+DES_Encrypt:plainFile[%s],keyStr[%s],cipherFile=[%s]\n",plainFile,keyStr,cipherFile); */ 
    
    /* ������Կ */
    memcpy(keyBlock,keyStr,8);/*printf("+��ԿkeyBlock=[%s]\n",keyBlock); */
    /* ����Կת��Ϊ�������� */
    Char8ToBit64(keyBlock,bKey); /*printf("+����Կת��Ϊ��������bKey[%s]\n",bKey); */ 
    /* ��������Կ */
    DES_MakeSubKeys(bKey,subKeys);/*printf("+��������ԿsubKeys[%s]\n",subKeys); */
   
   maclen=strlen(plainFile);/*printf("+plainFile=[%s]\n",plainFile);*/
   count = maclen % 8;
/*	if (count != 0)
		{
		memset(plainFile+maclen,0x00,8-count);
		realen = maclen + 8-count;
		
		
		}
	else
	realen = maclen ;
  */ 
      
   printf("keyBlock[%s],keyStr[%s]\n",keyBlock,keyStr);   
   printf("bKey[%s],subKeys[%s]\n",bKey,subKeys);   
   printf("count[%d],maclen[%d]\n",count,maclen);   
   
   for (i = 0;i<maclen / 8;i++)
   {
   	memset(&plainBlock,0,sizeof(plainBlock));
   	memcpy(plainBlock,plainFile+8*i,8); /*printf("+i=[%d],plainBlock=[%s]\n",i,plainBlock);*/
   	DES_EncryptBlock(plainBlock,subKeys,cipherBlock);/*printf("+i=[%d],cipherBlock=len[%d][%s]\n",i,strlen(cipherBlock),cipherBlock);*/
   	
   	/*strncat(cipherFile,cipherBlock,8);�˴�������*/
   	memcpy(cipherFile+8*i,cipherBlock,8);
   	printf("i=[%d],cipherFile=len[%d][%s]\n",i,strlen(cipherFile),cipherFile);   
   }
   memset(&plainBlock,0,sizeof(plainBlock));/****0317**/
   memcpy(plainBlock,plainFile+8*i,count);

   //memset(plainBlock + count,'\0',7 - count);
   memset(plainBlock + count,'0',7 - count);
   
         	printf("plainBlock=[%s],plainFile[%s]\n",plainBlock,plainFile);   

   
        /* ���һ���ַ�����������һ���ַ����ڵ��������ַ����� */
        //plainBlock[7] = 8 - count;
   sprintf(plainBlock+7,"%1d",8 - count);
   
         	printf("plainBlock=[%s],plainFile[%s]\n",plainBlock,plainFile);   

   DES_EncryptBlock(plainBlock,subKeys,cipherBlock);
         	printf("subKeys=[%s],cipherBlock[%s]\n",subKeys,cipherBlock);   


   	/*strncat(cipherFile,cipherBlock,8);�˴�������*/
   	
   	memcpy(cipherFile+8*i,cipherBlock,8);
   
      	printf("i=[%d],cipherFile[%s]\n",i,cipherFile);   

   
   
return OK;
}

/* �����ļ� */
int DES_Decrypt(char *cipherFile, char *keyStr,char *plainFile,int nLen){
//    FILE *plain, *cipher;
    int i = 0;
    int count=0;
    int maclen=0;
    int realen=0;
    char tmp[1+1];
    int tmplen;
    char tmpchar[4096+1];

    //long fileLen;
    ElemType plainBlock[8+1],cipherBlock[8+1],keyBlock[8+1];
    ElemType bKey[64];
    ElemType subKeys[16][48];


    /* ������Կ */
    memcpy(keyBlock,keyStr,8);
    /* ����Կת��Ϊ�������� */
    Char8ToBit64(keyBlock,bKey);
    /* ��������Կ */
    DES_MakeSubKeys(bKey,subKeys);

    
   /*maclen=strlen(cipherFile);������*/
   maclen=nLen;printf("maclen=[%d]\n",maclen);
   count = maclen % 8;
/*	if (count != 0)
		{
		memset(plainFile+maclen,0x00,8-count);
		realen = maclen + 8-count;
		
		
		}
	else
	realen = maclen ;
  */ 
      /**���ĳ���һ����8�ı���**/
   memset(&tmpchar,0,sizeof(tmpchar));
   for (i = 0;i<maclen / 8;i++)
   {
   	memset(&cipherBlock,0,sizeof(cipherBlock));
   	memcpy(cipherBlock,cipherFile+8*i,8);
   	DES_DecryptBlock(cipherBlock,subKeys,plainBlock);  
  /* 	strncat(tmpchar,plainBlock,8);*/
   memcpy(tmpchar+8*i,plainBlock,8);
   }
    
   memset(&tmp,0,sizeof(tmp));
   strncpy(tmp,tmpchar+maclen-1,1); 
   tmplen=atoi(tmp);  
   strncpy(plainFile,tmpchar,maclen-tmplen);
    

return OK;
}

/*********************************************************/















