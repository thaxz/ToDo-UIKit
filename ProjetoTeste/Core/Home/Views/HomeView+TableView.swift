//
//  HomeView+TableView.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import UIKit

// Configuring TableView

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseIdentifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
           let task = tasks[indexPath.row]
           cell.titleLabel.text = task.title
           return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: ProjectSegues.showDetailView.rawValue, sender: task)
    }
    
}
