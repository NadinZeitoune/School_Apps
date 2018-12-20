package com.company.hackeru.excresice7_201218;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

public class MainActivity extends Activity {
    private CheckBox star1;
    private CheckBox star2;
    private CheckBox star3;
    private CheckBox star4;
    private CheckBox star5;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        star1 = findViewById(R.id.star1);
        star2 = findViewById(R.id.star2);
        star3 = findViewById(R.id.star3);
        star4 = findViewById(R.id.star4);
        star5 = findViewById(R.id.star5);

        star1.setOnClickListener(listener);
        star2.setOnClickListener(listener);
        star3.setOnClickListener(listener);
        star4.setOnClickListener(listener);
        star5.setOnClickListener(listener);
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            int tag = Integer.valueOf((String)view.getTag());
            CheckBox checkBox;

            switch (tag){
                case 2:
                    checkBox = findViewById(R.id.star1);
                    checkBox.setChecked(true);
                    Toast.makeText(MainActivity.this, "2", Toast.LENGTH_SHORT).show();
                    break;
                case 3:

                    break;
                case 4:

                    break;
                case 5:

                    break;
            }
        }
    };
}
