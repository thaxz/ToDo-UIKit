//
//  TaskDetailViewController.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskEditDelegate {
    
    // MARK: Components
    
    @IBOutlet var taskTitleLabel: UILabel!
    @IBOutlet var taskDescriptionLabel: UILabel!
    @IBOutlet var creationDateLabel: UILabel!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let task = task {
            taskTitleLabel.text = task.title
            taskDescriptionLabel.text = task.taskDescription
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            if let dateCreated = task.dateCreated {
                creationDateLabel.text = dateFormatter.string(from: dateCreated)
            }
        }
    }
    
    func didEditTask(task: Task) {
        self.task = task
        setupUI()
    }
    
    @IBAction func editTask(_ sender: Any) {
        performSegue(withIdentifier: ProjectSegues.showEditView.rawValue, sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ProjectSegues.showEditView.rawValue {
                   if let destinationVC = segue.destination as? AddTaskViewController,
                      let taskToEdit = sender as? Task {
                       destinationVC.taskToEdit = taskToEdit
                       destinationVC.editDelegate = self
                   }
               }
    }
    
}
