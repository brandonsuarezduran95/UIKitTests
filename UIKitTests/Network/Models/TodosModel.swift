//
//  TodosModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import Foundation

/// End Point:
/// https://jsonplaceholder.typicode.com/todos

struct TodosModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
