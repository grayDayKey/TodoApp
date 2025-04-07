//
//  TaskService.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

final class TasksService {
    private let tasksRepository: TasksRepository
    
    init(_ tasksRepository: TasksRepository) {
        self.tasksRepository = tasksRepository
    }
    
    func fetchTasks() async throws -> [TaskEntity] {
        // TODO - add memoization for tasks
        let tasks = try await tasksRepository.fetchTasks()
        return tasks
    }
    
    func createTask(with title: String) async throws {
        let uiniqTitle = try await creatUniqueTitle(desierd: title, existing: getTaskTitles())
        let newOrder = try await getLastTaskOreder() + 1
        let newTask = TaskEntity(title: uiniqTitle, order: newOrder)
        try await tasksRepository.add(newTask)
    }
    
    func renameTask(with id: String, to newTitle: String) async throws {
        let uiniqTitle = try await creatUniqueTitle(desierd: newTitle, existing: getTaskTitles())

        guard var taskToRename = try await tasksRepository.find(by: id)  else {
            fatalError("Trying to rename task, but there is no task with id: \(id)")
        }
        
        taskToRename.update(title: uiniqTitle)
        try await tasksRepository.update(taskToRename)
    }
    
    func removeTask(with id: String) async throws {
        guard let taskToRemove = try await tasksRepository.find(by: id)  else {
            fatalError("Trying to remove task, but there is no task with id: \(id)")
        }
        
        try await tasksRepository.remove(taskToRemove)
    }
    
    func reorderTask(with id: String, to position: Int) async throws {
        guard var taskToReorder = try await tasksRepository.find(by: id)  else {
            fatalError("Trying to reorder task, but there is no task with id: \(id)")
        }
        
        taskToReorder.update(order: position)
        
        // TODO - find sibilings and reorder them too
        
        try await tasksRepository.update(taskToReorder)
    }
    
    private func getTaskTitles() async throws -> [String] {
        let tasks = try await fetchTasks()
        return getAllTitles(from: tasks)
    }
    
    private func getLastTaskOreder() async throws -> Int {
        let tasks = try await fetchTasks()
        return tasks.last?.order ?? -1
    }
}
