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
    
    func testExample() throws {
        /// given
        let title = "Test Task"
        let description = "Test Description"
        coreDataManager.createTask(title: title, description: description)
        
        ///when
        // Tenta encontrar a tarefa
        let tasks = coreDataManager.fetchTasks()
        let createdTask = tasks.first { $0.title == title && $0.taskDescription == description }
        ///then
        XCTAssertNotNil(createdTask)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
