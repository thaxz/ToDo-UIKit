//
//  TaskTableViewCell.swift
//  ProjetoTeste
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: Properties
    /// Reuse identifier for dequeuing cells in the table view.
    static let reuseIdentifier = "TaskCell"
}
