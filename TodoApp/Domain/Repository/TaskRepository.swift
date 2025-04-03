//
//  TaskRepository.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

import Foundation

protocol TaskRepository {
    func fetchTasks() async throws -> [TaskEntity]
    func add(_ task: TaskEntity) async throws -> Void
    func remove(_ task: TaskEntity) async throws -> Void
    func update(_ task: TaskEntity) async throws -> Void
    func find(by id: String) async throws -> TaskEntity?
}
