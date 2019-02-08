package com.company.hackeru.a20_12_2018_listview;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends Activity {

    private String[] countries = {"AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania","AF|Afghanistan","AL|Albania"};
    private ListAdapter adapter;
    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listView = findViewById(R.id.listView);

        adapter = new ArrayAdapter<String>(this, R.layout.item_country, R.id.lblCountry, countries);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
                String country = countries[position];
                Toast.makeText(MainActivity.this, "you clicked: " + country, Toast.LENGTH_SHORT).show();
            }
        });
        listView.setAdapter(adapter);
    }
}
