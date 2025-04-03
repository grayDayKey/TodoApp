//
//  Timestamped.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

import Foundation

protocol Timestamped {
    var createdAt: Date { get }
    var updatedAt: Date? { get set }
}

extension Timestamped {
    mutating func updateTimestamp() {
        updatedAt = Date()
    }
}
