//
//  TaskListPresenter.swift
//  TodoApp
//
//  Created by Sergey on 19.04.2025.
//

final class TaskListPresenter {
    
    private weak var view: TaskListView?
    private let service: TasksService
    
    init(service: TasksService, view: TaskListView) {
        self.service = service
        self.view = view
    }
    
    func renderTasks() {
        let tasks = service.fetchAllTasks()
        view?.render(TaskListViewState(tasks: tasks))
    }
    
    func create(taskWithTitle title: String) {
        service.create(taskWithTitle: title)
        renderTasks()
    }
}
