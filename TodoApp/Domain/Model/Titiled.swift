//
//  Titiled.swift
//  TodoApp
//
//  Created by Sergey on 03.04.2025.
//

import Foundation

protocol Titled {
    var title: String { get }
}

func getAllTitles<T: Titled>(from items: [T]) -> [String] {
    return items.map(\.title)
}

func creatUniqueTitle(desierd title: String, existing titles: [String]) -> String {
    var newTitle = title
    var postfix = 0
    while titles.contains(title) {
        newTitle = "\(title)\(postfix)"
        postfix += 1
    }
    
    return newTitle
}
