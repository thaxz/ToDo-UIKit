//
//  Task+CoreDataProperties.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//
//

import Foundation
import CoreData

// Code representation of DataModel

extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var taskDescription: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: UUID?

}

extension Task : Identifiable {

}

@objc(Task)
public class Task: NSManagedObject {

}
