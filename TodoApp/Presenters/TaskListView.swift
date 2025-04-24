//
//  TaskListView.swift
//  TodoApp
//
//  Created by Sergey on 19.04.2025.
//

protocol TaskListView: AnyObject {
    func render(_ state: TaskListViewState)
}
