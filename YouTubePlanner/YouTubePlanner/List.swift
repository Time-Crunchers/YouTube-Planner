//
//  List.swift
//  YouTubePlanner
//
//  Created by Dungeon Master on 5/9/19.
//  Copyright © 2019 Dungeon Master. All rights reserved.
//

import UIKit
class List: UIViewController {
    
    var notes = [Notes]()

    @IBAction func addButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter details?", message: "Enter your name and email", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            let idea = alertController.textFields?[0].text
            
           let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newNote = Notes(context: context)
            
            newNote.note = idea
             (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
}

