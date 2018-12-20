package com.company.hackeru.a20_12_2018_checkbox;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.Toast;

public class MainActivity extends Activity {

    private CheckBox chkOlives;
    private CheckBox chkMushrooms;
    private CheckBox chkPinapple;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /*chkOlives = findViewById(R.id.chkOlives);
        chkMushrooms = findViewById(R.id.chkMushroom);
        chkPinapple = findViewById(R.id.chkPinapple);
        chkOlives.setOnClickListener(listener);
        chkMushrooms.setOnClickListener(listener);
        chkPinapple.setOnClickListener(listener);
        */
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            String tag = (String) view.getTag();

            switch (tag){
                case "Olives":
                    Toast.makeText(MainActivity.this, "checked " + chkOlives.isChecked(), Toast.LENGTH_SHORT).show();
                    break;
                case "Mushrooms":
                    Toast.makeText(MainActivity.this, "checked " + chkMushrooms.isChecked(), Toast.LENGTH_SHORT).show();
                    break;
                case "Pinapple":
                    Toast.makeText(MainActivity.this, "checked " + chkPinapple.isChecked(), Toast.LENGTH_SHORT).show();
                    break;
            }
        }
    };
}
