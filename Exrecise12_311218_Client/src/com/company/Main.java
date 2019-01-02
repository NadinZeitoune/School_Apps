package com.company;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        int num1 = readIntegerFromClient("enter first number: ");
        int num2 = readIntegerFromClient("enter second number: ");
        int result = 0;
        try {
            result = addNumbers(num1, num2);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("result is: " + result);
    }

    private static int readIntegerFromClient(String message){
        System.out.println(message);
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine();
        int num = 0;
        try {
            num = Integer.valueOf(input);
        }catch (Exception e){
            System.out.println("invalid number");
            return readIntegerFromClient(message);
        }
        return num;
    }

    private static int addNumbers(int num1, int num2) throws Exception{
        URL url = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        HttpURLConnection connection = null;
        int result = 0;
        try {
            url = new URL("http://localhost:8080/Excrecise12_311218_war_exploded/MainServlet?num1="+num1+"&num2="+num2+"");
            connection = (HttpURLConnection) url.openConnection();
            connection.setUseCaches(false);
            connection.setRequestMethod("GET");
            connection.setDoOutput(false);
            connection.connect();
            inputStream = connection.getInputStream();
            byte[] buffer = new byte[64];
            int actuallyRead = inputStream.read(buffer);
            if (actuallyRead != -1){
                String response = new String(buffer, 0, actuallyRead);
                try {
                    result = Integer.valueOf(response);
                }catch (Exception e){
                    throw new Exception("the response was not a number");
                }
            }else {
                throw new Exception("no response from server");
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            throw e;
        }finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                connection.disconnect();
            }
        }
        return result;
    }
}
