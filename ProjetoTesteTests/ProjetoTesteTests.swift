//
//  ProjetoTesteTests.swift
//  ProjetoTesteTests
//

import XCTest
@testable import ProjetoTeste

final class ProjetoTesteTests: XCTestCase {
    
    var coreDataManager: CoreDataManager!
    
    override func setUpWithError() throws {
        coreDataManager = CoreDataManager.shared
    }
    
    override func tearDownWithError() throws {
        coreDataManager = nil
    }
    
    // Test to create a task and verify if it is stored properly in CoreData.
        func testTaskCreation() throws {
            // Given
            let title = "Test Task"
            let description = "Test Description"
            
            // When
            coreDataManager.createTask(title: title, description: description)
            
            // Tries to fetch the tasks and find the created one.
            let tasks = coreDataManager.fetchTasks()
            let createdTask = tasks.first { $0.title == title && $0.taskDescription == description }
            
            // Then
            XCTAssertNotNil(createdTask, "Failed to create and store the task in Core Data.")
        }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
