package com.company.hackeru.exerecise11_241218;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {
    EditText txtQuestion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtQuestion = findViewById(R.id.txtQuestion);
    }

    public void btnShowFragment(View view) {
        ApprovalFragment approvalFragment = new ApprovalFragment();
        approvalFragment.setQuestion(txtQuestion.getText().toString());
        //approvalFragment.setApprovalListener(this);
        approvalFragment.show(getFragmentManager(), "");
    }

    /*@Override
    public void onChoose(boolean isYes){
        Toast.makeText(this, "you choose", Toast.LENGTH_SHORT).show();
    }*/
}
