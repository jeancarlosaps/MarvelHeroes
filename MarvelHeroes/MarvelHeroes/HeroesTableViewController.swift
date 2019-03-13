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
  var loadingHeroes: Bool = false
  var currentPage = 0
  var total = 0
  
  
  // MARK: - IBOutlets
  
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
    loadingHeroes = true
    MarvelAPI.loadHeroes(name: name, page: currentPage) { (info) in
      if let info = info {
        self.heroes += info.data.results
        self.total = info.data.total
        
        print("Total: ", self.total, "- Já incluídos", self.heroes.count)
        
        DispatchQueue.main.async {
          self.loadingHeroes = false
          self.label.text = "No heroes were found with the name \(self.name!)."
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    tableView.backgroundView = heroes.count == 0 ? label : nil
    return heroes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
    
    let hero = heroes[indexPath.row]
    cell.configureCell(with: hero)
    
    return cell
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }

   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
