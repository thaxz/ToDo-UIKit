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
    static let reuseIdentifier = "TaskCell"
}
