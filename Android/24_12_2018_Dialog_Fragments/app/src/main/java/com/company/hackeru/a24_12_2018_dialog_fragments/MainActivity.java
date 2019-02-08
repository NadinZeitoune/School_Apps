package com.company.hackeru.a24_12_2018_dialog_fragments;

import android.app.Activity;
import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }


    public void btnShowLogin(View view) {
        LoginFragment loginFragment = new LoginFragment();
        //loginFragment.setCancelable(false);
        loginFragment.setTitle("please login:");
        //loginFragment.setUserName("elad");
        loginFragment.setListener(new LoginFragment.OnLoginFragmentListener() {
            @Override
            public void onLogin(String userName, String password) {
                Toast.makeText(MainActivity.this, "username: " + userName
                        + ", password: " + password, Toast.LENGTH_SHORT).show();
            }
        });
        loginFragment.show(getFragmentManager(), "");
    }
}