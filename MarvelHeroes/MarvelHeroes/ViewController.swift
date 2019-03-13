//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 08/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  var hero: Hero!

  //MARK: - IBOutlets
  @IBOutlet weak var tfSearchCharacters: UITextField!
  
  //MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! HeroesTableViewController
    tfSearchCharacters.resignFirstResponder()
    vc.name = tfSearchCharacters.text
  }
}
