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
    func save(){
        do {
            try context.save()
        } catch(let error){
            print("Error saving core data \(error.localizedDescription)")
        }
    }
    
    // MARK: Fetch
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("error fetching \(error)")
            return []
        }
    }
    
    // MARK: CRUD FUNCTIONS
    
    ///Create
    func createTask(title: String, description: String) {
        let task = Task(context: context)
        task.id = UUID()
        task.title = title
        task.taskDescription = description
        task.dateCreated = Date()
        save()
    }
    
    /// Remove
    func delete(task: Task){
        context.delete(task)
        save()
    }
    

    /// Update
    func updateTask(task: Task, newTitle: String, newDescription: String){
        task.title = newTitle
        task.taskDescription = newDescription
        save()
    }
    
    
}
