package com.company.hackeru.a24_12_2018_broadcastreceiver;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class SecondActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_second);
        int param1 = getIntent().getIntExtra("param1", 0);
        param1++;
        Intent data = new Intent();
        data.putExtra("result",param1);
        setResult(RESULT_OK, data);
        finish();
    }
}
