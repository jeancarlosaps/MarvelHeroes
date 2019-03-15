//
//  HeroViewController.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 11/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
  
  //MARK: - Properties
  var hero: Hero!
  
  //MARK: - IBOutlets
  @IBOutlet weak var webViewHeroDetail: WKWebView!
  @IBOutlet weak var loading: UIActivityIndicatorView!
  
  //MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    webViewConfiguration()
  }
  
  func webViewConfiguration() {
    let url = URL(string: hero.urls.first!.url)
    let request = URLRequest(url: url!)
    
    title = hero.name
    
    webViewHeroDetail.allowsBackForwardNavigationGestures = true
    webViewHeroDetail.navigationDelegate = self
    webViewHeroDetail.load(request)
  }
}

extension HeroViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    self.loading.stopAnimating()
    self.loading.hidesWhenStopped = true
  }
}
