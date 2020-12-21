//
//  ToDoListViewController.swift
//  To do list with tabbar(Swift5)
//
//  Created by Сергей Голенко on 21.12.2020.
//

import UIKit

class ToDoListViewController: UIViewController{
    
   let key = "111fgdsr465yhdh5ytyethwgdfsbw5yh41"
   private var itemsToDo : [String] = ["bay eggs"]
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadToDoItemsFromUserDefaults()
    }
    
    
 //uodate table and itemsToDo after adding new item
    override func viewWillAppear(_ animated: Bool) {
        loadToDoItemsFromUserDefaults()
        self.table.reloadData()
        
    }
    
  // delete item from table
 func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemsToDo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
        //save data after delete item in array
        UserDefaults.standard.set(itemsToDo, forKey: key)
    }

    
    
  //function for load data with UserDefaults
   private func loadToDoItemsFromUserDefaults(){
        if let arrayItems =  UserDefaults.standard.object(forKey: key) as? [String]{
            itemsToDo = arrayItems
        }
        
    }
}
    
    
    extension ToDoListViewController:UITableViewDelegate,UITableViewDataSource{
        
    //MARK:- TableView DataSource
    
    internal  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemsToDo.count
     }
     
     internal  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         let infoForCell = itemsToDo[indexPath.row]
         cell.textLabel?.text = infoForCell
         return cell
     }
}
