//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    let coreDataManager = CoreDataManager.shared
    var tasks: [Task] = []
    
    // MARK: View Lifecycle
    
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
    
    // MARK: Setup
    
    private func reloadData(){
        tasks = coreDataManager.fetchTasks()
        tableView.reloadData()
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TaskDetailViewController,
           let task = sender as? Task {
            destinationVC.task = task
        }
    }
    
}

