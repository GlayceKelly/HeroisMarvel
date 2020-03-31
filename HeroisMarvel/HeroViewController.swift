//
//  HeroViewController.swift
//  HeroisMarvel
//
//  Created by Eric Brito on 22/10/17.
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    //Variaveis da classe
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Obtem a url e monta a urlrequest
        let url = URL(string: hero.urls.first!.url)
        let request = URLRequest(url: url!)
        
        //Define o titulo da view
        title = hero.name
        
        //Carrega o webview
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension HeroViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
