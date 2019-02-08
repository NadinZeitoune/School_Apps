package com.company.hackeru.a24_12_2018_views;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.TimePicker;
import android.widget.Toast;

public class MainActivity extends Activity {

    //private TimePicker timePicker;
    DatePicker datePicker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        /*timePicker = findViewById(R.id.timePicker);
        timePicker.setIs24HourView(true);*/
        datePicker = findViewById(R.id.datePicker);
    }

    public void btnClick(View view) {
        /*int hour = timePicker.getHour();
        int minute = timePicker.getMinute();

        Toast.makeText(this, "Selected: " +formatTime(hour, minute), Toast.LENGTH_SHORT).show();*/

        String dateSelected = "data selected: ";
        dateSelected += datePicker.getDayOfMonth() + "/";
        dateSelected += (datePicker.getMonth() + 1) + "/";
        dateSelected += datePicker.getYear();
        Toast.makeText(this, dateSelected, Toast.LENGTH_SHORT).show();
    }

    private String formatTime(int hour, int minute){
        String result = "";

        if(hour < 10){
            result += "0";
        }
        result+= hour;
        result+=":";

        if (minute < 10){
            result+="0";
        }
        result +=minute;
        return result;
    }
}
