package com.example.nadins.excercise910_251218;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.TimePicker;
import android.widget.Toast;

public class MainActivity extends Activity {

    private TimePicker timePicker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        timePicker = findViewById(R.id.timePicker);
        timePicker.setIs24HourView(true);
    }

    public void btnClick(View view) {
        int hour = timePicker.getHour();
        int minute = timePicker.getMinute();
        Toast.makeText(this, "selected: " + formatTime(hour, minute), Toast.LENGTH_LONG).show();

    }

    private String formatTime(int hour, int minute){
        String result = "";
        if(hour < 10)
            result += "0";
        result += hour;
        result += ":";
        if(minute < 10)
            result += "0";
        result += minute;
        return result;
    }

    private void setClock(Long time){
        int hour = (int)(time / 100);
        int minute = (int)(time % 100);

        timePicker.setHour(hour);
        timePicker.setMinute(minute);
    }
}