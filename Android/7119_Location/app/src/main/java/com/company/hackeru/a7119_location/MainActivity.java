package com.company.hackeru.a7119_location;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.location.Location;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;

public class MainActivity extends Activity {

    public static final int REQUEST_CODE_LAST_LOCATION = 123;
    public static final int REQUEST_CODE_START_LOCATION_UPDATES = 321;
    private TextView textView;
    private Button button;
    private LocationRequest locationRequest;
    private LocationCallback locationCallback;

    private FusedLocationProviderClient fusedLocationProviderClient;

    private boolean shouldStartLocationUpdates;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);
        button = findViewById(R.id.btnLocation);

        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this);

        createLocationRequest();
        locationCallback = new LocationCallback(){
            @Override
            public void onLocationResult(LocationResult locationResult) {
                if (locationResult == null)
                    return;
                for (Location location : locationResult.getLocations()) {
                    textView.setText("latitude: " + location.getLatitude() + ", longitude: " + location.getLongitude());

                }
            }
        };
    }

    private void createLocationRequest() {
        locationRequest = LocationRequest.create();
        locationRequest.setInterval(5000);  // Every 5 seconds.
        locationRequest.setFastestInterval(2000);
        locationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);
    }

    @SuppressLint("MissingPermission")
    private void startLocationUpdates() {
        fusedLocationProviderClient.requestLocationUpdates(locationRequest, locationCallback, null);
    }

    private void stopLocationUpdates(){
        fusedLocationProviderClient.removeLocationUpdates(locationCallback);
    }

    @Override
    protected void onPause() {
        super.onPause();

        stopLocationUpdates();
    }

    @Override
    protected void onResume() {
        super.onResume();

        if (shouldStartLocationUpdates)
            startLocationUpdates();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_CODE_LAST_LOCATION) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED)
                getLastLocation();
        }else if (requestCode == REQUEST_CODE_START_LOCATION_UPDATES){
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED)
                startLocationUpdates();
        }
    }

    public void getLocation(View view) {
        if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, REQUEST_CODE_START_LOCATION_UPDATES);
            return;
        }
        getLastLocation();
    }

    @SuppressLint("MissingPermission")
    private void getLastLocation() {
        fusedLocationProviderClient.getLastLocation().addOnSuccessListener(this, new OnSuccessListener<Location>() {
            @Override
            public void onSuccess(Location location) {
                if (location != null) {
                    textView.setText("latitude: " + location.getLatitude() + ", longitude: " + location.getLongitude());
                } else {
                    textView.setText(R.string.no_known_location);
                }
            }
        });
    }


}
