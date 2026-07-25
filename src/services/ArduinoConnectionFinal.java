package services;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gnu.io.CommPortIdentifier; 
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent; 
import gnu.io.SerialPortEventListener; 
import java.util.Enumeration;

import java.util.*;
import java.lang.*;
import java.io.*;

import java.util.Properties;
import javax.sound.midi.MidiDevice.Info;
import connectDB.*;

public class ArduinoConnectionFinal implements SerialPortEventListener {
SerialPort serialPort;
    /** The port we're normally going to use. */
private static final String PORT_NAMES[] = {"/dev/tty.usbserial-A9007UX1", // Mac OS X
        "/dev/ttyUSB0", // Linux
        "COM5", // Windows
};

static String aadhar;
static String rTime;
static String messageString;
static BufferedReader input;
private static OutputStream output;
private static final int TIME_OUT = 2000;
private static final int DATA_RATE = 9600;
Properties prop = new Properties();
private static OutputStream outputStream = null;
public void initialize() {
	
    CommPortIdentifier portId = null;
    Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();

    //First, Find an instance of serial port as set in PORT_NAMES.
    while (portEnum.hasMoreElements()) {
        CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
        for (String portName : PORT_NAMES) {
            if (currPortId.getName().equals(portName)) {
                portId = currPortId;
                break;
            }
        }
    }
    if (portId == null) {
        System.out.println("Could not find COM port...");
        return;
    }

    try {
        serialPort = (SerialPort) portId.open(this.getClass().getName(),
                TIME_OUT);
        serialPort.setSerialPortParams(DATA_RATE,
                SerialPort.DATABITS_8,
                SerialPort.STOPBITS_1,
                SerialPort.PARITY_NONE);
        	
        // open the streams
        input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
        output = serialPort.getOutputStream();
        
        outputStream = serialPort.getOutputStream();
//        output=serialPort.getOutputBufferSize();

        
       
        
        serialPort.addEventListener(this);
        serialPort.notifyOnDataAvailable(true);
        
        
    } catch (Exception e) {
        System.err.println(e.toString());
    }
}


public synchronized void close() {
    if (serialPort != null) {
        serialPort.removeEventListener();
        serialPort.close();
    }
}

public synchronized void serialEvent(SerialPortEvent oEvent) {
    if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
    	
    	 try {
         
           if(input.ready())
       
           aadhar=input.readLine();
           rTime=input.readLine();

        System.out.println("aadhar = "+aadhar);
        System.out.println("rTime = "+rTime);
        
        Connection conn=DBconnect.getConnect();
	 	PreparedStatement ps = conn.prepareStatement("select * from farmer where aadhar=?");
	 	ps.setString(1, aadhar);
	 	ResultSet r = ps.executeQuery();
	 	
	 	if(r.next())
		{	messageString=r.getString("pid");
	 		if(messageString.equals("0"))
	 		{
	 			messageString="0";  
	 		}
	 		else
	 		{
	 			do
	 			{
	 			System.out.println("Writing to arduino: "+messageString);
	 			outputStream.write(messageString.getBytes());
	 			System.out.println("data sent = "+messageString);  
	 			aadhar=input.readLine();
	            rTime=input.readLine();
	            System.out.println("aadhar = "+aadhar);
	            System.out.println("rTime = "+rTime);
	 			//System.out.println("Thread Sleep = "+Long.parseLong(messageString));
	 			Thread.sleep(1000);
	 			if(!rTime.equals("0"))
	 			{
	 				PreparedStatement ps1 = conn.prepareStatement("UPDATE farmer SET pid=? where aadhar=?");
	 				ps1.setString(1,rTime);
	 				System.out.println("rTime in loop= "+rTime);
	 				ps1.setString(2,aadhar);
	 				ps1.executeUpdate();
	 			}
	 			}while(!rTime.equals("0"));
	 			PreparedStatement ps2 = conn.prepareStatement("UPDATE farmer SET pid=? where aadhar=?");
	 			ps2.setString(1,"0");
	 			ps2.setString(2,aadhar);
	 			ps2.executeUpdate();
	 		}
		}
	 	
		}
    	 catch(Exception e)
    	 {
    		 System.err.println(e);
    		 e.printStackTrace();
    	 }
           
            
        }
    
    }
  
    // Ignore all the other eventTypes, but you should consider the other ones.


private Object open(String inputLine, String string) {
	
	// TODO Auto-generated method stub
	return null;
}
public static void main(String[] args) throws SQLException {
	 
	ArduinoConnectionFinal main = new ArduinoConnectionFinal();
 
    
   main.initialize();
  
        
    Thread t=new Thread() {
        public void run() {
            //the following line will keep this app alive for 1000 seconds,
            //waiting for events to occur and responding to them    (printing incoming messages to console).
            try {Thread.sleep(1000000);} catch (InterruptedException ie) {}
        }
    };
          t.start();
    
    System.out.println("Server Started");
    
    
   
}
}

