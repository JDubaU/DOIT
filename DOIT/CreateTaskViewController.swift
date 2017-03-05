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
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var exlaButton: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        // Create a Task from the outlet information
        
        if taskNameField.text == "" {
            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let task = Task(context: context)
            task.name = taskNameField.text!
            
            if (exlaButton.selectedSegmentIndex == 0) {
                task.noneImportance = true
                task.firstImportance = false
                task.secondImportance = false
                task.thirdImportance = false
            } else if (exlaButton.selectedSegmentIndex == 1) {
                task.noneImportance = false
                task.firstImportance = true
                task.secondImportance = false
                task.thirdImportance = false
            } else if (exlaButton.selectedSegmentIndex == 2) {
                task.noneImportance = false
                task.firstImportance = false
                task.secondImportance = true
                task.thirdImportance = false
            } else if (exlaButton.selectedSegmentIndex == 3) {
                task.noneImportance = false
                task.firstImportance = false
                task.secondImportance = false
                task.thirdImportance = true
            } else {
                task.noneImportance = false
                task.firstImportance = false
                task.secondImportance = false
                task.thirdImportance = false
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            
            // Pop Back
            
            // previousVC.tasks.append(task)
            // previousVC.tableView.reloadData()
            navigationController!.popViewController(animated: true)
        }
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
