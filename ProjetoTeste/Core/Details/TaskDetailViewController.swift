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
    
    // MARK: Delegate
    
    func didEditTask(task: Task) {
        self.task = task
        setupUI()
    }
    
    // MARK: UI Setup
    
    private func setupUI() {
        if let task = task {
            taskTitleLabel.text = task.title
            taskDescriptionLabel.text = task.taskDescription
            if let dateCreated = task.dateCreated {
                creationDateLabel.text = DateFormatter.customDateFormatter.string(from: dateCreated)
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func editTask(_ sender: Any) {
        performSegue(withIdentifier: ProjectSegues.showEditView.rawValue, sender: task)
    }
    
    // MARK: Navigation
    
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
