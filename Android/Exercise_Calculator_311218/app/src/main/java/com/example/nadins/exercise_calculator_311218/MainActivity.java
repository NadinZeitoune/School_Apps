package com.example.nadins.exercise_calculator_311218;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity implements MathematicsThread.MathematicsActionListener {
    private EditText txtNum1, txtNum2;
    private Button btnSubmit;
    private TextView lblResult;
    private RadioGroup radioGroup;
    private Handler handler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtNum1 = findViewById(R.id.txtNum1);
        txtNum2 = findViewById(R.id.txtNum2);
        btnSubmit = findViewById(R.id.btnSubmit);
        lblResult = findViewById(R.id.lblResult);
        radioGroup = findViewById(R.id.radioGroup);
    }

    public void onSubmitClick(View view) {
        String strNum1 = txtNum1.getText().toString();
        String strNum2 = txtNum2.getText().toString();

        // Check if user type both numbers.
        if (strNum1.isEmpty() || strNum2.isEmpty()) {
            Toast.makeText(this, "One of the operands is missing!", Toast.LENGTH_SHORT).show();
            return;
        }
        String action = "";
        // Check action.
        if (radioGroup.getCheckedRadioButtonId() == -1){
            Toast.makeText(this, "You didn't select action!", Toast.LENGTH_SHORT).show();
            return;
        }
        else{
            RadioButton button = findViewById(radioGroup.getCheckedRadioButtonId());
            action = (String) button.getText();
        }

        int num1 = 0, num2 = 0;
        try {
            num1 = Integer.valueOf(strNum1);
            num2 = Integer.valueOf(strNum2);
        }catch (Exception e){
            Toast.makeText(this, "You didn't Enter numbers???", Toast.LENGTH_SHORT).show();
            return;
        }

        // Check division by 0.
        if (num2 == 0 && action == "/"){
            Toast.makeText(this, "You can't divide by zero!!!", Toast.LENGTH_SHORT).show();
            return;
        }

        lblResult.setText("Please wait...");
        btnSubmit.setEnabled(false);
        MathematicsThread mathematicsThread = new MathematicsThread(num1, num2, action, this);
        mathematicsThread.start();
    }

    @Override
    public void onMathActionCompleted(int result, int num1, int num2, String action) {
        handler.post(new MathActionRunnable(result, num1, num2, action) {
            @Override
            public void run() {
                lblResult.setText(num1 + " " + action + " " + num2 + " = " + result);
                btnSubmit.setEnabled(true);
            }
        });
    }
}

abstract class MathActionRunnable implements Runnable{

    protected int result, num1, num2;
    protected String action;

    public MathActionRunnable(int result, int num1, int num2, String action) {
        this.result = result;
        this.num1 = num1;
        this.num2 = num2;
        this.action = action;
    }
}