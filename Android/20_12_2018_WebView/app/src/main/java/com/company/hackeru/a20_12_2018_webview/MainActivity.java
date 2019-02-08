package com.company.hackeru.a20_12_2018_webview;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {

    private WebView webView1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        webView1 = findViewById(R.id.webView1);
        webView1.setWebViewClient(new MyWebViewClient());
        WebSettings webSettings = webView1.getSettings();
        webSettings.setBuiltInZoomControls(true);
        //webView1.loadUrl("http://www.cnn.com");
        String html = "<html><head></head><body><h1>Hi</h1><p>this is my paragraph</p></body></html>";
        webView1.loadData(html, "text/html", "utf-8");
    }

    private class MyWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            return false;
        }
    }
}
