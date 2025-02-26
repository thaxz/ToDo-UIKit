//
//  TaskDetailViewController.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskEditDelegate {
    
    // MARK: Outlets
    
    @IBOutlet var taskTitleLabel: UILabel!
    @IBOutlet var taskDescriptionLabel: UILabel!
    @IBOutlet var creationDateLabel: UILabel!
    
    // MARK: Properties
    
    var task: Task?
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: TaskEditDelegate Method
    
    /// Updates the task details after editing
    func didEditTask(task: Task) {
        self.task = task
        setupUI()
    }
    
    // MARK: UI Setup
    
    /// Configures UI with task details.
    private func setupUI() {
        if let task = task {
            taskTitleLabel.text = task.title
            taskDescriptionLabel.text = task.taskDescription
            if let dateCreated = task.dateCreated {
                let formattedLabel = DateFormatter.customDateFormatter.string(from: dateCreated)
                creationDateLabel.text = formattedLabel
            }
        }
    }
    
    // MARK: Actions
    
    /// Handles the edit button action and performs segue for editing the task.
    @IBAction func editTask(_ sender: Any) {
        performSegue(withIdentifier: ProjectSegues.showEditView.rawValue, sender: task)
    }
    
    // MARK: Navigation
    
    /// Prepares for navigation and passes the task for editing.
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
