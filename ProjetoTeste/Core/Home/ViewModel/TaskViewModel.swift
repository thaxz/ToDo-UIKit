//
//  TaskViewModel.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import CoreData

class TaskViewModel {
    private let coreDataManager = CoreDataManager.shared

    // MARK: CRUD Functions
    func createTask(title: String, description: String) -> Task {
        return coreDataManager.createTask(title: title, description: description)
    }

    func deleteTask(task: Task) {
        coreDataManager.delete(task: task)
    }

    func updateTask(task: Task, newTitle: String, newDescription: String) {
        coreDataManager.updateTask(task: task, newTitle: newTitle, newDescription: newDescription)
    }

    func getTasks() -> [Task] {
        return coreDataManager.fetchTasks()
    }
}
