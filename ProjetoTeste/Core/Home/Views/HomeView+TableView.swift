//
//  HomeView+TableView.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import UIKit

// MARK: Extension to configure TableView

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Returns the number of rows in the table view, equal to the number of tasks in CoreData
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    /// Configures and returns a custom cell for the specified row index path.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseIdentifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let task = tasks[indexPath.row]
        cell.titleLabel.text = task.title
        cell.descriptionLabel.text = task.taskDescription
        return cell
    }
    
    /// Handles selection of a row by performing a segue to show the details of the selected task
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: ProjectSegues.showDetailView.rawValue, sender: task)
    }
    
    /// Handles deletion of tasks when viewController's editing mode is activated
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            coreDataManager.delete(task: task)
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            reloadData()
        }
    }
    
}
