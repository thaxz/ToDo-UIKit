//
//  AddTaskViewController.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import UIKit

protocol TaskEditDelegate: AnyObject {
    func didEditTask(task: Task)
}

class AddTaskViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var descriptionTextView: UITextView!
    
    // MARK: Properties
    
    private var coreDataManager = CoreDataManager.shared
    weak var editDelegate: TaskEditDelegate?
    
    // Represents if there's a task being edited
    var taskToEdit: Task?
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupUI()
    }
    
    // MARK: Setup
    
    /// Configures UI elements and TextView placeholders.
    /// The view becomes an edit view if receiving an existing task and a add new task view if not.
    private func setupUI() {
        setupTextView(titleTextView, withPlaceholder: "Digite o título da tarefa")
        setupTextView(descriptionTextView, withPlaceholder: "Digite a descrição da tarefa")
        
        if let task = taskToEdit {
            titleTextView.text = task.title
            descriptionTextView.text = task.taskDescription
            titleTextView.textColor = .black
            descriptionTextView.textColor = .black
            self.title = "Edit task"
        }
    }
    
    // MARK: Actions
    
    /// Handles the save button action and either creates a new task or updates an existing one.
    @IBAction func saveNewTask(_ sender: UIButton) {
        guard let title = titleTextView.text,
              let description = descriptionTextView.text,
              // Ensures the title is not the default placeholder text.
              title != "Digite o título da tarefa",
              description != "Digite a descrição da tarefa" else {
            // Displays an alert if the text or is empty or contains placeholder
            displayAlert(message: "Por favor, preencha todos os campos.")
            return
        }
        if let task = taskToEdit {
            // If taskToEdit is not nil, we are editing an existing task.
            coreDataManager.updateTask(task: task,
                                       newTitle: title,
                                       newDescription: description)
            editDelegate?.didEditTask(task: task)
        } else {
            // Otherwise, we are adding a new task.
            coreDataManager.createTask(title: title, description: description)
        }
        navigationController?.popViewController(animated: true)
    }
}
