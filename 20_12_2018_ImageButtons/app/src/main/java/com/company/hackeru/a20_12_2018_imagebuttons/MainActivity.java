package com.company.hackeru.a20_12_2018_imagebuttons;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onClick(View view) {
        Toast.makeText(this, "Clicked", Toast.LENGTH_SHORT).show();
    }

    public void imagedClicked(View view) {
        Toast.makeText(this, "image clicked", Toast.LENGTH_SHORT).show();
    }
}
