package ssl;    
import java.io.BufferedInputStream;   
import java.io.BufferedOutputStream;   
import java.io.FileInputStream;   
import java.io.IOException;
import java.io.InputStream;   
import java.io.OutputStream;   
import java.net.Socket;   
import java.security.KeyStore;   
  
import javax.net.ssl.KeyManagerFactory;   
import javax.net.ssl.SSLContext;   
import javax.net.ssl.SSLServerSocket;   
import javax.net.ssl.TrustManagerFactory;   

public class Server implements Runnable {
    private static final int DEFAULT_PORT = 7777;
    private static final String SERVER_KEY_STORE_PASSWORD = "861002";
    private static final String SERVER_TRUST_KEY_STORE_PASSWORD = "861002";
    private SSLServerSocket serverSocket;
    /**
     * Æô¶¯³ÌÐò
     */
    public static void main(String[] args) throws Exception {
        Server server = new Server();
        server.init();
        Thread thread = new Thread(server);
        thread.start();
    }
    
    public void run() {
       try {
			start();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    public void init() throws Exception {
        SSLContext ctx = SSLContext.getInstance("SSL");
        KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
        TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
        KeyStore ks = KeyStore.getInstance("JKS");
        KeyStore tks = KeyStore.getInstance("JKS");
        ks.load(new FileInputStream("src/ssl/kserver.keystore"), SERVER_KEY_STORE_PASSWORD.toCharArray());
        tks.load(new FileInputStream("src/ssl/tserver.keystore"), SERVER_TRUST_KEY_STORE_PASSWORD.toCharArray());
        kmf.init(ks, SERVER_KEY_STORE_PASSWORD.toCharArray());
        tmf.init(tks);
        ctx.init(kmf.getKeyManagers(), tmf.getTrustManagers(), null);
        serverSocket = (SSLServerSocket) ctx.getServerSocketFactory().createServerSocket(DEFAULT_PORT);
        serverSocket.setNeedClientAuth(true);
    }
    
    public synchronized void start() throws IOException {
        while (true) {
      	  Socket s = serverSocket.accept();
      	  InputStream input = s.getInputStream();
      	  OutputStream output = s.getOutputStream();
      	  BufferedInputStream bis = new BufferedInputStream(input);
      	  BufferedOutputStream bos = new BufferedOutputStream(output);
      	  byte[] buffer = new byte[20];
      	  bis.read(buffer);
      	  System.out.println("------receive:--------"+new String(buffer).toString());
      	  bos.write("yes".getBytes());
      	  bos.flush();
      	  s.close();
        }
    }
}