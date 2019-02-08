package com.company.hackeru.a24_12_2018_broadcastreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

public class MyBroadcastReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        int param1 = intent.getIntExtra("param1", 0);
       // Toast.makeText(context, "on recive param1: " + param1, Toast.LENGTH_SHORT).show();
        Toast.makeText(context, "Hi Boot completed", Toast.LENGTH_SHORT).show();
        Intent intent1 = new Intent(context, MainActivity.class);
        context.startActivity(intent1);
    }
}
