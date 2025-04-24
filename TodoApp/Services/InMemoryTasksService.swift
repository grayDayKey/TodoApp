//
//  InMemoryTaskService.swift
//  TodoApp
//
//  Created by Sergey on 20.04.2025.
//

import Foundation

final class InMemoryTasksService: TasksService {
    
    private var tasks: [TaskModel] = [
        TaskModel(title: "Task", order: 0)
    ]
    
    func fetchAllTasks() -> [TaskModel] {
        return tasks
    }
    
    func fetchTask(withID id: UUID) -> TaskModel? {
        return fetchAllTasks().first {
            task in task.id == id
        }
    }
    
    func create(taskWithTitle title: String) {
        create(taskWithTitle: title, order: tasks.count)
    }
    
    func create(taskWithTitle title: String, order: Int) {
        tasks.append(
            TaskModel(title: title, order: order)
        )
    }
    
    func rename(taskWithID id: UUID, to newTitle: String) throws {
        try update(taskWithId: id) { taskToUpdate in
            taskToUpdate.update(title: newTitle)
        }
    }
    
    func reorder(taskWithID id: UUID, to newOrder: Int) throws {
        try update(taskWithId: id) { taskToUpdate in
            taskToUpdate.update(order: newOrder)
        }
        
    }
    
    func remove(taskWithID id: UUID) throws {
        let indexOfTaskToUpdate = try index(ofTaskWithID: id)
        
        if !tasks.isEmpty {
            tasks.remove(at: indexOfTaskToUpdate)
        }
    }
    
    private func index(ofTaskWithID id: UUID) throws -> Int {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == id }) else {
            throw TaskError.taskNotFound
        }
        
        return taskIndex
    }
    
    private func update(taskWithId id: UUID, _ mutate: (inout TaskModel) -> Void) throws {
        let indexOfTaskToUpdate = try index(ofTaskWithID: id)
        
        mutate(&tasks[indexOfTaskToUpdate])
    }
}
