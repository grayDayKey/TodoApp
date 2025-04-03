//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Sergey on 03.04.2025.
//

import Testing
@testable import TodoApp

struct TaskEntityTests {

    @Test func testInitialization() async throws {
        let expectedTitle = "Test task"
        let expectedOrder = 0
        let expectedIsCompleted = false
        let task = TaskEntity(title: expectedTitle, order: expectedOrder)
        #expect(task.id != nil)
        #expect(task.title == expectedTitle)
        #expect(task.isCompleted == expectedIsCompleted)
        #expect(task.order == expectedOrder)
    }
    
    @Test func testToggleCompletion() async throws {
        var task = TaskEntity(title: "Toggleable task", order: 0)
        #expect(task.isCompleted == false)
        task.toggleCompleted()
        #expect(task.isCompleted == true)
        task.toggleCompleted()
        #expect(task.isCompleted == false)
    }
    
    @Test func testUpdateTaskEntity() async throws {
        var task = TaskEntity(title: "Test task", order: 0)
        let expectedTitle = "Changed task"
        let expectedIsCompleted = true
        let expectedOrder = 1
        task.update(title: expectedTitle, isCompleted: expectedIsCompleted, order: expectedOrder)
        #expect(task.title == expectedTitle)
        #expect(task.isCompleted == expectedIsCompleted)
        #expect(task.order == expectedOrder)
    }

}
