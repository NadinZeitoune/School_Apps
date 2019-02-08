package com.company.hackeru.a20_12_2018_radiobuttons;

import android.app.Activity;
import android.os.Bundle;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

public class MainActivity extends Activity {
    private int choice = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        RadioGroup radioGroup = findViewById(R.id.radioGroup);
        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int id) {
                switch (id){
                    case R.id.radio1:
                        choice = 1;
                        break;
                    case R.id.radio2:
                        choice = 2;
                        break;
                    case R.id.radio3:
                        choice = 3;
                        break;
                }
                Toast.makeText(MainActivity.this, "you choose " + choice, Toast.LENGTH_SHORT).show();
            }
        });
        
    }
}
