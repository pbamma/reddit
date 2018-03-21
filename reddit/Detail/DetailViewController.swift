//
//  DetailViewController.swift
//  reddit
//
//  Created by Philip Starner on 3/20/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let webView = UIWebView(frame: self.view.frame)
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
