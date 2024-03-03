//
//  PostsModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import Foundation

/// End Point:
/// https://jsonplaceholder.typicode.com/posts

struct PostsModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
