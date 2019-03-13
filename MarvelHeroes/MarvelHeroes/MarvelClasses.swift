//
//  MarvelClasses.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 12/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import Foundation

struct MarvelInfo: Codable {
  let code: Int
  let status: String
  let data: MarvelData
}

struct MarvelData: Codable {
  let offset: Int
  let limit: Int
  let total: Int
  let count: Int
  let results: [Hero]
}

struct Hero: Codable {
  let id: Int
  let name: String
  let description: String
  let thumbnail: Thumbnail
  let urls: [HeroURL]
}

struct Thumbnail: Codable {
  let path: String
  let ext: String
  
  var url: String {
    return path + "." + ext
  }
  
  // DE - PARA, quando se é necessário utilizar alguma palavra reservada
  enum CodingKeys: String, CodingKey {
    case path
    case ext = "extension"
  }
}

struct HeroURL: Codable {
  let type: String
  let url: String
}
