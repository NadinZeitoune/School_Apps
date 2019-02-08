package com.company.hackeru.a24_12_2018_paging;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.view.ViewPager;

public class MainActivity extends Activity {
    private ViewPager viewPager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        viewPager = findViewById(R.id.viewPager);
        MyPagerAdapter adapter = new MyPagerAdapter();
        viewPager.setAdapter(adapter);
    }
}
