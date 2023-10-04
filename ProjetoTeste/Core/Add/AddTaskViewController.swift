//
//  AddTaskViewController.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    private var coreDataManager = CoreDataManager.shared
    
    // MARK: Components
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    
    var taskToEdit: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = taskToEdit {
                    setupUI()
                }
    }
    
    private func setupUI() {
            if let task = taskToEdit {
                titleTextField.text = task.title
                descriptionTextField.text = task.taskDescription
                self.title = "Edit task"
            }
        }
    
    @IBAction func saveNewTask(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty,
                      let description = descriptionTextField.text, !description.isEmpty else {
                    // Mostrar um alerta ao usuário indicando que os campos são obrigatórios.
                    displayAlert(message: "Por favor, preencha todos os campos.")
                    return
                }
                if let task = taskToEdit {
                    // Se taskToEdit não for nil, estamos editando uma tarefa existente.
                    coreDataManager.updateTask(task: task, newTitle: title, newDescription: description)
                } else {
                    // Caso contrário, estamos adicionando uma nova tarefa.
                    coreDataManager.createTask(title: title, description: description)
                }
                // Após adicionar ou editar a tarefa, você pode retornar à tela anterior, por exemplo:
                navigationController?.popViewController(animated: true)
    }
    
    func displayAlert(message: String) {
            let alertController = UIAlertController(title: "Aviso", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }

}
