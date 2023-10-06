//
//  CoreDataManager.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
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
    
    // MARK: Save
    /// Saves into Core Data .
    func save(){
        do {
            try context.save()
        } catch(let error){
            print("Error saving core data \(error.localizedDescription)")
        }
    }
    
    // MARK: CRUD
    
    /// Create
    /// Creates a new task with the provided title and description.
    func createTask(title: String, description: String) {
        let task = Task(context: context)
        task.id = UUID()
        task.title = title
        task.taskDescription = description
        task.dateCreated = Date()
        save()
    }
    
    /// Fetch
    /// Fetches all tasks from Core Data.
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("error fetching \(error)")
            return []
        }
    }
    
    /// Update
    /// Updates the title and description of the task in
    func updateTask(task: Task, newTitle: String, newDescription: String){
        task.title = newTitle
        task.taskDescription = newDescription
        save()
    }
    
    /// Delete
    /// Removes the specified task from Core Data.
    func delete(task: Task){
        context.delete(task)
        save()
    }
}
