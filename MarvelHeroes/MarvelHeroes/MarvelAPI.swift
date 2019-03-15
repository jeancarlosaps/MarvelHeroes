//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 12/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

class MarvelAPI {
  static private let basePath = "http://gateway.marvel.com/v1/public/characters?"
  static private let privateKey = "1770ceb17e7159abcf1fba276662443a204e38d5"
  static private let publicKey = "13bf281feb4982518242da6b4066437d"
  static private let limit = 20
  
  class func loadHeroes(name: String?, offset: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
    let startsWith: String
    
    if let name = name, !name.isEmpty {
      startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
    } else {
      startsWith = ""
    }
    
    let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
//    let url = basePath + startsWith + getCredentials()
    print(url)
    
    Alamofire.request(url).responseJSON { (response) in
      guard let data = response.data,
            let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
        marvelInfo.code == 200 else {
          onComplete(nil)
          return
      }
      onComplete(marvelInfo)
    }
  }
  
  private class func getCredentials() -> String {
    let timestamp = String(NSDate().timeIntervalSince1970)
    let hash = "\(timestamp)\(privateKey)\(publicKey)".md5()
    
    return "ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)" // Parameters to mount URL: chave=valor&
  }
}
