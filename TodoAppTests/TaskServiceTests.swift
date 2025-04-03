//
//  TaskServiceTests.swift
//  TodoAppTests
//
//  Created by Sergey on 04.04.2025.
//

import Testing
@testable import TodoApp

struct TaskServiceTests {

    @Test func testCreateTask() async throws {
        let taskService = TaskService(InMemoryTaskRepository())
        let expectedTitle = "Test task"
        try await taskService.createTask(with: expectedTitle)
        let tasks = try await taskService.fetchTasks()
        #expect(tasks.count == 1)
        #expect(tasks.first?.title == expectedTitle)
    }
    
    @Test func testRemoveTask() async throws {
        let taskService = TaskService(InMemoryTaskRepository())
        try await taskService.createTask(with: "Test task")
        let tasks = try await taskService.fetchTasks()
        let taskId = try #require(tasks.first?.id)
        try await taskService.removeTask(with: taskId)
        let newTasks = try await taskService.fetchTasks()
        #expect(newTasks.isEmpty)
    }
    
    // TODO - add reorder test cases
}
