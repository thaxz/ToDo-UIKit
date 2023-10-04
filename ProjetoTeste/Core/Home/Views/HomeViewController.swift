//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class HomeViewController: UIViewController {
    
    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var tableView: UITableView!
    
    /// Gerenciador de tarefas
    let coreDataManager = CoreDataManager.shared
    var tasks: [Task] = []
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TaskDetailViewController,
           let task = sender as? Task {
            destinationVC.task = task
        }
    }
    
}

