//
//  CompleteTaskViewController.swift
//  DOIT
//
//  Created by Jake Wojtas on 3/3/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task = Task()
    var previousVC = ToDoViewController()
    //var
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.firstImportance {
            taskLabel.text = "❗️\(task.name)"
        } else if task.secondImportance {
            taskLabel.text = "❗️❗️\(task.name)"
        } else if task.thirdImportance {
            taskLabel.text = "❗️❗️❗️\(task.name)"
        } else if task.noneImportance{
            taskLabel.text = task.name
        } else {
            taskLabel.text = task.name
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeButton(_ sender: UIButton) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
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
