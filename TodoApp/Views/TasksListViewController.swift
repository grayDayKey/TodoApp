//
//  TasksListViewController.swift
//  TodoApp
//
//  Created by Sergey on 20.04.2025.
//

import UIKit

final class TasksListViewController: UIViewController, TaskListView {
    
    private var tasks: [TaskModel] = [
        TaskModel(title: "TITLE", order: 0)
    ]
    private var presenter: TaskListPresenter!
    private let tableView = UITableView()
    
    init(service: TasksService) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = TaskListPresenter(service: service, view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.renderTasks()
    }
    
    func render(_ state: TaskListViewState) {
        tasks = state.tasks
        tableView.reloadData()
    }
    
    private func setupUI() {
           view.addSubview(tableView)
           tableView.frame = view.bounds
           tableView.dataSource = self
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       }
}

extension TasksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = task.title
        config.secondaryText = task.isCompleted ? "✅" : "🕘"
        cell.contentConfiguration = config
        return cell
    }
}
