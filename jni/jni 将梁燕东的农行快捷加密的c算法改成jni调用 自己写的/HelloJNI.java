public class HelloJNI 
{
	static {
		System.loadLibrary("Hello");
	}
	/**
	* @param data 加密的数据
	  @param key 加密的秘钥
	  @param result 加密后的密文

	  @return 加密后的密文
	*/
	public native String hello(String data, String key, String result);
	public static void main (String[] args) {
		HelloJNI hello = new HelloJNI();
		String result = new String("                                                            ");
		String xx = hello.hello("737854912058894282", "a6F739b0", result);
		System.out.println("xxx:"+result+"yyy"); // 返回:xxx:                                                            yyy,不是预期的.
		System.out.println("返回加密后的密文:"+xx); // 返回:98333592e970aa7868afa1857ace1cdf198ea3d93027cf34,是预期的.
	}
}