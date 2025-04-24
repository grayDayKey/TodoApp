//
//  TasksService.swift
//  TodoApp
//
//  Created by Sergey on 20.04.2025.
//

import Foundation

protocol TasksService {
    func fetchAllTasks() -> [TaskModel]
    func fetchTask(withID id: UUID) -> TaskModel?
    func create(taskWithTitle title: String)
    func create(taskWithTitle title: String, order: Int)
    func rename(taskWithID id: UUID, to newTitle: String) throws
    func reorder(taskWithID id: UUID, to newOrder: Int) throws
    func remove(taskWithID id: UUID) throws
}

enum TaskError: Error {
    case taskNotFound
}
