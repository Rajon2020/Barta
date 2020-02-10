//
//  WebViewController.swift
//  Barta
//
//  Created by apple on 2/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    var webView: WKWebView!
    var address:String = ""
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        DispatchQueue.main.async {
            let url = URL(string: self.address)!
            self.webView.load(URLRequest(url: url))
        }
       
          
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    title = webView.title
    }

}
