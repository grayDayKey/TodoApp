//
//  InMemoryTaskRepository.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

import Foundation

final class InMemoryTaskRepository: TasksRepository {
    private var tasks: [TaskEntity] = []
    
    func fetchTasks() async throws -> [TaskEntity] {
        return tasks
    }
    
    func add(_ task: TaskEntity) {
        tasks.append(task)
    }
    
    func remove(_ task: TaskEntity) async throws -> Void {
        let indexOfTaskToRemove = tasks.firstIndex {
            $0.id == task.id
        }
        
        if (indexOfTaskToRemove != nil) {
            tasks.remove(at: indexOfTaskToRemove!)
        }
    }
    
    func update(_ task: TaskEntity) async throws -> Void {
        let indexOfTaskToUpdate = tasks.firstIndex {
            $0.id == task.id
        }
        
        if (indexOfTaskToUpdate != nil) {
            tasks[indexOfTaskToUpdate!] = task
        }
    }
    
    func find(by id: String) async throws -> TaskEntity? {
        return try await fetchTasks().first {
            $0.id == id
        }
    }
}
