//
//  CreateTaskViewController.swift
//  DOIT
//
//  Created by Jake Wojtas on 2/27/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var exlaButton: UISegmentedControl!
    
    
    
    
    
    var previousVC = ToDoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        // Create a Task from the outlet information
        
        let task = Task()
        task.name = taskNameField.text!
        task.importance = importanceSwitch.isOn
        
        // Add a new task to the array
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
