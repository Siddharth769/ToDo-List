//
//  ToDosViewController.swift
//  ToDoComplex
//
//  Created by siddharth on 14/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class ToDosViewController: UIViewController {

    var previousVC = ViewController()
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let todo = ToDoCore(entity: ToDoCore.entity(), insertInto: context)
                if let taskText = taskName.text {
                            todo.name = taskText
                            todo.important = importanceSwitch.isOn
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
        
        
    }

   

}
