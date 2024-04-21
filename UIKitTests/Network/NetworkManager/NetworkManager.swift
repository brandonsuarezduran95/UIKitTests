//
//  NetworkManager.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import UIKit

enum EndPoints {
    static let todos: String = "https://jsonplaceholder.typicode.com/todos"
    static let posts: String = "https://jsonplaceholder.typicode.com/posts"
    static let unsplashPhotos: String = "https://api.unsplash.com/photos/?client_id=HUr7CAIeshOOQ6q0r-XURcy18uTnk8xcG9s0CwDVc5Q"
    
    private static let searchUnsplashPhotos: String = "https://api.unsplash.com/search/photos?page="
    private static let queryKeyPath: String = "&query="
    private static let clientId: String = "&client_id=HUr7CAIeshOOQ6q0r-XURcy18uTnk8xcG9s0CwDVc5Q"
    
    static func getUrlWithSearchTerm(search: String, page: Int) -> String {
        return "\(self.searchUnsplashPhotos)\(page)\(self.queryKeyPath)\(search)\(self.clientId)"
    }
}

final class NetworkManager {
    
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
    
    // MARK: - Unsplash Data
    func getUnsplashData() async throws -> [UnSplashModel] {
        
        guard let url = URL(string: EndPoints.unsplashPhotos) else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badServerResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode([UnSplashModel].self, from: data)
            return parsedData
        } catch {
            throw NetworkError.badParsing
        }
    }
    
    // MARK: - Search Unsplash Photo By Query
    
    func getUnsplashPhotosBy(query: String, and page: Int) async throws -> UnSplashSearchModel {
        let urlPath = EndPoints.getUrlWithSearchTerm(search: query, page: page)
        
        guard let url = URL(string: urlPath) else {
            throw NSError(domain: "Unsplash Search", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unsplash search query URL could not be unwrapped"])
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badServerResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode(UnSplashSearchModel.self, from: data)
            print(parsedData)
            return parsedData
        } catch {
            throw NetworkError.badParsing
        }
    }
    
    // MARK: - Download image

    func downloadImage(from url: String) async throws -> UIImage {
        
        guard let url = URL(string: url) else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badServerResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "Image-Download Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create image from data"])
        }
        
        return image
    }
}
