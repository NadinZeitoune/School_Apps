package com.company.hackeru.a24_12_2018_dialog_fragments;

import android.app.DialogFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class LoginFragment extends DialogFragment {

    private String title = "Login";
    private String userName;
    private EditText txtUserName;
    private EditText txtPassword;
    private Button btnLogin;
    private OnLoginFragmentListener listener;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        getDialog().setTitle(title);
        View view = inflater.inflate(R.layout.fragment_login, container, false);
        txtUserName = view.findViewById(R.id.txtUsername);
        txtPassword = view.findViewById(R.id.txtPassword);
        btnLogin = view.findViewById(R.id.btnLogin);
        if(userName != null) {
            txtUserName.setText(userName);
            txtPassword.requestFocus();
        }else{
            //txtUserName.requestFocus();
        }
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String userName = txtUserName.getText().toString();
                String password = txtPassword.getText().toString();
                if(userName.isEmpty() || password.isEmpty()){
                    Toast.makeText(getContext(), "username and password are required", Toast.LENGTH_SHORT).show();
                    return;
                }
                if(listener != null)
                    listener.onLogin(userName, password);
                dismiss();
            }
        });

        //this line is responsible of popping up the keyboard
        getDialog().getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
        return view;
    }

    public void setListener(OnLoginFragmentListener listener) {
        this.listener = listener;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public interface OnLoginFragmentListener{
        void onLogin(String userName, String password);
    }
}