package com.company.hackeru.a3119_working_with_files;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.Set;

public class MainActivity extends Activity {

    public static final String PREFS = "prefs";
    public static final String CIRCLE = "circle";
    public static final String CIRCLES = "circles";
    public static final String MY_FILE_TXT = "my_file.txt";
    public static final String TAG = "tag";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //saveStringToFile("hello world");
        String contentFromFile = readStringFromFile();
        Log.d(TAG, "content: "+ contentFromFile);

        /*Circle circle = new Circle(4,5,6);
        saveCircleToSharedPrefs(circle);*/
        /*Circle circle = loadCircleFromSharedPrefs();
        Log.d("tag", "Circle:"+circle.toQueryString());*/

        //saveStringToExternalStorage("hello");
        String s = readStringFromExternalStorage();
        Log.d(TAG ,s);
    }

    private void saveStringToExternalStorage(String s){
        //File externalStorageFile = new File(getExternalFilesDir(null), MY_FILE_TXT);
        File externalStorageFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), MY_FILE_TXT);

        OutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(externalStorageFile);
            outputStream.write(s.getBytes());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private String readStringFromExternalStorage(){
        File externalStorageFile = new File(getExternalFilesDir(null), MY_FILE_TXT);
        InputStream inputStream = null;

        try {
            inputStream = new FileInputStream(externalStorageFile);
            byte[] buffer = new byte[1024];
            int actuallyRead = inputStream.read(buffer);
            if (actuallyRead != -1){
                String contentOfFile = new String(buffer, 0, actuallyRead);
                return contentOfFile;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }

    private String readStringFromFile(){

        InputStream inputStream = null;

        try {
            inputStream = openFileInput(MY_FILE_TXT);
            byte[] buffer = new byte[1024];
            int actuallyRead = inputStream.read(buffer);
            if (actuallyRead != -1){
                String contentOfFile = new String(buffer, 0, actuallyRead);
                return contentOfFile;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }

    private void saveStringToFile(String s){
        OutputStream outputStream = null;
        try {
            outputStream = openFileOutput(MY_FILE_TXT, MODE_PRIVATE);
            outputStream.write(s.getBytes());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void saveCircleToSharedPrefs(Circle circle){
        SharedPreferences prefs = getSharedPreferences(PREFS, MODE_PRIVATE);
        Set<String> circlesAsStrings = prefs.getStringSet(CIRCLES, new HashSet<String>());
        circlesAsStrings.add(circle.toQueryString());
        SharedPreferences.Editor editor = prefs.edit();
        editor.putStringSet(CIRCLES, circlesAsStrings);
        editor.commit();
    }

    private Set<Circle> loadCircleFromSharedPrefs(){
        SharedPreferences prefs = getSharedPreferences(PREFS, MODE_PRIVATE);
        if (prefs.contains(CIRCLES)){
            Set<String> circlesAsStrings = prefs.getStringSet(CIRCLES, null);
            Set<Circle> circles = new HashSet<>();
            for (String circlesAsString : circlesAsStrings) {
                circles.add(new Circle(circlesAsString));
            }
            return circles;
        }
        return null;
    }
}
