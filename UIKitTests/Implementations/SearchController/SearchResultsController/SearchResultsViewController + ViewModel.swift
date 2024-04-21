//
//  SearchResultsViewController + ViewModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/18/24.
//

import UIKit
import Combine

extension SearchResultsViewController {
    class ViewModel: ObservableObject {
        @Published var dataSource: UnSplashSearchModel = UnSplashSearchModel(results: [])
        
        func getUnsplashPhotosBy(search: String, page: Int) {
            Task {
                do {
                    let newData = try await NetworkManager.shared.getUnsplashPhotosBy(query:search, and: page)
                } catch(let error) {
                    if let error = error as? NetworkError {
                        print("Error on getting Unsplash Photos by Search, error on:",error.rawValue)
                    } else {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
}
