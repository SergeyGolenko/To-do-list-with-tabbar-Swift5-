//
//  ToDoListViewController.swift
//  To do list with tabbar(Swift5)
//
//  Created by Сергей Голенко on 21.12.2020.
//

import UIKit

class ToDoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let key = "1111"
    
    var itemsToDo : [String] = ["bay eggs"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let infoForCell = itemsToDo[indexPath.row]
        cell.textLabel?.text = infoForCell
        return cell
    }
    
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadToDoItemsFromUserDefaults()

    }
    
    
    func loadToDoItemsFromUserDefaults(){
        if let arrayItems =  UserDefaults.standard.object(forKey: key) as? [String]{
            itemsToDo = arrayItems
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
