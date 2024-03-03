//
//  SearchControllerViewController + ViewModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit
import Combine

extension SearchControllerViewController {
    
    class ViewModel: ObservableObject {
        @Published var dataSource: [PostsModel] = []
        
        func fetchData() {
            NetworkManager.shared.getPostsData { response in
                switch response {
                case .success(let data):
                    DispatchQueue.main.async { [unowned self] in
                        self.dataSource = data
                    }
                case .failure(let error):
                    print(error.rawValue)
                }
            }
        }
    }
    
}
