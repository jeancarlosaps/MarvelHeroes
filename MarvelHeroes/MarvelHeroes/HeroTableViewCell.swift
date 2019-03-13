//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 12/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
  
  //MARK: - Properties
  
  //MARK: - IBOutlets
  @IBOutlet weak var imgHero: UIImageView!
  @IBOutlet weak var lblHeroName: UILabel!
  @IBOutlet weak var lblHeroDescription: UILabel!
  
  //MARK: - Super Methods
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Internal Methods
  func configureCell(with hero: Hero) {
    lblHeroName.text = hero.name
    lblHeroDescription.text = hero.description
    
    //Download images
    if let url = URL(string: hero.thumbnail.url) {
      imgHero.kf.indicatorType = .activity
      imgHero.kf.setImage(with: url)
    } else {
      imgHero.image = nil
    }
    
    imgHero.layer.cornerRadius = imgHero.frame.size.height/2
    imgHero.layer.borderColor = UIColor.red.cgColor
    imgHero.layer.borderWidth = 2
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
