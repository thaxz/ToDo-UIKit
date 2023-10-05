//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var noTasksView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var numberOfTasksLabel: UILabel!
    
    // MARK: Properties
    
    let coreDataManager = CoreDataManager.shared
    var tasks: [Task] = []
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.leftBarButtonItem = editButtonItem
        reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    // MARK: Setup
    
    func reloadData(){
        tasks = coreDataManager.fetchTasks()
        noTasksView.isHidden = !tasks.isEmpty
        tableView.reloadData()
        numberOfTasksLabel.text = "Tarefas: \(tasks.count)"
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TaskDetailViewController,
           let task = sender as? Task {
            destinationVC.task = task
        }
    }
    
}

