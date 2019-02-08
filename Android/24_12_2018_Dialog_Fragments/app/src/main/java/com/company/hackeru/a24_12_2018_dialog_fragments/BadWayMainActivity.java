package com.company.hackeru.a24_12_2018_dialog_fragments;

import android.app.Activity;
import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class BadWayMainActivity extends Activity {
private EditText txtInput;
private ConstraintLayout layoutLogin;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.badway);
        txtInput = findViewById(R.id.txtInput);
        layoutLogin = findViewById(R.id.layoutLogin);
        layoutLogin.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                return true;
            }
        });
    }

    public void btnClick(View view) {
        Toast.makeText(this, "you entered: " + txtInput.getText(), Toast.LENGTH_SHORT).show();
    }

    public void btnShowLogin(View view) {
    }
}
