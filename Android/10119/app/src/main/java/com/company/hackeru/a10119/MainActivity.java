package com.company.hackeru.a10119;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity {

    private RecyclerView recyclerView;
    private RecyclerView.Adapter adapter;
    private RecyclerView.LayoutManager layoutManager;
    private List<String> strings;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        strings = new ArrayList<>();
        for (int i = 1000; i < 2000; i++) {
            strings.add(String.valueOf(i));
        }
        recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        adapter = new MyAdapter(strings);
        recyclerView.setAdapter(adapter);
    }

    @SuppressLint("StaticFieldLeak")
    private void exampleOfAsyncTaskWithProgress(){
        new AsyncTask<Void, Integer, Boolean>(){

            @Override
            protected Boolean doInBackground(Void... voids) {
                URL url = null;
                InputStream inputStream = null;
                OutputStream outputStream = null;
                HttpURLConnection connection = null;

                try{
                    url = new URL("http://www.ynet.co.il");
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setUseCaches(false);
                    connection.setDoOutput(false);
                    connection.setRequestMethod("GET");
                    connection.connect();

                    byte[] buffer = new byte[1024];
                    int actuallyRead;
                    File file = new File(getFilesDir(), "lion.jpg");
                    outputStream = openFileOutput("lion.jpg", MODE_PRIVATE);
                    while ((actuallyRead = inputStream.read(buffer))!= -1){
                        outputStream.write(buffer, 0 , actuallyRead);
                    }
                    return true;
                } catch (java.io.IOException e) {
                    e.printStackTrace();
                } finally {
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (connection != null) {
                        connection.disconnect();
                    }
                }

                return false;
            }

            @Override
            protected void onProgressUpdate(Integer... values) {
                super.onProgressUpdate(values);
            }

            @Override
            protected void onPostExecute(Boolean aBoolean) {
                super.onPostExecute(aBoolean);
            }
        }.execute();
    }
}
