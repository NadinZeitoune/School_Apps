package com.company.hackeru.a27_12_2018_receiving_sms;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.telephony.SmsMessage;
import android.util.Log;
import android.widget.Toast;

public class SMSBroadcastReciever extends BroadcastReceiver {
    public static final String ANDROID_PROVIDER_TELEPHONY_SMS_RECEIVED = "android.provider.Telephony.SMS_RECEIVED";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals(ANDROID_PROVIDER_TELEPHONY_SMS_RECEIVED)) {
            Log.d("Nadin", "sms received");
            Bundle bundle = intent.getExtras();
            if (bundle != null){
                // protocol data units
                Object[] pdus = (Object[])bundle.get("pdus");
                String format = bundle.getString("format");
                SmsMessage[] messages = new SmsMessage[pdus.length];
                for (int i = 0; i < pdus.length; i++) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
                        messages[i] = SmsMessage.createFromPdu((byte[])pdus[i], format);
                    }
                    else{
                        messages[i] = SmsMessage.createFromPdu((byte[])pdus[i]);
                    }
                    //Toast.makeText(context, messages[i].getMessageBody(), Toast.LENGTH_SHORT).show();
                    Log.d("Nadin", messages[i].getMessageBody());
                }
                    Log.d("Nadin", messages[0].getOriginatingAddress());
            }
        }
    }
}
