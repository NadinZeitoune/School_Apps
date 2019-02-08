package com.example.nadins.exercise_calculator_311218;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MathematicsThread extends Thread {

    public static final String BASE_URL = "http://10.0.2.2:8080/Exercise_Calculator_Server_311218_war_exploded";
    private int num1, num2;
    private String action;
    private MathematicsActionListener listener;


    public MathematicsThread(int num1, int num2, String action, MathematicsActionListener listener) {
        this.num1 = num1;
        this.num2 = num2;
        this.action = action;
        this.listener = listener;
    }

    @Override
    public void run() {
        URL url = null;
        InputStream inputStream = null;
        HttpURLConnection connection = null;

        try {
            url = new URL(BASE_URL + "/math?num1="+num1+"&num2="+num2+"&action="+action);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setUseCaches(false);
            connection.setDoOutput(false);
            connection.connect();

            inputStream = connection.getInputStream();
            byte[] buffer = new byte[64];
            int actuallyRead = inputStream.read(buffer);
            if(actuallyRead != -1){
                String response = new String(buffer, 0, actuallyRead);
                try {
                    int result = Integer.valueOf(response);
                    if(listener != null)
                        listener.onMathActionCompleted(result, num1, num2, action);
                }catch (Exception ex){

                }
            }

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
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    public interface MathematicsActionListener{
        void onMathActionCompleted(int result, int num1, int num2, String action);
    }
}
