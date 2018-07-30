//
//  ArticleWebViewController.swift
//  NewsML
//
//  Created by Ross Lubinski on 7/28/18.
//  Copyright © 2018 Ross Lubinski. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController {
    
    var article = Article()

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: article.url) {
            webView.load(URLRequest(url: url))
        }
    }

}
