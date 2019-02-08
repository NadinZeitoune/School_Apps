package com.company;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class Main {

    public static void main(String[] args) {
        URL url = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        HttpURLConnection connection = null;

        try {
            url = new URL("http://localhost:8080/MyFirstWebApp_war_exploded/MainServlet?username=nadin&password=12345");
            connection = (HttpURLConnection) url.openConnection();
            connection.setUseCaches(false);
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.connect();
            outputStream = connection.getOutputStream();
            outputStream.write("hello sear server".getBytes());
            inputStream = connection.getInputStream();
            byte[] buffer = new byte[1024];
            int actuallyRead = inputStream.read(buffer);
            if (actuallyRead != -1){
                String responseToServer = new String(buffer, 0, actuallyRead);
                System.out.println(responseToServer);
            }else
                System.out.println("no response");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                connection.disconnect();
            }
        }

        /*private static void httpGetRequest() {
        URL url = null;
        InputStream inputStream = null;
        //OutputStream outputStream = null;
        HttpURLConnection connection = null;

        try {
            url = new URL("http://localhost:8080/MyFirstWebApp_war_exploded/MainServlet?username=nadin&password=12345");
            connection = (HttpURLConnection) url.openConnection();
            connection.setUseCaches(false);
            connection.setRequestMethod("GET");
            connection.setDoOutput(false);
            connection.connect();

            inputStream = connection.getInputStream();
            byte[] buffer = new byte[1024];
            int actuallyRead = inputStream.read(buffer);
            if (actuallyRead != -1){
                String responseFromServer = new String(buffer, 0, actuallyRead);
                System.out.println(responseFromServer);
            }else
                System.out.println("no response");

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null)
                connection.disconnect();
        }
    }*/
    }
}
