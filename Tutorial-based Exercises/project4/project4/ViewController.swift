//
//  ViewController.swift
//  project4
//
//  Created by Sonja Ek on 1.3.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        // Delegate is something acting in place of another; asking questions etc on its behalf:
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.sonjaek.com")! // Force unwrapping is ok bc this is hand-typed
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

