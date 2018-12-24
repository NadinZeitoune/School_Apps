package com.company.hackeru.a24_12_2018_paging;


import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class MyPagerAdapter extends PagerAdapter {
    @Override
    public int getCount() {
        return 3;
    }

    @NonNull
    @Override
    public Object instantiateItem(@NonNull ViewGroup container, int position) {
        LayoutInflater inflater =
                (LayoutInflater) container.getContext()
                        .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        int resId = 0;
        switch (position){
            case 0:
                resId = R.layout.page1;
                break;
            case 1:
                resId = R.layout.page2;
                break;
            case 2:
                resId = R.layout.page3;
                break;
        }

        View view = inflater.inflate(resId, container, false);
        container.addView(view);

        return view;
    }

    @Override
    public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
        container.removeView((View) object);
    }

    @Override
    public boolean isViewFromObject(@NonNull View view, @NonNull Object object) {
        return view == object;
    }
}
