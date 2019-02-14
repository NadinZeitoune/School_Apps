//
//  ViewController.swift
//  IOS_UIWebView
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate{

    var webKit : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = prefs
        
        webKit = WKWebView(frame: view.frame, configuration: configuration)
        let url = URL(string: "http://www.ynet.co.il")
        let urlRequest = URLRequest(url: url!)
        webKit.load(urlRequest)
        webKit.navigationDelegate = self
        view.addSubview(webKit)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}










