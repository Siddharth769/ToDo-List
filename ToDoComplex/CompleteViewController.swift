//
//  CompleteViewController.swift
//  ToDoComplex
//
//  Created by siddharth on 14/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
// Simple ToDo App

import UIKit

class CompleteViewController: UIViewController {

    var previousVC = ViewController()
    var previousIndex: ToDoCore?
    var index = 0
    
    @IBOutlet weak var taskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = previousIndex?.name
        
    }
    

    @IBAction func completeButton(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todo = previousIndex {
                context.delete(todo)
            }
            navigationController?.popViewController(animated: true)
        }
        
//        for todo in previousVC.toDos {
//            if todo.name == previousIndex?.name {
//                print("Found Selected Item")
//                previousVC.toDos.remove(at: index)
//                previousVC.tableView.reloadData()
//                navigationController?.popViewController(animated: true)
//                break
//            }
//            index += 1
//        }
    }
    

}
