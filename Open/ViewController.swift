//
//  ViewController.swift
//  Open
//
//  Created by marco on 19/03/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UIScrollViewDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.scrollView.delegate = self
        
        let myURL = URL(string:"https://www.open.online")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // disabilita il force touch
        webView.allowsLinkPreview = false
        
        // disabilita il pinch to zoom
        webView.scrollView.delegate = self

    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
             scrollView.pinchGestureRecognizer?.isEnabled = false
    }
}
