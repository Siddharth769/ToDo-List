//
//  ViewController.swift
//  ToDoComplex
//
//  Created by siddharth on 14/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!

    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        toDos = createToDo()
        tableView.reloadData()
    }

    @IBAction func addButton(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = toDos[indexPath.row]
        if todo.important {
            cell.textLabel?.text = "❗️" + todo.name!
        } else {
            cell.textLabel?.text = "     " + todo.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDos[indexPath.row]
        performSegue(withIdentifier: "taskDetailSegue", sender: todo)
    }
    
    func createToDo() -> [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = false
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        dog.important = true
        
        let tv = ToDo()
        tv.name = "Record tv show"
        tv.important = false
        return [eggs, dog, tv]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let todosVC = segue.destination as? ToDosViewController {
            todosVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
            
            if let toDo = sender as? ToDo {
                completeVC.previousIndex = toDo
                completeVC.previousVC = self
            }
           
        }
    }
    
}

