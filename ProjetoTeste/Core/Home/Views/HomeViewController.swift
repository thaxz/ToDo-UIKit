//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class HomeViewController: UIViewController {

    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var tableView: UITableView!

    /// Gerenciador de tarefas
    let taskManager = TaskManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        taskManager.loadTasks()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.getTasks().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = taskManager.getTasks()[indexPath.row]
        cell.titleLabel.text = task.title
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    // TODO: implementar comportamento ao selecionar uma tarefa
}
