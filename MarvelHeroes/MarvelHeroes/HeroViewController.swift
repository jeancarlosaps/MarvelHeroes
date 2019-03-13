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
  
  //MARK: - IBOutlets
  @IBOutlet weak var webViewHeroDetail: WKWebView!
  @IBOutlet weak var loading: UIActivityIndicatorView!
  
  //MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
