//
//  HeroesTableViewController.swift
//  MarvelHeroes
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 11/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
  
  // MARK: - Properties
  var name: String?
  var heroes: [Hero] = []
  var loadingHeroes: Bool = true
  var offset = 0
  var total = 0
  
  // MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.backBarButtonItem?.title = ""
    label.text = "Search Heroes. Wait... "
    loadHeroes()
  }
  
  // MARK: - Internal Methods
  var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .white
    return label
  }()
  
  func loadHeroes() {
    loadingHeroes = false
    let offset = self.heroes.count == 0 ? 0 : self.heroes.count + 1
    
    MarvelAPI.loadHeroes(name: name, offset: offset) { (info) in
      if let info = info {
        self.heroes.append(contentsOf: info.data.results)
        self.total = info.data.total
        
        print("Total: ", self.total, "- Já incluídos", self.heroes.count)
        
        DispatchQueue.main.async {
          self.loadingHeroes = true
          self.label.text = "No heroes were found with the name \(self.name!)."
          self.tableView.reloadData()
        }
      }
    }
  }
  
  private func activity() -> UIView {
    let activityView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 80))
    let loadingTableView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    loadingTableView.startAnimating()
    loadingTableView.hidesWhenStopped = true
    loadingTableView.center = activityView.center
    activityView.backgroundColor = .black
    activityView.addSubview(loadingTableView)
    
    tableView.backgroundColor = .black
    return activityView
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! HeroViewController
    vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableView.backgroundView = heroes.count == 0 ? label : nil
    return heroes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
    
    let hero = heroes[indexPath.row]
    cell.configureCell(with: hero)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return activity()
  }
  
  // calling before the tableView shows a cell
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == heroes.count - 5 && loadingHeroes && heroes.count != total {
      self.loadHeroes()
      print("load more heroes")
    }
  }
}
