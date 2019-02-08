package com.company.hackeru.a27_12_2018_monitoring_phone;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.widget.TextView;

public class MainActivity extends Activity {


    public static final int REQUEST_CODE = 123;
    private TelephonyManager telephonyManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (checkSelfPermission(Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED ||
                checkSelfPermission(Manifest.permission.READ_PHONE_NUMBERS) != PackageManager.PERMISSION_GRANTED){
            requestPermissions(new String[]{
                    Manifest.permission.READ_PHONE_STATE, Manifest.permission.READ_PHONE_NUMBERS}, REQUEST_CODE);
        }


        telephonyManager = (TelephonyManager)getSystemService(Context.TELEPHONY_SERVICE);
        telephonyManager.listen(phoneStateListener, PhoneStateListener.LISTEN_CALL_STATE);
    }

    private PhoneStateListener phoneStateListener = new PhoneStateListener(){
        @Override
        public void onCallStateChanged(int state, String incomingNumber) {
            String phoneState = null;

            switch (state){
                case TelephonyManager.CALL_STATE_IDLE:
                    phoneState = "idle";
                    break;
                case TelephonyManager.CALL_STATE_RINGING:
                    phoneState = "ringing";
                    break;
                case TelephonyManager.CALL_STATE_OFFHOOK:
                    phoneState = "off hook";
                    break;
            }

            TextView textView = findViewById(R.id.txtView);
            textView.setText("State changed to " + phoneState + ", number: " + incomingNumber);
        }
    };

    @Override
    protected void onDestroy() {
        super.onDestroy();

        telephonyManager.listen(phoneStateListener, PhoneStateListener.LISTEN_NONE);
    }
}
