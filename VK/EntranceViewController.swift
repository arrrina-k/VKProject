//
//  EntranceViewController.swift
//  VK
//
//  Created by Арина Кривенко on 27.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit
import WebKit

class EntranceViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataWithUrl()
    }
    
    func getDataWithUrl() {
//        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=7682293&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52") else { return }
//
//        let session = URLSession.shared
        
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7682293"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "6e001d0aed48df83dbc5bf337959af5dbcdf02bb569d91a5aecc1e866b0492a66b3b42150ddd571219927"),
                    URLQueryItem(name: "v", value: "5.52")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                webView.load(request)
    
    }
}


