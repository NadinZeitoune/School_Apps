package com.company.hackeru.a27_12_2018_send_sms;

import android.Manifest;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {

    public static final int REQUEST_CODE = 123;
    private Button btnSend;
    private EditText txtPhoneNumber;
    private EditText txtSMS;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnSend = findViewById(R.id.btnSend);
        txtPhoneNumber = findViewById(R.id.txtPhoneNumber);
        txtSMS = findViewById(R.id.txtSMS);

        if(checkSelfPermission(Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED){
            btnSend.setEnabled(false);
            requestPermissions(new String[]{Manifest.permission.SEND_SMS}, REQUEST_CODE);
        }else
            btnSend.setEnabled(true);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_CODE){
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED){
                btnSend.setEnabled(true);
            }
        }
    }

    public void btnClicked(View view) {
        String phoneNumber = txtPhoneNumber.getText().toString();
        String textMassage = txtSMS.getText().toString();
        if (phoneNumber.isEmpty() || textMassage.isEmpty()){
            Toast.makeText(this, "wtf?", Toast.LENGTH_SHORT).show();
            return;
        }

        SmsManager smsManager = SmsManager.getDefault();
        Intent intent = new Intent(this, MainActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 465, intent, PendingIntent.FLAG_UPDATE_CURRENT);
        smsManager.sendTextMessage(phoneNumber, null, textMassage, pendingIntent, null);
    }
}
