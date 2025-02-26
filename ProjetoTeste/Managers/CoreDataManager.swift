//
//  CoreDataManager.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    /// Shared instance
    static let shared = CoreDataManager()
    
    /// Persistence objects
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    /// Initializes Core Data container and context.
    init(){
        container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error.localizedDescription)")
            }
        }
        context = container.viewContext
        print("working")
    }
    
    /// Saves into Core Data .
    func save(){
        do {
            try context.save()
        } catch(let error){
            print("Error saving core data \(error.localizedDescription)")
        }
    }
    
    // MARK: CRUD
    
    /// Creates a new task and saves it to Core Data.
    /// - Parameters:
    ///   - title: The title of the task.
    ///   - description: A detailed description of the task.
    func createTask(title: String, description: String) {
        let task = Task(context: context)
        task.id = UUID()
        task.title = title
        task.taskDescription = description
        task.dateCreated = Date()
        save()
    }
    
    /// Fetches all tasks stored in Core Data.
    /// - Returns: An array of `Task` objects, or an empty array if fetching fails.
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("error fetching \(error)")
            return []
        }
    }
    
    /// Updates an existing task's title and description.
    /// - Parameters:
    ///   - task: The `Task` object to update.
    ///   - newTitle: The new title for the task.
    ///   - newDescription: The new description for the task.
    func updateTask(task: Task, newTitle: String, newDescription: String){
        task.title = newTitle
        task.taskDescription = newDescription
        save()
    }
    
    /// Deletes a specified task from Core Data.
    /// - Parameter task: The `Task` object to be deleted.
    func delete(task: Task){
        context.delete(task)
        save()
    }
}
