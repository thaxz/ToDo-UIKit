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
    var taskToEdit: Task?
    weak var editDelegate: TaskEditDelegate?
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: UI Setup
    
    private func setupUI() {
        setupTextView(titleTextView, withPlaceholder: "Digite o título da tarefa...")
        setupTextView(descriptionTextView, withPlaceholder: "Digite a descrição da tarefa...")
        
        if let task = taskToEdit {
            titleTextView.text = task.title
            descriptionTextView.text = task.taskDescription
            titleTextView.textColor = .black
            descriptionTextView.textColor = .black
            self.title = "Edit task"
        }
    }
    
    // MARK: Actions
    
    @IBAction func saveNewTask(_ sender: UIButton) {
        guard let title = titleTextView.text, !title.isEmpty,
              let description = descriptionTextView.text, !description.isEmpty else {
            displayAlert(message: "Por favor, preencha todos os campos.")
            return
        }
        
        if let task = taskToEdit {
            // Se taskToEdit não for nil, estamos editando uma tarefa existente.
            coreDataManager.updateTask(task: task, newTitle: title, newDescription: description)
            editDelegate?.didEditTask(task: task)
        } else {
            // Caso contrário, estamos adicionando uma nova tarefa.
            coreDataManager.createTask(title: title, description: description)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
