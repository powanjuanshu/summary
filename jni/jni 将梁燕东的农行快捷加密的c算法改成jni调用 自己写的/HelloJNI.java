public class HelloJNI 
{
	static {
		System.loadLibrary("Hello");
	}
	/**
	* @param data ���ܵ�����
	  @param key ���ܵ���Կ
	  @param result ���ܺ������

	  @return ���ܺ������
	*/
	public native String hello(String data, String key, String result);
	public static void main (String[] args) {
		HelloJNI hello = new HelloJNI();
		String result = new String("                                                            ");
		String xx = hello.hello("737854912058894282", "a6F739b0", result);
		System.out.println("xxx:"+result+"yyy"); // ����:xxx:                                                            yyy,����Ԥ�ڵ�.
		System.out.println("���ؼ��ܺ������:"+xx); // ����:98333592e970aa7868afa1857ace1cdf198ea3d93027cf34,��Ԥ�ڵ�.
	}
}