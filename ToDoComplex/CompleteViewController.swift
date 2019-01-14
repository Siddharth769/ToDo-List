//
//  CompleteViewController.swift
//  ToDoComplex
//
//  Created by siddharth on 14/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    var previousVC = ViewController()
    var previousIndex = ToDo()
    var index = 0
    
    @IBOutlet weak var taskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = previousIndex.name
        
    }
    

    @IBAction func completeButton(_ sender: Any) {
        for todo in previousVC.toDos {
            if todo.name == previousIndex.name {
                print("Found Selected Item")
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
    }
    

}
