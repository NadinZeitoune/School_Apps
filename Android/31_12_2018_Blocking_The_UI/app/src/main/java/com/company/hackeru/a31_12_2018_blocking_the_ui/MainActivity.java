package com.company.hackeru.a31_12_2018_blocking_the_ui;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
    private EditText txtInput;
    private TextView lblResult;
    private Button button;
    private boolean isRunning = false;
    private Handler handler = new Handler();
    String result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtInput = findViewById(R.id.txtInput);
        lblResult = findViewById(R.id.lblResult);
        button = findViewById(R.id.btnClick);
    }

    private String verySlowAlgorithm(String input){
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return input+input;
    }

    public void onClick(View view) {
        //String result = verySlowAlgorithm(txtInput.getText().toString());
        if (isRunning) {
            Toast.makeText(this, "please wait...", Toast.LENGTH_SHORT).show();
            return;
        }
        isRunning = true;
        button.setEnabled(false);
        lblResult.setText("please wait...");
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                result = verySlowAlgorithm(txtInput.getText().toString());
                Log.d("nadin", result);
                isRunning = false;
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        button.setEnabled(true);
                        lblResult.setText(result);
                    }
                });
            }
        });
        thread.start();
        //lblResult.setText(result);
    }
}
