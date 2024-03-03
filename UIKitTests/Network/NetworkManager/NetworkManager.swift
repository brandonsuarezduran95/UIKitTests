//
//  NetworkManager.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import Foundation

enum EndPoints {
    static let todos: String = "https://jsonplaceholder.typicode.com/todos"
    static let posts: String = "https://jsonplaceholder.typicode.com/posts"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    // MARK: - Todos Fetching Data
    func getTodosData(completion: @escaping (Result<[TodosModel], NetworkError>) -> Void) {
        
        guard let url = URL(string: EndPoints.todos) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.badServerResponse))
            }
            
            do {
                let parsedData = try JSONDecoder().decode([TodosModel].self, from: data)
                completion(.success(parsedData))
            } catch {
                completion(.failure(.badParsing))
            }
        }.resume()
    }
    
    // MARK: - Posts Fetching Data
    
    func getPostsData(completion: @escaping (Result<[PostsModel], NetworkError>) -> Void) {
        guard let url = URL(string: EndPoints.posts) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.badServerResponse))
            }
            
            do {
                let parsedData = try JSONDecoder().decode([PostsModel].self, from: data)
                completion(.success(parsedData))
            } catch {
                completion(.failure(.badParsing))
            }
        }.resume()
    }
    
}
