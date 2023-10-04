//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class HomeViewController: UIViewController {
    
    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var tableView: UITableView!
    
    /// Gerenciador de tarefas
    private let coreDataManager = CoreDataManager.shared
    private var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func reloadData(){
        tasks = coreDataManager.fetchTasks()
        tableView.reloadData()
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
            let task = tasks[indexPath.row]
            cell.titleLabel.text = task.title
            return cell
        }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "showTaskDetailSegue", sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TaskDetailViewController,
           let task = sender as? Task {
            destinationVC.task = task
        }
    }
}
