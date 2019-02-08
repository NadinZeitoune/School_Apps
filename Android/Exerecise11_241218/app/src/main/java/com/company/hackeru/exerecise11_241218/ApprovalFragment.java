package com.company.hackeru.exerecise11_241218;

import android.app.DialogFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Switch;
import android.widget.TextView;

public class ApprovalFragment extends DialogFragment {

    private String question;
    private ApprovalListener approvalListener;

    public void setQuestion(String question) {
        this.question = question;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_approval,container, false);

        TextView lblQusetion = view.findViewById(R.id.txtQuestion);
        if (question != null){
            lblQusetion.setText(question);
        }
        Button btnYes = view.findViewById(R.id.btnYes);
        Button btnNo = view.findViewById(R.id.btnNo);

        btnYes.setOnClickListener(listener);
        btnNo.setOnClickListener(listener);

        return view;
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            boolean isYes;
            switch(view.getId()){
                case R.id.btnYes:
                    isYes = true;
                    break;
                case R.id.btnNo:
                    isYes = false;
                    break;
            }
        }
    };

    public void setApprovalListener(ApprovalFragment approvalListener){
        //this.approvalListener = approvalListener;
    }

    public interface ApprovalListener{
        void onChoose(boolean isYes);
    }
}
