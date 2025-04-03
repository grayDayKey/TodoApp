//
//  TaskEntity.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

import Foundation

struct TaskEntity: Identifiable, Timestamped, Titled {
    let id: String = UUID().uuidString
    let createdAt: Date = Date()
    var updatedAt: Date? = nil
    private(set) var isCompleted: Bool = false
    private(set) var title: String
    private(set) var order: Int
    
    init(title: String, order: Int) {
        self.title = title
        self.order = order
    }
    
    mutating func update(title: String? = nil, isCompleted: Bool? = nil, order: Int? = nil)  {
        self.title = title ?? self.title
        self.isCompleted = isCompleted ?? self.isCompleted
        self.order = order ?? self.order
        updateTimestamp()
    }
    
    mutating func toggleCompleted() {
        update(isCompleted: !isCompleted)
    }
}
