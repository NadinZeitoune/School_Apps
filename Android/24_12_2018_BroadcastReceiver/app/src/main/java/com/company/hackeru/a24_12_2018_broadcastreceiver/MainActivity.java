package com.company.hackeru.a24_12_2018_broadcastreceiver;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends Activity {

    //public static final int REQUEST_CODE = 123;
    private MyBroadcastReceiver myBroadcastReceiver;
    private IntentFilter intentFilter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        intentFilter = new IntentFilter("MyAction");
    }

    @Override
    protected void onResume() {
        super.onResume();

        /*if (myBroadcastReceiver == null)
            myBroadcastReceiver = new MyBroadcastReceiver();
        registerReceiver(myBroadcastReceiver, intentFilter);*/


    }

    @Override
    protected void onPause() {
        super.onPause();
        //unregisterReceiver(myBroadcastReceiver);


    }

    public void btnOnClick(View view) {
       /* Intent intent = new Intent("SecondActivity");
        intent.putExtra("param1", 524564);
        startActivityForResult(intent, REQUEST_CODE);*/


       Intent intent = new Intent("MyAction");
       intent.putExtra("param1", 5456);
       sendBroadcast(intent);
    }

    /*@Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE && resultCode == RESULT_OK){
            int result = data.getIntExtra("result", 0);
            Toast.makeText(this, "result is: " + result, Toast.LENGTH_SHORT).show();
        }
    }*/
}
