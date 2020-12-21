//
//  AddItemViewController.swift
//  To do list with tabbar(Swift5)
//
//  Created by Сергей Голенко on 21.12.2020.
//

import UIKit

class AddItemViewController: UIViewController,UITextViewDelegate {
    
    let firstController = ToDoListViewController()
    var items: [String] = []
    
    
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBAction func addItebButton(_ sender: Any) {
        
        let  itemsObject = UserDefaults.standard.object(forKey:firstController.key)
       
        
        if let tempItems = itemsObject as? [String]{
            items = tempItems
            guard let item = addTextField.text else {return}
            items.append(item)
        } else {
            guard let item = addTextField.text else {return}
            items = [item]
        }
        
        
        UserDefaults.standard.set(items, forKey:firstController.key)
        
        addTextField.text = ""
                
        
        
        self.tabBarController?.selectedIndex = 0
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
