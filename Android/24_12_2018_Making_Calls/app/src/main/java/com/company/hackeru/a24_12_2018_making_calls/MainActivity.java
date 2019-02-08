package com.company.hackeru.a24_12_2018_making_calls;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends Activity {

    public static final int REQUEST_CODE = 123;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void btnMakeCalls(View view) {
        makeCall(true);
    }

    private void makeCall(boolean shouldCheckPermission){
        String phoneNumber = "0547007691";
        //Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:"+phoneNumber));
        if (!shouldCheckPermission || checkPermission(Manifest.permission.CALL_PHONE)) {
            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + phoneNumber));
            startActivity(intent);
        }else{
            requestPermissions(new String[]{Manifest.permission.CALL_PHONE}, REQUEST_CODE);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_CODE){
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED){
                makeCall(false);
            }else{
                Toast.makeText(this, "why did you clicked without giving permission?", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private boolean checkPermission(String permission){
        int permissionCheck = checkSelfPermission(permission);
        return permissionCheck == PackageManager.PERMISSION_GRANTED;
    }
}
