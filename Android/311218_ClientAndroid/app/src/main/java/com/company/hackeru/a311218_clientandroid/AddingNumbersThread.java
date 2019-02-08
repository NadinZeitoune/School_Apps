package com.company.hackeru.a311218_clientandroid;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AddingNumbersThread extends Thread {
    private int num1, num2;
    public static String BASE_URL ;

    public AddingNumbersThread(int num1, int num2) {
        this.num1 = num1;
        this.num2 = num2;
    }

    @Override
    public void run() {
        URL url = null;
        InputStream inputStream = null;
        HttpURLConnection connection = null;
        try {
           // url = new URL();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
