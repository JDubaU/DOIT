//
//  ToDoViewController.swift
//  DOIT
//
//  Created by Jake Wojtas on 2/25/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//  TO DO LIST
//  Add a ranking system that puts most important tasks on the top


import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
    
        if task.firstImportance {
            cell.textLabel?.text = "❗️\(task.name)"
        } else if task.secondImportance {
            cell.textLabel?.text = "❗️❗️\(task.name)"
        } else if task.thirdImportance {
            cell.textLabel?.text = "❗️❗️❗️\(task.name)"
        } else if task.noneImportance{
            cell.textLabel?.text = task.name
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the Dog"
        task1.firstImportance = false
        task1.secondImportance = false
        task1.thirdImportance = false
        task1.noneImportance = false
        
        let task2 = Task()
        task2.name = "FOLLOW YOUR DREAMS"
        task2.firstImportance = true
        task2.secondImportance = false
        task2.thirdImportance = false
        task2.noneImportance = false
        
        let task3 = Task()
        task3.name = "Buy textbooks"
        task3.firstImportance = false
        task3.secondImportance = false
        task3.thirdImportance = false
        task3.noneImportance = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

