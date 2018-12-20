package com.company.hackeru.a20_12_2018_buttons;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends Activity {
    private boolean doUnderstand = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button3 = findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(MainActivity.this, "Button 3 was clicked!", Toast.LENGTH_SHORT).show();
            }
        });

        Button button4 = findViewById(R.id.button4);
        Button button5 = findViewById(R.id.button5);
        button4.setOnClickListener(listener);
        button5.setOnClickListener(listener);
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            String tag = (String)view.getTag();
            Toast.makeText(MainActivity.this, "Button " + tag + " was clicked!", Toast.LENGTH_SHORT).show();
        }
    };

    public void onClick(View view) {
        String tag = (String)view.getTag();
        Toast.makeText(this, "Button " + tag + " was clicked!", Toast.LENGTH_SHORT).show();
    }

    public void onToggle(View view) {
        doUnderstand = !doUnderstand;
        ToggleButton toggleButton = (ToggleButton)view;
        Toast.makeText(this, (toggleButton.isChecked() ? "good" : "why?"), Toast.LENGTH_SHORT).show();
    }
}
