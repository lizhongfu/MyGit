package com.kalagame.utils.net;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.Iterator;

import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.util.ByteArrayBuffer;

import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;

import com.kalagame.component.Tool;

/**
 * Http的请求
 * @author benzhan
 */
public class SocketRequestExt extends AbstShortConnect {
    private final int BUFFER_SIZE = 8096;
    private ByteArrayBuffer mBuffer = null;
    private Socket mSocket = null;
    private boolean isEncryption = false;
    private XOR xor;
    public SocketRequestExt(Object url) {
        super(url);
        xor = new XOR();
    }

    /**
     * 是否加密数据
     * 默认不加密
     * @param isEncryption
     */
    public void isEncryption(boolean isEncryption){
    	this.isEncryption = isEncryption;
    }
    private void execute() {
        String type = Tool.getNetWorkType();
        if ("none".equals(type)) {
        	if(mListener != null && !mListener.onNetBreak(mRequestId)){
       		 mListener.onError(mRequestId, 0, "网络故障，请检查!", null);
        	}
            return;
        }
        
        (new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                StringBuffer  value = new StringBuffer();
                DataOutputStream dataOut = null;
                InputStream ins = null;
                try {
                    mSocket = new Socket();
                    InetSocketAddress remoteAddr = new InetSocketAddress("user.api.kalagame.com", 9080); //user.api.kalagame.com
                    //设置连接超时                   
                    mSocket.connect(remoteAddr, mConnectTimeout);
                    println("post的字符是："+ new String(mBuffer.toByteArray()));
                    //SystemUtils.println("post的字符是："+ new String(mBuffer.toByteArray()));
                    //设置socket读数据超时限制
                    mSocket.setSoTimeout(mSocketTimeout);
                    
                    OutputStream netOut = mSocket.getOutputStream();
                    dataOut = new DataOutputStream(netOut);
                    dataOut.write(mBuffer.toByteArray());
                    
                    ins = mSocket.getInputStream();
                    //System.out.println("流的："+ins.toString());
                    byte[] buf = new byte[4];
                    
                    int cmd = readInt(ins,buf);
                    //System.out.println("cmd:"+cmd);
                    int requestId = readInt(ins,buf);
                    //System.out.println("requestId:"+requestId);
                    int packageSize = readInt(ins,buf);
                    //System.out.println("packageSize:"+packageSize);
                   
                    while(packageSize != 0){
                    	byte[] bvalue = new byte[packageSize];
                    	int lens = ins.read(bvalue, 0, packageSize);
                    	
                    	value.append(new String(bvalue,0,lens));
                    	//System.out.println("读到的lens:"+lens);
                    	if(lens != packageSize){
                    		while(lens < packageSize){
                    			int len = ins.read(bvalue, 0, packageSize - lens);
                    			value.append(new String(bvalue,0,len));
                    			lens += len;
                        	}
                    	}   
                    	
                    	//System.out.println("value:"+value.toString());
                    	packageSize = readInt(ins,buf);
                    	//System.out.println("packageSize:"+packageSize);
                    }
                    
                    int end = readInt(ins,buf);
                    
                     if(value != null && value.length() > 0){
                    	 value.delete(0, 4);
                     }       
                    println("收到的字符是：cmd:"+ cmd + " requestId:"+requestId + " data:"+value.toString());
                    //SystemUtils.println("收到的字符是：cmd:"+ cmd + " requestId:"+requestId + " data:"+value.toString());
                    
                } catch (ConnectTimeoutException e) {
                    e.printStackTrace();
                    mIsTimeout = true;
                } catch (SocketTimeoutException e) {
                    e.printStackTrace();
                    mIsTimeout = true;
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (OutOfMemoryError e) {
                    e.printStackTrace();
                }finally{
                	if(dataOut != null){
                		try {
							dataOut.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                	}
                	
                	if(ins != null){
                		 try {
							ins.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                	}
                    
                	if(mSocket != null){
                		try {
							mSocket.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                	}
                }
                
                return value.toString();
            }

            @Override
            protected void onPostExecute(String result) {
                handleResponse(result);
            }
        }).execute();
       
    }
    
    private synchronized int readInt(InputStream in,byte[] buf) throws IOException{
    	
    	in.read(buf, 0, buf.length);
    	return (((int)buf[3]) << 24) + (((int)buf[2]) << 16) + (((int)buf[1]) << 8) + (buf[0] >= 0? buf[0] : 256+buf[0]);
    }
    
    
    public synchronized int readInt(byte[] b){    	
    	return (((int)b[3]) << 24) + (((int)b[2]) << 16) + (((int)b[1]) << 8) + (b[0] >= 0? b[0] : 256+b[0]);
    }
    
    public void get(AbsResponseListener listerner) {
    	mListener = listerner;
        int cmd = Integer.parseInt(mUrl.toString());
        mBuffer = new ByteArrayBuffer(100);
        if(isBuildDefaultParam){
        	buildDefaultParam();
        }
        makeHeader(TYPE_GET, cmd, mRequestId);
        makeGetParam();
        
        //SystemUtils.debug("cmd=" + cmd);
        
        execute();
    }

    public void post(AbsResponseListener listerner) {
    	mListener = listerner;
        int cmd = Integer.parseInt(mUrl.toString());
        mBuffer = new ByteArrayBuffer(1000);
        if(isBuildDefaultParam){
        	buildDefaultParam();
        }
        
        makeHeader(TYPE_POST, cmd, mRequestId);
        if(TextUtils.isEmpty(postContent)){
        	makePostParam();
        }else{
        	makePostContent();
        }      
        execute();
    }

    public void multipartPost(AbsResponseListener listerner) {
        //int cmd = Integer.parseInt(objUrl.toString());
    }

    /**
     * 停止请求
     */
    public void abort() {
        if (mSocket != null) {
            try {
                mSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
  
    
    private void makeInt(ByteArrayBuffer buffer, int value) {
        //添加结束符号
        byte[] numBytes = writeInt(value);
        buffer.append(numBytes, 0, numBytes.length);
    }
    
    /**
     * 构造不分段的数据 
     * @param buffer
     * @param value
     */
    private void makeSection(ByteArrayBuffer buffer, String value) {
        byte[] bytes = value.getBytes();
        makeInt(buffer, bytes.length);
        buffer.append(bytes, 0, bytes.length);
    }
    
    /**
     * 构造分段数据
     * @param buffer
     * @param value
     */
    private void makeMultiSection(ByteArrayBuffer buffer, byte[] bytes) {
        //byte[] bytes = value.getBytes();
        int len = bytes.length;
        int num = 0;
        //循环添加分段的数据
        do {
            if (len > BUFFER_SIZE) {
                makeInt(buffer, BUFFER_SIZE);
                buffer.append(bytes, num, BUFFER_SIZE);
                num += BUFFER_SIZE;
                len -= BUFFER_SIZE;
                //buffer.append(numBytes);
            } else {
                makeInt(buffer, len);
                buffer.append(bytes, num, len);
                break;
            }
        } while(true);
        
        //添加结束符号
        makeInt(buffer, 0);
    }
    
    private void makeHeader(int type, int cmd, int requestId) {
    	byte[] version = writeChart(type);
    	mBuffer.append(version,0,version.length);
    	byte[] btype = writeChart(type);
        mBuffer.append(btype,0,btype.length);
        makeInt(mBuffer, cmd);
        makeInt(mBuffer, requestId);
    }
    
    public void makePostParam() {
        Iterator<String> iterator = mParams.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();    
            String value = mParams.get(key).toString();
            if (TextUtils.isEmpty(value)) {
                continue;
            }
            
            makeSection(mBuffer, key);
            byte[] bytes;
            
			try {
				bytes = value.getBytes("UTF-8");
				if(isEncryption){
		           bytes = Encryption(value);
		        }
				
		        makeMultiSection(mBuffer, bytes);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				bytes = value.getBytes();
				if(isEncryption){
		           bytes = Encryption(value);
		        }
		        makeMultiSection(mBuffer, bytes);
			}
           
        }
        
        //添加结束符号
        makeInt(mBuffer, 0);
    }
    public void makePostContent() {
    	if(TextUtils.isEmpty(postContent)){
    		if(isEncryption){
    			makeMultiSection(mBuffer, Encryption(postContent));
    		}else{
    			makeMultiSection(mBuffer, postContent.getBytes());
    		}
    		
    	}    	
    	//添加结束符号
    	makeInt(mBuffer, 0);
    }
    
    public void makeGetParam() {
        ByteArrayBuffer tempBuffer = new ByteArrayBuffer(10);
        Iterator<String> iterator = mParams.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();
            makeSection(tempBuffer, key);
            String value = mParams.get(key).toString();
            makeSection(tempBuffer, value);
        }
        
        int totalSize = tempBuffer.length();
        //构造长度
        makeInt(mBuffer, totalSize);
        //添加内容
        mBuffer.append(tempBuffer.toByteArray(), 0, totalSize);
        //添加结束符号
        makeInt(mBuffer, 0);
    }
    
    private static byte[] writeInt(int val) {
        byte[] buff = new byte[4];
        buff[3] = (byte) (val >> 24);
        buff[2] = (byte) (val >> 16);
        buff[1] = (byte) (val >> 8);
        buff[0] = (byte) val;
        return buff;
    }
    private static byte[] writeChart(int val) {
    	byte[] buff = new byte[2];    	
    	buff[1] = (byte) (val >> 8);
    	buff[0] = (byte) val;
    	return buff;
    }

	@Override
	public void retryRequest() {
		execute();
	}

	private byte[] Encryption(String string){
		if(xor == null){
			xor = new XOR();
		}
		return xor.encode(string);
	}
	private void println(String msg){
		Log.d(TAG, msg);
	}
	private String TAG = "socket";
}
